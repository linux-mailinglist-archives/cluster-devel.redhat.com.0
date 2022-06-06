Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 336BD53F032
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:30 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-y2DvO93DN-S_BqDTNtebLQ-1; Mon, 06 Jun 2022 16:41:28 -0400
X-MC-Unique: y2DvO93DN-S_BqDTNtebLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1916F38005E4;
	Mon,  6 Jun 2022 20:41:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D1821410F3B;
	Mon,  6 Jun 2022 20:41:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6EB9E19451EF;
	Mon,  6 Jun 2022 20:41:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2BD371947079 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 20:41:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1624B1415101; Mon,  6 Jun 2022 20:41:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1289D1415100
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0174811E81
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:24 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-WQM81ymgOr-5iNp0_OIVyg-1; Mon, 06 Jun 2022 16:41:03 -0400
X-MC-Unique: WQM81ymgOr-5iNp0_OIVyg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWy-00B19u-3f; Mon, 06 Jun 2022 20:40:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:49 +0100
Message-Id: <20220606204050.2625949-20-willy@infradead.org>
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
Subject: [Cluster-devel] [PATCH 19/20] fs: Remove aops->migratepage()
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

With all users converted to migrate_folio(), remove this operation.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/fs.h |  2 --
 mm/compaction.c    |  5 ++---
 mm/migrate.c       | 10 +---------
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5737c92ed286..95347cc035ae 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -367,8 +367,6 @@ struct address_space_operations {
 	 */
 	int (*migrate_folio)(struct address_space *, struct folio *dst,
 			struct folio *src, enum migrate_mode);
-	int (*migratepage) (struct address_space *,
-			struct page *, struct page *, enum migrate_mode);
 	bool (*isolate_page)(struct page *, isolate_mode_t);
 	void (*putback_page)(struct page *);
 	int (*launder_folio)(struct folio *);
diff --git a/mm/compaction.c b/mm/compaction.c
index db34b459e5d9..f0dc62159c0e 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1034,7 +1034,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 
 			/*
 			 * Only pages without mappings or that have a
-			 * ->migratepage callback are possible to migrate
+			 * ->migrate_folio callback are possible to migrate
 			 * without blocking. However, we can be racing with
 			 * truncation so it's necessary to lock the page
 			 * to stabilise the mapping as truncation holds
@@ -1046,8 +1046,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 
 			mapping = page_mapping(page);
 			migrate_dirty = !mapping ||
-					mapping->a_ops->migrate_folio ||
-					mapping->a_ops->migratepage;
+					mapping->a_ops->migrate_folio;
 			unlock_page(page);
 			if (!migrate_dirty)
 				goto isolate_fail_put;
diff --git a/mm/migrate.c b/mm/migrate.c
index a8edd226c72d..c5560430dce4 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -911,9 +911,6 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 			 */
 			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
 								mode);
-		else if (mapping->a_ops->migratepage)
-			rc = mapping->a_ops->migratepage(mapping, &dst->page,
-							&src->page, mode);
 		else
 			rc = fallback_migrate_folio(mapping, dst, src, mode);
 	} else {
@@ -928,12 +925,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 			goto out;
 		}
 
-		if (mapping->a_ops->migrate_folio)
-			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
-								mode);
-		else
-			rc = mapping->a_ops->migratepage(mapping, &dst->page,
-							&src->page, mode);
+		rc = mapping->a_ops->migrate_folio(mapping, dst, src, mode);
 		WARN_ON_ONCE(rc == MIGRATEPAGE_SUCCESS &&
 				!folio_test_isolated(src));
 	}
-- 
2.35.1

