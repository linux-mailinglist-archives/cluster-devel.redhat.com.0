Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3A6D6848
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624291;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vAR4IqzKft1FulbfGVumK2HKMhiXaE7ZaLXEvaQK8Qc=;
	b=d5+LHLwRlqcUELM/SzDRrGAjU24pCDZr3NjMyNQVRHuPyc1yX90F84CZ+mYm9Hjlx15hfl
	bVI2Mlqt1jXtAYzp0yh/yZS2QGqW7k4ZJJBalqMXJfSjYRqDw8LYS0Wq8sOnU0pO8HJfLW
	Xvf0ti2bJt1LHKSK/h5v+0lVEkWKnG8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-KmFueAm-O9WMqU1agzocYQ-1; Tue, 04 Apr 2023 12:04:37 -0400
X-MC-Unique: KmFueAm-O9WMqU1agzocYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24502100DECA;
	Tue,  4 Apr 2023 16:02:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1915D40C6EC4;
	Tue,  4 Apr 2023 16:02:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 99E9319472CD;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 009DF194658D for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:56:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D863F1121315; Tue,  4 Apr 2023 14:55:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0AC61121314
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 449603C0F238
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:59 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-Nqjng3GvPBu16lGjX_eexQ-1; Tue, 04 Apr 2023 10:55:56 -0400
X-MC-Unique: Nqjng3GvPBu16lGjX_eexQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 u22-20020a05622a011600b003dfd61e8594so22279010qtw.15
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vAR4IqzKft1FulbfGVumK2HKMhiXaE7ZaLXEvaQK8Qc=;
 b=yM3tOWs0CARDO7ieXnIKowmH6PIVj8r91Is57Zv20gOLJI02v/cJuIE+MgH1v8atLi
 NOav2CcjxAkK48qhcgPNm0vzq5v/rjY+QMLR0/kRly307tSL8Sgwot2BYGsF3w68RNfx
 9Bh3+O8sRJR8ji0bqvV6Y6KA0amGIZYnH7TOwrzOvgwReR+9dshGPan1s9VMAJnVuQJA
 HDNyQGK8n/W3F/YEvsx/RmPxZ1d8DLVSQIGSKVlN0IXydVUpwJhk506u25exbrQ2xQH7
 WOdp13lY6WhQC38dPGTZBNiPdy01sYou3MGuhXYtw5fMiYK2ZJvQGcxwlmqJ894GuvBX
 gCTA==
X-Gm-Message-State: AAQBX9c5NRlMzxIj6lkqPtaTiT6pQcs7PioJj6UdrDayAqgCamGj+4qh
 GZxAP3HiGIIQ1dcLkwLTrIEsJJg54WdqI4z1uCL/7NJ6vkiBkzQCEZNQVTDZIh+fpY0by0PyswJ
 OLTmvVO/qqwu+fs9imR4k
X-Received: by 2002:a05:6214:da8:b0:5c5:471a:1e2f with SMTP id
 h8-20020a0562140da800b005c5471a1e2fmr3781912qvh.51.1680620152509; 
 Tue, 04 Apr 2023 07:55:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+CJdy2zuw3OclTHQicHY+1y6liC+cgVxTA4alT47Sc9E4dbJpC4DNw4j3Dv/W+hf5PybB+w==
X-Received: by 2002:a05:6214:da8:b0:5c5:471a:1e2f with SMTP id
 h8-20020a0562140da800b005c5471a1e2fmr3781877qvh.51.1680620152126; 
 Tue, 04 Apr 2023 07:55:52 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:51 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:17 +0200
Message-Id: <20230404145319.2057051-22-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 21/23] xfs: handle merkle tree block size
 != fs blocksize != PAGE_SIZE
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-ext4@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In case of different Merkle tree block size fs-verity expects
->read_merkle_tree_page() to return Merkle tree page filled with
Merkle tree blocks. The XFS stores each merkle tree block under
extended attribute. Those attributes are addressed by block offset
into Merkle tree.

This patch make ->read_merkle_tree_page() to fetch multiple merkle
tree blocks based on size ratio. Also the reference to each xfs_buf
is passed with page->private to ->drop_page().

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
 fs/xfs/xfs_verity.h |  8 +++++
 2 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
