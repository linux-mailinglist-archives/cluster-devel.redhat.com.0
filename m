Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D670EE80
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 08:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684911106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3ZBFgl7r+XFxtKE+zV/zBQvmUj5fJULrZ1iHCvCgOQw=;
	b=Ms5QPmkslQ4/ZuClokocM/m7mv674jb4vV5yFk31zhjCsIU4Bo5GIqzJ3Uq0vaIyY6ooVk
	ts8c3RMJeA33ZGExgI5Pl+m627F1hWxRqkTxRTtLQd4irGkgdCfEocR9eXhqFIvUx/WRgo
	FqWDEs50DIiQQfniP8cgS+Yl0GyRoZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-8gyy7K9xMt-91l6FMbaSSw-1; Wed, 24 May 2023 02:51:42 -0400
X-MC-Unique: 8gyy7K9xMt-91l6FMbaSSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93CA1101A593;
	Wed, 24 May 2023 06:51:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 568162029F6D;
	Wed, 24 May 2023 06:51:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E32B19465B3;
	Wed, 24 May 2023 06:51:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7977019465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 06:51:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66340400F1F; Wed, 24 May 2023 06:51:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E9F2492B00
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 06:51:39 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34E483801FFF
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 06:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-7XX9jZjuMA6G38t3kL8CyA-1; Wed, 24 May 2023 02:51:37 -0400
X-MC-Unique: 7XX9jZjuMA6G38t3kL8CyA-1
Received: from [2001:4bb8:188:23b2:cbb8:fcea:a637:5089] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1i8W-00CVeW-2b; Wed, 24 May 2023 06:38:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 24 May 2023 08:38:00 +0200
Message-Id: <20230524063810.1595778-2-hch@lst.de>
In-Reply-To: <20230524063810.1595778-1-hch@lst.de>
References: <20230524063810.1595778-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 01/11] backing_dev: remove
 current->backing_dev_info
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The last user of current->backing_dev_info disappeared in commit
b9b1335e6403 ("remove bdi_congested() and wb_congested() and related
functions").  Remove the field and all assignments to it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/file.c       | 6 +-----
 fs/ceph/file.c        | 4 ----
 fs/ext4/file.c        | 2 --
 fs/f2fs/file.c        | 2 --
 fs/fuse/file.c        | 4 ----
 fs/gfs2/file.c        | 2 --
 fs/nfs/file.c         | 5 +----
 fs/ntfs/file.c        | 2 --
 fs/ntfs3/file.c       | 3 ---
 fs/xfs/xfs_file.c     | 4 ----
 include/linux/sched.h | 3 ---
 mm/filemap.c          | 3 ---
 12 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index f649647392e0e4..ecd43ab66fa6c7 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1145,7 +1145,6 @@ static int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from,
 	    !(BTRFS_I(inode)->flags & (BTRFS_INODE_NODATACOW | BTRFS_INODE_PREALLOC)))
 		return -EAGAIN;
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	ret = file_remove_privs(file);
 	if (ret)
 		return ret;
@@ -1165,10 +1164,8 @@ static int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from,
 		loff_t end_pos = round_up(pos + count, fs_info->sectorsize);
 
 		ret = btrfs_cont_expand(BTRFS_I(inode), oldsize, end_pos);
-		if (ret) {
-			current->backing_dev_info = NULL;
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -1689,7 +1686,6 @@ ssize_t btrfs_do_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	if (sync)
 		atomic_dec(&inode->sync_writers);
 
-	current->backing_dev_info = NULL;
 	return num_written;
 }
 
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index f4d8bf7dec88a8..c8ef72f723badd 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -1791,9 +1791,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	else
 		ceph_start_io_write(inode);
 
