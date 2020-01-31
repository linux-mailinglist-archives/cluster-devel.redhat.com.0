Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6CA14F1E7
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:08:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fDd/3GGaZMO+7noRjIX3mOrwx0hBU94udQR8jagvN1c=;
	b=K86LyNQNHZRPdMvVe2iNGU0tZ6yNVnw4IR7EAi5HE+oTEhqZarUJoPQRpSc/qvsSwaUORy
	3+I8kKqELR/hpjZbJtvP7nXBoS8/yIYaeDdrXXNQydXfdT9qoAnp+xwAwN820rDZoG2AUr
	pSt5DaDJb8JbRrLiQbP1xPBfMXWo2+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-FiyxHh9jOK6f9d1S0XLNuQ-1; Fri, 31 Jan 2020 13:08:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BE6EA1A49;
	Fri, 31 Jan 2020 18:08:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88A5160BE1;
	Fri, 31 Jan 2020 18:08:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C6E485CE0;
	Fri, 31 Jan 2020 18:08:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI8BFX027047 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:08:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 24ED360BE1; Fri, 31 Jan 2020 18:08:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F16E660BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:08:09 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:17 -0600
Message-Id: <20200131180723.178863-20-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 19/25] gfs2: Check for log write errors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: FiyxHh9jOK6f9d1S0XLNuQ-1
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
index 233189d47afc..70a97a40f3db 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -620,6 +620,32 @@ __acquires(&gl->gl_lockref.lock)
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
@@ -628,8 +654,7 @@ __acquires(&gl->gl_lockref.lock)
 =09=09    test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags)) {
 =09=09=09finish_xmote(gl, target);
 =09=09=09gfs2_glock_queue_work(gl, 0);
-=09=09}
-=09=09else if (ret) {
+=09=09} else if (ret) {
 =09=09=09fs_err(sdp, "lm_lock ret %d\n", ret);
 =09=09=09GLOCK_BUG_ON(gl, !gfs2_withdrawn(sdp));
 =09=09}
@@ -637,7 +662,7 @@ __acquires(&gl->gl_lockref.lock)
 =09=09finish_xmote(gl, target);
 =09=09gfs2_glock_queue_work(gl, 0);
 =09}
-
+out:
 =09spin_lock(&gl->gl_lockref.lock);
 }
=20
--=20
2.24.1

