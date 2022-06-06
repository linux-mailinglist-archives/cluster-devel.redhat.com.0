Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3B53F011
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:14 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-EEExp4IpOumJW-TxYFjnNw-1; Mon, 06 Jun 2022 16:41:09 -0400
X-MC-Unique: EEExp4IpOumJW-TxYFjnNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 596641C08965;
	Mon,  6 Jun 2022 20:41:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A81440EC002;
	Mon,  6 Jun 2022 20:41:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 27A83194707B;
	Mon,  6 Jun 2022 20:41:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D933E194706E for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 20:41:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C9AA91415100; Mon,  6 Jun 2022 20:41:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5EDE1410F39
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AECB33C0F720
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:04 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-XP_74OxLOWC1RqzkvUF2Kg-1; Mon, 06 Jun 2022 16:41:02 -0400
X-MC-Unique: XP_74OxLOWC1RqzkvUF2Kg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWw-00B19O-PM; Mon, 06 Jun 2022 20:40:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:33 +0100
Message-Id: <20220606204050.2625949-4-willy@infradead.org>
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
Subject: [Cluster-devel] [PATCH 03/20] mm/migrate: Convert writeout() to
 take a folio
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

Use a folio throughout this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/migrate.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index d772ce63d7e2..f19246c12fe9 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -762,11 +762,10 @@ int buffer_migrate_page_norefs(struct address_space *mapping,
 #endif
 
 /*
- * Writeback a page to clean the dirty state
+ * Writeback a folio to clean the dirty state
  */
-static int writeout(struct address_space *mapping, struct page *page)
+static int writeout(struct address_space *mapping, struct folio *folio)
 {
-	struct folio *folio = page_folio(page);
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_NONE,
 		.nr_to_write = 1,
@@ -780,25 +779,25 @@ static int writeout(struct address_space *mapping, struct page *page)
 		/* No write method for the address space */
 		return -EINVAL;
 
-	if (!clear_page_dirty_for_io(page))
+	if (!folio_clear_dirty_for_io(folio))
 		/* Someone else already triggered a write */
 		return -EAGAIN;
 
 	/*
-	 * A dirty page may imply that the underlying filesystem has
-	 * the page on some queue. So the page must be clean for
-	 * migration. Writeout may mean we loose the lock and the
-	 * page state is no longer what we checked for earlier.
+	 * A dirty folio may imply that the underlying filesystem has
+	 * the folio on some queue. So the folio must be clean for
+	 * migration. Writeout may mean we lose the lock and the
+	 * folio state is no longer what we checked for earlier.
 	 * At this point we know that the migration attempt cannot
 	 * be successful.
 	 */
 	remove_migration_ptes(folio, folio, false);
 
-	rc = mapping->a_ops->writepage(page, &wbc);
+	rc = mapping->a_ops->writepage(&folio->page, &wbc);
 
 	if (rc != AOP_WRITEPAGE_ACTIVATE)
 		/* unlocked. Relock */
-		lock_page(page);
+		folio_lock(folio);
 
 	return (rc < 0) ? -EIO : -EAGAIN;
 }
@@ -818,7 +817,7 @@ static int fallback_migrate_folio(struct address_space *mapping,
 		default:
 			return -EBUSY;
 		}
-		return writeout(mapping, &src->page);
+		return writeout(mapping, src);
 	}
 
 	/*
-- 
2.35.1

