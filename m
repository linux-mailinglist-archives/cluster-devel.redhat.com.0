Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5E63C24DE84
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NPs5+sfkI3Hocb01Q1rt4ZJxb6MiP2fJ87BKGs4e2xw=;
	b=CfjbGPj4NQkVMTo08uygognRI1Kc4kjXjzUsiztpw+607wtFIvjRpQDpxU2Sb7+9CF2dPQ
	dChjTSAPOu5V2gYeDuSffh8WZFfh6NbjZydGApbyUixi9p62hISFbeL9anoAuRzvbDE5Jk
	cLrqOJX3puJLvwDK4Ns9+TrFUNLBujA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-Y-Z-lTiaMPOpIZir7i_YOg-1; Fri, 21 Aug 2020 13:33:55 -0400
X-MC-Unique: Y-Z-lTiaMPOpIZir7i_YOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DF4F1005E74;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16E785C1D0;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2222E85CD;
	Fri, 21 Aug 2020 17:33:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXfZS028370 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF1F85DA75; Fri, 21 Aug 2020 17:33:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AE555DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:26 -0500
Message-Id: <20200821173337.20377-2-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 01/12] gfs2: rename
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
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
index 68cd700a2719..faf58c40485a 100644
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
 
@@ -166,7 +171,7 @@ static int __gfs2_jdata_writepage(struct page *page, struct writeback_control *w
 		}
 		gfs2_page_add_databufs(ip, page, 0, sdp->sd_vfs->s_blocksize);
 	}
-	return gfs2_write_full_page(page, gfs2_get_block_noalloc, wbc);
+	return gfs2_write_jdata_page(page, wbc);
 }
 
 /**
-- 
2.26.2

