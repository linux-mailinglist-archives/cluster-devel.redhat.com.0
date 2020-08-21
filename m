Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8C024DE8F
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tD5VP39/4f4QKxcwebRcT89by7/A3cibktQi7U3yl4o=;
	b=bbfWi3KV29cHi3TlEABGvklwj0L3EMAhZq4COGtlhI1dKGyajJ5X8xOfK74E1PQDA2t3eI
	bXiq/I7c0G9M9U4BwX/7u/2Iw9W8ti1SEoxy/mBLaeZ55JEt/9QnG9MjD9hslYugW0wjW4
	rOshgVckq4E0KN7t/30fOliMgYXJ4mQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-TfnnHHVIMGGAeoceC-rA-w-1; Fri, 21 Aug 2020 13:33:58 -0400
X-MC-Unique: TfnnHHVIMGGAeoceC-rA-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58F5A81F03E;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 486805DA74;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 333AC181A894;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXjge028443 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C3495DA75; Fri, 21 Aug 2020 17:33:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC8A55DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:44 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:36 -0500
Message-Id: <20200821173337.20377-12-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 11/12] gfs2: Ignore journal log writes
	for jdata holes
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Before this patch, when flushing out its ail1 list, gfs2_write_jdata_page
called __block_write_full_page passing in function gfs2_get_block_noalloc.
But there was a problem when a process wrote to a jdata file, then
truncated it or punched a hole, leaving references to the blocks within
the new hole in its ail list, which are to be written to the journal log.

In writing them to the journal, after calling gfs2_block_map, function
gfs2_get_block_noalloc, determined that the (hole-punched) block was not
mapped, so it returned -EIO to generic_writepages, which passed it back
to gfs2_ail1_start_one. This, in turn, performed a withdraw, assuming
there was a real IO error writing to the journal.

This might be a valid error when writing metadata to the journal, but for
journaled data writes, it does not warrant with withdraw.

This patch makes a separate function gfs2_get_jblock_noalloc which checks
for this situation and makes an exception for journaled data writes that
correspond to jdata holes. Other errors are returned as before.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 27 +++++++++++++++++++++++++--
 fs/gfs2/bmap.c |  8 ++++++--
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 9b2e927e6535..b2ab0077e150 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -81,6 +81,29 @@ static int gfs2_get_block_noalloc(struct inode *inode, sector_t lblock,
 	return 0;
 }
 
+/**
+ * gfs2_get_jblock_noalloc - Fills in a buffer head with details about a block
+ * @inode: The inode
+ * @lblock: The block number to look up
+ * @bh_result: The buffer head to return the result in
+ * @create: Non-zero if we may add block to the file
+ *
+ * Returns: errno
+ */
+
+static int gfs2_get_jblock_noalloc(struct inode *inode, sector_t lblock,
+				   struct buffer_head *bh_result, int create)
+{
+	int error;
+
+	error = gfs2_block_map(inode, lblock, bh_result, 0);
+	if (error)
+		return error;
+	if (!buffer_mapped(bh_result))
+		return -EIO;
+	return 0;
+}
+
 /**
  * gfs2_writepage - Write page for writeback mappings
  * @page: The page
@@ -142,8 +165,8 @@ static int gfs2_write_jdata_page(struct page *page,
 	if (page->index == end_index && offset)
 		zero_user_segment(page, offset, PAGE_SIZE);
 
-	return __block_write_full_page(inode, page, gfs2_get_block_noalloc, wbc,
-				       end_buffer_async_write);
+	return __block_write_full_page(inode, page, gfs2_get_jblock_noalloc,
+				      wbc, end_buffer_async_write);
 }
 
 /**
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 67aff327bf38..2e3b121fb78b 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1300,8 +1300,12 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
 	trace_gfs2_bmap(ip, bh_map, lblock, create, 1);
 
 	ret = gfs2_iomap_get(inode, pos, length, flags, &iomap, &mp);
-	if (create && !ret && iomap.type == IOMAP_HOLE)
-		ret = gfs2_iomap_alloc(inode, &iomap, &mp);
+	if (!ret && iomap.type == IOMAP_HOLE) {
+		if (create)
+			ret = gfs2_iomap_alloc(inode, &iomap, &mp);
+		else
+			ret = -ENODATA;
+	}
 	release_metapath(&mp);
 	if (ret)
 		goto out;
-- 
2.26.2

