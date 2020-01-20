Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E660E1426CE
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511611;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JWbx5LnJnW63orlhf2aVRZCxs/UNPZeFN+plLsrq9nY=;
	b=hm86rN7+xWSqGAxkhQTqnlKxfvIgww9k8zn4ZSix1p93yfv4ozicN7vVvwefSk+iokGi6/
	GWBKfmbDrWYg9HlWi+1iBGmssti4WdOTZnj7CWtkujuiqMhCYJj6brmUbXWuxa27E9jEDz
	Vt0lIXQ+kGP9HInCEdUzDNeJy6voHmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-1PZmrLzCOrmryAbNGowbDg-1; Mon, 20 Jan 2020 04:13:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80C70800A02;
	Mon, 20 Jan 2020 09:13:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 701F85D9E2;
	Mon, 20 Jan 2020 09:13:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53E3D81964;
	Mon, 20 Jan 2020 09:13:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DQMN031707 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6D1EE84DAB; Mon, 20 Jan 2020 09:13:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D84B84DB4;
	Mon, 20 Jan 2020 09:13:21 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:12:59 +0100
Message-Id: <20200120091305.24997-6-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 05/11] gfs2: Give up the iopen glock on
	contention
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
X-MC-Unique: 1PZmrLzCOrmryAbNGowbDg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When there's contention on the iopen glock, it means that the link count
of the corresponding inode has dropped to zero on a remote node and that
node is trying to delete the inode.  In that case, try to evict the
inode so that the iopen glock will be released and give the remote node
some time to delete the inode itself.

When the inode is still open, the inode's reference count won't drop to
zero, and we'll keep hold of the inode and its iopen glock.  The remote
node will time out its request to grab the iopen glock, and when the
inode is closed, we'll try to delete it ourself.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/incore.h |  1 +
 fs/gfs2/super.c  |  7 +++++--
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e71f23ebb99b..38ba77b35b50 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -696,6 +696,42 @@ bool gfs2_inode_already_deleted(struct gfs2_glock *gl,=
 u64 generation)
 =09return generation <=3D be64_to_cpu(ri->ri_generation_deleted);
 }
=20
+static bool gfs2_try_evict(struct gfs2_glock *gl)
+{
+=09struct gfs2_inode *ip;
+=09bool evicted =3D false;
+
+=09/*
+=09 * If there is contention on the iopen glock and we have an inode, try
+=09 * to grab and release the inode so that it can be evicted.  This will
+=09 * allow the remote node to go ahead and delete the inode without us
+=09 * having to do it, which will avoid rgrp glock thrashing.
+=09 *
+=09 * The remote node is likely still holding the corresponding inode
+=09 * glock, so it will run before we get to verify that the delete has
+=09 * happened below.
+=09 */
+=09spin_lock(&gl->gl_lockref.lock);
+=09ip =3D gl->gl_object;
+=09if (ip && !igrab(&ip->i_inode))
+=09=09ip =3D NULL;
+=09spin_unlock(&gl->gl_lockref.lock);
+=09if (ip) {
+=09=09set_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
+=09=09d_prune_aliases(&ip->i_inode);
+=09=09iput(&ip->i_inode);
+
+=09=09/* If the inode was evicted, gl->gl_object will now be NULL. */
+=09=09spin_lock(&gl->gl_lockref.lock);
+=09=09ip =3D gl->gl_object;
+=09=09if (ip)
+=09=09=09clear_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
+=09=09spin_unlock(&gl->gl_lockref.lock);
+=09=09evicted =3D !ip;
+=09}
+=09return evicted;
+}
+
 static void delete_work_func(struct work_struct *work)
 {
 =09struct delayed_work *dwork =3D to_delayed_work(work);
@@ -710,6 +746,22 @@ static void delete_work_func(struct work_struct *work)
 =09if (test_bit(GLF_INODE_CREATING, &gl->gl_flags))
 =09=09goto out;
=20
+=09if (test_bit(GLF_DEMOTE, &gl->gl_flags)) {
+=09=09/*
+=09=09 * If we can evict the inode, give the remote node trying to
+=09=09 * delete the inode some time before verifying that the delete
+=09=09 * has happened.  If we cause contention on the inode glock
+=09=09 * immediately, the remote node will think that we still have
+=09=09 * the inode in use, and so it will give up waiting.
+=09=09 */
+=09=09if (gfs2_try_evict(gl)) {
+=09=09=09if (queue_delayed_work(gfs2_delete_workqueue,
+=09=09=09=09=09       &gl->gl_delete, 5 * HZ))
+=09=09=09=09return;
+=09=09=09goto out;
+=09=09}
+=09}
+
 =09inode =3D gfs2_lookup_by_inum(sdp, no_addr, NULL, GFS2_BLKST_UNLINKED);
 =09if (!IS_ERR_OR_NULL(inode)) {
 =09=09d_prune_aliases(inode);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index d7282356cbf5..aecdde83c22c 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -397,6 +397,7 @@ enum {
 =09GIF_ORDERED=09=09=3D 4,
 =09GIF_FREE_VFS_INODE      =3D 5,
 =09GIF_GLOP_PENDING=09=3D 6,
+=09GIF_DEFERRED_DELETE=09=3D 7,
 };
=20
 struct gfs2_inode {
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 1a029beaaaca..874949b17495 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1263,9 +1263,12 @@ static void gfs2_evict_inode(struct inode *inode)
 =09if (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
 =09=09BUG_ON(!gfs2_glock_is_locked_by_me(ip->i_gl));
 =09=09gfs2_holder_mark_uninitialized(&gh);
-=09=09goto alloc_failed;
+=09=09goto out_delete;
 =09}
=20
+=09if (test_bit(GIF_DEFERRED_DELETE, &ip->i_flags))
+=09=09goto out;
+
 =09/* Deletes should never happen under memory pressure anymore.  */
 =09if (WARN_ON_ONCE(current->flags & PF_MEMALLOC))
 =09=09goto out;
@@ -1297,7 +1300,7 @@ static void gfs2_evict_inode(struct inode *inode)
 =09if (inode->i_nlink)
 =09=09goto out_truncate;
=20
-alloc_failed:
+out_delete:
 =09if (gfs2_holder_initialized(&ip->i_iopen_gh) &&
 =09    test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
 =09=09ip->i_iopen_gh.gh_flags |=3D GL_NOCACHE;
--=20
2.20.1

