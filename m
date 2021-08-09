Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF553E403A
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:38:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-PWJ65PJGPU-LtzxBZ-tMAQ-1; Mon, 09 Aug 2021 02:38:52 -0400
X-MC-Unique: PWJ65PJGPU-LtzxBZ-tMAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86B14107465F;
	Mon,  9 Aug 2021 06:38:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79AD3189BB;
	Mon,  9 Aug 2021 06:38:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61DE44BB7B;
	Mon,  9 Aug 2021 06:38:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796bg5C004412 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:37:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8122421568AF; Mon,  9 Aug 2021 06:37:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B27C21568AE
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:37:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17E6F18A01AC
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:37:39 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-M2aoN2VJNsmfACWcYqnGQA-1; Mon, 09 Aug 2021 02:37:37 -0400
X-MC-Unique: M2aoN2VJNsmfACWcYqnGQA-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCyrd-00AhzV-Fc; Mon, 09 Aug 2021 06:34:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:40 +0200
Message-Id: <20210809061244.1196573-27-hch@lst.de>
In-Reply-To: <20210809061244.1196573-1-hch@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 26/30] iomap: rework unshare flag
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

Instead of another internal flags namespace inside of buffered-io.c,
just pass a UNSHARE hint in the main iomap flags field.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/iomap/buffered-io.c | 23 +++++++++--------------
 include/linux/iomap.h  |  1 +
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index cfeec6b0ed2293..ef902cc89accca 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -508,10 +508,6 @@ iomap_migrate_page(struct address_space *mapping, struct page *newpage,
 EXPORT_SYMBOL_GPL(iomap_migrate_page);
 #endif /* CONFIG_MIGRATION */
 
-enum {
-	IOMAP_WRITE_F_UNSHARE		= (1 << 0),
-};
-
 static void
 iomap_write_failed(struct inode *inode, loff_t pos, unsigned len)
 {
@@ -541,7 +537,7 @@ iomap_read_page_sync(loff_t block_start, struct page *page, unsigned poff,
 }
 
 static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
-		unsigned len, int flags, struct page *page)
+		unsigned len, struct page *page)
 {
 	struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct iomap_page *iop = iomap_page_create(iter->inode, page);
@@ -560,13 +556,13 @@ static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 		if (plen == 0)
 			break;
 
-		if (!(flags & IOMAP_WRITE_F_UNSHARE) &&
+		if (!(iter->flags & IOMAP_UNSHARE) &&
 		    (from <= poff || from >= poff + plen) &&
 		    (to <= poff || to >= poff + plen))
 			continue;
 
 		if (iomap_block_needs_zeroing(iter, block_start)) {
-			if (WARN_ON_ONCE(flags & IOMAP_WRITE_F_UNSHARE))
+			if (WARN_ON_ONCE(iter->flags & IOMAP_UNSHARE))
 				return -EIO;
 			zero_user_segments(page, poff, from, to, poff + plen);
 		} else {
@@ -596,7 +592,7 @@ static int iomap_write_begin_inline(struct iomap_iter *iter,
 }
 
 static int iomap_write_begin(struct iomap_iter *iter, loff_t pos, unsigned len,
-		unsigned flags, struct page **pagep)
+		struct page **pagep)
 {
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 	struct iomap *srcmap = iomap_iter_srcmap(iter);
@@ -628,7 +624,7 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos, unsigned len,
 	else if (srcmap->flags & IOMAP_F_BUFFER_HEAD)
 		status = __block_write_begin_int(page, pos, len, NULL, srcmap);
 	else
-		status = __iomap_write_begin(iter, pos, len, flags, page);
+		status = __iomap_write_begin(iter, pos, len, page);
 
 	if (unlikely(status))
 		goto out_unlock;
@@ -759,7 +755,7 @@ static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
 			break;
 		}
 
-		status = iomap_write_begin(iter, pos, bytes, 0, &page);
+		status = iomap_write_begin(iter, pos, bytes, &page);
 		if (unlikely(status))
 			break;
 
@@ -836,8 +832,7 @@ static loff_t iomap_unshare_iter(struct iomap_iter *iter)
 		unsigned long bytes = min_t(loff_t, PAGE_SIZE - offset, length);
 		struct page *page;
 
-		status = iomap_write_begin(iter, pos, bytes,
-				IOMAP_WRITE_F_UNSHARE, &page);
+		status = iomap_write_begin(iter, pos, bytes, &page);
 		if (unlikely(status))
 			return status;
 
@@ -865,7 +860,7 @@ iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
 		.inode		= inode,
 		.pos		= pos,
 		.len		= len,
-		.flags		= IOMAP_WRITE,
+		.flags		= IOMAP_WRITE | IOMAP_UNSHARE,
 	};
 	int ret;
 
@@ -882,7 +877,7 @@ static s64 __iomap_zero_iter(struct iomap_iter *iter, loff_t pos, u64 length)
 	unsigned offset = offset_in_page(pos);
 	unsigned bytes = min_t(u64, PAGE_SIZE - offset, length);
 
-	status = iomap_write_begin(iter, pos, bytes, 0, &page);
+	status = iomap_write_begin(iter, pos, bytes, &page);
 	if (status)
 		return status;
 
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 6784a8b6471449..f53c40e9d799fb 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -140,6 +140,7 @@ struct iomap_page_ops {
 #define IOMAP_DIRECT		(1 << 4) /* direct I/O */
 #define IOMAP_NOWAIT		(1 << 5) /* do not block */
 #define IOMAP_OVERWRITE_ONLY	(1 << 6) /* only pure overwrites allowed */
+#define IOMAP_UNSHARE		(1 << 7) /* unshare_file_range */
 
 struct iomap_ops {
 	/*
-- 
2.30.2

