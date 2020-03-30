Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 04AE1197D69
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576022;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eSK3V0vtT6rz4vqiIy85kxyXdTKhBKu4zND6tynIOW4=;
	b=gd3TeG68tkZ/SNyGNvAfxAmtS4+oiQkllX2/iyziaAB+EUoCKjXJ5ST03/altyYSAp0pSc
	jWMcYuVB2Fz/s46e/CJQRJwlKbdCg2iWZeS6+xLEXrAUwfHKDwZRFqcA+OB1wpn44eiBAL
	0+tdB4ahw9Z1j5QI8KYYYUkoJ3i7NNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-yhygae_vN5W9lxcCZ07geQ-1; Mon, 30 Mar 2020 09:47:00 -0400
X-MC-Unique: yhygae_vN5W9lxcCZ07geQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 923BFDBB1;
	Mon, 30 Mar 2020 13:46:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D1C597B13;
	Mon, 30 Mar 2020 13:46:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6110718089CF;
	Mon, 30 Mar 2020 13:46:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkgZM020636 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34A2E48; Mon, 30 Mar 2020 13:46:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC6C597B17
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:18 -0500
Message-Id: <20200330134624.259349-34-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 33/39] gfs2: Change inode qa_data to
	allow multiple users
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

Before this patch, multiple users called gfs2_qa_alloc which allocated
a qadata structure to the inode, if quotas are turned on. Later, in
file close or evict, the structure was deleted with gfs2_qa_delete.
But there can be several competing processes who need access to the
structure. There were races between file close (release) and the others.
Thus, a release could delete the structure out from under a process
that relied upon its existence. For example, chown.

This patch changes the management of the qadata structures to be
a get/put scheme. Function gfs2_qa_alloc has been changed to gfs2_qa_get
and if the structure is allocated, the count essentially starts out at
1. Function gfs2_qa_delete has been renamed to gfs2_qa_put, and the
last guy to decrement the count to 0 frees the memory.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/acl.c    |  6 +++--
 fs/gfs2/bmap.c   |  2 +-
 fs/gfs2/file.c   | 35 +++++++++++++++++++--------
 fs/gfs2/incore.h |  1 +
 fs/gfs2/inode.c  | 32 ++++++++++++++----------
 fs/gfs2/quota.c  | 63 +++++++++++++++++++++++++++++-------------------
 fs/gfs2/quota.h  |  4 +--
 fs/gfs2/rgrp.c   |  2 +-
 fs/gfs2/super.c  |  2 ++
 fs/gfs2/xattr.c  | 12 ++++++---
 10 files changed, 101 insertions(+), 58 deletions(-)

diff --git a/fs/gfs2/acl.c b/fs/gfs2/acl.c
index cb09b85c5b10..2e939f5fe751 100644
--- a/fs/gfs2/acl.c
+++ b/fs/gfs2/acl.c
@@ -117,14 +117,14 @@ int gfs2_set_acl(struct inode *inode, struct posix_ac=
l *acl, int type)
 =09if (acl && acl->a_count > GFS2_ACL_MAX_ENTRIES(GFS2_SB(inode)))
 =09=09return -E2BIG;
=20
-=09ret =3D gfs2_qa_alloc(ip);
+=09ret =3D gfs2_qa_get(ip);
 =09if (ret)
 =09=09return ret;
=20
 =09if (!gfs2_glock_is_locked_by_me(ip->i_gl)) {
 =09=09ret =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
 =09=09if (ret)
-=09=09=09return ret;
+=09=09=09goto out;
 =09=09need_unlock =3D true;
 =09}
=20
@@ -144,5 +144,7 @@ int gfs2_set_acl(struct inode *inode, struct posix_acl =
*acl, int type)
 unlock:
 =09if (need_unlock)
 =09=09gfs2_glock_dq_uninit(&gh);
+out:
+=09gfs2_qa_put(ip);
 =09return ret;
 }
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 4b9dbab50faf..d510a453dfa8 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2183,7 +2183,7 @@ int gfs2_setattr_size(struct inode *inode, u64 newsiz=
e)
=20
 =09inode_dio_wait(inode);
=20
-=09ret =3D gfs2_qa_alloc(ip);
+=09ret =3D gfs2_qa_get(ip);
 =09if (ret)
 =09=09goto out;
=20
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 54b0708e6d35..f18876cdfb0f 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -458,7 +458,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vm=
f)
=20
 =09sb_start_pagefault(inode->i_sb);
