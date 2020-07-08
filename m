Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B33F0219252
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 23:20:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-0kb9FatKNymDlxpn5sUeDg-1; Wed, 08 Jul 2020 17:19:59 -0400
X-MC-Unique: 0kb9FatKNymDlxpn5sUeDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8EE418FF660;
	Wed,  8 Jul 2020 21:19:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E4802C2BC;
	Wed,  8 Jul 2020 21:19:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EC841809547;
	Wed,  8 Jul 2020 21:19:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068LJoSp009688 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 17:19:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C87F215ADC0; Wed,  8 Jul 2020 21:19:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17EB32026D69
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:19:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F21D88007B1
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:19:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-279-eP610pmZPbiaazF-BFINHA-1;
	Wed, 08 Jul 2020 17:19:47 -0400
X-MC-Unique: eP610pmZPbiaazF-BFINHA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D3DF6AD33;
	Wed,  8 Jul 2020 21:19:46 +0000 (UTC)
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: linux-btrfs@vger.kernel.org
Date: Wed,  8 Jul 2020 16:19:21 -0500
Message-Id: <20200708211926.7706-2-rgoldwyn@suse.de>
In-Reply-To: <20200708211926.7706-1-rgoldwyn@suse.de>
References: <20200708211926.7706-1-rgoldwyn@suse.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 068LJoSp009688
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, darrick.wong@oracle.com,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, hch@lst.de,
	Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: [Cluster-devel] [PATCH 1/6] iomap: Convert wait_for_completion to
	flags
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Goldwyn Rodrigues <rgoldwyn@suse.com>

Convert wait_for_completion boolean to flags so we can pass more flags
to iomap_dio_rw()

Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
---
 fs/ext4/file.c        | 11 +++++++++--
 fs/gfs2/file.c        | 14 ++++++++++----
 fs/iomap/direct-io.c  |  3 ++-
 fs/xfs/xfs_file.c     | 15 +++++++++++----
 fs/zonefs/super.c     | 16 ++++++++++++----
 include/linux/iomap.h | 11 ++++++++++-
 6 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 2a01e31a032c..8f6324eb6b27 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -53,6 +53,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	ssize_t ret;
 	struct inode *inode = file_inode(iocb->ki_filp);
+	unsigned int flags = 0;
 
 	if (iocb->ki_flags & IOCB_NOWAIT) {
 		if (!inode_trylock_shared(inode))
@@ -74,8 +75,11 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		return generic_file_read_iter(iocb, to);
 	}
 
+	if (is_sync_kiocb(iocb))
+		flags |= IOMAP_DIO_RWF_SYNCIO;
+
 	ret = iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL,
-			   is_sync_kiocb(iocb));
+			   flags);
 	inode_unlock_shared(inode);
 
 	file_accessed(iocb->ki_filp);
@@ -457,6 +461,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	const struct iomap_ops *iomap_ops = &ext4_iomap_ops;
 	bool extend = false, unaligned_io = false;
 	bool ilock_shared = true;
+	unsigned int flags = 0;
 
 	/*
 	 * We initially start with shared inode lock unless it is
@@ -540,10 +545,12 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ext4_journal_stop(handle);
 	}
 
+	if (is_sync_kiocb(iocb) || unaligned_io || extend)
+		flags |= IOMAP_DIO_RWF_SYNCIO;
 	if (ilock_shared)
 		iomap_ops = &ext4_iomap_overwrite_ops;
 	ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
-			   is_sync_kiocb(iocb) || unaligned_io || extend);
+			   flags);
 
 	if (extend)
 		ret = ext4_handle_inode_extension(inode, offset, ret, count);
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index fe305e4bfd37..68f4ee4a20ee 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -767,6 +767,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to)
 	size_t count = iov_iter_count(to);
 	struct gfs2_holder gh;
 	ssize_t ret;
+	unsigned int flags = 0;
 
 	if (!count)
 		return 0; /* skip atime */
@@ -776,8 +777,10 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to)
 	if (ret)
 		goto out_uninit;
 
-	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
-			   is_sync_kiocb(iocb));
+	if (is_sync_kiocb(iocb))
+		flags |= IOMAP_DIO_RWF_SYNCIO;
+
+	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL, flags);
 
 	gfs2_glock_dq(&gh);
 out_uninit:
@@ -794,6 +797,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	loff_t offset = iocb->ki_pos;
 	struct gfs2_holder gh;
 	ssize_t ret;
