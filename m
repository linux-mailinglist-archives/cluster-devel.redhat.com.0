Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E370EE9B
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 08:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684911254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HdqYutACGg449lbpC5g+tM8dj77PJUcg5E3vRPFmYq0=;
	b=gYnNx9SdKImNoYVWXIl0ErVVfelGWGuSRN+u/1g6k/Q4/HDL6mu/7IWmMY6KsMMjO+iA6A
	SlhyiHYln68Yliw6PBEB+6FXpOWj5GHOW5KgTweXr4CgelI3sCpssjCr+d3pmRroQQcqGw
	27hdgbF3f3xbsQ3xvszuFHHh0YPBOAk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-e8seHaFfMr6VUJquZukGog-1; Wed, 24 May 2023 02:54:11 -0400
X-MC-Unique: e8seHaFfMr6VUJquZukGog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA9CA3C0C88D;
	Wed, 24 May 2023 06:54:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE740140E95D;
	Wed, 24 May 2023 06:54:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 80BAA19465BA;
	Wed, 24 May 2023 06:54:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 653B219465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 06:54:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B3B42166B26; Wed, 24 May 2023 06:54:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 427AD2166B25
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 06:54:09 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2891B8002BF
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 06:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-cqwJ53nMN4-QAAhYrnqZpw-1; Wed, 24 May 2023 02:53:59 -0400
X-MC-Unique: cqwJ53nMN4-QAAhYrnqZpw-1
Received: from [2001:4bb8:188:23b2:cbb8:fcea:a637:5089] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1i8l-00CVg9-0q; Wed, 24 May 2023 06:38:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 24 May 2023 08:38:05 +0200
Message-Id: <20230524063810.1595778-7-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH 06/11] filemap: add a
 kiocb_invalidate_post_direct_write helper
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a helper to invalidate page cache after a dio write.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Acked-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/direct-io.c          | 10 ++--------
 fs/iomap/direct-io.c    | 12 ++----------
 include/linux/fs.h      |  5 -----
 include/linux/pagemap.h |  1 +
 mm/filemap.c            | 37 ++++++++++++++++++++-----------------
 5 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index 0b380bb8a81e11..4f9069aee0fe19 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -285,14 +285,8 @@ static ssize_t dio_complete(struct dio *dio, ssize_t ret, unsigned int flags)
 	 * zeros from unwritten extents.
 	 */
 	if (flags & DIO_COMPLETE_INVALIDATE &&
-	    ret > 0 && dio_op == REQ_OP_WRITE &&
-	    dio->inode->i_mapping->nrpages) {
-		err = invalidate_inode_pages2_range(dio->inode->i_mapping,
-					offset >> PAGE_SHIFT,
-					(offset + ret - 1) >> PAGE_SHIFT);
-		if (err)
-			dio_warn_stale_pagecache(dio->iocb->ki_filp);
-	}
+	    ret > 0 && dio_op == REQ_OP_WRITE)
+		kiocb_invalidate_post_direct_write(dio->iocb, ret);
 
 	inode_dio_end(dio->inode);
 
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 6207a59d2162e1..0795c54a745bca 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -81,7 +81,6 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
 {
 	const struct iomap_dio_ops *dops = dio->dops;
 	struct kiocb *iocb = dio->iocb;
-	struct inode *inode = file_inode(iocb->ki_filp);
 	loff_t offset = iocb->ki_pos;
 	ssize_t ret = dio->error;
 
@@ -108,15 +107,8 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
 	 * ->end_io() when necessary, otherwise a racing buffer read would cache
 	 * zeros from unwritten extents.
 	 */
-	if (!dio->error && dio->size &&
-	    (dio->flags & IOMAP_DIO_WRITE) && inode->i_mapping->nrpages) {
-		int err;
-		err = invalidate_inode_pages2_range(inode->i_mapping,
-				offset >> PAGE_SHIFT,
-				(offset + dio->size - 1) >> PAGE_SHIFT);
-		if (err)
-			dio_warn_stale_pagecache(iocb->ki_filp);
-	}
+	if (!dio->error && dio->size && (dio->flags & IOMAP_DIO_WRITE))
+		kiocb_invalidate_post_direct_write(iocb, dio->size);
 
 	inode_dio_end(file_inode(iocb->ki_filp));
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 21a98168085641..e4efc1792a877a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2837,11 +2837,6 @@ static inline void inode_dio_end(struct inode *inode)
 		wake_up_bit(&inode->i_state, __I_DIO_WAKEUP);
 }
 