=20
-=09ret =3D gfs2_qa_alloc(ip);
+=09ret =3D gfs2_qa_get(ip);
 =09if (ret)
 =09=09goto out;
=20
@@ -553,6 +553,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vm=
f)
 out_unlock:
 =09gfs2_glock_dq(&gh);
 out_uninit:
+=09gfs2_qa_put(ip);
 =09gfs2_holder_uninit(&gh);
 =09if (ret =3D=3D 0) {
 =09=09set_page_dirty(page);
@@ -635,7 +636,17 @@ int gfs2_open_common(struct inode *inode, struct file =
*file)
=20
 =09gfs2_assert_warn(GFS2_SB(inode), !file->private_data);
 =09file->private_data =3D fp;
+=09if (file->f_mode & FMODE_WRITE) {
+=09=09ret =3D gfs2_qa_get(GFS2_I(inode));
+=09=09if (ret)
+=09=09=09goto fail;
+=09}
 =09return 0;
+
+fail:
+=09kfree(file->private_data);
+=09file->private_data =3D NULL;
+=09return ret;
 }
=20
 /**
@@ -690,10 +701,8 @@ static int gfs2_release(struct inode *inode, struct fi=
le *file)
 =09kfree(file->private_data);
 =09file->private_data =3D NULL;
=20
-=09if (!(file->f_mode & FMODE_WRITE))
-=09=09return 0;
-
-=09gfs2_rsqa_delete(ip, &inode->i_writecount);
+=09if (file->f_mode & FMODE_WRITE)
+=09=09gfs2_rsqa_delete(ip, &inode->i_writecount);
 =09return 0;
 }
=20
@@ -849,7 +858,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09ssize_t ret;
=20
-=09ret =3D gfs2_qa_alloc(ip);
+=09ret =3D gfs2_qa_get(ip);
 =09if (ret)
 =09=09return ret;
=20
@@ -860,7 +869,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
=20
 =09=09ret =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
 =09=09if (ret)
-=09=09=09return ret;
+=09=09=09goto out;
 =09=09gfs2_glock_dq_uninit(&gh);
 =09}
=20
@@ -918,6 +927,8 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
=20
 out_unlock:
 =09inode_unlock(inode);
+out:
+=09gfs2_qa_put(ip);
 =09return ret;
 }
=20
@@ -1149,7 +1160,7 @@ static long gfs2_fallocate(struct file *file, int mod=
e, loff_t offset, loff_t le
 =09if (mode & FALLOC_FL_PUNCH_HOLE) {
 =09=09ret =3D __gfs2_punch_hole(file, offset, len);
 =09} else {
-=09=09ret =3D gfs2_qa_alloc(ip);
+=09=09ret =3D gfs2_qa_get(ip);
 =09=09if (ret)
 =09=09=09goto out_putw;
=20
@@ -1157,6 +1168,7 @@ static long gfs2_fallocate(struct file *file, int mod=
e, loff_t offset, loff_t le
=20
 =09=09if (ret)
 =09=09=09gfs2_rs_deltree(&ip->i_res);
+=09=09gfs2_qa_put(ip);
 =09}
=20
 out_putw:
@@ -1175,14 +1187,17 @@ static ssize_t gfs2_file_splice_write(struct pipe_i=
node_info *pipe,
 {
 =09int error;
 =09struct gfs2_inode *ip =3D GFS2_I(out->f_mapping->host);
+=09ssize_t ret;
=20
-=09error =3D gfs2_qa_alloc(ip);
+=09error =3D gfs2_qa_get(ip);
 =09if (error)
 =09=09return (ssize_t)error;
=20
 =09gfs2_size_hint(out, *ppos, len);
=20
-=09return iter_file_splice_write(pipe, out, ppos, len, flags);
+=09ret =3D iter_file_splice_write(pipe, out, ppos, len, flags);
+=09gfs2_qa_put(ip);
+=09return ret;
 }
=20
 #ifdef CONFIG_GFS2_FS_LOCKING_DLM
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 04549a8cae7e..84a824293a78 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -295,6 +295,7 @@ struct gfs2_qadata { /* quota allocation data */
 =09struct gfs2_quota_data *qa_qd[2 * GFS2_MAXQUOTAS];
 =09struct gfs2_holder qa_qd_ghs[2 * GFS2_MAXQUOTAS];
 =09unsigned int qa_qd_num;
+=09int qa_ref;
 };
