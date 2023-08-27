Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AACC78C096
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gCfV0fVoW+e4YW0XQ3QMYbYSY2wWMOrk5M9QZ/9mRm8=;
	b=Wo4GPG5MWQzWCJYgcZ4fb4HvCtZ3xLIg/wq4uWcaEQmAN1f8pdHPOmlDxcRpKrT7JT4nkF
	nztRymSaSdoKEk+sTAGDEQrmVJBmpXzNAZVYiudy0sFIFSCeWM+NbDTlT/SIjye3MpZq08
	T8EtJlSeW5YIV3EoieLAvqWTlmH1pvs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-Kdb5ReWoMZeCCjoi-WUM-g-1; Tue, 29 Aug 2023 04:41:14 -0400
X-MC-Unique: Kdb5ReWoMZeCCjoi-WUM-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 862AF823D78;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 778826B2B0;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9AA319459FC;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A54319465A8 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 27 Aug 2023 13:33:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B238492C14; Sun, 27 Aug 2023 13:33:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 237C8492C13
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:33:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F1D1C0514D
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:33:47 +0000 (UTC)
Received: from out-246.mta1.migadu.com (out-246.mta1.migadu.com
 [95.215.58.246]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-Zoo7jP_VPoOcrUO8DaqmsQ-1; Sun, 27 Aug 2023 09:33:44 -0400
X-MC-Unique: Zoo7jP_VPoOcrUO8DaqmsQ-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:30 +0800
Message-Id: <20230827132835.1373581-7-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 06/11] vfs: add a nowait parameter for
 touch_atime()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Add a nowait boolean parameter for touch_atime() to support nowait
semantics. It is true only when io_uring is the initial caller.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/cachefiles/namei.c | 2 +-
 fs/ecryptfs/file.c    | 4 ++--
 fs/inode.c            | 7 ++++---
 fs/namei.c            | 4 ++--
 fs/nfsd/vfs.c         | 2 +-
 fs/overlayfs/file.c   | 2 +-
 fs/overlayfs/inode.c  | 2 +-
 fs/stat.c             | 2 +-
 include/linux/fs.h    | 4 ++--
 kernel/bpf/inode.c    | 4 ++--
 net/unix/af_unix.c    | 4 ++--
 11 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index d9d22d0ec38a..7a21bf0e36b8 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -591,7 +591,7 @@ static bool cachefiles_open_file(struct cachefiles_obje=
ct *object,
 =09 * used to keep track of culling, and atimes are only updated by read,
 =09 * write and readdir but not lookup or open).
 =09 */
-=09touch_atime(&file->f_path);
+=09touch_atime(&file->f_path, false);
 =09dput(dentry);
 =09return true;
=20
diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
index ce0a3c5ed0ca..3db7006cc440 100644
--- a/fs/ecryptfs/file.c
+++ b/fs/ecryptfs/file.c
@@ -39,7 +39,7 @@ static ssize_t ecryptfs_read_update_atime(struct kiocb *i=
ocb,
 =09rc =3D generic_file_read_iter(iocb, to);
 =09if (rc >=3D 0) {
 =09=09path =3D ecryptfs_dentry_to_lower_path(file->f_path.dentry);
-=09=09touch_atime(path);
+=09=09touch_atime(path, false);
 =09}
 =09return rc;
 }
@@ -64,7 +64,7 @@ static ssize_t ecryptfs_splice_read_update_atime(struct f=
ile *in, loff_t *ppos,
 =09rc =3D filemap_splice_read(in, ppos, pipe, len, flags);
 =09if (rc >=3D 0) {
 =09=09path =3D ecryptfs_dentry_to_lower_path(in->f_path.dentry);
-=09=09touch_atime(path);
+=09=09touch_atime(path, false);
 =09}
 =09return rc;
 }
diff --git a/fs/inode.c b/fs/inode.c
index 8fefb69e1f84..e83b836f2d09 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1961,17 +1961,17 @@ bool atime_needs_update(const struct path *path, st=
ruct inode *inode)
 =09return true;
 }
=20
-void touch_atime(const struct path *path)
+int touch_atime(const struct path *path, bool nowait)
 {
 =09struct vfsmount *mnt =3D path->mnt;
 =09struct inode *inode =3D d_inode(path->dentry);
 =09struct timespec64 now;
=20
 =09if (!atime_needs_update(path, inode))
-=09=09return;
+=09=09return 0;
=20
 =09if (!sb_start_write_trylock(inode->i_sb))
-=09=09return;
+=09=09return 0;
=20
 =09if (__mnt_want_write(mnt) !=3D 0)
 =09=09goto skip_update;
@@ -1989,6 +1989,7 @@ void touch_atime(const struct path *path)
 =09__mnt_drop_write(mnt);
 skip_update:
 =09sb_end_write(inode->i_sb);
+=09return 0;
 }
 EXPORT_SYMBOL(touch_atime);
