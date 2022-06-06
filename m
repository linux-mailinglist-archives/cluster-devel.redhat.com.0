Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213A53F049
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:42 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-4UmohxQ9PLuJZlWDb1wWiw-1; Mon, 06 Jun 2022 16:41:37 -0400
X-MC-Unique: 4UmohxQ9PLuJZlWDb1wWiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 733BF80B90D;
	Mon,  6 Jun 2022 20:41:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 681D3492C3B;
	Mon,  6 Jun 2022 20:41:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 187C71947B8D;
	Mon,  6 Jun 2022 20:41:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 785C5194707A for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 20:41:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 571DB40EC003; Mon,  6 Jun 2022 20:41:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 531BD40EC002
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B1DD3C0F722
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-qLMp5XPbNJSmSZTWs8BXOw-1; Mon, 06 Jun 2022 16:41:32 -0400
X-MC-Unique: qLMp5XPbNJSmSZTWs8BXOw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWx-00B19k-M6; Mon, 06 Jun 2022 20:40:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:44 +0100
Message-Id: <20220606204050.2625949-15-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 14/20] hugetlb: Convert to migrate_folio
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This involves converting migrate_huge_page_move_mapping().  We also need a
folio variant of hugetlb_set_page_subpool(), but that's for a later patch.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/hugetlbfs/inode.c    | 19 ++++++++++---------
 include/linux/migrate.h |  6 +++---
 mm/migrate.c            | 18 +++++++++---------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 14d33f725e05..583ca3f52c04 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -954,25 +954,26 @@ static int hugetlbfs_symlink(struct user_namespace *mnt_userns,
 	return error;
 }
 
-static int hugetlbfs_migrate_page(struct address_space *mapping,
-				struct page *newpage, struct page *page,
+static int hugetlbfs_migrate_folio(struct address_space *mapping,
+				struct folio *dst, struct folio *src,
 				enum migrate_mode mode)
 {
 	int rc;
 
-	rc = migrate_huge_page_move_mapping(mapping, newpage, page);
+	rc = migrate_huge_page_move_mapping(mapping, dst, src);
 	if (rc != MIGRATEPAGE_SUCCESS)
 		return rc;
 
-	if (hugetlb_page_subpool(page)) {
-		hugetlb_set_page_subpool(newpage, hugetlb_page_subpool(page));
-		hugetlb_set_page_subpool(page, NULL);
+	if (hugetlb_page_subpool(&src->page)) {
+		hugetlb_set_page_subpool(&dst->page,
+					hugetlb_page_subpool(&src->page));
+		hugetlb_set_page_subpool(&src->page, NULL);
 	}
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
-		migrate_page_copy(newpage, page);
+		folio_migrate_copy(dst, src);
 	else
-		migrate_page_states(newpage, page);
+		folio_migrate_flags(dst, src);
 
 	return MIGRATEPAGE_SUCCESS;
 }
@@ -1142,7 +1143,7 @@ static const struct address_space_operations hugetlbfs_aops = {
 	.write_begin	= hugetlbfs_write_begin,
 	.write_end	= hugetlbfs_write_end,
 	.dirty_folio	= noop_dirty_folio,
-	.migratepage    = hugetlbfs_migrate_page,
+	.migrate_folio  = hugetlbfs_migrate_folio,
 	.error_remove_page	= hugetlbfs_error_remove_page,
 };
 
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 4ef22806cd8e..088749471485 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -35,8 +35,8 @@ extern int isolate_movable_page(struct page *page, isolate_mode_t mode);
 
 extern void migrate_page_states(struct page *newpage, struct page *page);
 extern void migrate_page_copy(struct page *newpage, struct page *page);
-extern int migrate_huge_page_move_mapping(struct address_space *mapping,
-				  struct page *newpage, struct page *page);
+int migrate_huge_page_move_mapping(struct address_space *mapping,
+		struct folio *dst, struct folio *src);
 extern int migrate_page_move_mapping(struct address_space *mapping,
 		struct page *newpage, struct page *page, int extra_count);
 void migration_entry_wait_on_locked(swp_entry_t entry, pte_t *ptep,
@@ -67,7 +67,7 @@ static inline void migrate_page_copy(struct page *newpage,
 				     struct page *page) {}
 
 static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
-				  struct page *newpage, struct page *page)
+				  struct folio *dst, struct folio *src)
 {
 	return -ENOSYS;
 }
diff --git a/mm/migrate.c b/mm/migrate.c
index 148dd0463dec..a8edd226c72d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -475,26 +475,26 @@ EXPORT_SYMBOL(folio_migrate_mapping);
  * of folio_migrate_mapping().
  */
 int migrate_huge_page_move_mapping(struct address_space *mapping,
-				   struct page *newpage, struct page *page)
+				   struct folio *dst, struct folio *src)
 {
-	XA_STATE(xas, &mapping->i_pages, page_index(page));
+	XA_STATE(xas, &mapping->i_pages, folio_index(src));
 	int expected_count;
 
 	xas_lock_irq(&xas);
-	expected_count = 2 + page_has_private(page);
-	if (!page_ref_freeze(page, expected_count)) {
+	expected_count = 2 + folio_has_private(src);
+	if (!folio_ref_freeze(src, expected_count)) {
 		xas_unlock_irq(&xas);
 		return -EAGAIN;
 	}
 
-	newpage->index = page->index;
-	newpage->mapping = page->mapping;
+	dst->index = src->index;
+	dst->mapping = src->mapping;
 
-	get_page(newpage);
+	folio_get(dst);
 
-	xas_store(&xas, newpage);
+	xas_store(&xas, dst);
 
-	page_ref_unfreeze(page, expected_count - 1);
+	folio_ref_unfreeze(src, expected_count - 1);
 
 	xas_unlock_irq(&xas);
 
-- 
2.35.1

