Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 520163BE77A
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jul 2021 13:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625658944;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pmZDH/DEXLKzetTFHJTrnle9t5h1vn/VXibFPU+EECg=;
	b=KGjyc88/7P+GLtqfr51gSSetf2XNgHB+ncRQr150VNJZlDwPF/ORXItxqQCiGhQGasDAds
	JoCNU2DzTyTW6Psm+8CXASP6iVty+VYyd8CffEKpqE7lfxtMJLbz4QAOFwOQ08vIcMhmqt
	j59c0bNQh7L3CdLYze1Oeh/Y+j/1Oug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Q9fAER-1ObCrVulLuxKsPg-1; Wed, 07 Jul 2021 07:55:43 -0400
X-MC-Unique: Q9fAER-1ObCrVulLuxKsPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6997C80430E;
	Wed,  7 Jul 2021 11:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0F8D6267C;
	Wed,  7 Jul 2021 11:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E3651809C98;
	Wed,  7 Jul 2021 11:55:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 167Bta4n030182 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 7 Jul 2021 07:55:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2385F5D741; Wed,  7 Jul 2021 11:55:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.108])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 786B45D6AB;
	Wed,  7 Jul 2021 11:55:34 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Wed,  7 Jul 2021 13:55:23 +0200
Message-Id: <20210707115524.2242151-3-agruenba@redhat.com>
In-Reply-To: <20210707115524.2242151-1-agruenba@redhat.com>
References: <20210707115524.2242151-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [PATCH v3 2/3] iomap: Don't create iomap_page
	objects for inline files
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In iomap_readpage_actor, don't create iop objects for inline inodes.
Otherwise, iomap_read_inline_data will set PageUptodate without setting
iop->uptodate, and iomap_page_release will eventually complain.

To prevent this kind of bug from occurring in the future, make sure the
page doesn't have private data attached in iomap_read_inline_data.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 598fcfabc337..6330dabc451e 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -215,6 +215,7 @@ iomap_read_inline_data(struct inode *inode, struct page *page,
 	if (PageUptodate(page))
 		return;
 
+	BUG_ON(page_has_private(page));
 	BUG_ON(page->index);
 	BUG_ON(size > PAGE_SIZE - offset_in_page(iomap->inline_data));
 
@@ -239,7 +240,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 {
 	struct iomap_readpage_ctx *ctx = data;
 	struct page *page = ctx->cur_page;
-	struct iomap_page *iop = iomap_page_create(inode, page);
+	struct iomap_page *iop;
 	bool same_page = false, is_contig = false;
 	loff_t orig_pos = pos;
 	unsigned poff, plen;
@@ -252,6 +253,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 	}
 
 	/* zero post-eof blocks as the page may be mapped */
+	iop = iomap_page_create(inode, page);
 	iomap_adjust_read_range(inode, iop, &pos, length, &poff, &plen);
 	if (plen == 0)
 		goto done;
-- 
2.26.3

