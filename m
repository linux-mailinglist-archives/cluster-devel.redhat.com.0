Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D70C84F6FA3
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 03:12:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-094KMqrqNVGvq9Wbgeu1gA-1; Wed, 06 Apr 2022 21:11:58 -0400
X-MC-Unique: 094KMqrqNVGvq9Wbgeu1gA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15968185A7B2;
	Thu,  7 Apr 2022 01:11:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08F5840CF910;
	Thu,  7 Apr 2022 01:11:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C0813194034E;
	Thu,  7 Apr 2022 01:11:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 109BA1949763 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 01:11:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E892EC27E98; Thu,  7 Apr 2022 01:11:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E45E7C27E97
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:11:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA34D811E75
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:11:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-gJPPsqvSM-6X8PUQYCZxEg-1; Wed, 06 Apr 2022 21:11:47 -0400
X-MC-Unique: gJPPsqvSM-6X8PUQYCZxEg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2255161DAF;
 Thu,  7 Apr 2022 01:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AD6C385A8;
 Thu,  7 Apr 2022 01:11:44 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  6 Apr 2022 21:11:13 -0400
Message-Id: <20220407011140.113856-3-sashal@kernel.org>
In-Reply-To: <20220407011140.113856-1-sashal@kernel.org>
References: <20220407011140.113856-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [PATCH AUTOSEL 5.16 03/30] gfs2: Switch lock order
 of inode and iopen glock
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: application/octet-stream; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit 29464ee36bcaaee2691249f49b9592b8d5c97ece ]

This patch tries to fix the continual ABBA deadlocks we keep having
between the iopen and inode glocks. This switches the lock order in
gfs2_inode_lookup and gfs2_create_inode so the iopen glock is always
locked first.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/inode.c | 49 +++++++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 89905f4f29bb..b30ff50d17f3 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -131,7 +131,21 @@ struct inode *gfs2_inode_lookup(struct super_block *sb=
, unsigned int type,
 =09=09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
 =09=09struct gfs2_glock *io_gl;
=20
-=09=09error =3D gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &i=
p->i_gl);
+=09=09error =3D gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE,
+=09=09=09=09       &ip->i_gl);
+=09=09if (unlikely(error))
+=09=09=09goto fail;
+
+=09=09error =3D gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE,
+=09=09=09=09       &io_gl);
+=09=09if (unlikely(error))
+=09=09=09goto fail;
+
+=09=09if (blktype !=3D GFS2_BLKST_UNLINKED)
+=09=09=09gfs2_cancel_delete_work(io_gl);
+=09=09error =3D gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT,
+=09=09=09=09=09   &ip->i_iopen_gh);
+=09=09gfs2_glock_put(io_gl);
 =09=09if (unlikely(error))
 =09=09=09goto fail;
=20
@@ -161,16 +175,6 @@ struct inode *gfs2_inode_lookup(struct super_block *sb=
, unsigned int type,
=20
 =09=09set_bit(GLF_INSTANTIATE_NEEDED, &ip->i_gl->gl_flags);
=20
-=09=09error =3D gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE, &i=
o_gl);
-=09=09if (unlikely(error))
-=09=09=09goto fail;
-=09=09if (blktype !=3D GFS2_BLKST_UNLINKED)
-=09=09=09gfs2_cancel_delete_work(io_gl);
-=09=09error =3D gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_i=
open_gh);
-=09=09gfs2_glock_put(io_gl);
-=09=09if (unlikely(error))
-=09=09=09goto fail;
-
 =09=09/* Lowest possible timestamp; will be overwritten in gfs2_dinode_in.=
 */
 =09=09inode->i_atime.tv_sec =3D 1LL << (8 * sizeof(inode->i_atime.tv_sec) =
- 1);
 =09=09inode->i_atime.tv_nsec =3D 0;
@@ -716,13 +720,17 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09error =3D insert_inode_locked4(inode, ip->i_no_addr, iget_test, &ip->i_=
no_addr);
 =09BUG_ON(error);
=20
-=09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + =
1);
+=09error =3D gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iope=
n_gh);
 =09if (error)
 =09=09goto fail_gunlock2;
=20
+=09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + =
1);
+=09if (error)
+=09=09goto fail_gunlock3;
+
 =09error =3D gfs2_trans_begin(sdp, blocks, 0);
 =09if (error)
-=09=09goto fail_gunlock2;
+=09=09goto fail_gunlock3;
=20
 =09if (blocks > 1) {
 =09=09ip->i_eattr =3D ip->i_no_addr + 1;
@@ -731,10 +739,6 @@ static int gfs2_create_inode(struct inode *dir, struct=
 dentry *dentry,
 =09init_dinode(dip, ip, symname);
 =09gfs2_trans_end(sdp);
=20
-=09error =3D gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iope=
n_gh);
-=09if (error)
-=09=09goto fail_gunlock2;
-
 =09glock_set_object(ip->i_gl, ip);
 =09glock_set_object(io_gl, ip);
 =09gfs2_set_iop(inode);
@@ -745,14 +749,14 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09if (default_acl) {
 =09=09error =3D __gfs2_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
 =09=09if (error)
-=09=09=09goto fail_gunlock3;
+=09=09=09goto fail_gunlock4;
 =09=09posix_acl_release(default_acl);
 =09=09default_acl =3D NULL;
 =09}
 =09if (acl) {
 =09=09error =3D __gfs2_set_acl(inode, acl, ACL_TYPE_ACCESS);
 =09=09if (error)
-=09=09=09goto fail_gunlock3;
+=09=09=09goto fail_gunlock4;
 =09=09posix_acl_release(acl);
 =09=09acl =3D NULL;
 =09}
@@ -760,11 +764,11 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09error =3D security_inode_init_security(&ip->i_inode, &dip->i_inode, nam=
e,
 =09=09=09=09=09     &gfs2_initxattrs, NULL);
 =09if (error)
-=09=09goto fail_gunlock3;
+=09=09goto fail_gunlock4;
=20
 =09error =3D link_dinode(dip, name, ip, &da);
 =09if (error)
-=09=09goto fail_gunlock3;
+=09=09goto fail_gunlock4;
=20
 =09mark_inode_dirty(inode);
 =09d_instantiate(dentry, inode);
@@ -782,9 +786,10 @@ static int gfs2_create_inode(struct inode *dir, struct=
 dentry *dentry,
 =09unlock_new_inode(inode);
 =09return error;
=20
-fail_gunlock3:
+fail_gunlock4:
 =09glock_clear_object(ip->i_gl, ip);
 =09glock_clear_object(io_gl, ip);
+fail_gunlock3:
 =09gfs2_glock_dq_uninit(&ip->i_iopen_gh);
 fail_gunlock2:
 =09gfs2_glock_put(io_gl);
--=20
2.35.1