index a9874ff4efcd..ef0aff216f06 100644
--- a/fs/xfs/xfs_verity.c
+++ b/fs/xfs/xfs_verity.c
@@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
 	struct page		*page = NULL;
 	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
 	uint32_t		bs = 1 << log_blocksize;
+	int			blocks_per_page =
+		(1 << (PAGE_SHIFT - log_blocksize));
+	int			n = 0;
+	int			offset = 0;
 	struct xfs_da_args	args = {
 		.dp		= ip,
 		.attr_filter	= XFS_ATTR_VERITY,
@@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
 		.valuelen	= bs,
 	};
 	int			error = 0;
+	bool			is_checked = true;
+	struct xfs_verity_buf_list	*buf_list;
 
 	page = alloc_page(GFP_KERNEL);
 	if (!page)
 		return ERR_PTR(-ENOMEM);
 
-	error = xfs_attr_get(&args);
-	if (error) {
-		kmem_free(args.value);
-		xfs_buf_rele(args.bp);
+	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
+	if (!buf_list) {
 		put_page(page);
-		return ERR_PTR(-EFAULT);
+		return ERR_PTR(-ENOMEM);
 	}
 
-	if (args.bp->b_flags & XBF_VERITY_CHECKED)
+	/*
+	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
+	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
+	 * PAGE SIZE
+	 */
+	for (n = 0; n < blocks_per_page; n++) {
+		offset = bs * n;
+		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
+		args.name = (const uint8_t *)&name;
+
+		error = xfs_attr_get(&args);
+		if (error) {
+			kmem_free(args.value);
+			/*
+			 * No more Merkle tree blocks (e.g. this was the last
+			 * block of the tree)
+			 */
+			if (error == -ENOATTR)
+				break;
+			xfs_buf_rele(args.bp);
+			put_page(page);
+			kmem_free(buf_list);
+			return ERR_PTR(-EFAULT);
+		}
+
+		buf_list->bufs[buf_list->buf_count++] = args.bp;
+
+		/* One of the buffers was dropped */
+		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
+			is_checked = false;
+
+		memcpy(page_address(page) + offset, args.value, args.valuelen);
+		kmem_free(args.value);
+		args.value = NULL;
+	}
+
+	if (is_checked)
 		SetPageChecked(page);
+	page->private = (unsigned long)buf_list;
 
-	page->private = (unsigned long)args.bp;
-	memcpy(page_address(page), args.value, args.valuelen);
-
-	kmem_free(args.value);
 	return page;
 }
 
@@ -191,16 +228,21 @@ xfs_write_merkle_tree_block(
 
 static void
 xfs_drop_page(
-	struct page	*page)
+	struct page			*page)
 {
-	struct xfs_buf *buf = (struct xfs_buf *)page->private;
+	int				i = 0;
+	struct xfs_verity_buf_list	*buf_list =
+		(struct xfs_verity_buf_list *)page->private;
 
-	ASSERT(buf != NULL);
+	ASSERT(buf_list != NULL);
 
-	if (PageChecked(page))
-		buf->b_flags |= XBF_VERITY_CHECKED;
+	for (i = 0; i < buf_list->buf_count; i++) {
+		if (PageChecked(page))
+			buf_list->bufs[i]->b_flags |= XBF_VERITY_CHECKED;
+		xfs_buf_rele(buf_list->bufs[i]);
+	}
 
-	xfs_buf_rele(buf);
+	kmem_free(buf_list);
 	put_page(page);
 }
 
diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
index ae5d87ca32a8..433b2f4ae3bc 100644
--- a/fs/xfs/xfs_verity.h
+++ b/fs/xfs/xfs_verity.h
@@ -16,4 +16,12 @@ extern const struct fsverity_operations xfs_verity_ops;
 #define xfs_verity_ops NULL
 #endif	/* CONFIG_FS_VERITY */
 
+/* Minimal Merkle tree block size is 1024 */
+#define XFS_VERITY_MAX_MBLOCKS_PER_PAGE (1 << (PAGE_SHIFT - 10))
+
+struct xfs_verity_buf_list {
+	unsigned int	buf_count;
+	struct xfs_buf	*bufs[XFS_VERITY_MAX_MBLOCKS_PER_PAGE];
+};
+
 #endif	/* __XFS_VERITY_H__ */
-- 
2.38.4