-/*
- * Warn about a page cache invalidation failure diring a direct I/O write.
- */
-void dio_warn_stale_pagecache(struct file *filp);
-
 extern void inode_set_flags(struct inode *inode, unsigned int flags,
 			    unsigned int mask);
 
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 6e4c9ee40baa99..6ecc4aaf5e3d51 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -31,6 +31,7 @@ int invalidate_inode_pages2(struct address_space *mapping);
 int invalidate_inode_pages2_range(struct address_space *mapping,
 		pgoff_t start, pgoff_t end);
 int kiocb_invalidate_pages(struct kiocb *iocb, size_t count);
+void kiocb_invalidate_post_direct_write(struct kiocb *iocb, size_t count);
 
 int write_inode_now(struct inode *, int sync);
 int filemap_fdatawrite(struct address_space *);
diff --git a/mm/filemap.c b/mm/filemap.c
index a1cb01a4b8046a..ddb6f8aa86d6ca 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3816,7 +3816,7 @@ EXPORT_SYMBOL(read_cache_page_gfp);
 /*
  * Warn about a page cache invalidation failure during a direct I/O write.
  */
-void dio_warn_stale_pagecache(struct file *filp)
+static void dio_warn_stale_pagecache(struct file *filp)
 {
 	static DEFINE_RATELIMIT_STATE(_rs, 86400 * HZ, DEFAULT_RATELIMIT_BURST);
 	char pathname[128];
@@ -3833,19 +3833,23 @@ void dio_warn_stale_pagecache(struct file *filp)
 	}
 }
 
+void kiocb_invalidate_post_direct_write(struct kiocb *iocb, size_t count)
+{
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
+
+	if (mapping->nrpages &&
+	    invalidate_inode_pages2_range(mapping,
+			iocb->ki_pos >> PAGE_SHIFT,
+			(iocb->ki_pos + count - 1) >> PAGE_SHIFT))
+		dio_warn_stale_pagecache(iocb->ki_filp);
+}
+
 ssize_t
 generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 {
-	struct file	*file = iocb->ki_filp;
-	struct address_space *mapping = file->f_mapping;
-	struct inode	*inode = mapping->host;
-	loff_t		pos = iocb->ki_pos;
-	ssize_t		written;
-	size_t		write_len;
-	pgoff_t		end;
-
-	write_len = iov_iter_count(from);
-	end = (pos + write_len - 1) >> PAGE_SHIFT;
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
+	size_t write_len = iov_iter_count(from);
+	ssize_t written;
 
 	/*
 	 * If a page can not be invalidated, return 0 to fall back
@@ -3855,7 +3859,7 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	if (written) {
 		if (written == -EBUSY)
 			return 0;
-		goto out;
+		return written;
 	}
 
 	written = mapping->a_ops->direct_IO(iocb, from);
@@ -3877,11 +3881,11 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	 *
 	 * Skip invalidation for async writes or if mapping has no pages.
 	 */
-	if (written > 0 && mapping->nrpages &&
-	    invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT, end))
-		dio_warn_stale_pagecache(file);
-
 	if (written > 0) {
+		struct inode *inode = mapping->host;
+		loff_t pos = iocb->ki_pos;
+
+		kiocb_invalidate_post_direct_write(iocb, written);
 		pos += written;
 		write_len -= written;
 		if (pos > i_size_read(inode) && !S_ISBLK(inode->i_mode)) {
@@ -3892,7 +3896,6 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	}
 	if (written != -EIOCBQUEUED)
 		iov_iter_revert(from, write_len - iov_iter_count(from));
-out:
 	return written;
 }
 EXPORT_SYMBOL(generic_file_direct_write);
-- 
2.39.2

