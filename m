Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B382A705E03
	for <lists+cluster-devel@lfdr.de>; Wed, 17 May 2023 05:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684293902;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MTazUSmP60aFx31IVJaFu6OAEq842mbF5PpWY4mveic=;
	b=Nj75qbA0z2LUc6tkWuDvQ4t80hjMFw+OSIjsGVysCZHcS9Ol+qT368f48jBJ0v8CFP9MZD
	o00BB6oyksJm4f/Sf3FujVNnQJBmV4ygYOYvrik0MKk1l7cza3FLX5oG1HVexCGyN7AXrq
	ihBx+ez3Mfczk8SuxtIREv0E7d5uJGA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-J4KVoKGrNRCkza8K8r1fVA-1; Tue, 16 May 2023 23:24:57 -0400
X-MC-Unique: J4KVoKGrNRCkza8K8r1fVA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13B7D1C060D5;
	Wed, 17 May 2023 03:24:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9238E492C3F;
	Wed, 17 May 2023 03:24:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3421619465B2;
	Wed, 17 May 2023 03:24:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9AA3319465A4 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 17 May 2023 03:24:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 700884021CD; Wed, 17 May 2023 03:24:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68AA7492C3F
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:24:52 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 461871C060D4
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:24:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-356-doP95EoRMPK5oTZgMgBXEw-1; Tue,
 16 May 2023 23:24:49 -0400
X-MC-Unique: doP95EoRMPK5oTZgMgBXEw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pz7mN-004lN6-PH; Wed, 17 May 2023 03:24:43 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 17 May 2023 04:24:38 +0100
Message-Id: <20230517032442.1135379-3-willy@infradead.org>
In-Reply-To: <20230517032442.1135379-1-willy@infradead.org>
References: <20230517032442.1135379-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 2/6] gfs2: Pass a folio to
 __gfs2_jdata_write_folio()
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
Cc: Hannes Reinecke <hare@suse.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Remove a couple of folio->page conversions in the callers, and two
calls to compound_head() in the function itself.  Rename it from
__gfs2_jdata_writepage() to __gfs2_jdata_write_folio().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/gfs2/aops.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 0518861df783..749135252d52 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -113,30 +113,31 @@ static int gfs2_write_jdata_page(struct page *page,
 }
 
 /**
- * __gfs2_jdata_writepage - The core of jdata writepage
- * @page: The page to write
+ * __gfs2_jdata_write_folio - The core of jdata writepage
+ * @folio: The folio to write
  * @wbc: The writeback control
  *
  * This is shared between writepage and writepages and implements the
  * core of the writepage operation. If a transaction is required then
- * PageChecked will have been set and the transaction will have
+ * the checked flag will have been set and the transaction will have
  * already been started before this is called.
  */
-
-static int __gfs2_jdata_writepage(struct page *page, struct writeback_control *wbc)
+static int __gfs2_jdata_write_folio(struct folio *folio,
+		struct writeback_control *wbc)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
 
-	if (PageChecked(page)) {
-		ClearPageChecked(page);
-		if (!page_has_buffers(page)) {
-			create_empty_buffers(page, inode->i_sb->s_blocksize,
-					     BIT(BH_Dirty)|BIT(BH_Uptodate));
+	if (folio_test_checked(folio)) {
+		folio_clear_checked(folio);
+		if (!folio_buffers(folio)) {
+			folio_create_empty_buffers(folio,
+					inode->i_sb->s_blocksize,
+					BIT(BH_Dirty)|BIT(BH_Uptodate));
 		}
-		gfs2_trans_add_databufs(ip, page_folio(page), 0, PAGE_SIZE);
+		gfs2_trans_add_databufs(ip, folio, 0, folio_size(folio));
 	}
-	return gfs2_write_jdata_page(page, wbc);
+	return gfs2_write_jdata_page(&folio->page, wbc);
 }
 
 /**
@@ -159,7 +160,7 @@ static int gfs2_jdata_writepage(struct page *page, struct writeback_control *wbc
 		goto out;
 	if (folio_test_checked(folio) || current->journal_info)
 		goto out_ignore;
-	return __gfs2_jdata_writepage(&folio->page, wbc);
+	return __gfs2_jdata_write_folio(folio, wbc);
 
 out_ignore:
 	folio_redirty_for_writepage(wbc, folio);
@@ -256,7 +257,7 @@ static int gfs2_write_jdata_batch(struct address_space *mapping,
 
 		trace_wbc_writepage(wbc, inode_to_bdi(inode));
 
-		ret = __gfs2_jdata_writepage(&folio->page, wbc);
+		ret = __gfs2_jdata_write_folio(folio, wbc);
 		if (unlikely(ret)) {
 			if (ret == AOP_WRITEPAGE_ACTIVATE) {
 				folio_unlock(folio);
-- 
2.39.2

