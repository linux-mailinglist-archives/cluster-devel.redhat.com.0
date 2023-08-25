Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981278C07E
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zonD2vHDwfNE097BzhleOFFTvtL6LMK+/DDdFwwOuJY=;
	b=Ju7fFLfdgJo9ACF1Xt35EkZogJoRddLScol8VNNlNkMfYNKCzRHkzkQKWZ+V01X26QwaWX
	VJacwreGskcwefNFMIxpzR1St5C9psGoTHMQb2hQNaG8/nyr1a6vD+M0K3Ga2uqQH3EJPI
	69SohDJ0zD+bsCIuL0feRuE9gsSUaCs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-689-SFaBHUugM2-W3HGbam3Yeg-1; Tue, 29 Aug 2023 04:41:10 -0400
X-MC-Unique: SFaBHUugM2-W3HGbam3Yeg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07BE2185A7A5;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB310112131E;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 561101946A42;
	Tue, 29 Aug 2023 08:41:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60C2619465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 13:58:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3D540C1602F; Fri, 25 Aug 2023 13:58:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35215C1602B
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 13:58:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 155658564F0
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 13:58:57 +0000 (UTC)
Received: from out-249.mta1.migadu.com (out-249.mta1.migadu.com
 [95.215.58.249]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-hvJ2tOS-Nnav9m4oZliauw-1; Fri, 25 Aug 2023 09:58:54 -0400
X-MC-Unique: hvJ2tOS-Nnav9m4oZliauw-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:10 +0800
Message-Id: <20230825135431.1317785-9-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 08/29] vfs: add nowait parameter for
 file_accessed()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Add a boolean parameter for file_accessed() to support nowait semantics.
Currently it is true only with io_uring as its initial caller.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 arch/s390/hypfs/inode.c | 2 +-
 block/fops.c            | 2 +-
 fs/btrfs/file.c         | 2 +-
 fs/btrfs/inode.c        | 2 +-
 fs/coda/dir.c           | 4 ++--
 fs/ext2/file.c          | 4 ++--
 fs/ext4/file.c          | 6 +++---
 fs/f2fs/file.c          | 4 ++--
 fs/fuse/dax.c           | 2 +-
 fs/fuse/file.c          | 4 ++--
 fs/gfs2/file.c          | 2 +-
 fs/hugetlbfs/inode.c    | 2 +-
 fs/nilfs2/file.c        | 2 +-
 fs/orangefs/file.c      | 2 +-
 fs/orangefs/inode.c     | 2 +-
 fs/pipe.c               | 2 +-
 fs/ramfs/file-nommu.c   | 2 +-
 fs/readdir.c            | 2 +-
 fs/smb/client/cifsfs.c  | 2 +-
 fs/splice.c             | 2 +-
 fs/ubifs/file.c         | 2 +-
 fs/udf/file.c           | 2 +-
 fs/xfs/xfs_file.c       | 6 +++---
 fs/zonefs/file.c        | 4 ++--
 include/linux/fs.h      | 5 +++--
 mm/filemap.c            | 8 ++++----
 mm/shmem.c              | 6 +++---
 27 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
index ee919bfc8186..55f562027c4f 100644
--- a/arch/s390/hypfs/inode.c
+++ b/arch/s390/hypfs/inode.c
@@ -157,7 +157,7 @@ static ssize_t hypfs_read_iter(struct kiocb *iocb, stru=
ct iov_iter *to)
 =09if (!count)
 =09=09return -EFAULT;
 =09iocb->ki_pos =3D pos + count;
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09return count;
 }
=20
diff --git a/block/fops.c b/block/fops.c
index a286bf3325c5..546ecd3c8084 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -601,7 +601,7 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, str=
uct iov_iter *to)
 =09=09ret =3D kiocb_write_and_wait(iocb, count);
 =09=09if (ret < 0)
 =09=09=09goto reexpand;
