Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA1853F012
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-KhNtEpgGNue2cZDgdUs46A-1; Mon, 06 Jun 2022 16:41:12 -0400
X-MC-Unique: KhNtEpgGNue2cZDgdUs46A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 969C438005DD;
	Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A2441415106;
	Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 370EA19451F0;
	Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6876F194706E for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 20:41:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 470E62026D2D; Mon,  6 Jun 2022 20:41:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42A742026D07
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 244E3100BABB
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:10 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-GkoIQXFVMT-Ru0yoP_B4Eg-1; Mon, 06 Jun 2022 16:41:08 -0400
X-MC-Unique: GkoIQXFVMT-Ru0yoP_B4Eg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWw-00B19Q-Rb; Mon, 06 Jun 2022 20:40:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:34 +0100
Message-Id: <20220606204050.2625949-5-willy@infradead.org>
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 04/20] mm/migrate: Convert
 buffer_migrate_page() to buffer_migrate_folio()
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use a folio throughout __buffer_migrate_folio(), add kernel-doc for
buffer_migrate_folio() and buffer_migrate_folio_norefs(), move their
declarations to buffer.h and switch all filesystems that have wired
them up.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 block/fops.c                |  2 +-
 fs/ext2/inode.c             |  4 +-
 fs/ext4/inode.c             |  4 +-
 fs/ntfs/aops.c              |  6 +--
 fs/ocfs2/aops.c             |  2 +-
 include/linux/buffer_head.h | 10 +++++
 include/linux/fs.h          | 12 ------
 mm/migrate.c                | 76 ++++++++++++++++++++++---------------
 8 files changed, 65 insertions(+), 51 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index d6b3276a6c68..743fc46d0aad 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -417,7 +417,7 @@ const struct address_space_operations def_blk_aops = {
 	.write_end	= blkdev_write_end,
 	.writepages	= blkdev_writepages,
 	.direct_IO	= blkdev_direct_IO,
-	.migratepage	= buffer_migrate_page_norefs,
+	.migrate_folio	= buffer_migrate_folio_norefs,
 	.is_dirty_writeback = buffer_check_dirty_writeback,
 };
 
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 360ce3604a2d..84570c6265aa 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -973,7 +973,7 @@ const struct address_space_operations ext2_aops = {
 	.bmap			= ext2_bmap,
 	.direct_IO		= ext2_direct_IO,
 	.writepages		= ext2_writepages,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.is_partially_uptodate	= block_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 };
