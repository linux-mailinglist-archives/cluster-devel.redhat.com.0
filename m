Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498053F052
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jun 2022 22:42:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-tUOM4QYXN4CiwkXbekHPqA-1; Mon, 06 Jun 2022 16:41:23 -0400
X-MC-Unique: tUOM4QYXN4CiwkXbekHPqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED2B7801228;
	Mon,  6 Jun 2022 20:41:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0E7A1410F39;
	Mon,  6 Jun 2022 20:41:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6983B194706E;
	Mon,  6 Jun 2022 20:41:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 384C81947079 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 20:41:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1A8951415100; Mon,  6 Jun 2022 20:41:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16D921410F3B
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00C891C0896A
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:19 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-47YFxwLbOX-0EThMlTGjCA-1; Mon, 06 Jun 2022 16:41:17 -0400
X-MC-Unique: 47YFxwLbOX-0EThMlTGjCA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWx-00B19Y-4o; Mon, 06 Jun 2022 20:40:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:38 +0100
Message-Id: <20220606204050.2625949-9-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 08/20] mm/migrate: Convert migrate_page() to
 migrate_folio()
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

Convert all callers to pass a folio.  Most have the folio
already available.  Switch all users from aops->migratepage to
aops->migrate_folio.  Also turn the documentation into kerneldoc.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  4 +--
 fs/btrfs/disk-io.c                          |  2 +-
 fs/nfs/write.c                              |  2 +-
 include/linux/migrate.h                     |  5 ++-
 mm/migrate.c                                | 37 +++++++++++----------
 mm/migrate_device.c                         |  3 +-
 mm/shmem.c                                  |  2 +-
 mm/swap_state.c                             |  2 +-
 8 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 094f06b4ce33..8423df021b71 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -216,8 +216,8 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_object *obj,
 			 * However...!
 			 *
 			 * The mmu-notifier can be invalidated for a
-			 * migrate_page, that is alreadying holding the lock
-			 * on the page. Such a try_to_unmap() will result
+			 * migrate_folio, that is alreadying holding the lock
+			 * on the folio. Such a try_to_unmap() will result
 			 * in us calling put_pages() and so recursively try
 			 * to lock the page. We avoid that deadlock with
 			 * a trylock_page() and in exchange we risk missing
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 9ceb73f683af..8e5f1fa1e972 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -968,7 +968,7 @@ static int btree_migrate_folio(struct address_space *mapping,
 	if (folio_get_private(src) &&
 	    !filemap_release_folio(src, GFP_KERNEL))
 		return -EAGAIN;
-	return migrate_page(mapping, &dst->page, &src->page, mode);
+	return migrate_folio(mapping, dst, src, mode);
 }
 #else
 #define btree_migrate_folio NULL
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 649b9e633459..69569696dde0 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -2139,7 +2139,7 @@ int nfs_migrate_folio(struct address_space *mapping, struct folio *dst,
 		folio_wait_fscache(src);
 	}
 
-	return migrate_page(mapping, &dst->page, &src->page, mode);
+	return migrate_folio(mapping, dst, src, mode);
 }
 #endif
 
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 069a89e847f3..4ef22806cd8e 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -25,9 +25,8 @@ extern const char *migrate_reason_names[MR_TYPES];
 #ifdef CONFIG_MIGRATION
 
 extern void putback_movable_pages(struct list_head *l);
-extern int migrate_page(struct address_space *mapping,
-			struct page *newpage, struct page *page,
-			enum migrate_mode mode);
+int migrate_folio(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode);
 extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
 		unsigned long private, enum migrate_mode mode, int reason,
 		unsigned int *ret_succeeded);
diff --git a/mm/migrate.c b/mm/migrate.c
index e0a593e5b5f9..6232c291fdb9 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -594,34 +594,37 @@ EXPORT_SYMBOL(folio_migrate_copy);
  *                    Migration functions
  ***********************************************************/
 
