Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0F7186EDC
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Mar 2020 16:43:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584373424;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pwvMjDNPzPCJ7DyJy7QFeD8Yanjk3/IaYlqOexOmi3s=;
	b=aHH9FudjXuFD1kFuQ2IzXQJe10Q+q9xDXpOQSyeH8mKfADKQEYEYGjK2R29xOoW53D5tzD
	h1K2u0LoDo32z0BqjKAoQfWYI8Mzbrbo+SysmfLKGNcHJNCR/ZZ744jX3qJ6p1uJFQApce
	wF3YJX3LozFh7wvW2Ns0L1WzlEcQUv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-2hrqaU0xPD2he12YkOSEbw-1; Mon, 16 Mar 2020 11:43:42 -0400
X-MC-Unique: 2hrqaU0xPD2he12YkOSEbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03D21333E5;
	Mon, 16 Mar 2020 15:43:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 019D792F83;
	Mon, 16 Mar 2020 15:43:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBEEE18089C8;
	Mon, 16 Mar 2020 15:43:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02GFhQI8022216 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 16 Mar 2020 11:43:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5D5E5D9E2; Mon, 16 Mar 2020 15:43:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-206-58.brq.redhat.com [10.40.206.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E53105D9C9;
	Mon, 16 Mar 2020 15:43:23 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 16 Mar 2020 16:43:20 +0100
Message-Id: <20200316154321.182811-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Clean up inode initialization and
	teardown
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When allocating a new inode, mark the iopen glock holder as uninitialized t=
o
make sure gfs2_evict_inode won't fail after an incomplete create or lookup.=
  In
gfs2_evict_inode, allow the inode glock to be NULL and remove the duplicate
iopen glock teardown code.  In gfs2_inode_lookup, don't tear down things th=
at
gfs2_evict_inode will already tear down.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 18 ++++++------------
 fs/gfs2/super.c | 28 +++++++++++++---------------
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 2716d56ed0a0..b5d04f3a247e 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -144,7 +144,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb,=
 unsigned int type,
=20
 =09=09error =3D gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE, &i=
o_gl);
 =09=09if (unlikely(error))
