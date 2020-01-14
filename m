Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CD72D13AFA4
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020055;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L8S6uQDHdJiCSuQj20JvtTg7yuQ0lbVy5Q9bTH7J8RU=;
	b=MS3M9Gms76bHHaWNsNTX0T41L4nB8jSoVrJ2y6bo1Se73pOCa8QSfkjiRho9hwp66wrl5O
	k7FQGY0SKfDxGPtkUlvbTE4n2suX1ji+rYeFBr7AS4VKMYj9E8kOLiDAuT27rBTND4JXKe
	mY4l/fW8rmW4jbHQqrAuBHi7M88A8F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-ZDWI98HvNP6X7E4ofgwZ_g-1; Tue, 14 Jan 2020 11:40:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABDCE18B916B;
	Tue, 14 Jan 2020 16:40:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D02384339;
	Tue, 14 Jan 2020 16:40:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06AE018089CD;
	Tue, 14 Jan 2020 16:40:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGdumq021402 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:39:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 104CD6F9D8; Tue, 14 Jan 2020 16:39:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BB10B351D
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:39:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21AFE8032B8
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:39:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-281-TJa1Vg5xO4eSSZgv34GimA-1; Tue, 14 Jan 2020 11:39:52 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOoD-0000DG-38; Tue, 14 Jan 2020 16:12:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:21 +0100
Message-Id: <20200114161225.309792-9-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: TJa1Vg5xO4eSSZgv34GimA-1
X-MC-Unique: ZDWI98HvNP6X7E4ofgwZ_g-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGdumq021402
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 08/12] ext4: hold i_rwsem until AIO completes
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Switch ext4 from the magic i_dio_count scheme to just hold i_rwsem
until the actual I/O has completed to reduce the locking complexity
and avoid nasty bugs due to missing inode_dio_wait calls.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/extents.c     | 12 ------------
 fs/ext4/file.c        | 21 +++++++++++++--------
 fs/ext4/inode.c       | 11 -----------
 fs/ext4/ioctl.c       |  5 -----
 fs/ext4/move_extent.c |  4 ----
 5 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 0e8708b77da6..b6aa2d249b30 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -4777,9 +4777,6 @@ static long ext4_zero_range(struct file *file, loff_t=
 offset,
 =09if (mode & FALLOC_FL_KEEP_SIZE)
 =09=09flags |=3D EXT4_GET_BLOCKS_KEEP_SIZE;
=20
-=09/* Wait all existing dio workers, newcomers will block on i_mutex */
-=09inode_dio_wait(inode);
-
 =09/* Preallocate the range including the unaligned edges */
 =09if (partial_begin || partial_end) {
 =09=09ret =3D ext4_alloc_file_blocks(file,
@@ -4949,9 +4946,6 @@ long ext4_fallocate(struct file *file, int mode, loff=
_t offset, loff_t len)
 =09=09=09goto out;
 =09}
=20
-=09/* Wait all existing dio workers, newcomers will block on i_mutex */
-=09inode_dio_wait(inode);
-
 =09ret =3D ext4_alloc_file_blocks(file, lblk, max_blocks, new_size, flags)=
;
 =09if (ret)
 =09=09goto out;
@@ -5525,9 +5519,6 @@ int ext4_collapse_range(struct inode *inode, loff_t o=
ffset, loff_t len)
 =09=09goto out_mutex;
 =09}
=20
-=09/* Wait for existing dio to complete */
-=09inode_dio_wait(inode);
-
 =09/*
 =09 * Prevent page faults from reinstantiating pages we have released from
 =09 * page cache.
@@ -5678,9 +5669,6 @@ int ext4_insert_range(struct inode *inode, loff_t off=
set, loff_t len)
 =09=09goto out_mutex;
 =09}
=20
-=09/* Wait for existing dio to complete */
-=09inode_dio_wait(inode);
-
 =09/*
 =09 * Prevent page faults from reinstantiating pages we have released from
 =09 * page cache.
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 08b603d0c638..b3410a3ede27 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -74,9 +74,10 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, st=
ruct iov_iter *to)
 =09=09return generic_file_read_iter(iocb, to);
 =09}
=20
-=09ret =3D iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL, 0);
-=09inode_unlock_shared(inode);
-
+=09ret =3D iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL,
+=09=09=09   IOMAP_DIO_RWSEM_SHARED);
+=09if (ret !=3D -EIOCBQUEUED)
+=09=09inode_unlock_shared(inode);
 =09file_accessed(iocb->ki_filp);
 =09return ret;
 }
@@ -405,7 +406,6 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, =
struct iov_iter *from)
 =09    !is_sync_kiocb(iocb) && ext4_unaligned_aio(inode, from, offset)) {
 =09=09unaligned_aio =3D true;
 =09=09dio_flags |=3D IOMAP_DIO_SYNCHRONOUS;
-=09=09inode_dio_wait(inode);
 =09}
=20
 =09/*
@@ -416,7 +416,10 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
 =09if (!unaligned_aio && ext4_overwrite_io(inode, offset, count) &&
 =09    ext4_should_dioread_nolock(inode)) {
 =09=09overwrite =3D true;
+=09=09dio_flags |=3D IOMAP_DIO_RWSEM_SHARED;
 =09=09downgrade_write(&inode->i_rwsem);
+=09} else {
+=09=09dio_flags |=3D IOMAP_DIO_RWSEM_EXCL;
 =09}
=20
 =09if (offset + count > EXT4_I(inode)->i_disksize) {
@@ -444,10 +447,12 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb=
, struct iov_iter *from)
 =09=09ret =3D ext4_handle_inode_extension(inode, offset, ret, count);
=20
 out:
-=09if (overwrite)
-=09=09inode_unlock_shared(inode);
-=09else
-=09=09inode_unlock(inode);
+=09if (ret !=3D -EIOCBQUEUED) {
+=09=09if (overwrite)
+=09=09=09inode_unlock_shared(inode);
+=09=09else
+=09=09=09inode_unlock(inode);
+=09}
=20
 =09if (ret >=3D 0 && iov_iter_count(from)) {
 =09=09ssize_t err;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 629a25d999f0..e2dac0727ab0 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3965,9 +3965,6 @@ int ext4_punch_hole(struct inode *inode, loff_t offse=
t, loff_t length)
=20
 =09}
=20
-=09/* Wait all existing dio workers, newcomers will block on i_mutex */
-=09inode_dio_wait(inode);
-
 =09/*
 =09 * Prevent page faults from reinstantiating pages we have released from
 =09 * page cache.
@@ -5263,11 +5260,6 @@ int ext4_setattr(struct dentry *dentry, struct iattr=
 *attr)
 =09=09=09=09if (error)
 =09=09=09=09=09goto err_out;
 =09=09=09}
-=09=09=09/*
-=09=09=09 * Blocks are going to be removed from the inode. Wait
-=09=09=09 * for dio in flight.
-=09=09=09 */
-=09=09=09inode_dio_wait(inode);
 =09=09}
