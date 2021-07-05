Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 266193BC288
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 20:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625509149;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OfnbDKVQTNnP9yn/zxhP8slR9Z1sonaiM3CMMk0IhL8=;
	b=Ht9KvdUmi0XN4eSSUiZWgIveHtDqpUNmDQ/2GjWqiCwgN4WEq3cPw2SHJVGFyVCMJeVl0Y
	FajEVr9AhoTrrivLtu+7jx8VuEo8JsADptVvV3Uzjmr3fv2AXyOkeHcSSc4XulRfG9SvvO
	lQIXC6bG0FwUC63DoFuQDpOUzfXb41Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-voY-xr_KPW6UH8dQXu9zWg-1; Mon, 05 Jul 2021 14:19:08 -0400
X-MC-Unique: voY-xr_KPW6UH8dQXu9zWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5306100B3AD;
	Mon,  5 Jul 2021 18:19:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D769C5C1D0;
	Mon,  5 Jul 2021 18:19:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E9061809C97;
	Mon,  5 Jul 2021 18:19:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165IIbvl013740 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 14:18:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C846319D9D; Mon,  5 Jul 2021 18:18:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C95B2EB18;
	Mon,  5 Jul 2021 18:18:33 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Mon,  5 Jul 2021 20:18:24 +0200
Message-Id: <20210705181824.2174165-3-agruenba@redhat.com>
In-Reply-To: <20210705181824.2174165-1-agruenba@redhat.com>
References: <20210705181824.2174165-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [PATCH v2 2/2] iomap: Permit pages without an iop
	to enter writeback
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

Create an iop in the writeback path if one doesn't exist.  This allows
us to avoid creating the iop in some cases.  The only current case we
do that for is pages with inline data, but it can be extended to pages
which are entirely within an extent.  It also allows for an iop to be
removed from pages in the future (eg page split).

Co-developed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 03537ecb2a94..6330dabc451e 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1336,14 +1336,13 @@ iomap_writepage_map(struct iomap_writepage_ctx *wpc,
 		struct writeback_control *wbc, struct inode *inode,
 		struct page *page, u64 end_offset)
 {
-	struct iomap_page *iop = to_iomap_page(page);
+	struct iomap_page *iop = iomap_page_create(inode, page);
 	struct iomap_ioend *ioend, *next;
 	unsigned len = i_blocksize(inode);
 	u64 file_offset; /* file offset of page */
 	int error = 0, count = 0, i;
 	LIST_HEAD(submit_list);
 
-	WARN_ON_ONCE(i_blocks_per_page(inode, page) > 1 && !iop);
 	WARN_ON_ONCE(iop && atomic_read(&iop->write_bytes_pending) != 0);
 
 	/*
-- 
2.26.3

