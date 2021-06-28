Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BE2C63B67A1
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 19:27:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624901265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cf6zR78zKAwwuUrcY7BAjfHSnos7uy6FIUf8aGQv4ng=;
	b=FCOikM0GayS4cQl9J4MIe2vZub32ByuAEJY8s6jRAMgkNvvKpJPyk9f9Lm6EEJin0n+ojA
	9heoEHCs7/Q/8D9dcOVlPwSCjf+xfNJcEfkGM74LAb9llnJe38Z7NRcnzTxapPA7THgjxD
	/+xElCXwQUVRXmlq1PtkESU5EDIQ7IQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-3IYAFaBVNliHou1MVa-d5A-1; Mon, 28 Jun 2021 13:27:44 -0400
X-MC-Unique: 3IYAFaBVNliHou1MVa-d5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD68192296B;
	Mon, 28 Jun 2021 17:27:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B63A5D703;
	Mon, 28 Jun 2021 17:27:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F00211809C99;
	Mon, 28 Jun 2021 17:27:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SHRcIL017777 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 13:27:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7D505D705; Mon, 28 Jun 2021 17:27:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21D755D6AD;
	Mon, 28 Jun 2021 17:27:33 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Mon, 28 Jun 2021 19:27:26 +0200
Message-Id: <20210628172727.1894503-2-agruenba@redhat.com>
In-Reply-To: <20210628172727.1894503-1-agruenba@redhat.com>
References: <20210628172727.1894503-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/2] iomap: Don't create iomap_page objects
	for inline files
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
index 9023717c5188..03537ecb2a94 100644
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