-=09=09file_accessed(iocb->ki_filp);
+=09=09file_accessed(iocb->ki_filp, false);
=20
 =09=09ret =3D blkdev_direct_IO(iocb, to);
 =09=09if (ret >=3D 0) {
diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index fd03e689a6be..24c0bf3818a6 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -2013,7 +2013,7 @@ static int btrfs_file_mmap(struct file=09*filp, struc=
t vm_area_struct *vma)
 =09if (!mapping->a_ops->read_folio)
 =09=09return -ENOEXEC;
=20
-=09file_accessed(filp);
+=09file_accessed(filp, false);
 =09vma->vm_ops =3D &btrfs_file_vm_ops;
=20
 =09return 0;
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index dbbb67293e34..50e9ae8c388c 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -10153,7 +10153,7 @@ ssize_t btrfs_encoded_read(struct kiocb *iocb, stru=
ct iov_iter *iter,
 =09struct extent_map *em;
 =09bool unlocked =3D false;
=20
-=09file_accessed(iocb->ki_filp);
+=09file_accessed(iocb->ki_filp, false);
=20
 =09btrfs_inode_lock(inode, BTRFS_ILOCK_SHARED);
=20
diff --git a/fs/coda/dir.c b/fs/coda/dir.c
index 8450b1bd354b..1d94c013ac88 100644
--- a/fs/coda/dir.c
+++ b/fs/coda/dir.c
@@ -436,12 +436,12 @@ static int coda_readdir(struct file *coda_file, struc=
t dir_context *ctx)
 =09=09=09if (host_file->f_op->iterate_shared) {
 =09=09=09=09inode_lock_shared(host_inode);
 =09=09=09=09ret =3D host_file->f_op->iterate_shared(host_file, ctx);
-=09=09=09=09file_accessed(host_file);
+=09=09=09=09file_accessed(host_file, false);
 =09=09=09=09inode_unlock_shared(host_inode);
 =09=09=09} else {
 =09=09=09=09inode_lock(host_inode);
 =09=09=09=09ret =3D host_file->f_op->iterate(host_file, ctx);
-=09=09=09=09file_accessed(host_file);
+=09=09=09=09file_accessed(host_file, false);
 =09=09=09=09inode_unlock(host_inode);
 =09=09=09}
 =09=09}
diff --git a/fs/ext2/file.c b/fs/ext2/file.c
index 0b4c91c62e1f..dc059cae50a4 100644
--- a/fs/ext2/file.c
+++ b/fs/ext2/file.c
@@ -44,7 +44,7 @@ static ssize_t ext2_dax_read_iter(struct kiocb *iocb, str=
uct iov_iter *to)
 =09ret =3D dax_iomap_rw(iocb, to, &ext2_iomap_ops);
 =09inode_unlock_shared(inode);
=20
-=09file_accessed(iocb->ki_filp);
+=09file_accessed(iocb->ki_filp, false);
 =09return ret;
 }
=20
@@ -127,7 +127,7 @@ static int ext2_file_mmap(struct file *file, struct vm_=
area_struct *vma)
 =09if (!IS_DAX(file_inode(file)))
 =09=09return generic_file_mmap(file, vma);
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &ext2_dax_vm_ops;
 =09return 0;
 }
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index c457c8517f0f..2ab790a668a8 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -94,7 +94,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, str=
uct iov_iter *to)
 =09ret =3D iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL, 0, NULL, 0);
 =09inode_unlock_shared(inode);
=20
-=09file_accessed(iocb->ki_filp);
+=09file_accessed(iocb->ki_filp, false);
 =09return ret;
 }
=20
@@ -122,7 +122,7 @@ static ssize_t ext4_dax_read_iter(struct kiocb *iocb, s=
truct iov_iter *to)
 =09ret =3D dax_iomap_rw(iocb, to, &ext4_iomap_ops);
 =09inode_unlock_shared(inode);
=20
-=09file_accessed(iocb->ki_filp);
+=09file_accessed(iocb->ki_filp, false);
 =09return ret;
 }
 #endif
@@ -820,7 +820,7 @@ static int ext4_file_mmap(struct file *file, struct vm_=
area_struct *vma)
 =09if (!daxdev_mapping_supported(vma, dax_dev))
 =09=09return -EOPNOTSUPP;
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09if (IS_DAX(file_inode(file))) {
 =09=09vma->vm_ops =3D &ext4_dax_vm_ops;
 =09=09vm_flags_set(vma, VM_HUGEPAGE);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 093039dee992..246e61d78f92 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -524,7 +524,7 @@ static int f2fs_file_mmap(struct file *file, struct vm_=
area_struct *vma)
 =09if (!f2fs_is_compress_backend_ready(inode))
 =09=09return -EOPNOTSUPP;
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &f2fs_file_vm_ops;
 =09set_inode_flag(inode, FI_MMAP_FILE);
 =09return 0;
@@ -4380,7 +4380,7 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb,=
 struct iov_iter *to)
