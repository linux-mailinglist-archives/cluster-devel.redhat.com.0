Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D7D253CD23E
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 12:51:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-yfAyJkOUMoaIeepHdrE0Rw-1; Mon, 19 Jul 2021 06:51:27 -0400
X-MC-Unique: yfAyJkOUMoaIeepHdrE0Rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFD22102C855;
	Mon, 19 Jul 2021 10:51:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A001760CA0;
	Mon, 19 Jul 2021 10:51:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6453C4EA2A;
	Mon, 19 Jul 2021 10:51:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JAp5xA007794 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 06:51:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A513C2156A5F; Mon, 19 Jul 2021 10:51:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FBEC2156A5A
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 10:50:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0CCF805A30
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 10:50:59 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-196-xV6Ozxr5PnOppMKyjGPXbw-1; Mon, 19 Jul 2021 06:50:57 -0400
X-MC-Unique: xV6Ozxr5PnOppMKyjGPXbw-1
Received: from [2001:4bb8:193:7660:d2a4:8d57:2e55:21d0] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5QoF-006lGP-BC; Mon, 19 Jul 2021 10:48:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 19 Jul 2021 12:35:04 +0200
Message-Id: <20210719103520.495450-12-hch@lst.de>
In-Reply-To: <20210719103520.495450-1-hch@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 11/27] iomap: switch iomap_file_unshare to
	use iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Switch iomap_file_unshare to use iomap_iter.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 7195e82d15775e..59781c72c278e5 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -806,10 +806,12 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 }
 EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
 
-static loff_t
-iomap_unshare_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
-		struct iomap *iomap, struct iomap *srcmap)
+static loff_t iomap_unshare_iter(struct iomap_iter *iter)
 {
+	struct iomap *iomap = &iter->iomap;
+	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	loff_t pos = iter->pos;
+	loff_t length = iomap_length(iter);
 	long status = 0;
 	loff_t written = 0;
 
@@ -825,12 +827,12 @@ iomap_unshare_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		unsigned long bytes = min_t(loff_t, PAGE_SIZE - offset, length);
 		struct page *page;
 
-		status = iomap_write_begin(inode, pos, bytes,
+		status = iomap_write_begin(iter->inode, pos, bytes,
 				IOMAP_WRITE_F_UNSHARE, &page, iomap, srcmap);
 		if (unlikely(status))
 			return status;
 
-		status = iomap_write_end(inode, pos, bytes, bytes, page, iomap,
+		status = iomap_write_end(iter->inode, pos, bytes, bytes, page, iomap,
 				srcmap);
 		if (WARN_ON_ONCE(status == 0))
 			return -EIO;
@@ -841,7 +843,7 @@ iomap_unshare_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		written += status;
 		length -= status;
 
-		balance_dirty_pages_ratelimited(inode->i_mapping);
+		balance_dirty_pages_ratelimited(iter->inode->i_mapping);
 	} while (length);
 
 	return written;
@@ -851,18 +853,17 @@ int
 iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
 		const struct iomap_ops *ops)
 {
-	loff_t ret;
-
-	while (len) {
-		ret = iomap_apply(inode, pos, len, IOMAP_WRITE, ops, NULL,
-				iomap_unshare_actor);
-		if (ret <= 0)
-			return ret;
-		pos += ret;
-		len -= ret;
-	}
+	struct iomap_iter iter = {
+		.inode		= inode,
+		.pos		= pos,
+		.len		= len,
+		.flags		= IOMAP_WRITE,
+	};
+	int ret;
 
-	return 0;
+	while ((ret = iomap_iter(&iter, ops)) > 0)
+		iter.processed = iomap_unshare_iter(&iter);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iomap_file_unshare);
 
-- 
2.30.2

