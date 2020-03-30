Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id CBDD4197D55
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cU3qzZtBn9wacM4vYzqMFTfOSYdw84Lup7pH5F4cbMA=;
	b=iOaDON4KLresV95ozvYvDPEHy4Ftw00XbV65OcA6rFFDdk8qnRDzOyJLWFZ12RzR8EnJYS
	FfNF3qRK/PyXyXs+Vc7mW6ocX/HEJz9zhSkebCBJg+KpqU+/Vm4iqbM6wq2v1GCob+0hB0
	SlR9MD5MmM7LS2IeKAbi0mxbbqLeEJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-TrUu_OHzPu-_gGPFRrP0JA-1; Mon, 30 Mar 2020 09:46:49 -0400
X-MC-Unique: TrUu_OHzPu-_gGPFRrP0JA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A79451902EB7;
	Mon, 30 Mar 2020 13:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90EBFA7ED;
	Mon, 30 Mar 2020 13:46:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74B3A944D4;
	Mon, 30 Mar 2020 13:46:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkan0020468 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31D5B48; Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E79DF99DEE
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:35 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:04 -0500
Message-Id: <20200330134624.259349-20-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 19/39] gfs2: Check for log write errors
	before telling dlm to unlock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function do_xmote just assumed all the writes
submitted to the journal were finished and successful, and it
called the go_unlock function to release the dlm lock. But if
they're not, and a revoke failed to make its way to the journal,
a journal replay on another node will cause corruption if we
let the go_inval function continue and tell dlm to release the
glock to another node. This patch adds a couple checks for errors
in do_xmote after the calls to go_sync and go_inval. If an error
is found, we cannot withdraw yet, because the withdraw itself
uses glocks to make the file system read-only. Instead, we flag
the error. Later, asserts should cause another node to replay
the journal before continuing, thus protecting rgrp and dinode
glocks and maintaining the integrity of the metadata. Note that
we only need to do this for journaled glocks. System glocks
should be able to progress even under withdrawn conditions.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 5afaf92057c0..6af1edabef05 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -622,6 +622,32 @@ __acquires(&gl->gl_lockref.lock)
 =09}
=20
 =09gfs2_glock_hold(gl);
+=09/*
+=09 * Check for an error encountered since we called go_sync and go_inval.
+=09 * If so, we can't withdraw from the glock code because the withdraw
+=09 * code itself uses glocks (see function signal_our_withdraw) to
+=09 * change the mount to read-only. Most importantly, we must not call
+=09 * dlm to unlock the glock until the journal is in a known good state
+=09 * (after journal replay) otherwise other nodes may use the object
+=09 * (rgrp or dinode) and then later, journal replay will corrupt the
+=09 * file system. The best we can do here is wait for the logd daemon
+=09 * to see sd_log_error and withdraw, and in the meantime, requeue the
+=09 * work for later.
+=09 *
+=09 * However, if we're just unlocking the lock (say, for unmount, when
+=09 * gfs2_gl_hash_clear calls clear_glock) and recovery is complete
+=09 * then it's okay to tell dlm to unlock it.
+=09 */
+=09if (unlikely(sdp->sd_log_error && !gfs2_withdrawn(sdp)))
+=09=09gfs2_withdraw_delayed(sdp);
+=09if (glock_blocked_by_withdraw(gl)) {
+=09=09if (target !=3D LM_ST_UNLOCKED ||
+=09=09    test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags)) {
+=09=09=09gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
+=09=09=09goto out;
+=09=09}
+=09}
+
 =09if (sdp->sd_lockstruct.ls_ops->lm_lock)=09{
 =09=09/* lock_dlm */
 =09=09ret =3D sdp->sd_lockstruct.ls_ops->lm_lock(gl, target, lck_flags);
@@ -630,8 +656,7 @@ __acquires(&gl->gl_lockref.lock)
 =09=09    test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags)) {
 =09=09=09finish_xmote(gl, target);
 =09=09=09gfs2_glock_queue_work(gl, 0);
-=09=09}
-=09=09else if (ret) {
+=09=09} else if (ret) {
 =09=09=09fs_err(sdp, "lm_lock ret %d\n", ret);
 =09=09=09GLOCK_BUG_ON(gl, !gfs2_withdrawn(sdp));
 =09=09}
@@ -639,7 +664,7 @@ __acquires(&gl->gl_lockref.lock)
 =09=09finish_xmote(gl, target);
 =09=09gfs2_glock_queue_work(gl, 0);
 =09}
-
+out:
 =09spin_lock(&gl->gl_lockref.lock);
 }
=20
--=20
2.25.1