-=09=09=09goto fail_put;
+=09=09=09goto fail;
=20
 =09=09if (type =3D=3D DT_UNKNOWN || blktype !=3D GFS2_BLKST_FREE) {
 =09=09=09/*
@@ -155,13 +155,13 @@ struct inode *gfs2_inode_lookup(struct super_block *s=
b, unsigned int type,
 =09=09=09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE,
 =09=09=09=09=09=09   GL_SKIP, &i_gh);
 =09=09=09if (error)
-=09=09=09=09goto fail_put;
+=09=09=09=09goto fail;
=20
 =09=09=09if (blktype !=3D GFS2_BLKST_FREE) {
 =09=09=09=09error =3D gfs2_check_blk_type(sdp, no_addr,
 =09=09=09=09=09=09=09    blktype);
 =09=09=09=09if (error)
-=09=09=09=09=09goto fail_put;
+=09=09=09=09=09goto fail;
 =09=09=09}
 =09=09}
=20
@@ -169,7 +169,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb,=
 unsigned int type,
 =09=09set_bit(GIF_INVALID, &ip->i_flags);
 =09=09error =3D gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_i=
open_gh);
 =09=09if (unlikely(error))
-=09=09=09goto fail_put;
+=09=09=09goto fail;
 =09=09glock_set_object(ip->i_iopen_gh.gh_gl, ip);
 =09=09gfs2_glock_put(io_gl);
 =09=09io_gl =3D NULL;
@@ -182,7 +182,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb,=
 unsigned int type,
 =09=09=09/* Inode glock must be locked already */
 =09=09=09error =3D gfs2_inode_refresh(GFS2_I(inode));
 =09=09=09if (error)
-=09=09=09=09goto fail_refresh;
+=09=09=09=09goto fail;
 =09=09} else {
 =09=09=09ip->i_no_formal_ino =3D no_formal_ino;
 =09=09=09inode->i_mode =3D DT2IF(type);
@@ -197,17 +197,11 @@ struct inode *gfs2_inode_lookup(struct super_block *s=
b, unsigned int type,
 =09=09gfs2_glock_dq_uninit(&i_gh);
 =09return inode;
=20
-fail_refresh:
-=09ip->i_iopen_gh.gh_flags |=3D GL_NOCACHE;
-=09glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
-=09gfs2_glock_dq_uninit(&ip->i_iopen_gh);
-fail_put:
+fail:
 =09if (io_gl)
 =09=09gfs2_glock_put(io_gl);
-=09glock_clear_object(ip->i_gl, ip);
 =09if (gfs2_holder_initialized(&i_gh))
 =09=09gfs2_glock_dq_uninit(&i_gh);
-fail:
 =09iget_failed(inode);
 =09return ERR_PTR(error);
 }
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 68cc7c291a81..0f8c0f057f80 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1356,14 +1356,6 @@ static void gfs2_evict_inode(struct inode *inode)
 =09if (gfs2_rs_active(&ip->i_res))
 =09=09gfs2_rs_deltree(&ip->i_res);
=20
-=09if (gfs2_holder_initialized(&ip->i_iopen_gh)) {
-=09=09glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
-=09=09if (test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
-=09=09=09ip->i_iopen_gh.gh_flags |=3D GL_NOCACHE;
-=09=09=09gfs2_glock_dq(&ip->i_iopen_gh);
-=09=09}
-=09=09gfs2_holder_uninit(&ip->i_iopen_gh);
-=09}
 =09if (gfs2_holder_initialized(&gh)) {
 =09=09glock_clear_object(ip->i_gl, ip);
 =09=09gfs2_glock_dq_uninit(&gh);
@@ -1376,18 +1368,23 @@ static void gfs2_evict_inode(struct inode *inode)
 =09gfs2_ordered_del_inode(ip);
 =09clear_inode(inode);
 =09gfs2_dir_hash_inval(ip);
-=09glock_clear_object(ip->i_gl, ip);
-=09wait_on_bit_io(&ip->i_flags, GIF_GLOP_PENDING, TASK_UNINTERRUPTIBLE);
-=09gfs2_glock_add_to_lru(ip->i_gl);
-=09gfs2_glock_put_eventually(ip->i_gl);
-=09ip->i_gl =3D NULL;
+=09if (ip->i_gl) {
+=09=09glock_clear_object(ip->i_gl, ip);
+=09=09wait_on_bit_io(&ip->i_flags, GIF_GLOP_PENDING, TASK_UNINTERRUPTIBLE)=
;
+=09=09gfs2_glock_add_to_lru(ip->i_gl);
+=09=09gfs2_glock_put_eventually(ip->i_gl);
+=09=09ip->i_gl =3D NULL;
+=09}
 =09if (gfs2_holder_initialized(&ip->i_iopen_gh)) {
 =09=09struct gfs2_glock *gl =3D ip->i_iopen_gh.gh_gl;
=20
 =09=09glock_clear_object(gl, ip);
-=09=09ip->i_iopen_gh.gh_flags |=3D GL_NOCACHE;
+=09=09if (test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
+=09=09=09ip->i_iopen_gh.gh_flags |=3D GL_NOCACHE;
+=09=09=09gfs2_glock_dq(&ip->i_iopen_gh);
+=09=09}
 =09=09gfs2_glock_hold(gl);
-=09=09gfs2_glock_dq_uninit(&ip->i_iopen_gh);
+=09=09gfs2_holder_uninit(&ip->i_iopen_gh);
 =09=09gfs2_glock_put_eventually(gl);
 =09}
 }
@@ -1401,6 +1398,7 @@ static struct inode *gfs2_alloc_inode(struct super_bl=
ock *sb)
 =09=09return NULL;
 =09ip->i_flags =3D 0;
 =09ip->i_gl =3D NULL;
+=09gfs2_holder_mark_uninitialized(&ip->i_iopen_gh);
 =09memset(&ip->i_res, 0, sizeof(ip->i_res));
 =09RB_CLEAR_NODE(&ip->i_res.rs_node);
 =09ip->i_rahead =3D 0;
--=20
2.24.1