+	unsigned int flags = 0;
 
 	/*
 	 * Deferred lock, even if its a write, since we do no allocation on
@@ -812,8 +816,10 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	if (offset + len > i_size_read(&ip->i_inode))
 		goto out;
 
-	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
-			   is_sync_kiocb(iocb));
+	if (is_sync_kiocb(iocb))
+		flags |= IOMAP_DIO_RWF_SYNCIO;
+
+	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL, flags);
 
 out:
 	gfs2_glock_dq(&gh);
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index ec7b78e6feca..2753b7022403 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -405,7 +405,7 @@ iomap_dio_actor(struct inode *inode, loff_t pos, loff_t length,
 ssize_t
 iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
-		bool wait_for_completion)
+		unsigned int dio_flags)
 {
 	struct address_space *mapping = iocb->ki_filp->f_mapping;
 	struct inode *inode = file_inode(iocb->ki_filp);
@@ -415,6 +415,7 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 	unsigned int flags = IOMAP_DIRECT;
 	struct blk_plug plug;
 	struct iomap_dio *dio;
+	bool wait_for_completion = dio_flags & IOMAP_DIO_RWF_SYNCIO;
 
 	if (!count)
 		return 0;
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 00db81eac80d..6a7edb2c3167 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -169,6 +169,8 @@ xfs_file_dio_aio_read(
 	struct xfs_inode	*ip = XFS_I(file_inode(iocb->ki_filp));
 	size_t			count = iov_iter_count(to);
 	ssize_t			ret;
+	unsigned int		flags = 0;
+
 
 	trace_xfs_file_direct_read(ip, count, iocb->ki_pos);
 
@@ -183,8 +185,11 @@ xfs_file_dio_aio_read(
 	} else {
 		xfs_ilock(ip, XFS_IOLOCK_SHARED);
 	}
-	ret = iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL,
-			is_sync_kiocb(iocb));
+
+	if (is_sync_kiocb(iocb))
+		flags |= IOMAP_DIO_RWF_SYNCIO;
+
+	ret = iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL,	flags);
 	xfs_iunlock(ip, XFS_IOLOCK_SHARED);
 
 	return ret;
@@ -483,6 +488,7 @@ xfs_file_dio_aio_write(
 	int			iolock;
 	size_t			count = iov_iter_count(from);
 	struct xfs_buftarg      *target = xfs_inode_buftarg(ip);
+	unsigned int		flags = 0;
 
 	/* DIO must be aligned to device logical sector size */
 	if ((iocb->ki_pos | count) & target->bt_logical_sectormask)
@@ -546,9 +552,10 @@ xfs_file_dio_aio_write(
 	 * If unaligned, this is the only IO in-flight. Wait on it before we
 	 * release the iolock to prevent subsequent overlapping IO.
 	 */
+	if (is_sync_kiocb(iocb) || unaligned_io)
+		flags |= IOMAP_DIO_RWF_SYNCIO;
 	ret = iomap_dio_rw(iocb, from, &xfs_direct_write_iomap_ops,
-			   &xfs_dio_write_ops,
-			   is_sync_kiocb(iocb) || unaligned_io);
+			   &xfs_dio_write_ops, flags);
 out:
 	xfs_iunlock(ip, iolock);
 
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 07bc42d62673..798e2e636887 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -670,6 +670,7 @@ static ssize_t zonefs_file_dio_write(struct kiocb *iocb, struct iov_iter *from)
 	bool append = false;
 	size_t count;
 	ssize_t ret;
+	int flags = 0;
 
 	/*
 	 * For async direct IOs to sequential zone files, refuse IOCB_NOWAIT
@@ -711,11 +712,15 @@ static ssize_t zonefs_file_dio_write(struct kiocb *iocb, struct iov_iter *from)
 		append = sync;
 	}
 
-	if (append)
+	if (append) {
 		ret = zonefs_file_dio_append(iocb, from);
-	else
+	} else {
+		if (is_sync_kiocb(iocb))
+			flags |= IOMAP_DIO_RWF_SYNCIO;
+
 		ret = iomap_dio_rw(iocb, from, &zonefs_iomap_ops,
-				   &zonefs_write_dio_ops, sync);
+				&zonefs_write_dio_ops, flags);
+	}
 	if (zi->i_ztype == ZONEFS_ZTYPE_SEQ &&
 	    (ret > 0 || ret == -EIOCBQUEUED)) {
 		if (ret > 0)
@@ -814,6 +819,7 @@ static ssize_t zonefs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	struct super_block *sb = inode->i_sb;
 	loff_t isize;
 	ssize_t ret;
+	int flags = 0;
 
 	/* Offline zones cannot be read */
 	if (unlikely(IS_IMMUTABLE(inode) && !(inode->i_mode & 0777)))
@@ -848,8 +854,10 @@ static ssize_t zonefs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			goto inode_unlock;
 		}
 		file_accessed(iocb->ki_filp);
+		if (is_sync_kiocb(iocb))
+			flags |= IOMAP_DIO_RWF_SYNCIO;
 		ret = iomap_dio_rw(iocb, to, &zonefs_iomap_ops,
-				   &zonefs_read_dio_ops, is_sync_kiocb(iocb));
+				   &zonefs_read_dio_ops, flags);
 	} else {
 		ret = generic_file_read_iter(iocb, to);
 		if (ret == -EIO)
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 4d1d3c3469e9..80cd5f524124 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -255,9 +255,18 @@ struct iomap_dio_ops {
 			struct bio *bio, loff_t file_offset);
 };
 
+/*
+ * Flags to pass iomap_dio_rw()
+ */
+
+/*
+ * Wait for completion of DIO
+ */
+#define IOMAP_DIO_RWF_SYNCIO			(1 << 0)
+
 ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
-		bool wait_for_completion);
+		unsigned int flags);
 int iomap_dio_iopoll(struct kiocb *kiocb, bool spin);
 
 #ifdef CONFIG_SWAP
-- 
2.26.2