-	/* We can write back this queue in page reclaim */
-	current->backing_dev_info = inode_to_bdi(inode);
-
 	if (iocb->ki_flags & IOCB_APPEND) {
 		err = ceph_do_getattr(inode, CEPH_STAT_CAP_SIZE, false);
 		if (err < 0)
@@ -1940,7 +1937,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ceph_end_io_write(inode);
 out_unlocked:
 	ceph_free_cap_flush(prealloc_cf);
-	current->backing_dev_info = NULL;
 	return written ? written : err;
 }
 
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index d101b3b0c7dad8..bc430270c23c19 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -285,9 +285,7 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
 	if (ret <= 0)
 		goto out;
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	ret = generic_perform_write(iocb, from);
-	current->backing_dev_info = NULL;
 
 out:
 	inode_unlock(inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ac53d2627d20d..4f423d367a44b9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4517,9 +4517,7 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		return -EOPNOTSUPP;
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	ret = generic_perform_write(iocb, from);
-	current->backing_dev_info = NULL;
 
 	if (ret > 0) {
 		iocb->ki_pos += ret;
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 89d97f6188e05e..97d435874b14aa 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1362,9 +1362,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 writethrough:
 	inode_lock(inode);
 
-	/* We can write back this queue in page reclaim */
-	current->backing_dev_info = inode_to_bdi(inode);
-
 	err = generic_write_checks(iocb, from);
 	if (err <= 0)
 		goto out;
@@ -1409,7 +1406,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			iocb->ki_pos += written;
 	}
 out:
-	current->backing_dev_info = NULL;
 	inode_unlock(inode);
 	if (written > 0)
 		written = generic_write_sync(iocb, written);
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 300844f50dcd28..904a0d6ac1a1a9 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1041,11 +1041,9 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 			goto out_unlock;
 	}
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	pagefault_disable();
 	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
 	pagefault_enable();
-	current->backing_dev_info = NULL;
 	if (ret > 0) {
 		iocb->ki_pos += ret;
 		written += ret;
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index f0edf5a36237d1..665ce3fc62eaf4 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -648,11 +648,8 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
 	since = filemap_sample_wb_err(file->f_mapping);
 	nfs_start_io_write(inode);
 	result = generic_write_checks(iocb, from);
-	if (result > 0) {
-		current->backing_dev_info = inode_to_bdi(inode);
+	if (result > 0)
 		result = generic_perform_write(iocb, from);
-		current->backing_dev_info = NULL;
-	}
 	nfs_end_io_write(inode);
 	if (result <= 0)
 		goto out;
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index c481b14e4fd989..e296f804a9c442 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -1911,11 +1911,9 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 	inode_lock(vi);
 	/* We can write back this queue in page reclaim. */
-	current->backing_dev_info = inode_to_bdi(vi);
 	err = ntfs_prepare_file_for_write(iocb, from);
 	if (iov_iter_count(from) && !err)
 		written = ntfs_perform_write(file, from, iocb->ki_pos);
-	current->backing_dev_info = NULL;
 	inode_unlock(vi);
 	iocb->ki_pos += written;
 	if (likely(written > 0))
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 9a3d55c367d920..86d16a2c8339ca 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -820,7 +820,6 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 	if (!pages)
 		return -ENOMEM;
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	err = file_remove_privs(file);
 	if (err)
 		goto out;
@@ -993,8 +992,6 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 out:
 	kfree(pages);
 
-	current->backing_dev_info = NULL;
-
 	if (err < 0)
 		return err;
 
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index aede746541f8ae..431c3fd0e2b598 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -717,9 +717,6 @@ xfs_file_buffered_write(
 	if (ret)
 		goto out;
 
-	/* We can write back this queue in page reclaim */
-	current->backing_dev_info = inode_to_bdi(inode);
-
 	trace_xfs_file_buffered_write(iocb, from);
 	ret = iomap_file_buffered_write(iocb, from,
 			&xfs_buffered_write_iomap_ops);
@@ -753,7 +750,6 @@ xfs_file_buffered_write(
 		goto write_retry;
 	}
 
-	current->backing_dev_info = NULL;
 out:
 	if (iolock)
 		xfs_iunlock(ip, iolock);
diff --git a/include/linux/sched.h b/include/linux/sched.h
index eed5d65b8d1f4d..54780571fe9a07 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -41,7 +41,6 @@
 
 /* task_struct member predeclarations (sorted alphabetically): */
 struct audit_context;
-struct backing_dev_info;
 struct bio_list;
 struct blk_plug;
 struct bpf_local_storage;
@@ -1186,8 +1185,6 @@ struct task_struct {
 	/* VM state: */
 	struct reclaim_state		*reclaim_state;
 
-	struct backing_dev_info		*backing_dev_info;
-
 	struct io_context		*io_context;
 
 #ifdef CONFIG_COMPACTION
diff --git a/mm/filemap.c b/mm/filemap.c
index b4c9bd368b7e58..33b54660ad2b39 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3991,8 +3991,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	ssize_t		err;
 	ssize_t		status;
 
-	/* We can write back this queue in page reclaim */
-	current->backing_dev_info = inode_to_bdi(inode);
 	err = file_remove_privs(file);
 	if (err)
 		goto out;
@@ -4053,7 +4051,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			iocb->ki_pos += written;
 	}
 out:
-	current->backing_dev_info = NULL;
 	return written ? written : err;
 }
 EXPORT_SYMBOL(__generic_file_write_iter);
-- 
2.39.2

