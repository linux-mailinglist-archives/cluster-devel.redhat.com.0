Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3272D149
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 23:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686603722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QVNnWFXK6jFzHkA+IkFF3lxJNeiQVfoJXZ8J7ElSc1A=;
	b=gs22tp5HATSQzzS9uS1WrmxG9hiMf1ZWzKdyBcKbOjHnZhhVDlPxsD1nBL7t1Lff8OUnDj
	38PilsGuuOiZrx4YcNCiKypcbFTMYARcff+LQXKEF00o8OM9TBc53hBsMu3D5Oe4MKSBSY
	Iw2ArKaGchDDBFPyCBCv4BYNtJY1AwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-3FYRgYCEOpWO1SHF5LvmdA-1; Mon, 12 Jun 2023 17:02:01 -0400
X-MC-Unique: 3FYRgYCEOpWO1SHF5LvmdA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CDD01019C88;
	Mon, 12 Jun 2023 21:01:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6A83492C38;
	Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C0C71946A42;
	Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C953D194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:01:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 808682166B26; Mon, 12 Jun 2023 21:01:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77E432166B25
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A8163803522
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:47 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-GwlNIcH0O3OxsCWoM341Aw-1; Mon,
 12 Jun 2023 17:01:45 -0400
X-MC-Unique: GwlNIcH0O3OxsCWoM341Aw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q8ofX-0033wi-3h; Mon, 12 Jun 2023 21:01:43 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jun 2023 22:01:30 +0100
Message-Id: <20230612210141.730128-4-willy@infradead.org>
In-Reply-To: <20230612210141.730128-1-willy@infradead.org>
References: <20230612210141.730128-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v3 03/14] gfs2: Convert
 gfs2_write_jdata_page() to gfs2_write_jdata_folio()
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
 Luis Chamberlain <mcgrof@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add support for large folios and remove some accesses to page->mapping
and page->index.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Tested-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 749135252d52..ec5b5c1ea634 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -82,33 +82,33 @@ static int gfs2_get_block_noalloc(struct inode *inode, sector_t lblock,
 }
 
 /**
- * gfs2_write_jdata_page - gfs2 jdata-specific version of block_write_full_page
- * @page: The page to write
+ * gfs2_write_jdata_folio - gfs2 jdata-specific version of block_write_full_page
+ * @folio: The folio to write
  * @wbc: The writeback control
  *
  * This is the same as calling block_write_full_page, but it also
  * writes pages outside of i_size
  */
-static int gfs2_write_jdata_page(struct page *page,
+static int gfs2_write_jdata_folio(struct folio *folio,
 				 struct writeback_control *wbc)
 {
-	struct inode * const inode = page->mapping->host;
+	struct inode * const inode = folio->mapping->host;
 	loff_t i_size = i_size_read(inode);
-	const pgoff_t end_index = i_size >> PAGE_SHIFT;
-	unsigned offset;
 
 	/*
-	 * The page straddles i_size.  It must be zeroed out on each and every
+	 * The folio straddles i_size.  It must be zeroed out on each and every
 	 * writepage invocation because it may be mmapped.  "A file is mapped
 	 * in multiples of the page size.  For a file that is not a multiple of
-	 * the  page size, the remaining memory is zeroed when mapped, and
+	 * the page size, the remaining memory is zeroed when mapped, and
 	 * writes to that region are not written out to the file."
 	 */
-	offset = i_size & (PAGE_SIZE - 1);
-	if (page->index == end_index && offset)
-		zero_user_segment(page, offset, PAGE_SIZE);
+	if (folio_pos(folio) < i_size &&
+	    i_size < folio_pos(folio) + folio_size(folio))
+		folio_zero_segment(folio, offset_in_folio(folio, i_size),
+				folio_size(folio));
 
-	return __block_write_full_page(inode, page, gfs2_get_block_noalloc, wbc,
+	return __block_write_full_page(inode, &folio->page,
+				       gfs2_get_block_noalloc, wbc,
 				       end_buffer_async_write);
 }
 
@@ -137,7 +137,7 @@ static int __gfs2_jdata_write_folio(struct folio *folio,
 		}
 		gfs2_trans_add_databufs(ip, folio, 0, folio_size(folio));
 	}
-	return gfs2_write_jdata_page(&folio->page, wbc);
+	return gfs2_write_jdata_folio(folio, wbc);
 }
 
 /**
-- 
2.39.2

