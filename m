Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0B9543771
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jun 2022 17:34:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-VnsVZk0cNP2Atty8bqF-Ww-1; Wed, 08 Jun 2022 11:34:01 -0400
X-MC-Unique: VnsVZk0cNP2Atty8bqF-Ww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5AE029DD9A4;
	Wed,  8 Jun 2022 15:34:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D651B2166B29;
	Wed,  8 Jun 2022 15:34:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B94601947051;
	Wed,  8 Jun 2022 15:34:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 35204194704A for <cluster-devel@listman.corp.redhat.com>;
 Wed,  8 Jun 2022 15:03:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11C2440CFD0B; Wed,  8 Jun 2022 15:03:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DF6240CF8E8
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 15:03:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E44A23C0F728
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 15:03:16 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-cHwzZzlfOemxXfdHOljgGg-1; Wed, 08 Jun 2022 11:03:15 -0400
X-MC-Unique: cHwzZzlfOemxXfdHOljgGg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyxCv-00CjFi-3n; Wed, 08 Jun 2022 15:02:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  8 Jun 2022 16:02:45 +0100
Message-Id: <20220608150249.3033815-16-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH v2 15/19] aio: Convert to migrate_folio
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use a folio throughout this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/aio.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index 3c249b938632..a1911e86859c 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -400,8 +400,8 @@ static const struct file_operations aio_ring_fops = {
 };
 
 #if IS_ENABLED(CONFIG_MIGRATION)
-static int aio_migratepage(struct address_space *mapping, struct page *new,
-			struct page *old, enum migrate_mode mode)
+static int aio_migrate_folio(struct address_space *mapping, struct folio *dst,
+			struct folio *src, enum migrate_mode mode)
 {
 	struct kioctx *ctx;
 	unsigned long flags;
@@ -435,10 +435,10 @@ static int aio_migratepage(struct address_space *mapping, struct page *new,
 		goto out;
 	}
 
-	idx = old->index;
+	idx = src->index;
 	if (idx < (pgoff_t)ctx->nr_pages) {
-		/* Make sure the old page hasn't already been changed */
-		if (ctx->ring_pages[idx] != old)
+		/* Make sure the old folio hasn't already been changed */
+		if (ctx->ring_pages[idx] != &src->page)
 			rc = -EAGAIN;
 	} else
 		rc = -EINVAL;
@@ -447,27 +447,27 @@ static int aio_migratepage(struct address_space *mapping, struct page *new,
 		goto out_unlock;
 
 	/* Writeback must be complete */
-	BUG_ON(PageWriteback(old));
-	get_page(new);
+	BUG_ON(folio_test_writeback(src));
+	folio_get(dst);
 
-	rc = migrate_page_move_mapping(mapping, new, old, 1);
+	rc = folio_migrate_mapping(mapping, dst, src, 1);
 	if (rc != MIGRATEPAGE_SUCCESS) {
-		put_page(new);
+		folio_put(dst);
 		goto out_unlock;
 	}
 
 	/* Take completion_lock to prevent other writes to the ring buffer
-	 * while the old page is copied to the new.  This prevents new
+	 * while the old folio is copied to the new.  This prevents new
 	 * events from being lost.
 	 */
 	spin_lock_irqsave(&ctx->completion_lock, flags);
-	migrate_page_copy(new, old);
-	BUG_ON(ctx->ring_pages[idx] != old);
-	ctx->ring_pages[idx] = new;
+	folio_migrate_copy(dst, src);
+	BUG_ON(ctx->ring_pages[idx] != &src->page);
+	ctx->ring_pages[idx] = &dst->page;
 	spin_unlock_irqrestore(&ctx->completion_lock, flags);
 
-	/* The old page is no longer accessible. */
-	put_page(old);
+	/* The old folio is no longer accessible. */
+	folio_put(src);
 
 out_unlock:
 	mutex_unlock(&ctx->ring_lock);
@@ -475,13 +475,13 @@ static int aio_migratepage(struct address_space *mapping, struct page *new,
 	spin_unlock(&mapping->private_lock);
 	return rc;
 }
+#else
+#define aio_migrate_folio NULL
 #endif
 
 static const struct address_space_operations aio_ctx_aops = {
 	.dirty_folio	= noop_dirty_folio,
-#if IS_ENABLED(CONFIG_MIGRATION)
-	.migratepage	= aio_migratepage,
-#endif
+	.migrate_folio	= aio_migrate_folio,
 };
 
 static int aio_setup_ring(struct kioctx *ctx, unsigned int nr_events)
-- 
2.35.1

