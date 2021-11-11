Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B77F44DA37
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Nov 2021 17:17:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636647461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xujJ/bq+SC+rezsEo80o3fydJSWpSL4LfjFJ7txhcyk=;
	b=CnKMYQzfqNDUDzTaM6Fz8mRIa9jJQZER8HX51Z377BRLZqVWhuWLG8vO2GczjSboxqW4UY
	ogaQr2ySYH+bBeResnZqL70EGpJHGwpw7dMD4Y9Xu5urLhqzaoepj7sI28bbHEuiYhgguj
	dBB/vsob3qBGIcQrJIFtfY0CNjnQfd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-ePi52pQkOq6VLwXzIKtbew-1; Thu, 11 Nov 2021 11:17:37 -0500
X-MC-Unique: ePi52pQkOq6VLwXzIKtbew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAF1C1006AA0;
	Thu, 11 Nov 2021 16:17:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9468818A50;
	Thu, 11 Nov 2021 16:17:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE73C1800FDD;
	Thu, 11 Nov 2021 16:17:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABGHOXv012300 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 11:17:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 470E713C8A; Thu, 11 Nov 2021 16:17:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7D3960854;
	Thu, 11 Nov 2021 16:17:15 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>, "Darrick J . Wong" <djwong@kernel.org>
Date: Thu, 11 Nov 2021 17:17:14 +0100
Message-Id: <20211111161714.584718-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, stable@vger.kernel.org
Subject: [Cluster-devel] [5.15 REGRESSION v2] iomap: Fix inline extent
	handling in iomap_readpage
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before commit 740499c78408 ("iomap: fix the iomap_readpage_actor return
value for inline data"), when hitting an IOMAP_INLINE extent,
iomap_readpage_actor would report having read the entire page.  Since
then, it only reports having read the inline data (iomap->length).

This will force iomap_readpage into another iteration, and the
filesystem will report an unaligned hole after the IOMAP_INLINE extent.
But iomap_readpage_actor (now iomap_readpage_iter) isn't prepared to
deal with unaligned extents, it will get things wrong on filesystems
with a block size smaller than the page size, and we'll eventually run
into the following warning in iomap_iter_advance:

  WARN_ON_ONCE(iter->processed > iomap_length(iter));

Fix that by changing iomap_readpage_iter to return 0 when hitting an
inline extent; this will cause iomap_iter to stop immediately.

To fix readahead as well, change iomap_readahead_iter to pass on
iomap_readpage_iter return values less than or equal to zero.

Fixes: 740499c78408 ("iomap: fix the iomap_readpage_actor return value for inline data")
Cc: stable@vger.kernel.org # v5.15+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 1753c26c8e76..fe10d8a30f6b 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -256,8 +256,13 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 	unsigned poff, plen;
 	sector_t sector;
 
-	if (iomap->type == IOMAP_INLINE)
-		return min(iomap_read_inline_data(iter, page), length);
+	if (iomap->type == IOMAP_INLINE) {
+		loff_t ret = iomap_read_inline_data(iter, page);
+
+		if (ret < 0)
+			return ret;
+		return 0;
+	}
 
 	/* zero post-eof blocks as the page may be mapped */
 	iop = iomap_page_create(iter->inode, page);
@@ -370,6 +375,8 @@ static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
 			ctx->cur_page_in_bio = false;
 		}
 		ret = iomap_readpage_iter(iter, ctx, done);
+		if (ret <= 0)
+			return ret;
 	}
 
 	return done;
-- 
2.31.1