=20
 =09f2fs_up_read(&fi->i_gc_rwsem[READ]);
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 out:
 =09trace_f2fs_direct_IO_exit(inode, pos, count, READ, ret);
 =09return ret;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 8e74f278a3f6..8a43c37195dd 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -858,7 +858,7 @@ static const struct vm_operations_struct fuse_dax_vm_op=
s =3D {
=20
 int fuse_dax_mmap(struct file *file, struct vm_area_struct *vma)
 {
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &fuse_dax_vm_ops;
 =09vm_flags_set(vma, VM_MIXEDMAP | VM_HUGEPAGE);
 =09return 0;
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index bc4115288eec..3c4cbc5e2de6 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2496,7 +2496,7 @@ static int fuse_file_mmap(struct file *file, struct v=
m_area_struct *vma)
 =09if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
 =09=09fuse_link_write_file(file);
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &fuse_file_vm_ops;
 =09return 0;
 }
@@ -3193,7 +3193,7 @@ static ssize_t __fuse_copy_file_range(struct file *fi=
le_in, loff_t pos_in,
 =09=09clear_bit(FUSE_I_SIZE_UNSTABLE, &fi_out->state);
=20
 =09inode_unlock(inode_out);
-=09file_accessed(file_in);
+=09file_accessed(file_in, false);
=20
 =09fuse_flush_time_update(inode_out);
=20
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 1bf3c4453516..3003be5b8266 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -601,7 +601,7 @@ static int gfs2_mmap(struct file *file, struct vm_area_=
struct *vma)
 =09=09=09return error;
 =09=09/* grab lock to update inode */
 =09=09gfs2_glock_dq_uninit(&i_gh);
-=09=09file_accessed(file);
+=09=09file_accessed(file, false);
 =09}
 =09vma->vm_ops =3D &gfs2_vm_ops;
=20
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7b17ccfa039d..729f66346c3c 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -161,7 +161,7 @@ static int hugetlbfs_file_mmap(struct file *file, struc=
t vm_area_struct *vma)
 =09=09return -EINVAL;
=20
 =09inode_lock(inode);
-=09file_accessed(file);
+=09file_accessed(file, false);
=20
 =09ret =3D -ENOMEM;
 =09if (!hugetlb_reserve_pages(inode,
diff --git a/fs/nilfs2/file.c b/fs/nilfs2/file.c
index a9eb3487efb2..a857ebcf099c 100644
--- a/fs/nilfs2/file.c
+++ b/fs/nilfs2/file.c
@@ -119,7 +119,7 @@ static const struct vm_operations_struct nilfs_file_vm_=
ops =3D {
=20
 static int nilfs_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &nilfs_file_vm_ops;
 =09return 0;
 }
diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index d68372241b30..5c7a17995fe1 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -412,7 +412,7 @@ static int orangefs_file_mmap(struct file *file, struct=
 vm_area_struct *vma)
 =09/* set the sequential readahead hint */
 =09vm_flags_mod(vma, VM_SEQ_READ, VM_RAND_READ);
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &orangefs_file_vm_ops;
 =09return 0;
 }
diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 9014bbcc8031..77d56703bb09 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -597,7 +597,7 @@ static ssize_t orangefs_direct_IO(struct kiocb *iocb,
 =09=09ret =3D total_count;
 =09if (ret > 0) {
 =09=09if (type =3D=3D ORANGEFS_IO_READ) {
-=09=09=09file_accessed(file);
+=09=09=09file_accessed(file, false);
 =09=09} else {
 =09=09=09file_update_time(file);
 =09=09=09if (*offset > i_size_read(inode))
diff --git a/fs/pipe.c b/fs/pipe.c
index 2d88f73f585a..ce1038d3de4b 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -393,7 +393,7 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
 =09=09wake_up_interruptible_sync_poll(&pipe->rd_wait, EPOLLIN | EPOLLRDNOR=
M);
 =09kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
 =09if (ret > 0)
-=09=09file_accessed(filp);
+=09=09file_accessed(filp, false);
 =09return ret;
 }
=20
diff --git a/fs/ramfs/file-nommu.c b/fs/ramfs/file-nommu.c
index efb1b4c1a0a4..ad69f828f6ad 100644
--- a/fs/ramfs/file-nommu.c
+++ b/fs/ramfs/file-nommu.c
@@ -267,7 +267,7 @@ static int ramfs_nommu_mmap(struct file *file, struct v=
m_area_struct *vma)
 =09if (!is_nommu_shared_mapping(vma->vm_flags))
 =09=09return -ENOSYS;
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &generic_file_vm_ops;
 =09return 0;
 }
diff --git a/fs/readdir.c b/fs/readdir.c
index b80caf4c9321..2f4c9c663a39 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -68,7 +68,7 @@ int iterate_dir(struct file *file, struct dir_context *ct=
x)
 =09=09=09res =3D file->f_op->iterate(file, ctx);
 =09=09file->f_pos =3D ctx->pos;
 =09=09fsnotify_access(file);
-=09=09file_accessed(file);
+=09=09file_accessed(file, ctx->flags & DIR_CONTEXT_F_NOWAIT);
 =09}
 =09if (shared)
 =09=09inode_unlock_shared(inode);
diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index a4d8b0ea1c8c..20156c5e83e6 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -1307,7 +1307,7 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
 =09=09rc =3D target_tcon->ses->server->ops->copychunk_range(xid,
 =09=09=09smb_file_src, smb_file_target, off, len, destoff);
=20
-=09file_accessed(src_file);
+=09file_accessed(src_file, false);
=20
 =09/* force revalidate of size and timestamps of target file now
 =09 * that target is updated on the server
diff --git a/fs/splice.c b/fs/splice.c
index 004eb1c4ce31..e4dcfa1c0fef 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -1104,7 +1104,7 @@ ssize_t splice_direct_to_actor(struct file *in, struc=
t splice_desc *sd,
=20
 done:
 =09pipe->tail =3D pipe->head =3D 0;
-=09file_accessed(in);
+=09file_accessed(in, false);
 =09return bytes;
=20
 read_failure:
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 6738fe43040b..a27c73848571 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1603,7 +1603,7 @@ static int ubifs_file_mmap(struct file *file, struct =
vm_area_struct *vma)
 =09vma->vm_ops =3D &ubifs_file_vm_ops;
=20
 =09if (IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
-=09=09file_accessed(file);
+=09=09file_accessed(file, false);
=20
 =09return 0;
 }
diff --git a/fs/udf/file.c b/fs/udf/file.c
index 243840dc83ad..46edf6e64632 100644
--- a/fs/udf/file.c
+++ b/fs/udf/file.c
@@ -191,7 +191,7 @@ static int udf_release_file(struct inode *inode, struct=
 file *filp)
=20
 static int udf_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &udf_file_vm_ops;
=20
 =09return 0;
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 4f502219ae4f..c72efdb9e43e 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -227,7 +227,7 @@ xfs_file_dio_read(
 =09if (!iov_iter_count(to))
 =09=09return 0; /* skip atime */
=20
-=09file_accessed(iocb->ki_filp);
+=09file_accessed(iocb->ki_filp, false);
=20
 =09ret =3D xfs_ilock_iocb(iocb, XFS_IOLOCK_SHARED);
 =09if (ret)
@@ -257,7 +257,7 @@ xfs_file_dax_read(
 =09ret =3D dax_iomap_rw(iocb, to, &xfs_read_iomap_ops);
 =09xfs_iunlock(ip, XFS_IOLOCK_SHARED);
=20
-=09file_accessed(iocb->ki_filp);
+=09file_accessed(iocb->ki_filp, false);
 =09return ret;
 }
=20
@@ -1434,7 +1434,7 @@ xfs_file_mmap(
 =09if (!daxdev_mapping_supported(vma, target->bt_daxdev))
 =09=09return -EOPNOTSUPP;
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &xfs_file_vm_ops;
 =09if (IS_DAX(inode))
 =09=09vm_flags_set(vma, VM_HUGEPAGE);
diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 92c9aaae3663..664ebae181bd 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -323,7 +323,7 @@ static int zonefs_file_mmap(struct file *file, struct v=
m_area_struct *vma)
 =09    (vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
 =09=09return -EINVAL;
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &zonefs_file_vm_ops;
=20
 =09return 0;
@@ -736,7 +736,7 @@ static ssize_t zonefs_file_read_iter(struct kiocb *iocb=
, struct iov_iter *to)
 =09=09=09ret =3D -EINVAL;
 =09=09=09goto inode_unlock;
 =09=09}
-=09=09file_accessed(iocb->ki_filp);
+=09=09file_accessed(iocb->ki_filp, false);
 =09=09ret =3D iomap_dio_rw(iocb, to, &zonefs_read_iomap_ops,
 =09=09=09=09   &zonefs_read_dio_ops, 0, NULL, 0);
 =09} else {
diff --git a/include/linux/fs.h b/include/linux/fs.h
index ba54879089ac..ed60b3d70d1e 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2204,10 +2204,11 @@ extern bool atime_needs_update(const struct path *,=
 struct inode *);
 extern int touch_atime(const struct path *path, bool nowait);
 int inode_update_time(struct inode *inode, struct timespec64 *time, int fl=
ags);
=20
-static inline void file_accessed(struct file *file)
+static inline int file_accessed(struct file *file, bool nowait)
 {
 =09if (!(file->f_flags & O_NOATIME))
-=09=09touch_atime(&file->f_path, false);
+=09=09return touch_atime(&file->f_path, nowait);
+=09return 0;
 }
=20
 extern int file_modified(struct file *file);
diff --git a/mm/filemap.c b/mm/filemap.c
index 9e44a49bbd74..1f2032f4fd10 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2723,7 +2723,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_i=
ter *iter,
 =09=09folio_batch_init(&fbatch);
 =09} while (iov_iter_count(iter) && iocb->ki_pos < isize && !error);
=20
-=09file_accessed(filp);
+=09file_accessed(filp, false);
=20
 =09return already_read ? already_read : error;
 }
@@ -2809,7 +2809,7 @@ generic_file_read_iter(struct kiocb *iocb, struct iov=
_iter *iter)
 =09=09retval =3D kiocb_write_and_wait(iocb, count);
 =09=09if (retval < 0)
 =09=09=09return retval;
-=09=09file_accessed(file);
+=09=09file_accessed(file, false);
=20
 =09=09retval =3D mapping->a_ops->direct_IO(iocb, iter);
 =09=09if (retval >=3D 0) {
@@ -2978,7 +2978,7 @@ ssize_t filemap_splice_read(struct file *in, loff_t *=
ppos,
=20
 out:
 =09folio_batch_release(&fbatch);
-=09file_accessed(in);
+=09file_accessed(in, false);
=20
 =09return total_spliced ? total_spliced : error;
 }
@@ -3613,7 +3613,7 @@ int generic_file_mmap(struct file *file, struct vm_ar=
ea_struct *vma)
=20
 =09if (!mapping->a_ops->read_folio)
 =09=09return -ENOEXEC;
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09vma->vm_ops =3D &generic_file_vm_ops;
 =09return 0;
 }
diff --git a/mm/shmem.c b/mm/shmem.c
index 2f2e0e618072..440b23e2d9e1 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2317,7 +2317,7 @@ static int shmem_mmap(struct file *file, struct vm_ar=
ea_struct *vma)
 =09/* arm64 - allow memory tagging on RAM-based files */
 =09vm_flags_set(vma, VM_MTE_ALLOWED);
=20
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09/* This is anonymous shared memory if it is unlinked at the time of mma=
p */
 =09if (inode->i_nlink)
 =09=09vma->vm_ops =3D &shmem_vm_ops;
@@ -2727,7 +2727,7 @@ static ssize_t shmem_file_read_iter(struct kiocb *ioc=
b, struct iov_iter *to)
 =09}
=20
 =09*ppos =3D ((loff_t) index << PAGE_SHIFT) + offset;
-=09file_accessed(file);
+=09file_accessed(file, false);
 =09return retval ? retval : error;
 }
=20
@@ -2859,7 +2859,7 @@ static ssize_t shmem_file_splice_read(struct file *in=
, loff_t *ppos,
 =09if (folio)
 =09=09folio_put(folio);
=20
-=09file_accessed(in);
+=09file_accessed(in, false);
 =09return total_spliced ? total_spliced : error;
 }
=20
--=20
2.25.1

