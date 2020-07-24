Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E333622CDD6
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615784;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jFptDT+gmhKCU3AIn9astP1IbS7nsFzWlFx7IsSv198=;
	b=Dck6NpEgigYhxSh9LHAG28PKUgn4i7rHJMq3queMK5J1SW6MNBubw+AVyBbWAy4q4S1Qd/
	HQDCjQKGMojBLou3Xmdmvqjkow96v1POuoF/b7Ph6iAaV0SSYdei1mLIHu8v4q1bI77N7i
	OiNiAPvt+T3Rsqe93YjgLoGW25B/jdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-W08l0EyWO2mVQ--Vt0QodQ-1; Fri, 24 Jul 2020 14:36:22 -0400
X-MC-Unique: W08l0EyWO2mVQ--Vt0QodQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F382C19200C0;
	Fri, 24 Jul 2020 18:36:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E14E12DE79;
	Fri, 24 Jul 2020 18:36:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBED2A3596;
	Fri, 24 Jul 2020 18:36:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXCfx016302 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E75AA70599; Fri, 24 Jul 2020 18:33:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B87936FEFE
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:33:00 -0500
Message-Id: <20200724183304.366913-8-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 07/11] gfs2: Add a new jdata-specific
	version of gfs2_get_block_noalloc
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch creates a new function, gfs2_get_jblk_noalloc, similar to
gfs2_get_block_noalloc, which doesn't complain about unmapped blocks.

This is due to situations in which jdata pages are queued to the ail1
list but haven't been written back, but afterward, they're deleted
by a punch_hole or truncate operation. This resulted in a calling
sequence that looks like this:

gfs2_ail1_start
   gfs2_ail1_flush - for every tr on the sd_ail1_list:
      gfs2_ail1_start_one - for every bd on the tr's tr_ail1_list:
         generic_writepages
            write_cache_pages passing __writepage()
               __writepage() calls:
                  mapping->a_ops->writepage AKA gfs2_jdata_writepage:
                     __gfs2_jdata_writepage calls gfs2_write_jdata_page
                        gfs2_get_jblk_noalloc (was gfs2_get_block_noalloc)
                           gfs2_block_map - finds unmapped jdata page

If we return -EIO like gfs2_get_block_noalloc, we error out and withdraw
from gfs2_ail1_start_one. With this jdata-specific version, we simply
assume the error is due to the page being truncated and ignore the error,
which allows the ail1 write operation to finish successfully, writing out
the jdata pages it can.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index e548b54d4139..c94521de838a 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -115,6 +115,27 @@ static int gfs2_writepage(struct page *page, struct writeback_control *wbc)
 	return 0;
 }
 
+/**
+ * gfs2_get_jblk_noalloc - Fills in a buffer head with details about a block
+ * @inode: The inode
+ * @lblock: The block number to look up
+ * @bh_result: The buffer head to return the result in
+ * @create: Non-zero if we may add block to the file
+ *
+ * This is a jdata-specific version of gfs2_get_block_noalloc. The difference
+ * is: This is called when the ail1 list is being written for jdata pages,
+ * which means we don't want to throw a -EIO error when they are not mapped,
+ * which can happen when jdata pages are deleted by punch_hold operations.
+ *
+ * Returns: errno
+ */
+
+static int gfs2_get_jblk_noalloc(struct inode *inode, sector_t lblock,
+				 struct buffer_head *bh_result, int create)
+{
+	return gfs2_block_map(inode, lblock, bh_result, 0);
+}
+
 /**
  * gfs2_write_jdata_page - gfs2 jdata-specific version of block_write_full_page
  * @page: The page to write
@@ -142,7 +163,7 @@ static int gfs2_write_jdata_page(struct page *page,
 	if (page->index == end_index && offset)
 		zero_user_segment(page, offset, PAGE_SIZE);
 
-	return __block_write_full_page(inode, page, gfs2_get_block_noalloc, wbc,
+	return __block_write_full_page(inode, page, gfs2_get_jblk_noalloc, wbc,
 				       end_buffer_async_write);
 }
 
-- 
2.26.2