=20
 =09=09down_write(&EXT4_I(inode)->i_mmap_sem);
@@ -5798,9 +5790,6 @@ int ext4_change_inode_journal_flag(struct inode *inod=
e, int val)
 =09if (is_journal_aborted(journal))
 =09=09return -EROFS;
=20
-=09/* Wait for all existing dio workers */
-=09inode_dio_wait(inode);
-
 =09/*
 =09 * Before flushing the journal and switching inode's aops, we have
 =09 * to flush all dirty data the inode has. There can be outstanding
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index e8870fff8224..99d21d81074f 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -153,10 +153,6 @@ static long swap_inode_boot_loader(struct super_block =
*sb,
 =09if (err)
 =09=09goto err_out;
=20
-=09/* Wait for all existing dio workers */
-=09inode_dio_wait(inode);
-=09inode_dio_wait(inode_bl);
-
 =09truncate_inode_pages(&inode->i_data, 0);
 =09truncate_inode_pages(&inode_bl->i_data, 0);
=20
@@ -364,7 +360,6 @@ static int ext4_ioctl_setflags(struct inode *inode,
 =09 */
 =09if (S_ISREG(inode->i_mode) && !IS_IMMUTABLE(inode) &&
 =09    (flags & EXT4_IMMUTABLE_FL)) {
-=09=09inode_dio_wait(inode);
 =09=09err =3D filemap_write_and_wait(inode->i_mapping);
 =09=09if (err)
 =09=09=09goto flags_out;
diff --git a/fs/ext4/move_extent.c b/fs/ext4/move_extent.c
index 30ce3dc69378..20240808569f 100644
--- a/fs/ext4/move_extent.c
+++ b/fs/ext4/move_extent.c
@@ -602,10 +602,6 @@ ext4_move_extents(struct file *o_filp, struct file *d_=
filp, __u64 orig_blk,
 =09/* Protect orig and donor inodes against a truncate */
 =09lock_two_nondirectories(orig_inode, donor_inode);
=20
-=09/* Wait for all existing dio workers */
-=09inode_dio_wait(orig_inode);
-=09inode_dio_wait(donor_inode);
-
 =09/* Protect extent tree against block allocations via delalloc */
 =09ext4_double_down_write_data_sem(orig_inode, donor_inode);
 =09/* Check the filesystem environment whether move_extent can be done */
--=20
2.24.1


