Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BA44B3CD2F2
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 13:03:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596--2ZqidR7M_Kn87WGueIKbg-1; Mon, 19 Jul 2021 07:03:56 -0400
X-MC-Unique: -2ZqidR7M_Kn87WGueIKbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE8748018A7;
	Mon, 19 Jul 2021 11:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFE0760C82;
	Mon, 19 Jul 2021 11:03:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5B064EA2A;
	Mon, 19 Jul 2021 11:03:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JB3rXl008719 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 07:03:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F108D21568A4; Mon, 19 Jul 2021 11:03:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC78721568A3
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 11:03:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D2B589C7DB
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 11:03:50 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-156-UHCPPPj2O5y8yG7PP9tAKQ-1; Mon, 19 Jul 2021 07:03:46 -0400
X-MC-Unique: UHCPPPj2O5y8yG7PP9tAKQ-1
Received: from [2001:4bb8:193:7660:d2a4:8d57:2e55:21d0] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5R1V-006mK6-97; Mon, 19 Jul 2021 11:01:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 19 Jul 2021 12:35:16 +0200
Message-Id: <20210719103520.495450-24-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 23/27] iomap: rework unshare flag
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

Instead of another internal flags namespace inside of buffered-io.c,
just pass a UNSHARE hint in the main iomap flags field.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 23 +++++++++--------------
 include/linux/iomap.h  |  1 +
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index daabbe8d7edfb5..eb5d742b5bf8b7 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -511,10 +511,6 @@ iomap_migrate_page(struct address_space *mapping, struct page *newpage,
 EXPORT_SYMBOL_GPL(iomap_migrate_page);
 #endif /* CONFIG_MIGRATION */
 
-enum {
-	IOMAP_WRITE_F_UNSHARE		= (1 << 0),
-};
-
 static void
 iomap_write_failed(struct inode *inode, loff_t pos, unsigned len)
 {
@@ -544,7 +540,7 @@ iomap_read_page_sync(loff_t block_start, struct page *page, unsigned poff,
 }
 
 static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
-		unsigned len, int flags, struct page *page)
+		unsigned len, struct page *page)
 {
 	struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct iomap_page *iop = iomap_page_create(iter->inode, page);
@@ -563,13 +559,13 @@ static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
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
@@ -585,7 +581,7 @@ static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 }
 
 static int iomap_write_begin(struct iomap_iter *iter, loff_t pos, unsigned len,
-		unsigned flags, struct page **pagep)
+		struct page **pagep)
 {
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 	struct iomap *srcmap = iomap_iter_srcmap(iter);
@@ -617,7 +613,7 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos, unsigned len,
 	else if (iter->iomap.flags & IOMAP_F_BUFFER_HEAD)
 		status = __block_write_begin_int(page, pos, len, NULL, srcmap);
 	else
-		status = __iomap_write_begin(iter, pos, len, flags, page);
+		status = __iomap_write_begin(iter, pos, len, page);
 
 	if (unlikely(status))
 		goto out_unlock;
@@ -748,7 +744,7 @@ static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
 			break;
 		}
 
-		status = iomap_write_begin(iter, pos, bytes, 0, &page);
+		status = iomap_write_begin(iter, pos, bytes, &page);
 		if (unlikely(status))
 			break;
 
@@ -825,8 +821,7 @@ static loff_t iomap_unshare_iter(struct iomap_iter *iter)
 		unsigned long bytes = min_t(loff_t, PAGE_SIZE - offset, length);
 		struct page *page;
 
-		status = iomap_write_begin(iter, pos, bytes,
-				IOMAP_WRITE_F_UNSHARE, &page);
+		status = iomap_write_begin(iter, pos, bytes, &page);
 		if (unlikely(status))
 			return status;
 
@@ -854,7 +849,7 @@ iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
 		.inode		= inode,
 		.pos		= pos,
 		.len		= len,
-		.flags		= IOMAP_WRITE,
+		.flags		= IOMAP_WRITE | IOMAP_UNSHARE,
 	};
 	int ret;
 
@@ -871,7 +866,7 @@ static s64 __iomap_zero_iter(struct iomap_iter *iter, loff_t pos, u64 length)
 	unsigned offset = offset_in_page(pos);
 	unsigned bytes = min_t(u64, PAGE_SIZE - offset, length);
 
-	status = iomap_write_begin(iter, pos, bytes, 0, &page);
+	status = iomap_write_begin(iter, pos, bytes, &page);
 	if (status)
 		return status;
 
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 2f13e34c2c0b0b..719798814bdfdb 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -122,6 +122,7 @@ struct iomap_page_ops {
 #define IOMAP_DIRECT		(1 << 4) /* direct I/O */
 #define IOMAP_NOWAIT		(1 << 5) /* do not block */
 #define IOMAP_OVERWRITE_ONLY	(1 << 6) /* only pure overwrites allowed */
+#define IOMAP_UNSHARE		(1 << 7) /* unshare_file_range */
 
 struct iomap_ops {
 	/*
-- 
2.30.2

