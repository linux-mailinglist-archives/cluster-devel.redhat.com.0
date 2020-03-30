Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2D684197D5F
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IqBCCA+118efejIKKcBgYHcGP5+IgEFlANo0PFYDnLY=;
	b=ItGG4ZEFLr6Yjk84pR2SWlZyo4Rhoi4zJL2hqS8I5s1+9ZrnvwGqElJLbCi7+OUR/BNVYB
	8bhG51gm8tvVSs1BiwC0/FI2ansBfvT3d0rv07vdhHRkYGbmjTaeUvuiyhL7KY2lTKEVfa
	tFgA+ETATkvjnD0aJQ6VEgTadEQ2tYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-ROFvdx6MMemIo08v7yFJjQ-1; Mon, 30 Mar 2020 09:46:53 -0400
X-MC-Unique: ROFvdx6MMemIo08v7yFJjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8525A86A072;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BA5B6EFA4;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AA9E18089CD;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkfYL020623 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5DD797B13; Mon, 30 Mar 2020 13:46:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AF4E48
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:17 -0500
Message-Id: <20200330134624.259349-33-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 32/39] gfs2: eliminate gfs2_rsqa_alloc
	in favor of gfs2_qa_alloc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, multiple callers called gfs2_rsqa_alloc to force
the existence of a reservations structure and a quota data structure
if needed. However, now the reservations are handled separately, so
the quota data is only the quota data. So we eliminate the one in
favor of just calling gfs2_qa_alloc directly.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/acl.c   |  3 ++-
 fs/gfs2/bmap.c  |  2 +-
 fs/gfs2/file.c  |  8 ++++----
 fs/gfs2/inode.c | 12 ++++++------
 fs/gfs2/quota.c |  6 +++---
 fs/gfs2/rgrp.c  | 10 ----------
 fs/gfs2/rgrp.h  |  1 -
 fs/gfs2/xattr.c |  2 +-
 8 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/fs/gfs2/acl.c b/fs/gfs2/acl.c
index 09e6be8aa036..cb09b85c5b10 100644
--- a/fs/gfs2/acl.c
+++ b/fs/gfs2/acl.c
@@ -21,6 +21,7 @@
 #include "glock.h"
 #include "inode.h"
 #include "meta_io.h"
+#include "quota.h"
 #include "rgrp.h"
 #include "trans.h"
 #include "util.h"
@@ -116,7 +117,7 @@ int gfs2_set_acl(struct inode *inode, struct posix_acl =
*acl, int type)
 =09if (acl && acl->a_count > GFS2_ACL_MAX_ENTRIES(GFS2_SB(inode)))
 =09=09return -E2BIG;
=20
-=09ret =3D gfs2_rsqa_alloc(ip);
+=09ret =3D gfs2_qa_alloc(ip);
 =09if (ret)
 =09=09return ret;
=20
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 2fe4457e1d01..4b9dbab50faf 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2183,7 +2183,7 @@ int gfs2_setattr_size(struct inode *inode, u64 newsiz=
e)
=20
 =09inode_dio_wait(inode);
=20
-=09ret =3D gfs2_rsqa_alloc(ip);
+=09ret =3D gfs2_qa_alloc(ip);
 =09if (ret)
 =09=09goto out;
=20
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index cb26be6f4351..54b0708e6d35 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -458,7 +458,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vm=
f)
=20
 =09sb_start_pagefault(inode->i_sb);
=20
-=09ret =3D gfs2_rsqa_alloc(ip);
+=09ret =3D gfs2_qa_alloc(ip);
 =09if (ret)
 =09=09goto out;
=20
@@ -849,7 +849,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09ssize_t ret;
=20
-=09ret =3D gfs2_rsqa_alloc(ip);
+=09ret =3D gfs2_qa_alloc(ip);
 =09if (ret)
 =09=09return ret;