=20
 /* Resource group multi-block reservation, in order of appearance:
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 710f1c644f87..d1a24753c55f 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -588,13 +588,13 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09if (!name->len || name->len > GFS2_FNAMESIZE)
 =09=09return -ENAMETOOLONG;
=20
-=09error =3D gfs2_qa_alloc(dip);
+=09error =3D gfs2_qa_get(dip);
 =09if (error)
 =09=09return error;
=20
 =09error =3D gfs2_rindex_update(sdp);
 =09if (error)
-=09=09return error;
+=09=09goto fail;
=20
 =09error =3D gfs2_glock_nq_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
 =09if (error)
@@ -641,7 +641,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09=09goto fail_gunlock;
=20
 =09ip =3D GFS2_I(inode);
-=09error =3D gfs2_qa_alloc(ip);
+=09error =3D gfs2_qa_get(ip);
 =09if (error)
 =09=09goto fail_free_acls;
=20
@@ -776,6 +776,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
 =09gfs2_glock_put(io_gl);
 fail_free_inode:
+=09gfs2_qa_put(ip);
 =09if (ip->i_gl) {
 =09=09glock_clear_object(ip->i_gl, ip);
 =09=09gfs2_glock_put(ip->i_gl);
@@ -798,6 +799,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09if (gfs2_holder_initialized(ghs + 1))
 =09=09gfs2_glock_dq_uninit(ghs + 1);
 fail:
+=09gfs2_qa_put(dip);
 =09return error;
 }
=20
@@ -899,7 +901,7 @@ static int gfs2_link(struct dentry *old_dentry, struct =
inode *dir,
 =09if (S_ISDIR(inode->i_mode))
 =09=09return -EPERM;
=20
-=09error =3D gfs2_qa_alloc(dip);
+=09error =3D gfs2_qa_get(dip);
 =09if (error)
 =09=09return error;
=20
@@ -1002,6 +1004,7 @@ static int gfs2_link(struct dentry *old_dentry, struc=
t inode *dir,
 out_child:
 =09gfs2_glock_dq(ghs);
 out_parent:
+=09gfs2_qa_put(ip);
 =09gfs2_holder_uninit(ghs);
 =09gfs2_holder_uninit(ghs + 1);
 =09return error;
@@ -1362,7 +1365,7 @@ static int gfs2_rename(struct inode *odir, struct den=
try *odentry,
 =09if (error)
 =09=09return error;
=20
-=09error =3D gfs2_qa_alloc(ndip);
+=09error =3D gfs2_qa_get(ndip);
 =09if (error)
 =09=09return error;
=20
@@ -1562,6 +1565,7 @@ static int gfs2_rename(struct inode *odir, struct den=
try *odentry,
 =09if (gfs2_holder_initialized(&r_gh))
 =09=09gfs2_glock_dq_uninit(&r_gh);
 out:
+=09gfs2_qa_put(ndip);
 =09return error;
 }
=20
@@ -1873,10 +1877,9 @@ static int setattr_chown(struct inode *inode, struct=
 iattr *attr)
 =09=09ouid =3D nuid =3D NO_UID_QUOTA_CHANGE;
 =09if (!(attr->ia_valid & ATTR_GID) || gid_eq(ogid, ngid))
 =09=09ogid =3D ngid =3D NO_GID_QUOTA_CHANGE;
-
-=09error =3D gfs2_qa_alloc(ip);
+=09error =3D gfs2_qa_get(ip);
 =09if (error)
-=09=09goto out;
+=09=09return error;
=20
 =09error =3D gfs2_rindex_update(sdp);
 =09if (error)
@@ -1914,6 +1917,7 @@ static int setattr_chown(struct inode *inode, struct =
iattr *attr)
 out_gunlock_q:
 =09gfs2_quota_unlock(ip);
 out:
+=09gfs2_qa_put(ip);
 =09return error;
 }
=20
@@ -1935,21 +1939,21 @@ static int gfs2_setattr(struct dentry *dentry, stru=
ct iattr *attr)
 =09struct gfs2_holder i_gh;
 =09int error;
=20
-=09error =3D gfs2_qa_alloc(ip);
+=09error =3D gfs2_qa_get(ip);
 =09if (error)
 =09=09return error;
=20
 =09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &i_gh);
 =09if (error)
-=09=09return error;
+=09=09goto out;
=20
 =09error =3D -EPERM;
 =09if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
-=09=09goto out;
+=09=09goto error;
=20
 =09error =3D setattr_prepare(dentry, attr);
 =09if (error)
-=09=09goto out;
+=09=09goto error;
=20
 =09if (attr->ia_valid & ATTR_SIZE)
 =09=09error =3D gfs2_setattr_size(inode, attr->ia_size);
@@ -1961,10 +1965,12 @@ static int gfs2_setattr(struct dentry *dentry, stru=
ct iattr *attr)
 =09=09=09error =3D posix_acl_chmod(inode, inode->i_mode);
 =09}
=20
-out:
+error:
 =09if (!error)
 =09=09mark_inode_dirty(inode);
 =09gfs2_glock_dq_uninit(&i_gh);
+out:
+=09gfs2_qa_put(ip);
 =09return error;
 }
=20
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index cbe45e8eb2e0..cc0c4b5800be 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -525,11 +525,11 @@ static void qdsb_put(struct gfs2_quota_data *qd)
 }
=20
 /**
- * gfs2_qa_alloc - make sure we have a quota allocations data structure,
- *                 if necessary
+ * gfs2_qa_get - make sure we have a quota allocations data structure,
+ *               if necessary
  * @ip: the inode for this reservation
  */