=20
diff --git a/fs/namei.c b/fs/namei.c
index e56ff39a79bc..35731d405730 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1776,12 +1776,12 @@ static const char *pick_link(struct nameidata *nd, =
struct path *link,
 =09=09return ERR_PTR(-ELOOP);
=20
 =09if (!(nd->flags & LOOKUP_RCU)) {
-=09=09touch_atime(&last->link);
+=09=09touch_atime(&last->link, false);
 =09=09cond_resched();
 =09} else if (atime_needs_update(&last->link, inode)) {
 =09=09if (!try_to_unlazy(nd))
 =09=09=09return ERR_PTR(-ECHILD);
-=09=09touch_atime(&last->link);
+=09=09touch_atime(&last->link, false);
 =09}
=20
 =09error =3D security_inode_follow_link(link->dentry, inode,
diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index 8a2321d19194..3179e7b5d209 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -1569,7 +1569,7 @@ nfsd_readlink(struct svc_rqst *rqstp, struct svc_fh *=
fhp, char *buf, int *lenp)
 =09if (unlikely(!d_is_symlink(path.dentry)))
 =09=09return nfserr_inval;
=20
-=09touch_atime(&path);
+=09touch_atime(&path, false);
=20
 =09link =3D vfs_get_link(path.dentry, &done);
 =09if (IS_ERR(link))
diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index 21245b00722a..6ff466ef98ea 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -255,7 +255,7 @@ static void ovl_file_accessed(struct file *file)
 =09=09inode->i_ctime =3D upperinode->i_ctime;
 =09}
=20
-=09touch_atime(&file->f_path);
+=09touch_atime(&file->f_path, false);
 }
=20
 static rwf_t ovl_iocb_to_rwf(int ifl)
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index a63e57447be9..66e03025e748 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -703,7 +703,7 @@ int ovl_update_time(struct inode *inode, struct timespe=
c64 *ts, int flags)
 =09=09};
=20
 =09=09if (upperpath.dentry) {
-=09=09=09touch_atime(&upperpath);
+=09=09=09touch_atime(&upperpath, false);
 =09=09=09inode->i_atime =3D d_inode(upperpath.dentry)->i_atime;
 =09=09}
 =09}
diff --git a/fs/stat.c b/fs/stat.c
index 7c238da22ef0..713773e61110 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -485,7 +485,7 @@ static int do_readlinkat(int dfd, const char __user *pa=
thname,
 =09=09if (d_is_symlink(path.dentry) || inode->i_op->readlink) {
 =09=09=09error =3D security_inode_readlink(path.dentry);
 =09=09=09if (!error) {
-=09=09=09=09touch_atime(&path);
+=09=09=09=09touch_atime(&path, false);
 =09=09=09=09error =3D vfs_readlink(path.dentry, buf, bufsiz);
 =09=09=09}
 =09=09}
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f3e315e8efdd..ba54879089ac 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2201,13 +2201,13 @@ enum file_time_flags {
 };
=20
 extern bool atime_needs_update(const struct path *, struct inode *);
-extern void touch_atime(const struct path *);
+extern int touch_atime(const struct path *path, bool nowait);
 int inode_update_time(struct inode *inode, struct timespec64 *time, int fl=
ags);
=20
 static inline void file_accessed(struct file *file)
 {
 =09if (!(file->f_flags & O_NOATIME))
-=09=09touch_atime(&file->f_path);
+=09=09touch_atime(&file->f_path, false);
 }
=20
 extern int file_modified(struct file *file);
diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index 4174f76133df..bc020b45d5c8 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -517,7 +517,7 @@ static void *bpf_obj_do_get(int path_fd, const char __u=
ser *pathname,
=20
 =09raw =3D bpf_any_get(inode->i_private, *type);
 =09if (!IS_ERR(raw))
-=09=09touch_atime(&path);
+=09=09touch_atime(&path, false);
=20
 =09path_put(&path);
 =09return raw;
@@ -591,7 +591,7 @@ struct bpf_prog *bpf_prog_get_type_path(const char *nam=
e, enum bpf_prog_type typ
 =09=09return ERR_PTR(ret);
 =09prog =3D __get_prog_inode(d_backing_inode(path.dentry), type);
 =09if (!IS_ERR(prog))
-=09=09touch_atime(&path);
+=09=09touch_atime(&path, false);
 =09path_put(&path);
 =09return prog;
 }
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 123b35ddfd71..5868e4e47320 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1084,7 +1084,7 @@ static struct sock *unix_find_bsd(struct sockaddr_un =
*sunaddr, int addr_len,
=20
 =09err =3D -EPROTOTYPE;
 =09if (sk->sk_type =3D=3D type)
-=09=09touch_atime(&path);
+=09=09touch_atime(&path, false);
 =09else
 =09=09goto sock_put;
=20
@@ -1114,7 +1114,7 @@ static struct sock *unix_find_abstract(struct net *ne=
t,
=20
 =09dentry =3D unix_sk(sk)->path.dentry;
 =09if (dentry)
-=09=09touch_atime(&unix_sk(sk)->path);
+=09=09touch_atime(&unix_sk(sk)->path, false);
=20
 =09return sk;
 }
--=20
2.25.1