@@ -989,7 +989,7 @@ const struct address_space_operations ext2_nobh_aops = {
 	.bmap			= ext2_bmap,
 	.direct_IO		= ext2_direct_IO,
 	.writepages		= ext2_writepages,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.error_remove_page	= generic_error_remove_page,
 };
 
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 1aaea53e67b5..53877ffe3c41 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3633,7 +3633,7 @@ static const struct address_space_operations ext4_aops = {
 	.invalidate_folio	= ext4_invalidate_folio,
 	.release_folio		= ext4_release_folio,
 	.direct_IO		= noop_direct_IO,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.is_partially_uptodate  = block_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 	.swap_activate		= ext4_iomap_swap_activate,
@@ -3668,7 +3668,7 @@ static const struct address_space_operations ext4_da_aops = {
 	.invalidate_folio	= ext4_invalidate_folio,
 	.release_folio		= ext4_release_folio,
 	.direct_IO		= noop_direct_IO,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.is_partially_uptodate  = block_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 	.swap_activate		= ext4_iomap_swap_activate,
diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index 9e3964ea2ea0..5f4fb6ca6f2e 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -1659,7 +1659,7 @@ const struct address_space_operations ntfs_normal_aops = {
 	.dirty_folio	= block_dirty_folio,
 #endif /* NTFS_RW */
 	.bmap		= ntfs_bmap,
-	.migratepage	= buffer_migrate_page,
+	.migrate_folio	= buffer_migrate_folio,
 	.is_partially_uptodate = block_is_partially_uptodate,
 	.error_remove_page = generic_error_remove_page,
 };
@@ -1673,7 +1673,7 @@ const struct address_space_operations ntfs_compressed_aops = {
 	.writepage	= ntfs_writepage,
 	.dirty_folio	= block_dirty_folio,
 #endif /* NTFS_RW */
-	.migratepage	= buffer_migrate_page,
+	.migrate_folio	= buffer_migrate_folio,
 	.is_partially_uptodate = block_is_partially_uptodate,
 	.error_remove_page = generic_error_remove_page,
 };
@@ -1688,7 +1688,7 @@ const struct address_space_operations ntfs_mst_aops = {
 	.writepage	= ntfs_writepage,	/* Write dirty page to disk. */
 	.dirty_folio	= filemap_dirty_folio,
 #endif /* NTFS_RW */
-	.migratepage	= buffer_migrate_page,
+	.migrate_folio	= buffer_migrate_folio,
 	.is_partially_uptodate	= block_is_partially_uptodate,
 	.error_remove_page = generic_error_remove_page,
 };
diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 767df51f8657..1d489003f99d 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -2462,7 +2462,7 @@ const struct address_space_operations ocfs2_aops = {
 	.direct_IO		= ocfs2_direct_IO,
 	.invalidate_folio	= block_invalidate_folio,
 	.release_folio		= ocfs2_release_folio,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.is_partially_uptodate	= block_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 };
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index c9d1463bb20f..b0366c89d6a4 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -267,6 +267,16 @@ int nobh_truncate_page(struct address_space *, loff_t, get_block_t *);
 int nobh_writepage(struct page *page, get_block_t *get_block,
                         struct writeback_control *wbc);
 
+#ifdef CONFIG_MIGRATION
+extern int buffer_migrate_folio(struct address_space *,
+		struct folio *dst, struct folio *src, enum migrate_mode);
+extern int buffer_migrate_folio_norefs(struct address_space *,
+		struct folio *dst, struct folio *src, enum migrate_mode);
+#else
+#define buffer_migrate_folio NULL
+#define buffer_migrate_folio_norefs NULL
+#endif
+
 void buffer_init(void);
 
 /*
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 7b380fa66983..5737c92ed286 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3217,18 +3217,6 @@ extern int generic_check_addressable(unsigned, u64);
 
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
-#ifdef CONFIG_MIGRATION
-extern int buffer_migrate_page(struct address_space *,
-				struct page *, struct page *,
-				enum migrate_mode);
-extern int buffer_migrate_page_norefs(struct address_space *,
-				struct page *, struct page *,
-				enum migrate_mode);
-#else
-#define buffer_migrate_page NULL
-#define buffer_migrate_page_norefs NULL
-#endif
-
 int may_setattr(struct user_namespace *mnt_userns, struct inode *inode,
 		unsigned int ia_valid);
 int setattr_prepare(struct user_namespace *, struct dentry *, struct iattr *);
diff --git a/mm/migrate.c b/mm/migrate.c
index f19246c12fe9..77b8c662c9ca 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -657,23 +657,23 @@ static bool buffer_migrate_lock_buffers(struct buffer_head *head,
 	return true;
 }
 
-static int __buffer_migrate_page(struct address_space *mapping,
-		struct page *newpage, struct page *page, enum migrate_mode mode,
+static int __buffer_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode,
 		bool check_refs)
 {
 	struct buffer_head *bh, *head;
 	int rc;
 	int expected_count;
 
-	if (!page_has_buffers(page))
-		return migrate_page(mapping, newpage, page, mode);
+	head = folio_buffers(src);
+	if (!head)
+		return migrate_page(mapping, &dst->page, &src->page, mode);
 
 	/* Check whether page does not have extra refs before we do more work */
-	expected_count = expected_page_refs(mapping, page);
-	if (page_count(page) != expected_count)
+	expected_count = expected_page_refs(mapping, &src->page);
+	if (folio_ref_count(src) != expected_count)
 		return -EAGAIN;
 
-	head = page_buffers(page);
 	if (!buffer_migrate_lock_buffers(head, mode))
 		return -EAGAIN;
 
@@ -704,23 +704,22 @@ static int __buffer_migrate_page(struct address_space *mapping,
 		}
 	}
 
-	rc = migrate_page_move_mapping(mapping, newpage, page, 0);
+	rc = folio_migrate_mapping(mapping, dst, src, 0);
 	if (rc != MIGRATEPAGE_SUCCESS)
 		goto unlock_buffers;
 
-	attach_page_private(newpage, detach_page_private(page));
+	folio_attach_private(dst, folio_detach_private(src));
 
 	bh = head;
 	do {
-		set_bh_page(bh, newpage, bh_offset(bh));
+		set_bh_page(bh, &dst->page, bh_offset(bh));
 		bh = bh->b_this_page;
-
 	} while (bh != head);
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
-		migrate_page_copy(newpage, page);
+		folio_migrate_copy(dst, src);
 	else
-		migrate_page_states(newpage, page);
+		folio_migrate_flags(dst, src);
 
 	rc = MIGRATEPAGE_SUCCESS;
 unlock_buffers:
@@ -730,34 +729,51 @@ static int __buffer_migrate_page(struct address_space *mapping,
 	do {
 		unlock_buffer(bh);
 		bh = bh->b_this_page;
-
 	} while (bh != head);
 
 	return rc;
 }
 
-/*
- * Migration function for pages with buffers. This function can only be used
- * if the underlying filesystem guarantees that no other references to "page"
- * exist. For example attached buffer heads are accessed only under page lock.
+/**
+ * buffer_migrate_folio() - Migration function for folios with buffers.
+ * @mapping: The address space containing @src.
+ * @dst: The folio to migrate to.
+ * @src: The folio to migrate from.
+ * @mode: How to migrate the folio.
+ *
+ * This function can only be used if the underlying filesystem guarantees
+ * that no other references to @src exist. For example attached buffer
+ * heads are accessed only under the folio lock.  If your filesystem cannot
+ * provide this guarantee, buffer_migrate_folio_noref() may be more
+ * appropriate.
+ *
+ * Return: 0 on success or a negative errno on failure.
  */
-int buffer_migrate_page(struct address_space *mapping,
-		struct page *newpage, struct page *page, enum migrate_mode mode)
+int buffer_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
-	return __buffer_migrate_page(mapping, newpage, page, mode, false);
+	return __buffer_migrate_folio(mapping, dst, src, mode, false);
 }
-EXPORT_SYMBOL(buffer_migrate_page);
+EXPORT_SYMBOL(buffer_migrate_folio);
 
-/*
- * Same as above except that this variant is more careful and checks that there
- * are also no buffer head references. This function is the right one for
- * mappings where buffer heads are directly looked up and referenced (such as
- * block device mappings).
+/**
+ * buffer_migrate_folio_noref() - Migration function for folios with buffers.
+ * @mapping: The address space containing @src.
+ * @dst: The folio to migrate to.
+ * @src: The folio to migrate from.
+ * @mode: How to migrate the folio.
+ *
+ * Like buffer_migrate_folio() except that this variant is more careful
+ * and checks that there are also no buffer head references. This function
+ * is the right one for mappings where buffer heads are directly looked
+ * up and referenced (such as block device mappings).
+ *
+ * Return: 0 on success or a negative errno on failure.
  */
-int buffer_migrate_page_norefs(struct address_space *mapping,
-		struct page *newpage, struct page *page, enum migrate_mode mode)
+int buffer_migrate_folio_norefs(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
-	return __buffer_migrate_page(mapping, newpage, page, mode, true);
+	return __buffer_migrate_folio(mapping, dst, src, mode, true);
 }
 #endif
 
-- 
2.35.1