-int gfs2_qa_alloc(struct gfs2_inode *ip)
+int gfs2_qa_get(struct gfs2_inode *ip)
 {
 =09int error =3D 0;
 =09struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
@@ -540,17 +540,21 @@ int gfs2_qa_alloc(struct gfs2_inode *ip)
 =09down_write(&ip->i_rw_mutex);
 =09if (ip->i_qadata =3D=3D NULL) {
 =09=09ip->i_qadata =3D kmem_cache_zalloc(gfs2_qadata_cachep, GFP_NOFS);
-=09=09if (!ip->i_qadata)
+=09=09if (!ip->i_qadata) {
 =09=09=09error =3D -ENOMEM;
+=09=09=09goto out;
+=09=09}
 =09}
+=09ip->i_qadata->qa_ref++;
+out:
 =09up_write(&ip->i_rw_mutex);
 =09return error;
 }
=20
-void gfs2_qa_delete(struct gfs2_inode *ip, atomic_t *wcount)
+void gfs2_qa_put(struct gfs2_inode *ip)
 {
 =09down_write(&ip->i_rw_mutex);
-=09if (ip->i_qadata && ((wcount =3D=3D NULL) || (atomic_read(wcount) <=3D =
1))) {
+=09if (ip->i_qadata && --ip->i_qadata->qa_ref =3D=3D 0) {
 =09=09kmem_cache_free(gfs2_qadata_cachep, ip->i_qadata);
 =09=09ip->i_qadata =3D NULL;
 =09}
@@ -566,27 +570,27 @@ int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid=
, kgid_t gid)
 =09if (sdp->sd_args.ar_quota =3D=3D GFS2_QUOTA_OFF)
 =09=09return 0;
=20
-=09if (ip->i_qadata =3D=3D NULL) {
-=09=09error =3D gfs2_qa_alloc(ip);
-=09=09if (error)
-=09=09=09return error;
-=09}
+=09error =3D gfs2_qa_get(ip);
+=09if (error)
+=09=09return error;
=20
 =09qd =3D ip->i_qadata->qa_qd;
=20
 =09if (gfs2_assert_warn(sdp, !ip->i_qadata->qa_qd_num) ||
-=09    gfs2_assert_warn(sdp, !test_bit(GIF_QD_LOCKED, &ip->i_flags)))
-=09=09return -EIO;
+=09    gfs2_assert_warn(sdp, !test_bit(GIF_QD_LOCKED, &ip->i_flags))) {
+=09=09error =3D -EIO;
+=09=09goto out;
+=09}
=20
 =09error =3D qdsb_get(sdp, make_kqid_uid(ip->i_inode.i_uid), qd);
 =09if (error)
-=09=09goto out;
+=09=09goto out_unhold;
 =09ip->i_qadata->qa_qd_num++;
 =09qd++;
=20
 =09error =3D qdsb_get(sdp, make_kqid_gid(ip->i_inode.i_gid), qd);
 =09if (error)
-=09=09goto out;
+=09=09goto out_unhold;
 =09ip->i_qadata->qa_qd_num++;
 =09qd++;
