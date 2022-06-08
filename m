Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DCD5436F0
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jun 2022 17:16:28 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-vKOP9GY5NjyfIjd_351z5w-1; Wed, 08 Jun 2022 11:16:23 -0400
X-MC-Unique: vKOP9GY5NjyfIjd_351z5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3273238149AC;
	Wed,  8 Jun 2022 15:16:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 071B4404E4B5;
	Wed,  8 Jun 2022 15:16:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7ADF11947055;
	Wed,  8 Jun 2022 15:16:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 065DE194704E for <cluster-devel@listman.corp.redhat.com>;
 Wed,  8 Jun 2022 15:03:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D099A112131E; Wed,  8 Jun 2022 15:03:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3FEC1121319
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 15:03:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DB7C804194
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 15:03:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-yZ13ttkFO9iq_ipOv695sg-1; Wed, 08 Jun 2022 11:03:29 -0400
X-MC-Unique: yZ13ttkFO9iq_ipOv695sg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyxCv-00CjFq-E2; Wed, 08 Jun 2022 15:02:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  8 Jun 2022 16:02:49 +0100
Message-Id: <20220608150249.3033815-20-willy@infradead.org>
In-Reply-To: <20220608150249.3033815-1-willy@infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v2 19/19] mm/folio-compat: Remove migration
 compatibility functions
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
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

migrate_page_move_mapping(), migrate_page_copy() and migrate_page_states()
are all now unused after converting all the filesystems from
aops->migratepage() to aops->migrate_folio().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/migrate.h | 11 -----------
 mm/folio-compat.c       | 22 ----------------------
 mm/ksm.c                |  2 +-
 3 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 59d64a1e6b4b..3e18c7048506 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -40,12 +40,8 @@ extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
 extern struct page *alloc_migration_target(struct page *page, unsigned long private);
 extern int isolate_movable_page(struct page *page, isolate_mode_t mode);
 
-extern void migrate_page_states(struct page *newpage, struct page *page);
-extern void migrate_page_copy(struct page *newpage, struct page *page);
 int migrate_huge_page_move_mapping(struct address_space *mapping,
 		struct folio *dst, struct folio *src);
-extern int migrate_page_move_mapping(struct address_space *mapping,
-		struct page *newpage, struct page *page, int extra_count);
 void migration_entry_wait_on_locked(swp_entry_t entry, pte_t *ptep,
 				spinlock_t *ptl);
 void folio_migrate_flags(struct folio *newfolio, struct folio *folio);
@@ -66,13 +62,6 @@ static inline struct page *alloc_migration_target(struct page *page,
 static inline int isolate_movable_page(struct page *page, isolate_mode_t mode)
 	{ return -EBUSY; }
 
-static inline void migrate_page_states(struct page *newpage, struct page *page)
-{
-}
-
-static inline void migrate_page_copy(struct page *newpage,
-				     struct page *page) {}
-
 static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 				  struct folio *dst, struct folio *src)
 {
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 20bc15b57d93..458618c7302c 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -51,28 +51,6 @@ void mark_page_accessed(struct page *page)
 }
 EXPORT_SYMBOL(mark_page_accessed);
 
-#ifdef CONFIG_MIGRATION
-int migrate_page_move_mapping(struct address_space *mapping,
-		struct page *newpage, struct page *page, int extra_count)
-{
-	return folio_migrate_mapping(mapping, page_folio(newpage),
-					page_folio(page), extra_count);
-}
-EXPORT_SYMBOL(migrate_page_move_mapping);
-
-void migrate_page_states(struct page *newpage, struct page *page)
-{
-	folio_migrate_flags(page_folio(newpage), page_folio(page));
-}
-EXPORT_SYMBOL(migrate_page_states);
-
-void migrate_page_copy(struct page *newpage, struct page *page)
-{
-	folio_migrate_copy(page_folio(newpage), page_folio(page));
-}
-EXPORT_SYMBOL(migrate_page_copy);
-#endif
-
 bool set_page_writeback(struct page *page)
 {
 	return folio_start_writeback(page_folio(page));
diff --git a/mm/ksm.c b/mm/ksm.c
index 54f78c9eecae..e8f8c1a2bb39 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -712,7 +712,7 @@ static struct page *get_ksm_page(struct stable_node *stable_node,
 	 * however, it might mean that the page is under page_ref_freeze().
 	 * The __remove_mapping() case is easy, again the node is now stale;
 	 * the same is in reuse_ksm_page() case; but if page is swapcache
-	 * in migrate_page_move_mapping(), it might still be our page,
+	 * in folio_migrate_mapping(), it might still be our page,
 	 * in which case it's essential to keep the node.
 	 */
 	while (!get_page_unless_zero(page)) {
-- 
2.35.1

