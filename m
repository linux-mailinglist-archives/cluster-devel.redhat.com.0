Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE0453F02D
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:28 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-o4H5QnB_MeOTWOy4SgtHqg-1; Mon, 06 Jun 2022 16:41:23 -0400
X-MC-Unique: o4H5QnB_MeOTWOy4SgtHqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36DB3858F11;
	Mon,  6 Jun 2022 20:41:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28F0B40EC002;
	Mon,  6 Jun 2022 20:41:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EEFA1194706E;
	Mon,  6 Jun 2022 20:41:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 28D14194706E for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 20:41:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5FF51410F39; Mon,  6 Jun 2022 20:41:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E26EC1410DDB
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBC511C08967
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:18 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-MMh26216Npy0gYXiLER62Q-1; Mon, 06 Jun 2022 16:41:17 -0400
X-MC-Unique: MMh26216Npy0gYXiLER62Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWx-00B19c-AH; Mon, 06 Jun 2022 20:40:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:40 +0100
Message-Id: <20220606204050.2625949-11-willy@infradead.org>
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
Subject: [Cluster-devel] [PATCH 10/20] btrfs: Convert btrfs_migratepage to
 migrate_folio
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use filemap_migrate_folio() to do the bulk of the work, and then copy
the ordered flag across if needed.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/btrfs/inode.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 81737eff92f3..5f41d869c648 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8255,30 +8255,24 @@ static bool btrfs_release_folio(struct folio *folio, gfp_t gfp_flags)
 }
 
 #ifdef CONFIG_MIGRATION
-static int btrfs_migratepage(struct address_space *mapping,
-			     struct page *newpage, struct page *page,
+static int btrfs_migrate_folio(struct address_space *mapping,
+			     struct folio *dst, struct folio *src,
 			     enum migrate_mode mode)
 {
-	int ret;
+	int ret = filemap_migrate_folio(mapping, dst, src, mode);
 
-	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
 	if (ret != MIGRATEPAGE_SUCCESS)
 		return ret;
 
-	if (page_has_private(page))
-		attach_page_private(newpage, detach_page_private(page));
-
-	if (PageOrdered(page)) {
-		ClearPageOrdered(page);
-		SetPageOrdered(newpage);
+	if (folio_test_ordered(src)) {
+		folio_clear_ordered(src);
+		folio_set_ordered(dst);
 	}
 
-	if (mode != MIGRATE_SYNC_NO_COPY)
-		migrate_page_copy(newpage, page);
-	else
-		migrate_page_states(newpage, page);
 	return MIGRATEPAGE_SUCCESS;
 }
+#else
+#define btrfs_migrate_folio NULL
 #endif
 
 static void btrfs_invalidate_folio(struct folio *folio, size_t offset,
@@ -11422,9 +11416,7 @@ static const struct address_space_operations btrfs_aops = {
 	.direct_IO	= noop_direct_IO,
 	.invalidate_folio = btrfs_invalidate_folio,
 	.release_folio	= btrfs_release_folio,
-#ifdef CONFIG_MIGRATION
-	.migratepage	= btrfs_migratepage,
-#endif
+	.migrate_folio	= btrfs_migrate_folio,
 	.dirty_folio	= filemap_dirty_folio,
 	.error_remove_page = generic_error_remove_page,
 	.swap_activate	= btrfs_swap_activate,
-- 
2.35.1

