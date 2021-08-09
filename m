Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1266B3E3FDD
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:25:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-4ELxwiOANmGLoI19ZkRF0A-1; Mon, 09 Aug 2021 02:25:20 -0400
X-MC-Unique: 4ELxwiOANmGLoI19ZkRF0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21B0C8799EB;
	Mon,  9 Aug 2021 06:25:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0880427C5C;
	Mon,  9 Aug 2021 06:25:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB3574BB7C;
	Mon,  9 Aug 2021 06:25:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796PGPk002396 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:25:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95E0D21568AE; Mon,  9 Aug 2021 06:25:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 904FE21568A5
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:25:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 151018CA944
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:25:13 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-83-xCaULI8AO2mb_ZWPkVrJ5A-1; Mon, 09 Aug 2021 02:25:11 -0400
X-MC-Unique: xCaULI8AO2mb_ZWPkVrJ5A-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCygT-00Ah5e-4K; Mon, 09 Aug 2021 06:23:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:27 +0200
Message-Id: <20210809061244.1196573-14-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 13/30] iomap: switch
	iomap_file_buffered_write to use iomap_iter
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Switch iomap_file_buffered_write to use iomap_iter.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 49 +++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 9cda461887afad..4c7e82928cc546 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -726,13 +726,14 @@ static size_t iomap_write_end(struct inode *inode, loff_t pos, size_t len,
 	return ret;
 }
 
-static loff_t
-iomap_write_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
-		struct iomap *iomap, struct iomap *srcmap)
+static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
 {
-	struct iov_iter *i = data;
-	long status = 0;
+	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	struct iomap *iomap = &iter->iomap;
+	loff_t length = iomap_length(iter);
+	loff_t pos = iter->pos;
 	ssize_t written = 0;
+	long status = 0;
 
 	do {
 		struct page *page;
@@ -758,18 +759,18 @@ iomap_write_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 			break;
 		}
 
-		status = iomap_write_begin(inode, pos, bytes, 0, &page, iomap,
-				srcmap);
+		status = iomap_write_begin(iter->inode, pos, bytes, 0, &page,
+					   iomap, srcmap);
 		if (unlikely(status))
 			break;
 
-		if (mapping_writably_mapped(inode->i_mapping))
+		if (mapping_writably_mapped(iter->inode->i_mapping))
 			flush_dcache_page(page);
 
 		copied = copy_page_from_iter_atomic(page, offset, bytes, i);
 
-		status = iomap_write_end(inode, pos, bytes, copied, page, iomap,
-				srcmap);
+		status = iomap_write_end(iter->inode, pos, bytes, copied, page,
+					 iomap, srcmap);
 
 		if (unlikely(copied != status))
 			iov_iter_revert(i, copied - status);
@@ -790,29 +791,29 @@ iomap_write_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		written += status;
 		length -= status;
 
-		balance_dirty_pages_ratelimited(inode->i_mapping);
+		balance_dirty_pages_ratelimited(iter->inode->i_mapping);
 	} while (iov_iter_count(i) && length);
 
 	return written ? written : status;
 }
 
 ssize_t
-iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *iter,
+iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 		const struct iomap_ops *ops)
 {
-	struct inode *inode = iocb->ki_filp->f_mapping->host;
-	loff_t pos = iocb->ki_pos, ret = 0, written = 0;
-
-	while (iov_iter_count(iter)) {
-		ret = iomap_apply(inode, pos, iov_iter_count(iter),
-				IOMAP_WRITE, ops, iter, iomap_write_actor);
-		if (ret <= 0)
-			break;
-		pos += ret;
-		written += ret;
-	}
+	struct iomap_iter iter = {
+		.inode		= iocb->ki_filp->f_mapping->host,
+		.pos		= iocb->ki_pos,
+		.len		= iov_iter_count(i),
+		.flags		= IOMAP_WRITE,
+	};
+	int ret;
 
-	return written ? written : ret;
+	while ((ret = iomap_iter(&iter, ops)) > 0)
+		iter.processed = iomap_write_iter(&iter, i);
+	if (iter.pos == iocb->ki_pos)
+		return ret;
+	return iter.pos - iocb->ki_pos;
 }
 EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
 
-- 
2.30.2

