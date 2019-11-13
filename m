Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 354EFFBACF
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7RfK6c7OdG/4oZ3DSg3NKa5ckwsHDkfhA3LNE8dnIn4=;
	b=NdDlZPH8rDsEqaFJ+pRhOEDJIxjhxGWkXNyIOAMF/ocxxTC6OIqHDVQ2rIjaq+I5xZjfiE
	86nFP5c+/nzF5klbWGxp8e/jjaFtBIUWxiOp7/50qlsZhxlBY19CZFFWyyLfen1o5xqHcr
	aSgTSB8gTxUYWaZ0IP8fqUU8/LAFhAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-M4ttyFpLMyyiBVBwf3Xsug-1; Wed, 13 Nov 2019 16:30:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0942718A3EA9;
	Wed, 13 Nov 2019 21:30:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E76BE5E253;
	Wed, 13 Nov 2019 21:30:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC2A818034EC;
	Wed, 13 Nov 2019 21:30:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUkiu005395 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 901536A507; Wed, 13 Nov 2019 21:30:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC9A6A505
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:45 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:19 -0600
Message-Id: <20191113213030.237431-22-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 21/32] gfs2: Close timing window with
	GLF_INVALIDATE_IN_PROGRESS
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: M4ttyFpLMyyiBVBwf3Xsug-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

This patch closes a timing window in which two processes compete
and overlap in the execution of do_xmote for the same glock:

             Process A                              Process B
   ------------------------------------   -----------------------------
1. Grabs gl_lockref and calls do_xmote
2.                                        Grabs gl_lockref but is blocked
3. Sets GLF_INVALIDATE_IN_PROGRESS
4. Unlocks gl_lockref
5.                                        Calls do_xmote
6. Call glops->go_sync
7. test_and_clear_bit GLF_DIRTY
8. Call gfs2_log_flush                    Call glops->go_sync
9. (slow IO, so it blocks a long time)    test_and_clear_bit GLF_DIRTY
                                          It's not dirty (step 7) returns
10.                                       Tests GLF_INVALIDATE_IN_PROGRESS
11.                                       Calls go_inval (rgrp_go_inval)
12.                                       gfs2_rgrp_relse does brelse
13.                                       truncate_inode_pages_range
14.                                       Calls lm_lock UN

In step 14 we've just told dlm to give the glock to another node
when, in fact, process A has not finished the IO and synced all
buffer_heads to disk and make sure their revokes are done.

This patch fixes the problem by changing the GLF_INVALIDATE_IN_PROGRESS
to use test_and_set_bit, and if the bit is already set, process B just
ignores it and trusts that process A will do the do_xmote in the proper
order.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index f18b8f2b8ce5..ab72797e3ba1 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -584,7 +584,19 @@ __acquires(&gl->gl_lockref.lock)
 =09GLOCK_BUG_ON(gl, gl->gl_state =3D=3D gl->gl_target);
 =09if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRED) &&
 =09    glops->go_inval) {
-=09=09set_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
+=09=09/*
+=09=09 * If another process is already doing the invalidate we should
+=09=09 * not interfere. If we call go_sync and it finds the glock is
+=09=09 * not dirty, we might call go_inval prematurely before the
+=09=09 * other go_sync has finished with its revokes. If we then call
+=09=09 * lm_lock prematurely, we've really screwed up: we cannot tell
+=09=09 * dlm to give the glock away until we're synced and
+=09=09 * invalidated. Best thing is to return and trust the other
+=09=09 * process will finish do_xmote tasks in their proper order.
+=09=09 */
+=09=09if (test_and_set_bit(GLF_INVALIDATE_IN_PROGRESS,
+=09=09=09=09     &gl->gl_flags))
+=09=09=09return;
 =09=09do_error(gl, 0); /* Fail queued try locks */
 =09}
 =09gl->gl_req =3D target;
--=20
2.23.0

