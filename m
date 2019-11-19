Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7309D102F71
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Nov 2019 23:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574203171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SPFbsVONWxgSpiUmAm0SQ+b7SGQ8AtT9LY71cZeZOw0=;
	b=Mvbm80ZLlOl4xsqYql/Wz81SVR9mLFqwLA6+moXzvM/JjGcj54bXAdgfBJIwasRU4UmB0p
	7knbbzvOXlFl1fuO8cmDLKE+WXMHN48UnZ8Tn1vkp6PWYjfbvlnE+NsdKrALmH2Wqi4anV
	8eylxVqFXNBUk7adhPFQzo+2ZamoopA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-9peJL1taMuO-Gbfojit3Kg-1; Tue, 19 Nov 2019 17:39:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 196AE1802CEB;
	Tue, 19 Nov 2019 22:39:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0792D19C5B;
	Tue, 19 Nov 2019 22:39:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD5A04BB65;
	Tue, 19 Nov 2019 22:39:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMdONd009523 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:39:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 591D050910; Tue, 19 Nov 2019 22:39:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.183])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DAEE5E1AD;
	Tue, 19 Nov 2019 22:39:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 19 Nov 2019 23:39:18 +0100
Message-Id: <20191119223918.15038-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Further gfs2_create_inode cleanups
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
X-MC-Unique: 9peJL1taMuO-Gbfojit3Kg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Remove a duplicate call to gfs2_set_inode_blocks.  Rename the error labels =
to a
consistent scheme to make the function slightly easier to review.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 4a1039c41c69..2a1689621ae1 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -604,12 +604,12 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
=20
 =09error =3D gfs2_glock_nq_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
 =09if (error)
-=09=09goto fail;
+=09=09return error;
 =09gfs2_holder_mark_uninitialized(ghs + 1);
=20
 =09error =3D create_ok(dip, name, mode);
 =09if (error)
-=09=09goto fail_gunlock;
+=09=09goto fail;
=20
 =09inode =3D gfs2_dir_search(dir, &dentry->d_name, !S_ISREG(mode) || excl)=
;
 =09error =3D PTR_ERR(inode);
@@ -617,7 +617,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09=09if (S_ISDIR(inode->i_mode)) {
 =09=09=09iput(inode);
 =09=09=09inode =3D ERR_PTR(-EISDIR);
-=09=09=09goto fail_gunlock;
+=09=09=09goto fail;
 =09=09}
 =09=09d_instantiate(dentry, inode);
 =09=09error =3D 0;
@@ -630,33 +630,32 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09=09gfs2_glock_dq_uninit(ghs);
 =09=09return error;
 =09} else if (error !=3D -ENOENT) {
-=09=09goto fail_gunlock;
+=09=09goto fail;
 =09}
=20
 =09error =3D gfs2_diradd_alloc_required(dir, name, &da);
 =09if (error < 0)
-=09=09goto fail_gunlock;
+=09=09goto fail;
=20
 =09inode =3D new_inode(sdp->sd_vfs);
 =09error =3D -ENOMEM;
 =09if (!inode)
-=09=09goto fail_gunlock;
+=09=09goto fail;
=20
 =09error =3D posix_acl_create(dir, &mode, &default_acl, &acl);
 =09if (error)
-=09=09goto fail_gunlock;
+=09=09goto fail;
=20
 =09ip =3D GFS2_I(inode);
 =09error =3D gfs2_rsqa_alloc(ip);
 =09if (error)
-=09=09goto fail_free_acls;
+=09=09goto fail2;
=20
 =09inode->i_mode =3D mode;
 =09set_nlink(inode, S_ISDIR(mode) ? 2 : 1);
 =09inode->i_rdev =3D dev;
 =09inode->i_size =3D size;
 =09inode->i_atime =3D inode->i_mtime =3D inode->i_ctime =3D current_time(i=
node);
-=09gfs2_set_inode_blocks(inode, 1);
 =09munge_mode_uid_gid(dip, inode);
 =09check_and_update_goal(dip);
 =09ip->i_goal =3D dip->i_goal;
