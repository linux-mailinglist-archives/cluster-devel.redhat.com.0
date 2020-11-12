Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F294D2B0813
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Nov 2020 16:04:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605193459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EY6WJ/x3WOvoXPkE0CyJAPQKQnuZHCea233sQJBCPhI=;
	b=X/ScYy37XYyB3Tog+ilodWJTAg5OxHK0NYgdPoE2tYcCvOMQy7RkmALwqI+q+n0HaDQPTu
	plGzkIYvWG69ccrEmeTDoPCOATIYAB4/CK/X5lMQpquFxzeqpyqxL4Ia+qVRWwi762Q8Tq
	CStEvznTAJx5GmMo9XsTDi5jhrivyoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-p5eEOaRhOIm5jJLa71Rwug-1; Thu, 12 Nov 2020 10:04:16 -0500
X-MC-Unique: p5eEOaRhOIm5jJLa71Rwug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C71FD800688;
	Thu, 12 Nov 2020 15:04:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADF7C5C5DE;
	Thu, 12 Nov 2020 15:04:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A76B58103;
	Thu, 12 Nov 2020 15:04:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACEvmmf021295 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 09:57:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5880627BA5; Thu, 12 Nov 2020 14:57:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-10.phx2.redhat.com [10.3.113.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28EE927CCA
	for <cluster-devel@redhat.com>; Thu, 12 Nov 2020 14:57:48 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 12 Nov 2020 08:57:43 -0600
Message-Id: <20201112145743.376789-3-rpeterso@redhat.com>
In-Reply-To: <20201112145743.376789-1-rpeterso@redhat.com>
References: <20201112145743.376789-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/2] gfs2: Make special version of
	gfs2_get_block_noalloc for jdata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Patch b2a846dbef4ef54ef032f0f5ee188c609a0278a7 fixed cases in which
writes were attempted to blocks that had been freed by punch_hole in a jdata
file, but the blocks were still represented on the ail1 list.

It had an unfortunate side-effect of returning -ENODATA in cases that
were not jdata because it affected function gfs2_block_map which is used by
many other callers. This resulted in several xfstests test failures. For
example, generic/029 would fail with this error:

    +hexdump: /mnt/scratch/testfile: Input/output error
     00000000  58 58 58 58 58 58 58 58  58 58 58 58 58 58 58 58  |XXXXXXXXXXXXXXXX|

This patch creates a special version of gfs2_get_block_noalloc for
jdata which returns -ENODATA instead of -EIO for unmapped blocks.
This is a more targeted approach that doesn't break non-jdata cases.

Fixes: b2a846dbef4e ("gfs2: Ignore journal log writes for jdata holes")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 30 ++++++++++++++++++++++++++++--
 fs/gfs2/log.c  |  2 ++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 9cd2ecad07db..835c50e6a871 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -80,6 +80,32 @@ static int gfs2_get_block_noalloc(struct inode *inode, sector_t lblock,
 		return -EIO;
 	return 0;
 }
+/**
+ * get_jdata_block_noalloc - jdata version of gfs2_get_block_noalloc
+ * @inode: The inode
+ * @lblock: The block number to look up
+ * @bh_result: The buffer head to return the result in
+ * @create: Non-zero if we may add block to the file
+ *
+ * The reason we have a separate function for jdata is that jdata go through
+ * the journal, and we don't want jdata holes (left by punch_hole) to appear
+ * as IO errors. We can safely ignore them.
+ *
+ * Returns: errno
+ */
+static int get_jdata_block_noalloc(struct inode *inode, sector_t lblock,
+				      struct buffer_head *bh_result,
+				      int create)
+{
+	int error;
+
+	error = gfs2_block_map(inode, lblock, bh_result, 0);
+	if (error)
+		return error;
+	if (!buffer_mapped(bh_result))
+		return -ENODATA;
+	return 0;
+}
 
 /**
  * gfs2_writepage - Write page for writeback mappings
@@ -133,8 +159,8 @@ static int gfs2_write_jdata_page(struct page *page,
 	if (page->index == end_index && offset)
 		zero_user_segment(page, offset, PAGE_SIZE);
 
-	return __block_write_full_page(inode, page, gfs2_get_block_noalloc, wbc,
-				       end_buffer_async_write);
+	return __block_write_full_page(inode, page, get_jdata_block_noalloc,
+				       wbc, end_buffer_async_write);
 }
 
 /**
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 9133b3178677..2e9314091c81 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -132,6 +132,8 @@ __acquires(&sdp->sd_ail_lock)
 		spin_unlock(&sdp->sd_ail_lock);
 		ret = generic_writepages(mapping, wbc);
 		spin_lock(&sdp->sd_ail_lock);
+		if (ret == -ENODATA) /* if a jdata write into a new hole */
+			ret = 0; /* ignore it */
 		if (ret || wbc->nr_to_write <= 0)
 			break;
 		return -EBUSY;
-- 
2.26.2

