Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A677822CDCB
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615601;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EMXQHnBOwona4Zv8X9kNVX5R1rczIyNxKPrpudOrh5E=;
	b=FeuNVYwBJyMdNl9xHx65ahfCE8Z4eIozJSPdk/u7aq6pLcj/BR/eN8kz3sxXpiawgrhco9
	oasonL/0Bc6W1ya+FfpKWzdb8N7BxYlr2RTTW4zT75+8JYJonhVtd+5+1UlbfUmmYVVWHB
	g3LVCkKUZLGPQ+teummckVMQo4kxGLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-4KiXTAFcN5KLDSND763yXA-1; Fri, 24 Jul 2020 14:33:19 -0400
X-MC-Unique: 4KiXTAFcN5KLDSND763yXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BEE88017FB;
	Fri, 24 Jul 2020 18:33:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B10951C4F;
	Fri, 24 Jul 2020 18:33:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0FEC1809557;
	Fri, 24 Jul 2020 18:33:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXBPA016265 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1529C6FEFE; Fri, 24 Jul 2020 18:33:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA4D1709E4
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:10 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:32:54 -0500
Message-Id: <20200724183304.366913-2-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 01/11] gfs2: inline
	gfs2_write_jdata_pagevec into gfs2_write_cache_jdata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch inlines function gfs2_write_jdata_pagevec() into function
gfs2_write_cache_jdata(). Since gfs2_write_cache_jdata() is a gfs2-specific
copy of write_cache_pages(), we should preserve the structure and logic
of write_cache_pages() so upstream changes can be more easily ported
without all the hokey "ret = 1...if (ret > 0) ret = 0" kludge and
obfuscated logic.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 185 ++++++++++++++++++++++---------------------------
 1 file changed, 84 insertions(+), 101 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 68cd700a2719..d6f471cbd62b 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -222,102 +222,6 @@ static int gfs2_writepages(struct address_space *mapping,
 	return ret;
 }
 
