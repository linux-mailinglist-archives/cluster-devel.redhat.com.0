Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CC525FBACD
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fExJjx1Z8foeF9hQ6Pyl1gSOPXiE3pwkRdF3IW++tRs=;
	b=QNhAX08qvG9XIwGnsa5jmnHE1IUj5b+4CNs33zqbbbVNaczp4wZVEnbRuR57LJb8mjn89B
	ABYpMh4wbduXhQojoR71vHK0CSVgtJuEdVWp5e1/BT7uqh6X92EmpWSJG6I7N3nVREKZ+l
	BE3GBu8epLz49SLTzOsLnp64lPjWZrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-IvvmbNVrOc2Wxmpq8MZCww-1; Wed, 13 Nov 2019 16:30:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57F48100551F;
	Wed, 13 Nov 2019 21:30:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F7435E254;
	Wed, 13 Nov 2019 21:30:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16E1D4E56E;
	Wed, 13 Nov 2019 21:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUiit005374 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 862CF6A505; Wed, 13 Nov 2019 21:30:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51F7A69739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:17 -0600
Message-Id: <20191113213030.237431-20-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 19/32] gfs2: Check for log write errors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: IvvmbNVrOc2Wxmpq8MZCww-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
---
 fs/gfs2/glock.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 879625471fe0..f18b8f2b8ce5 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -614,6 +614,30 @@ __acquires(&gl->gl_lockref.lock)
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
+=09if (unlikely(sdp->sd_log_error && !allow_while_withdrawn(gl))) {
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
@@ -622,8 +646,7 @@ __acquires(&gl->gl_lockref.lock)
 =09=09    test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags)) {
 =09=09=09finish_xmote(gl, target);
 =09=09=09gfs2_glock_queue_work(gl, 0);
-=09=09}
-=09=09else if (ret) {
+=09=09} else if (ret) {
 =09=09=09fs_err(sdp, "lm_lock ret %d\n", ret);
 =09=09=09GLOCK_BUG_ON(gl, !gfs2_withdrawn(sdp));
 =09=09}
@@ -631,7 +654,7 @@ __acquires(&gl->gl_lockref.lock)
 =09=09finish_xmote(gl, target);
 =09=09gfs2_glock_queue_work(gl, 0);
 =09}
-
+out:
 =09spin_lock(&gl->gl_lockref.lock);
 }
=20
--=20
2.23.0

