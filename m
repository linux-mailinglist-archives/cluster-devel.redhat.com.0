Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEAA3B67A7
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 19:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624901275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qx+pJPqGuDwHEVclhC42irAu7Sb7G7yMiMuZ9iVPouQ=;
	b=JqavjfhiZZGoqywe18GXqGMTeHnzJJacUsTmty+lHTq2XODIZUV5689c7x7w8bCfxeyle5
	BHqV4jcvtX0TnH5+fTGpjyGo/Mh7xb8dBLycqPRNiMNsnQyvyxM0MGn+Ba06s/Vms7vXSA
	Zl71kc8Dgd1cmArMFDiN+VaTPWvmIJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-VF_XxITTMxKoEuwF6u74Xw-1; Mon, 28 Jun 2021 13:27:53 -0400
X-MC-Unique: VF_XxITTMxKoEuwF6u74Xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E1A99F92F;
	Mon, 28 Jun 2021 17:27:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B9CD100F49F;
	Mon, 28 Jun 2021 17:27:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 789491809C99;
	Mon, 28 Jun 2021 17:27:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SHRon1017790 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 13:27:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 027151AC77; Mon, 28 Jun 2021 17:27:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 197E45D6AD;
	Mon, 28 Jun 2021 17:27:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Mon, 28 Jun 2021 19:27:27 +0200
Message-Id: <20210628172727.1894503-3-agruenba@redhat.com>
In-Reply-To: <20210628172727.1894503-1-agruenba@redhat.com>
References: <20210628172727.1894503-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 2/2] iomap: Add helper for un-inlining an
	inline inode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Bob Peterson <rpeterso@redhat.com>

Add function iomap_uninline_inode for converting an inline inode into a
non-inline inode.  This takes care of attaching a new iomap_page object
to page->private if the block size is smaller than the page size.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 24 ++++++++++++++++++++++++
 include/linux/iomap.h  |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 03537ecb2a94..44acb59191b2 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -226,6 +226,30 @@ iomap_read_inline_data(struct inode *inode, struct page *page,
 	SetPageUptodate(page);
 }
 
+int iomap_uninline_inode(struct inode *inode,
+		int (*uninline)(struct inode *, struct page *))
+{
+	struct page *page = NULL;
+	int ret;
+
+	if (i_size_read(inode)) {
+		page = find_or_create_page(inode->i_mapping, 0, GFP_NOFS);
+		if (!page)
+			return -ENOMEM;
+	}
+	ret = uninline(inode, page);
+	if (page) {
+		if (PageUptodate(page)) {
+			iomap_page_create(inode, page);
+			iomap_set_range_uptodate(page, 0, PAGE_SIZE);
+		}
+		unlock_page(page);
+		put_page(page);
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iomap_uninline_inode);
+
 static inline bool iomap_block_needs_zeroing(struct inode *inode,
 		struct iomap *iomap, loff_t pos)
 {
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index c87d0cb0de6d..90c924eec09b 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -157,6 +157,8 @@ loff_t iomap_apply(struct inode *inode, loff_t pos, loff_t length,
 
 ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *from,
 		const struct iomap_ops *ops);
+int iomap_uninline_inode(struct inode *inode,
+                int (*uninline)(struct inode *, struct page *));
 int iomap_readpage(struct page *page, const struct iomap_ops *ops);
 void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops);
 int iomap_set_page_dirty(struct page *page);
-- 
2.26.3

