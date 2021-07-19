Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4994D3CD241
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 12:53:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-secF4WkpPPuCWgWTCj-dVg-1; Mon, 19 Jul 2021 06:53:13 -0400
X-MC-Unique: secF4WkpPPuCWgWTCj-dVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0879D100C661;
	Mon, 19 Jul 2021 10:53:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDE5F5C23A;
	Mon, 19 Jul 2021 10:53:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CED384EA2A;
	Mon, 19 Jul 2021 10:53:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JAr8Gp007902 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 06:53:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3E1C202E4BF; Mon, 19 Jul 2021 10:53:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD80202E4BB
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 10:53:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F375F10AF7C5
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 10:53:04 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-551-tangl_BMNv2zZvOsJpmZtg-1; Mon, 19 Jul 2021 06:53:02 -0400
X-MC-Unique: tangl_BMNv2zZvOsJpmZtg-1
Received: from [2001:4bb8:193:7660:d2a4:8d57:2e55:21d0] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5QrJ-006lWj-Rf; Mon, 19 Jul 2021 10:51:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 19 Jul 2021 12:35:06 +0200
Message-Id: <20210719103520.495450-14-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 13/27] iomap: switch iomap_page_mkwrite to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Switch iomap_page_mkwrite to use iomap_iter.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index e5832ffb413cb6..c273b5d88dd8a8 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -950,15 +950,15 @@ iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
 }
 EXPORT_SYMBOL_GPL(iomap_truncate_page);
 
-static loff_t
-iomap_page_mkwrite_actor(struct inode *inode, loff_t pos, loff_t length,
-		void *data, struct iomap *iomap, struct iomap *srcmap)
+static loff_t iomap_page_mkwrite_iter(struct iomap_iter *iter,
+		struct page *page)
 {
-	struct page *page = data;
+	loff_t length = iomap_length(iter);
 	int ret;
 
-	if (iomap->flags & IOMAP_F_BUFFER_HEAD) {
-		ret = __block_write_begin_int(page, pos, length, NULL, iomap);
+	if (iter->iomap.flags & IOMAP_F_BUFFER_HEAD) {
+		ret = __block_write_begin_int(page, iter->pos, length, NULL,
+					      &iter->iomap);
 		if (ret)
 			return ret;
 		block_commit_write(page, 0, length);
@@ -972,29 +972,24 @@ iomap_page_mkwrite_actor(struct inode *inode, loff_t pos, loff_t length,
 
 vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
 {
+	struct iomap_iter iter = {
+		.inode		= file_inode(vmf->vma->vm_file),
+		.flags		= IOMAP_WRITE | IOMAP_FAULT,
+	};
 	struct page *page = vmf->page;
-	struct inode *inode = file_inode(vmf->vma->vm_file);
-	unsigned long length;
-	loff_t offset;
 	ssize_t ret;
 
 	lock_page(page);
-	ret = page_mkwrite_check_truncate(page, inode);
+	ret = page_mkwrite_check_truncate(page, iter.inode);
 	if (ret < 0)
 		goto out_unlock;
-	length = ret;
-
-	offset = page_offset(page);
-	while (length > 0) {
-		ret = iomap_apply(inode, offset, length,
-				IOMAP_WRITE | IOMAP_FAULT, ops, page,
-				iomap_page_mkwrite_actor);
-		if (unlikely(ret <= 0))
-			goto out_unlock;
-		offset += ret;
-		length -= ret;
-	}
+	iter.pos = page_offset(page);
+	iter.len = ret;
+	while ((ret = iomap_iter(&iter, ops)) > 0)
+		iter.processed = iomap_page_mkwrite_iter(&iter, page);
 
+	if (ret < 0)
+		goto out_unlock;
 	wait_for_stable_page(page);
 	return VM_FAULT_LOCKED;
 out_unlock:
-- 
2.30.2

