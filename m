Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D9705E02
	for <lists+cluster-devel@lfdr.de>; Wed, 17 May 2023 05:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684293902;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a1XCbp+iWkGqywLnM4z2nNwatMKh9R6EW0sUZgVreBU=;
	b=QOBpci3hCqAjOsw4YA+rN5NFcChm22cGBp215Y8V9Hd8R9vxeRA5E5r3m1hlBkiyKHRMgI
	ZljVxk62T/V/jHsImn3Mv7mbde57KCw7vLQtjIRCXpIfifpbgfHnqQGOS6S6MdrqSNfwK3
	BE5nit/HJyVwMTiIpw8SPaQOtcVRU70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-vH4-ESenP-iym5GEfOexxA-1; Tue, 16 May 2023 23:24:57 -0400
X-MC-Unique: vH4-ESenP-iym5GEfOexxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 134AE84AF33;
	Wed, 17 May 2023 03:24:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A35352026D16;
	Wed, 17 May 2023 03:24:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 406C419465B7;
	Wed, 17 May 2023 03:24:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 11F0819465A4 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 17 May 2023 03:24:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EADA863F84; Wed, 17 May 2023 03:24:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E397A63F7F
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:24:52 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C443485C064
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:24:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-569-dH9nBrukM5qU5n_osigiCQ-1; Tue,
 16 May 2023 23:24:48 -0400
X-MC-Unique: dH9nBrukM5qU5n_osigiCQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pz7mO-004lNC-1P; Wed, 17 May 2023 03:24:44 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 17 May 2023 04:24:41 +0100
Message-Id: <20230517032442.1135379-6-willy@infradead.org>
In-Reply-To: <20230517032442.1135379-1-willy@infradead.org>
References: <20230517032442.1135379-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH 5/6] gfs2: Support ludicrously large folios
 in gfs2_trans_add_databufs()
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
Cc: Hannes Reinecke <hare@suse.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

We may someday support folios larger than 4GB, so use a size_t for
the byte count within a folio to prevent unpleasant truncations.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/gfs2/aops.c | 2 +-
 fs/gfs2/aops.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index e97462a5302e..8da4397aafc6 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -38,7 +38,7 @@
 
 
 void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct folio *folio,
-			     unsigned int from, unsigned int len)
+			     size_t from, size_t len)
 {
 	struct buffer_head *head = folio_buffers(folio);
 	unsigned int bsize = head->b_size;
diff --git a/fs/gfs2/aops.h b/fs/gfs2/aops.h
index 09db1914425e..f08322ef41cf 100644
--- a/fs/gfs2/aops.h
+++ b/fs/gfs2/aops.h
@@ -10,6 +10,6 @@
 
 extern void adjust_fs_space(struct inode *inode);
 extern void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct folio *folio,
-				    unsigned int from, unsigned int len);
+				    size_t from, size_t len);
 
 #endif /* __AOPS_DOT_H__ */
-- 
2.39.2