@@ -696,23 +695,23 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
=20
 =09error =3D alloc_dinode(ip, aflags, &blocks);
 =09if (error)
-=09=09goto fail_free_inode;
+=09=09goto fail3;
=20
 =09gfs2_set_inode_blocks(inode, blocks);
=20
 =09error =3D gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_inode_glops, CREATE,=
 &ip->i_gl);
 =09if (error)
-=09=09goto fail_free_inode;
+=09=09goto fail3;
 =09flush_delayed_work(&ip->i_gl->gl_work);
 =09glock_set_object(ip->i_gl, ip);
=20
 =09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + =
1);
 =09if (error)
-=09=09goto fail_free_inode;
+=09=09goto fail3;
=20
 =09error =3D gfs2_trans_begin(sdp, blocks, 0);
 =09if (error)
-=09=09goto fail_free_inode;
+=09=09goto fail3;
=20
 =09if (blocks > 1) {
 =09=09ip->i_eattr =3D ip->i_no_addr + 1;
@@ -723,13 +722,13 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
=20
 =09error =3D gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_iopen_glops, CREATE,=
 &io_gl);
 =09if (error)
-=09=09goto fail_free_inode;
+=09=09goto fail3;
=20
 =09BUG_ON(test_and_set_bit(GLF_INODE_CREATING, &io_gl->gl_flags));
=20
 =09error =3D gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iope=
n_gh);
 =09if (error)
-=09=09goto fail_gunlock2;
+=09=09goto fail4;
=20
 =09glock_set_object(ip->i_iopen_gh.gh_gl, ip);
 =09gfs2_set_iop(inode);
@@ -741,14 +740,14 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09if (default_acl) {
 =09=09error =3D __gfs2_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
 =09=09if (error)
-=09=09=09goto fail_gunlock3;
+=09=09=09goto fail5;
 =09=09posix_acl_release(default_acl);
 =09=09default_acl =3D NULL;
 =09}
 =09if (acl) {
 =09=09error =3D __gfs2_set_acl(inode, acl, ACL_TYPE_ACCESS);
 =09=09if (error)
-=09=09=09goto fail_gunlock3;
+=09=09=09goto fail5;
 =09=09posix_acl_release(acl);
 =09=09acl =3D NULL;
 =09}
@@ -756,11 +755,11 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09error =3D security_inode_init_security(&ip->i_inode, &dip->i_inode, nam=
e,
 =09=09=09=09=09     &gfs2_initxattrs, NULL);
 =09if (error)
-=09=09goto fail_gunlock3;
+=09=09goto fail5;
=20
 =09error =3D link_dinode(dip, name, ip, &da);
 =09if (error)
-=09=09goto fail_gunlock3;
+=09=09goto fail5;
=20
 =09mark_inode_dirty(inode);
 =09d_instantiate(dentry, inode);
@@ -776,22 +775,22 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09gfs2_glock_put(io_gl);
 =09return error;
=20
-fail_gunlock3:
+fail5:
 =09glock_clear_object(io_gl, ip);
 =09gfs2_glock_dq_uninit(&ip->i_iopen_gh);
-fail_gunlock2:
+fail4:
 =09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
 =09gfs2_glock_put(io_gl);
-fail_free_inode:
+fail3:
 =09if (ip->i_gl) {
 =09=09glock_clear_object(ip->i_gl, ip);
 =09=09gfs2_glock_put(ip->i_gl);
 =09}
 =09gfs2_rsqa_delete(ip, NULL);
-fail_free_acls:
+fail2:
 =09posix_acl_release(default_acl);
 =09posix_acl_release(acl);
-fail_gunlock:
+fail:
 =09gfs2_dir_no_add(&da);
 =09gfs2_glock_dq_uninit(ghs);
 =09if (!IS_ERR_OR_NULL(inode)) {
@@ -804,7 +803,6 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09}
 =09if (gfs2_holder_initialized(ghs + 1))
 =09=09gfs2_glock_dq_uninit(ghs + 1);
-fail:
 =09return error;
 }
=20
--=20
2.20.1