=20
@@ -594,7 +598,7 @@ int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, =
kgid_t gid)
 =09    !uid_eq(uid, ip->i_inode.i_uid)) {
 =09=09error =3D qdsb_get(sdp, make_kqid_uid(uid), qd);
 =09=09if (error)
-=09=09=09goto out;
+=09=09=09goto out_unhold;
 =09=09ip->i_qadata->qa_qd_num++;
 =09=09qd++;
 =09}
@@ -603,14 +607,15 @@ int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid=
, kgid_t gid)
 =09    !gid_eq(gid, ip->i_inode.i_gid)) {
 =09=09error =3D qdsb_get(sdp, make_kqid_gid(gid), qd);
 =09=09if (error)
-=09=09=09goto out;
+=09=09=09goto out_unhold;
 =09=09ip->i_qadata->qa_qd_num++;
 =09=09qd++;
 =09}
=20
-out:
+out_unhold:
 =09if (error)
 =09=09gfs2_quota_unhold(ip);
+out:
 =09return error;
 }
=20
@@ -621,6 +626,7 @@ void gfs2_quota_unhold(struct gfs2_inode *ip)
=20
 =09if (ip->i_qadata =3D=3D NULL)
 =09=09return;
+
 =09gfs2_assert_warn(sdp, !test_bit(GIF_QD_LOCKED, &ip->i_flags));
=20
 =09for (x =3D 0; x < ip->i_qadata->qa_qd_num; x++) {
@@ -628,6 +634,7 @@ void gfs2_quota_unhold(struct gfs2_inode *ip)
 =09=09ip->i_qadata->qa_qd[x] =3D NULL;
 =09}
 =09ip->i_qadata->qa_qd_num =3D 0;
+=09gfs2_qa_put(ip);
 }
=20
 static int sort_qd(const void *a, const void *b)
@@ -876,7 +883,7 @@ static int do_sync(unsigned int num_qd, struct gfs2_quo=
ta_data **qda)
 =09unsigned int nalloc =3D 0, blocks;
 =09int error;
=20
-=09error =3D gfs2_qa_alloc(ip);
+=09error =3D gfs2_qa_get(ip);
 =09if (error)
 =09=09return error;
=20
@@ -884,8 +891,10 @@ static int do_sync(unsigned int num_qd, struct gfs2_qu=
ota_data **qda)
 =09=09=09      &data_blocks, &ind_blocks);
=20
 =09ghs =3D kmalloc_array(num_qd, sizeof(struct gfs2_holder), GFP_NOFS);
-=09if (!ghs)
-=09=09return -ENOMEM;
+=09if (!ghs) {
+=09=09error =3D -ENOMEM;
+=09=09goto out;
+=09}
=20
 =09sort(qda, num_qd, sizeof(struct gfs2_quota_data *), sort_qd, NULL);
 =09inode_lock(&ip->i_inode);
@@ -893,12 +902,12 @@ static int do_sync(unsigned int num_qd, struct gfs2_q=
uota_data **qda)
 =09=09error =3D gfs2_glock_nq_init(qda[qx]->qd_gl, LM_ST_EXCLUSIVE,
 =09=09=09=09=09   GL_NOCACHE, &ghs[qx]);
 =09=09if (error)
-=09=09=09goto out;
+=09=09=09goto out_dq;
 =09}
=20
 =09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &i_gh);
 =09if (error)
-=09=09goto out;
+=09=09goto out_dq;
=20
 =09for (x =3D 0; x < num_qd; x++) {
 =09=09offset =3D qd2offset(qda[x]);
@@ -950,13 +959,15 @@ static int do_sync(unsigned int num_qd, struct gfs2_q=
uota_data **qda)
 =09gfs2_inplace_release(ip);
 out_alloc:
 =09gfs2_glock_dq_uninit(&i_gh);
-out:
+out_dq:
 =09while (qx--)
 =09=09gfs2_glock_dq_uninit(&ghs[qx]);
 =09inode_unlock(&ip->i_inode);
 =09kfree(ghs);
 =09gfs2_log_flush(ip->i_gl->gl_name.ln_sbd, ip->i_gl,
 =09=09       GFS2_LOG_HEAD_FLUSH_NORMAL | GFS2_LFC_DO_SYNC);
+out:
+=09gfs2_qa_put(ip);
 =09return error;
 }