=20
@@ -1149,7 +1149,7 @@ static long gfs2_fallocate(struct file *file, int mod=
e, loff_t offset, loff_t le
 =09if (mode & FALLOC_FL_PUNCH_HOLE) {
 =09=09ret =3D __gfs2_punch_hole(file, offset, len);
 =09} else {
-=09=09ret =3D gfs2_rsqa_alloc(ip);
+=09=09ret =3D gfs2_qa_alloc(ip);
 =09=09if (ret)
 =09=09=09goto out_putw;
=20
@@ -1176,7 +1176,7 @@ static ssize_t gfs2_file_splice_write(struct pipe_ino=
de_info *pipe,
 =09int error;
 =09struct gfs2_inode *ip =3D GFS2_I(out->f_mapping->host);
=20
-=09error =3D gfs2_rsqa_alloc(ip);
+=09error =3D gfs2_qa_alloc(ip);
 =09if (error)
 =09=09return (ssize_t)error;
=20
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index b5d04f3a247e..710f1c644f87 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -588,7 +588,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09if (!name->len || name->len > GFS2_FNAMESIZE)
 =09=09return -ENAMETOOLONG;
=20
-=09error =3D gfs2_rsqa_alloc(dip);
+=09error =3D gfs2_qa_alloc(dip);
 =09if (error)
 =09=09return error;
=20
@@ -641,7 +641,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09=09goto fail_gunlock;
=20
 =09ip =3D GFS2_I(inode);
-=09error =3D gfs2_rsqa_alloc(ip);
+=09error =3D gfs2_qa_alloc(ip);
 =09if (error)
 =09=09goto fail_free_acls;
=20
@@ -899,7 +899,7 @@ static int gfs2_link(struct dentry *old_dentry, struct =
inode *dir,
 =09if (S_ISDIR(inode->i_mode))
 =09=09return -EPERM;
=20
-=09error =3D gfs2_rsqa_alloc(dip);
+=09error =3D gfs2_qa_alloc(dip);
 =09if (error)
 =09=09return error;
=20
@@ -1362,7 +1362,7 @@ static int gfs2_rename(struct inode *odir, struct den=
try *odentry,
 =09if (error)
 =09=09return error;
=20
-=09error =3D gfs2_rsqa_alloc(ndip);
+=09error =3D gfs2_qa_alloc(ndip);
 =09if (error)
 =09=09return error;
=20
@@ -1874,7 +1874,7 @@ static int setattr_chown(struct inode *inode, struct =
iattr *attr)
 =09if (!(attr->ia_valid & ATTR_GID) || gid_eq(ogid, ngid))
 =09=09ogid =3D ngid =3D NO_GID_QUOTA_CHANGE;
=20
-=09error =3D gfs2_rsqa_alloc(ip);
+=09error =3D gfs2_qa_alloc(ip);
 =09if (error)
 =09=09goto out;
=20
@@ -1935,7 +1935,7 @@ static int gfs2_setattr(struct dentry *dentry, struct=
 iattr *attr)
 =09struct gfs2_holder i_gh;
 =09int error;
=20
-=09error =3D gfs2_rsqa_alloc(ip);
+=09error =3D gfs2_qa_alloc(ip);
 =09if (error)
 =09=09return error;
=20
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 8290f60f9877..cbe45e8eb2e0 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -567,7 +567,7 @@ int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, =
kgid_t gid)
 =09=09return 0;
=20
 =09if (ip->i_qadata =3D=3D NULL) {
-=09=09error =3D gfs2_rsqa_alloc(ip);
+=09=09error =3D gfs2_qa_alloc(ip);
 =09=09if (error)
 =09=09=09return error;
 =09}
@@ -876,7 +876,7 @@ static int do_sync(unsigned int num_qd, struct gfs2_quo=
ta_data **qda)
 =09unsigned int nalloc =3D 0, blocks;
 =09int error;
=20
-=09error =3D gfs2_rsqa_alloc(ip);
+=09error =3D gfs2_qa_alloc(ip);
 =09if (error)
 =09=09return error;
=20
@@ -1677,7 +1677,7 @@ static int gfs2_set_dqblk(struct super_block *sb, str=
uct kqid qid,
 =09if (error)
 =09=09return error;
=20
-=09error =3D gfs2_rsqa_alloc(ip);
+=09error =3D gfs2_qa_alloc(ip);
 =09if (error)
 =09=09goto out_put;
=20
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 2ee2f7d48bc1..3e3696da5bcb 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -590,16 +590,6 @@ void gfs2_free_clones(struct gfs2_rgrpd *rgd)
 =09}
 }
=20
-/**
- * gfs2_rsqa_alloc - make sure we have a reservation assigned to the inode
- *                 plus a quota allocations data structure, if necessary
- * @ip: the inode for this reservation
- */
-int gfs2_rsqa_alloc(struct gfs2_inode *ip)
-{
-=09return gfs2_qa_alloc(ip);
-}
-
 static void dump_rs(struct seq_file *seq, const struct gfs2_blkreserv *rs,
 =09=09    const char *fs_id_buf)
 {
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index a584f3096418..92cebb785996 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -44,7 +44,6 @@ extern void gfs2_inplace_release(struct gfs2_inode *ip);
 extern int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int =
*n,
 =09=09=09     bool dinode, u64 *generation);
=20
-extern int gfs2_rsqa_alloc(struct gfs2_inode *ip);
 extern void gfs2_rs_deltree(struct gfs2_blkreserv *rs);
 extern void gfs2_rsqa_delete(struct gfs2_inode *ip, atomic_t *wcount);
 extern void __gfs2_free_blocks(struct gfs2_inode *ip, struct gfs2_rgrpd *r=
gd,
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index bbe593d16bea..c4fbb96e001f 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -1222,7 +1222,7 @@ static int gfs2_xattr_set(const struct xattr_handler =
*handler,
 =09struct gfs2_holder gh;
 =09int ret;
=20
-=09ret =3D gfs2_rsqa_alloc(ip);
+=09ret =3D gfs2_qa_alloc(ip);
 =09if (ret)
 =09=09return ret;
=20
--=20
2.25.1