-/*
- * Common logic to directly migrate a single LRU page suitable for
- * pages that do not use PagePrivate/PagePrivate2.
+/**
+ * migrate_folio() - Simple folio migration.
+ * @mapping: The address_space containing the folio.
+ * @dst: The folio to migrate the data to.
+ * @src: The folio containing the current data.
+ * @mode: How to migrate the page.
  *
- * Pages are locked upon entry and exit.
+ * Common logic to directly migrate a single LRU folio suitable for
+ * folios that do not use PagePrivate/PagePrivate2.
+ *
+ * Folios are locked upon entry and exit.
  */
-int migrate_page(struct address_space *mapping,
-		struct page *newpage, struct page *page,
-		enum migrate_mode mode)
+int migrate_folio(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode)
 {
-	struct folio *newfolio = page_folio(newpage);
-	struct folio *folio = page_folio(page);
 	int rc;
 
-	BUG_ON(folio_test_writeback(folio));	/* Writeback must be complete */
+	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
 
-	rc = folio_migrate_mapping(mapping, newfolio, folio, 0);
+	rc = folio_migrate_mapping(mapping, dst, src, 0);
 
 	if (rc != MIGRATEPAGE_SUCCESS)
 		return rc;
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
-		folio_migrate_copy(newfolio, folio);
+		folio_migrate_copy(dst, src);
 	else
-		folio_migrate_flags(newfolio, folio);
+		folio_migrate_flags(dst, src);
 	return MIGRATEPAGE_SUCCESS;
 }
-EXPORT_SYMBOL(migrate_page);
+EXPORT_SYMBOL(migrate_folio);
 
 #ifdef CONFIG_BLOCK
 /* Returns true if all buffers are successfully locked */
@@ -672,7 +675,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
 
 	head = folio_buffers(src);
 	if (!head)
-		return migrate_page(mapping, &dst->page, &src->page, mode);
+		return migrate_folio(mapping, dst, src, mode);
 
 	/* Check whether page does not have extra refs before we do more work */
 	expected_count = folio_expected_refs(mapping, src);
@@ -849,7 +852,7 @@ static int fallback_migrate_folio(struct address_space *mapping,
 	    !filemap_release_folio(src, GFP_KERNEL))
 		return mode == MIGRATE_SYNC ? -EAGAIN : -EBUSY;
 
-	return migrate_page(mapping, &dst->page, &src->page, mode);
+	return migrate_folio(mapping, dst, src, mode);
 }
 
 /*
@@ -877,7 +880,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 	if (likely(is_lru)) {
 		if (!mapping)
-			rc = migrate_page(mapping, &dst->page, &src->page, mode);
+			rc = migrate_folio(mapping, dst, src, mode);
 		else if (mapping->a_ops->migrate_folio)
 			/*
 			 * Most folios have a mapping and most filesystems
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 5052093d0262..5dd97c39ca6a 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -718,7 +718,8 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			continue;
 		}
 
-		r = migrate_page(mapping, newpage, page, MIGRATE_SYNC_NO_COPY);
+		r = migrate_folio(mapping, page_folio(newpage),
+				page_folio(page), MIGRATE_SYNC_NO_COPY);
 		if (r != MIGRATEPAGE_SUCCESS)
 			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
diff --git a/mm/shmem.c b/mm/shmem.c
index 313ae7df59d8..e37ff6a1a6d0 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3801,7 +3801,7 @@ const struct address_space_operations shmem_aops = {
 	.write_end	= shmem_write_end,
 #endif
 #ifdef CONFIG_MIGRATION
-	.migratepage	= migrate_page,
+	.migrate_folio	= migrate_folio,
 #endif
 	.error_remove_page = shmem_error_remove_page,
 };
diff --git a/mm/swap_state.c b/mm/swap_state.c
index f5b6f5638908..0a2021fc55ad 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -33,7 +33,7 @@ static const struct address_space_operations swap_aops = {
 	.writepage	= swap_writepage,
 	.dirty_folio	= noop_dirty_folio,
 #ifdef CONFIG_MIGRATION
-	.migratepage	= migrate_page,
+	.migrate_folio	= migrate_folio,
 #endif
 };
 
-- 
2.35.1