=20
@@ -1259,6 +1270,7 @@ void gfs2_quota_change(struct gfs2_inode *ip, s64 cha=
nge,
 =09if (ip->i_diskflags & GFS2_DIF_SYSTEM)
 =09=09return;
=20
+=09BUG_ON(ip->i_qadata->qa_ref <=3D 0);
 =09for (x =3D 0; x < ip->i_qadata->qa_qd_num; x++) {
 =09=09qd =3D ip->i_qadata->qa_qd[x];
=20
@@ -1677,7 +1689,7 @@ static int gfs2_set_dqblk(struct super_block *sb, str=
uct kqid qid,
 =09if (error)
 =09=09return error;
=20
-=09error =3D gfs2_qa_alloc(ip);
+=09error =3D gfs2_qa_get(ip);
 =09if (error)
 =09=09goto out_put;
=20
@@ -1746,6 +1758,7 @@ static int gfs2_set_dqblk(struct super_block *sb, str=
uct kqid qid,
 out_q:
 =09gfs2_glock_dq_uninit(&q_gh);
 out_unlockput:
+=09gfs2_qa_put(ip);
 =09inode_unlock(&ip->i_inode);
 out_put:
 =09qd_put(qd);
diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
index 765627d9a91e..7f9ca8ef40fc 100644
--- a/fs/gfs2/quota.h
+++ b/fs/gfs2/quota.h
@@ -15,8 +15,8 @@ struct gfs2_sbd;
 #define NO_UID_QUOTA_CHANGE INVALID_UID
 #define NO_GID_QUOTA_CHANGE INVALID_GID
=20
-extern int gfs2_qa_alloc(struct gfs2_inode *ip);
-extern void gfs2_qa_delete(struct gfs2_inode *ip, atomic_t *wcount);
+extern int gfs2_qa_get(struct gfs2_inode *ip);
+extern void gfs2_qa_put(struct gfs2_inode *ip);
 extern int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, kgid_t gid);
 extern void gfs2_quota_unhold(struct gfs2_inode *ip);
=20
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 3e3696da5bcb..04e3e13a230c 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -673,7 +673,7 @@ void gfs2_rsqa_delete(struct gfs2_inode *ip, atomic_t *=
wcount)
 =09if ((wcount =3D=3D NULL) || (atomic_read(wcount) <=3D 1))
 =09=09gfs2_rs_deltree(&ip->i_res);
 =09up_write(&ip->i_rw_mutex);
-=09gfs2_qa_delete(ip, wcount);
+=09gfs2_qa_put(ip);
 }
=20
 /**
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index a6bf8f1e083e..68d934fa0f9f 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1401,6 +1401,8 @@ static void gfs2_evict_inode(struct inode *inode)
 =09=09fs_warn(sdp, "gfs2_evict_inode: %d\n", error);
 out:
 =09truncate_inode_pages_final(&inode->i_data);
+=09if (ip->i_qadata)
+=09=09gfs2_assert_warn(sdp, ip->i_qadata->qa_ref =3D=3D 0);
 =09gfs2_rsqa_delete(ip, NULL);
 =09gfs2_ordered_del_inode(ip);
 =09clear_inode(inode);
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index c4fbb96e001f..9d7667bc4292 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -1222,7 +1222,7 @@ static int gfs2_xattr_set(const struct xattr_handler =
*handler,
 =09struct gfs2_holder gh;
 =09int ret;
=20
-=09ret =3D gfs2_qa_alloc(ip);
+=09ret =3D gfs2_qa_get(ip);
 =09if (ret)
 =09=09return ret;
=20
@@ -1231,15 +1231,19 @@ static int gfs2_xattr_set(const struct xattr_handle=
r *handler,
 =09if (!gfs2_glock_is_locked_by_me(ip->i_gl)) {
 =09=09ret =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
 =09=09if (ret)
-=09=09=09return ret;
+=09=09=09goto out;
 =09} else {
-=09=09if (WARN_ON_ONCE(ip->i_gl->gl_state !=3D LM_ST_EXCLUSIVE))
-=09=09=09return -EIO;
+=09=09if (WARN_ON_ONCE(ip->i_gl->gl_state !=3D LM_ST_EXCLUSIVE)) {
+=09=09=09ret =3D -EIO;
+=09=09=09goto out;
+=09=09}
 =09=09gfs2_holder_mark_uninitialized(&gh);
 =09}
 =09ret =3D __gfs2_xattr_set(inode, name, value, size, flags, handler->flag=
s);
 =09if (gfs2_holder_initialized(&gh))
 =09=09gfs2_glock_dq_uninit(&gh);
+out:
+=09gfs2_qa_put(ip);
 =09return ret;
 }
=20
--=20
2.25.1

