Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C22BB6504ED
	for <lists+cluster-devel@lfdr.de>; Sun, 18 Dec 2022 23:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671401468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oaDAnC1sTKX92MKULIjHiEC9OYj6fZcVoW9K2+IChko=;
	b=iOxTrdA7FfP2YugEinYxx4kawQF98skvv0NpAbjb7o63We5HYuA6fE2NHs6DkTgL1trbh2
	mxKwYBhnQxnc1Qoat8v2NiJTzeoaycRaI/54gQOprWGZJZfJ6ZwjtEyOrv+YGlip+Dxw4m
	V+aK+ftA9vZx1QAHwEe8dNYaa6PZjg0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-mpljgW-UP8iOrAJgvlKNDA-1; Sun, 18 Dec 2022 17:11:05 -0500
X-MC-Unique: mpljgW-UP8iOrAJgvlKNDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87B7787B2A0;
	Sun, 18 Dec 2022 22:11:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD2F9C16020;
	Sun, 18 Dec 2022 22:11:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C74DE1946588;
	Sun, 18 Dec 2022 22:11:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B0B501946588 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 18 Dec 2022 22:10:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9622A2166B2B; Sun, 18 Dec 2022 22:10:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-22.brq.redhat.com [10.40.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F72F2166B26;
 Sun, 18 Dec 2022 22:10:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun, 18 Dec 2022 23:10:48 +0100
Message-Id: <20221218221054.3946886-2-agruenba@redhat.com>
In-Reply-To: <20221216150626.670312-1-agruenba@redhat.com>
References: <20221216150626.670312-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC v4 1/7] fs: Add folio_may_straddle_isize helper
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
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a folio_may_straddle_isize() helper as a replacement for
pagecache_isize_extended() when we have a locked folio.

Use the new helper in generic_write_end(), iomap_write_end(),
ext4_write_end(), and ext4_journalled_write_end().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/buffer.c            |  5 ++---
 fs/ext4/inode.c        | 13 ++++++-------
 fs/iomap/buffered-io.c |  3 +--
 include/linux/mm.h     |  2 ++
 mm/truncate.c          | 35 +++++++++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index d9c6d1fbb6dd..bbae1437994b 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2164,16 +2164,15 @@ int generic_write_end(struct file *file, struct address_space *mapping,
 	 * But it's important to update i_size while still holding page lock:
 	 * page writeout could otherwise come in and zero beyond i_size.
 	 */
-	if (pos + copied > inode->i_size) {
+	if (pos + copied > old_size) {
 		i_size_write(inode, pos + copied);
 		i_size_changed = true;
+		folio_may_straddle_isize(inode, page_folio(page), old_size, pos);
 	}
 
 	unlock_page(page);
 	put_page(page);
 
-	if (old_size < pos)
-		pagecache_isize_extended(inode, old_size, pos);
 	/*
 	 * Don't mark the inode dirty under page lock. First, it unnecessarily
 	 * makes the holding time of page lock longer. Second, it forces lock
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 9d9f414f99fe..6fe1c9609d86 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1327,13 +1327,13 @@ static int ext4_write_end(struct file *file,
 	 * If FS_IOC_ENABLE_VERITY is running on this inode, then Merkle tree
 	 * blocks are being written past EOF, so skip the i_size update.
 	 */
-	if (!verity)
+	if (!verity) {
 		i_size_changed = ext4_update_inode_size(inode, pos + copied);
+		folio_may_straddle_isize(inode, page_folio(page), old_size, pos);
+	}
 	unlock_page(page);
 	put_page(page);
 
-	if (old_size < pos && !verity)
-		pagecache_isize_extended(inode, old_size, pos);
 	/*
 	 * Don't mark the inode dirty under page lock. First, it unnecessarily
 	 * makes the holding time of page lock longer. Second, it forces lock
@@ -1439,16 +1439,15 @@ static int ext4_journalled_write_end(struct file *file,
 		if (!partial)
 			SetPageUptodate(page);
 	}
-	if (!verity)
+	if (!verity) {
 		size_changed = ext4_update_inode_size(inode, pos + copied);
+		folio_may_straddle_isize(inode, page_folio(page), old_size, pos);
+	}
 	ext4_set_inode_state(inode, EXT4_STATE_JDATA);
 	EXT4_I(inode)->i_datasync_tid = handle->h_transaction->t_tid;
 	unlock_page(page);
 	put_page(page);
 
-	if (old_size < pos && !verity)
-		pagecache_isize_extended(inode, old_size, pos);
-
 	if (size_changed) {
 		ret2 = ext4_mark_inode_dirty(handle, inode);
 		if (!ret)
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 356193e44cf0..347010c6a652 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -734,11 +734,10 @@ static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
 	if (pos + ret > old_size) {
 		i_size_write(iter->inode, pos + ret);
 		iter->iomap.flags |= IOMAP_F_SIZE_CHANGED;
+		folio_may_straddle_isize(iter->inode, folio, old_size, pos);
 	}
 	folio_unlock(folio);
 
-	if (old_size < pos)
-		pagecache_isize_extended(iter->inode, old_size, pos);
 	if (page_ops && page_ops->page_done)
 		page_ops->page_done(iter->inode, pos, ret, &folio->page);
 	folio_put(folio);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8178fe894e2e..a8632747780e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2016,6 +2016,8 @@ int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
 
 extern void truncate_pagecache(struct inode *inode, loff_t new);
 extern void truncate_setsize(struct inode *inode, loff_t newsize);
+void folio_may_straddle_isize(struct inode *inode, struct folio *folio,
+			      loff_t old_size, loff_t start);
 void pagecache_isize_extended(struct inode *inode, loff_t from, loff_t to);
 void truncate_pagecache_range(struct inode *inode, loff_t offset, loff_t end);
 int generic_error_remove_page(struct address_space *mapping, struct page *page);
diff --git a/mm/truncate.c b/mm/truncate.c
index 7b4ea4c4a46b..971b08399144 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -769,6 +769,41 @@ void truncate_setsize(struct inode *inode, loff_t newsize)
 }
 EXPORT_SYMBOL(truncate_setsize);
 
+/**
+ * folio_may_straddle_isize - update pagecache after extending i_size
+ * @inode:	inode for which i_size was extended
+ * @folio:	folio to maybe mark read-only
+ * @old_size:	original inode size
+ * @start:	start of the write
+ *
+ * Handle extending an inode by a write that starts behind the old inode size.
+ * If a block-aligned hole exists between the old inode size and the start of
+ * the write, we mark the folio read-only so that page_mkwrite() is called on
+ * the nearest write access to the page.  That way, the filesystem can be sure
+ * that page_mkwrite() is called on the page before a user writes to the page
+ * via mmap.
+ *
+ * This function must be called while we still hold i_rwsem - this not only
+ * makes sure i_size is stable but also that userspace cannot observe the new
+ * i_size value before we are prepared to handle mmap writes there.
+ */
+void folio_may_straddle_isize(struct inode *inode, struct folio *folio,
+			      loff_t old_size, loff_t start)
+{
+	unsigned int blocksize = i_blocksize(inode);
+
+	if (round_up(old_size, blocksize) >= round_down(start, blocksize))
+		return;
+
+	/*
+	 * See clear_page_dirty_for_io() for details why folio_set_dirty()
+	 * is needed.
+	 */
+	if (folio_mkclean(folio))
+		folio_set_dirty(folio);
+}
+EXPORT_SYMBOL(folio_may_straddle_isize);
+
 /**
  * pagecache_isize_extended - update pagecache after extension of i_size
  * @inode:	inode for which i_size was extended
-- 
2.38.1

