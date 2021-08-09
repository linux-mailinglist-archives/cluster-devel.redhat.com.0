Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 06A333E4014
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:33:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-J-bnSfptN5mZcq_1hw7gOQ-1; Mon, 09 Aug 2021 02:33:17 -0400
X-MC-Unique: J-bnSfptN5mZcq_1hw7gOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA9CA801B3D;
	Mon,  9 Aug 2021 06:33:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE0FE189BB;
	Mon,  9 Aug 2021 06:33:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98A0B4BB7B;
	Mon,  9 Aug 2021 06:33:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796XDuu004116 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:33:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 193AD100611F; Mon,  9 Aug 2021 06:33:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14D33100402D
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:33:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F965800159
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:33:10 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-26-XcyNbWMwMtOcLlP-TH5F1w-1; Mon, 09 Aug 2021 02:33:08 -0400
X-MC-Unique: XcyNbWMwMtOcLlP-TH5F1w-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCyo8-00Ahix-Ga; Mon, 09 Aug 2021 06:30:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:36 +0200
Message-Id: <20210809061244.1196573-23-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 22/30] iomap: switch iomap_swapfile_activate
	to use iomap_iter
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

Switch iomap_swapfile_activate to use iomap_iter.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/swapfile.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
index 6250ca6a1f851d..7069606eca85b2 100644
--- a/fs/iomap/swapfile.c
+++ b/fs/iomap/swapfile.c
@@ -88,13 +88,9 @@ static int iomap_swapfile_fail(struct iomap_swapfile_info *isi, const char *str)
  * swap only cares about contiguous page-aligned physical extents and makes no
  * distinction between written and unwritten extents.
  */
-static loff_t iomap_swapfile_activate_actor(struct inode *inode, loff_t pos,
-		loff_t count, void *data, struct iomap *iomap,
-		struct iomap *srcmap)
+static loff_t iomap_swapfile_iter(const struct iomap_iter *iter,
+		struct iomap *iomap, struct iomap_swapfile_info *isi)
 {
-	struct iomap_swapfile_info *isi = data;
-	int error;
-
 	switch (iomap->type) {
 	case IOMAP_MAPPED:
 	case IOMAP_UNWRITTEN:
@@ -125,12 +121,12 @@ static loff_t iomap_swapfile_activate_actor(struct inode *inode, loff_t pos,
 		isi->iomap.length += iomap->length;
 	} else {
 		/* Otherwise, add the retained iomap and store this one. */
-		error = iomap_swapfile_add_extent(isi);
+		int error = iomap_swapfile_add_extent(isi);
 		if (error)
 			return error;
 		memcpy(&isi->iomap, iomap, sizeof(isi->iomap));
 	}
-	return count;
+	return iomap_length(iter);
 }
 
 /*
@@ -141,16 +137,19 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
 		struct file *swap_file, sector_t *pagespan,
 		const struct iomap_ops *ops)
 {
+	struct inode *inode = swap_file->f_mapping->host;
+	struct iomap_iter iter = {
+		.inode	= inode,
+		.pos	= 0,
+		.len	= ALIGN_DOWN(i_size_read(inode), PAGE_SIZE),
+		.flags	= IOMAP_REPORT,
+	};
 	struct iomap_swapfile_info isi = {
 		.sis = sis,
 		.lowest_ppage = (sector_t)-1ULL,
 		.file = swap_file,
 	};
-	struct address_space *mapping = swap_file->f_mapping;
-	struct inode *inode = mapping->host;
-	loff_t pos = 0;
-	loff_t len = ALIGN_DOWN(i_size_read(inode), PAGE_SIZE);
-	loff_t ret;
+	int ret;
 
 	/*
 	 * Persist all file mapping metadata so that we won't have any
@@ -160,15 +159,10 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
 	if (ret)
 		return ret;
 
-	while (len > 0) {
-		ret = iomap_apply(inode, pos, len, IOMAP_REPORT,
-				ops, &isi, iomap_swapfile_activate_actor);
-		if (ret <= 0)
-			return ret;
-
-		pos += ret;
-		len -= ret;
-	}
+	while ((ret = iomap_iter(&iter, ops)) > 0)
+		iter.processed = iomap_swapfile_iter(&iter, &iter.iomap, &isi);
+	if (ret < 0)
+		return ret;
 
 	if (isi.iomap.length) {
 		ret = iomap_swapfile_add_extent(&isi);
-- 
2.30.2

