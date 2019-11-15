Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 825E5FE1BB
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 16:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573832754;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Xf+T9WZoZHfkiPWGhofclwlAOSFVk7q23jjWP081HcY=;
	b=ZnqkFxmfQxs/0OX6b7w3dsiIBj652GcOWzXaHOZaVBT2YxBVNMZ2i1AWO9A15BTOeC2Eh3
	ad7Sf5HJT3ef4bzFl/B9EV8ShBdNbI+Z/RO9ElaT71UPMCH7wgThj1+ur43kD8TfJKRGjI
	hqxdl0q5XrQ+/IcOxf4d4nv8AoB0akc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-8ShiiK2sMxOt6Akcq7ud5A-1; Fri, 15 Nov 2019 10:45:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EB70106C016;
	Fri, 15 Nov 2019 15:45:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC15910016E8;
	Fri, 15 Nov 2019 15:45:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E11818089CD;
	Fri, 15 Nov 2019 15:45:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFFjijP006461 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 10:45:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 444DD60C81; Fri, 15 Nov 2019 15:45:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F0A960BE1
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 15:45:41 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE0F44BB65
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 15:45:41 +0000 (UTC)
Date: Fri, 15 Nov 2019 10:45:41 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1255360710.30262128.1573832741690.JavaMail.zimbra@redhat.com>
In-Reply-To: <1819526286.30262006.1573832637022.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.22]
Thread-Topic: gfs2: Close timing window with GLF_INVALIDATE_IN_PROGRESS
Thread-Index: UNv65AamuFrUJvfLffjzqsQDXi7aBw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Close timing window with
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 8ShiiK2sMxOt6Akcq7ud5A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

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
index faa88bd594e2..4a4a390ffd00 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -558,7 +558,19 @@ __acquires(&gl->gl_lockref.lock)
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

