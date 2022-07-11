Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7079356D44D
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jul 2022 07:27:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657517219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=coXs7fZqtjdeX2Tzle8EdrF+O0+NaGLuimvWE8sIgts=;
	b=eOpbB7QNIxpjY+bxRCzLUlKj0gu8xhZgQF5UUku9ZW1qmUd/0D+2l/UTm17dkDNK3lalqh
	ry9xTepBExyJd4EXtbmpr0oTpqpnw3N3dBhBvOBpT0ACDfRmKFONZlt2iP3dcY9ZybM1UT
	Q82I32ytq99QLhDBaL1zuwsQtIVnvNc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-MPvrcE5kOfu2euZlo_hUSw-1; Mon, 11 Jul 2022 01:26:47 -0400
X-MC-Unique: MPvrcE5kOfu2euZlo_hUSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A356C811E84;
	Mon, 11 Jul 2022 05:26:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8FBB2166B26;
	Mon, 11 Jul 2022 05:26:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B65E51947054;
	Mon, 11 Jul 2022 05:26:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE7171947040 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 05:26:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0609492CA4; Mon, 11 Jul 2022 05:26:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC38F492CA2
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 05:26:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2B6A101A5B3
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 05:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-mFe9thCYMYChqaTaYduMMA-1; Mon, 11 Jul 2022 01:26:42 -0400
X-MC-Unique: mFe9thCYMYChqaTaYduMMA-1
Received: from 089144197153.atnat0006.highway.a1.net ([89.144.197.153]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oAkpF-00Fpxf-Jo; Mon, 11 Jul 2022 04:15:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Naohiro Aota <naohiro.aota@wdc.com>
Date: Mon, 11 Jul 2022 06:14:59 +0200
Message-Id: <20220711041459.1062583-5-hch@lst.de>
In-Reply-To: <20220711041459.1062583-1-hch@lst.de>
References: <20220711041459.1062583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 4/4] iomap: remove iomap_writepage
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
Cc: cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Unused now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 15 ---------------
 include/linux/iomap.h  |  3 ---
 2 files changed, 18 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index d2a9f699e17ed..1bac8bda40d0c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1518,21 +1518,6 @@ iomap_do_writepage(struct page *page, struct writeback_control *wbc, void *data)
 	return 0;
 }
 
-int
-iomap_writepage(struct page *page, struct writeback_control *wbc,
-		struct iomap_writepage_ctx *wpc,
-		const struct iomap_writeback_ops *ops)
-{
-	int ret;
-
-	wpc->ops = ops;
-	ret = iomap_do_writepage(page, wbc, wpc);
-	if (!wpc->ioend)
-		return ret;
-	return iomap_submit_ioend(wpc, wpc->ioend, ret);
-}
-EXPORT_SYMBOL_GPL(iomap_writepage);
-
 int
 iomap_writepages(struct address_space *mapping, struct writeback_control *wbc,
 		struct iomap_writepage_ctx *wpc,
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index e552097c67e0b..911888560d3eb 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -303,9 +303,6 @@ void iomap_finish_ioends(struct iomap_ioend *ioend, int error);
 void iomap_ioend_try_merge(struct iomap_ioend *ioend,
 		struct list_head *more_ioends);
 void iomap_sort_ioends(struct list_head *ioend_list);
-int iomap_writepage(struct page *page, struct writeback_control *wbc,
-		struct iomap_writepage_ctx *wpc,
-		const struct iomap_writeback_ops *ops);
 int iomap_writepages(struct address_space *mapping,
 		struct writeback_control *wbc, struct iomap_writepage_ctx *wpc,
 		const struct iomap_writeback_ops *ops);
-- 
2.30.2