-/**
- * gfs2_write_jdata_pagevec - Write back a pagevec's worth of pages
- * @mapping: The mapping
- * @wbc: The writeback control
- * @pvec: The vector of pages
- * @nr_pages: The number of pages to write
- * @done_index: Page index
- *
- * Returns: non-zero if loop should terminate, zero otherwise
- */
-
-static int gfs2_write_jdata_pagevec(struct address_space *mapping,
-				    struct writeback_control *wbc,
-				    struct pagevec *pvec,
-				    int nr_pages,
-				    pgoff_t *done_index)
-{
-	struct inode *inode = mapping->host;
-	struct gfs2_sbd *sdp = GFS2_SB(inode);
-	unsigned nrblocks = nr_pages * (PAGE_SIZE >> inode->i_blkbits);
-	int i;
-	int ret;
-
-	ret = gfs2_trans_begin(sdp, nrblocks, nrblocks);
-	if (ret < 0)
-		return ret;
-
-	for(i = 0; i < nr_pages; i++) {
-		struct page *page = pvec->pages[i];
-
-		*done_index = page->index;
-
-		lock_page(page);
-
-		if (unlikely(page->mapping != mapping)) {
-continue_unlock:
-			unlock_page(page);
-			continue;
-		}
-
-		if (!PageDirty(page)) {
-			/* someone wrote it for us */
-			goto continue_unlock;
-		}
-
-		if (PageWriteback(page)) {
-			if (wbc->sync_mode != WB_SYNC_NONE)
-				wait_on_page_writeback(page);
-			else
-				goto continue_unlock;
-		}
-
-		BUG_ON(PageWriteback(page));
-		if (!clear_page_dirty_for_io(page))
-			goto continue_unlock;
-
-		trace_wbc_writepage(wbc, inode_to_bdi(inode));
-
-		ret = __gfs2_jdata_writepage(page, wbc);
-		if (unlikely(ret)) {
-			if (ret == AOP_WRITEPAGE_ACTIVATE) {
-				unlock_page(page);
-				ret = 0;
-			} else {
-
-				/*
-				 * done_index is set past this page,
-				 * so media errors will not choke
-				 * background writeout for the entire
-				 * file. This has consequences for
-				 * range_cyclic semantics (ie. it may
-				 * not be suitable for data integrity
-				 * writeout).
-				 */
-				*done_index = page->index + 1;
-				ret = 1;
-				break;
-			}
-		}
-
-		/*
-		 * We stop writing back only if we are not doing
-		 * integrity sync. In case of integrity sync we have to
-		 * keep going until we have written all the pages
-		 * we tagged for writeback prior to entering this loop.
-		 */
-		if (--wbc->nr_to_write <= 0 && wbc->sync_mode == WB_SYNC_NONE) {
-			ret = 1;
-			break;
-		}
-
-	}
-	gfs2_trans_end(sdp);
-	return ret;
-}
-
 /**
  * gfs2_write_cache_jdata - Like write_cache_pages but different
  * @mapping: The mapping to write
@@ -331,6 +235,8 @@ static int gfs2_write_jdata_pagevec(struct address_space *mapping,
 static int gfs2_write_cache_jdata(struct address_space *mapping,
 				  struct writeback_control *wbc)
 {
+	struct inode *inode = mapping->host;
+	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	int ret = 0;
 	int done = 0;
 	struct pagevec pvec;
@@ -369,16 +275,93 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && (index <= end)) {
+		int i;
+		unsigned nrblocks;
+
 		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
 				tag);
 		if (nr_pages == 0)
 			break;
 
-		ret = gfs2_write_jdata_pagevec(mapping, wbc, &pvec, nr_pages, &done_index);
-		if (ret)
-			done = 1;
-		if (ret > 0)
-			ret = 0;
+		nrblocks = nr_pages * (PAGE_SIZE >> inode->i_blkbits);
+		ret = gfs2_trans_begin(sdp, nrblocks, nrblocks);
+		if (ret < 0)
+			break;
+
+		for (i = 0; i < nr_pages; i++) {
+			struct page *page = pvec.pages[i];
+
+			done_index = page->index;
+
+			lock_page(page);
+
+			/*
+			 * Page truncated or invalidated. We can freely skip it
+			 * then, even for data integrity operations: the page
+			 * has disappeared concurrently, so there could be no
+			 * real expectation of this data interity operation
+			 * even if there is now a new, dirty page at the same
+			 * pagecache address.
+			 */
+			if (unlikely(page->mapping != mapping)) {
+continue_unlock:
+				unlock_page(page);
+				continue;
+			}
+
+			if (!PageDirty(page)) {
+				/* someone wrote it for us */
+				goto continue_unlock;
+			}
+
+			if (PageWriteback(page)) {
+				if (wbc->sync_mode != WB_SYNC_NONE)
+					wait_on_page_writeback(page);
+				else
+					goto continue_unlock;
+			}
+
+			BUG_ON(PageWriteback(page));
+			if (!clear_page_dirty_for_io(page))
+				goto continue_unlock;
+
+			trace_wbc_writepage(wbc, inode_to_bdi(inode));
+			ret = __gfs2_jdata_writepage(page, wbc);
+			if (unlikely(ret)) {
+				if (ret == AOP_WRITEPAGE_ACTIVATE) {
+					unlock_page(page);
+					ret = 0;
+				} else {
+					/*
+					 * done_index is set past this page,
+					 * so media errors will not choke
+					 * background writeout for the entire
+					 * file. This has consequences for
+					 * range_cyclic semantics (ie. it may
+					 * not be suitable for data integrity
+					 * writeout).
+					 */
+					done_index = page->index + 1;
+					done = 1;
+					break;
+				}
+			}
+
+			/*
+			 * We stop writing back only if we are not doing
+			 * integrity sync. In case of integrity sync we have to
+			 * keep going until we have written all the pages
+			 * we tagged for writeback prior to entering this loop.
+			 */
+			if (--wbc->nr_to_write <= 0 &&
+			    wbc->sync_mode == WB_SYNC_NONE) {
+				done = 1;
+				break;
+			}
+
+		}
+		gfs2_trans_end(sdp);
+
 		pagevec_release(&pvec);
 		cond_resched();
 	}
-- 
2.26.2

