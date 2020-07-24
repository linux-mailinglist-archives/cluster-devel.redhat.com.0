Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DB68522CDD0
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PzbEG/QoA06DFxUJW5Xre63CiVMBkZ1pnSx7Q48X5yE=;
	b=BApuJ6a548goMqShFYOQJ86aMyOgdD84/s03lC8LeLb7seQURGzwpzMOnaWsVXvJCOmW/f
	sCqPthcdVhl3ZSO1vjMQj4moULt4kG47EHsNPlTSMZo7WCp52NSmdtHUbYNp7WKGyH/SYz
	jCEu6UyZ1aNMT7+l8qZQUskXN5wUWR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-T4_YfX-PP4OlzANTEOEocw-1; Fri, 24 Jul 2020 14:33:21 -0400
X-MC-Unique: T4_YfX-PP4OlzANTEOEocw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B25F100A61F;
	Fri, 24 Jul 2020 18:33:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFAB95D9F7;
	Fri, 24 Jul 2020 18:33:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABF8B1809561;
	Fri, 24 Jul 2020 18:33:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXC7k016293 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BAEF6FEFE; Fri, 24 Jul 2020 18:33:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9D4709E4
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:32:59 -0500
Message-Id: <20200724183304.366913-7-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 06/11] gfs2: rename
	gfs2_write_full_page to gfs2_write_jdata_page, remove parm
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Since the function is only used for writing jdata pages, this patch
simply renames function gfs2_write_full_page to a more appropriate
name: gfs2_write_jdata_page. This makes the code easier to understand.

The function was only called in one place, which passed in a pointer to
function gfs2_get_block_noalloc. The function doesn't need to be
passed in. Therefore, this also eliminates the unnecessary parameter
to increase efficiency.

I also took the liberty of cleaning up the function comments.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index aedc9fbf6ac7..e548b54d4139 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -115,11 +115,16 @@ static int gfs2_writepage(struct page *page, struct writeback_control *wbc)
 	return 0;
 }
 
-/* This is the same as calling block_write_full_page, but it also
+/**
+ * gfs2_write_jdata_page - gfs2 jdata-specific version of block_write_full_page
+ * @page: The page to write
+ * @wbc: The writeback control
+ *
+ * This is the same as calling block_write_full_page, but it also
  * writes pages outside of i_size
  */
-static int gfs2_write_full_page(struct page *page, get_block_t *get_block,
-				struct writeback_control *wbc)
+static int gfs2_write_jdata_page(struct page *page,
+				 struct writeback_control *wbc)
 {
 	struct inode * const inode = page->mapping->host;
 	loff_t i_size = i_size_read(inode);
@@ -137,7 +142,7 @@ static int gfs2_write_full_page(struct page *page, get_block_t *get_block,
 	if (page->index == end_index && offset)
 		zero_user_segment(page, offset, PAGE_SIZE);
 
-	return __block_write_full_page(inode, page, get_block, wbc,
+	return __block_write_full_page(inode, page, gfs2_get_block_noalloc, wbc,
 				       end_buffer_async_write);
 }
 
@@ -181,7 +186,7 @@ static int __gfs2_jdata_writepage(struct page *page, struct writeback_control *w
 				     BIT(BH_Dirty)|BIT(BH_Uptodate));
 	}
 write:
-	return gfs2_write_full_page(page, gfs2_get_block_noalloc, wbc);
+	return gfs2_write_jdata_page(page, wbc);
 }
 
 /**
-- 
2.26.2

