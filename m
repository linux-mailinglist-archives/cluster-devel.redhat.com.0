Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD54724FEB
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jun 2023 00:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686090868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vAFZSL3nTXFwL8IPdl3K3J/1oPVBjzs/oCIJOb/JvBA=;
	b=b6iQuOfM+mUuvkd9aGoAshqgT6lfJAJMytLMDOly27q8CLhsUJ1GTKqFE6Nf1y6FvNI/42
	xRDPLCnShlRLFGkwQzlskLXzswOPfqPyzlNAFVX2TWdcQjL9JUWNX/0tCDlEttezhyIunw
	ZUtTqlRzeQJWEncFw3XFO+VWBgXYQFs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-pm3MgmqGNvOtpeA-YUjhuw-1; Tue, 06 Jun 2023 18:34:23 -0400
X-MC-Unique: pm3MgmqGNvOtpeA-YUjhuw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A587185A78F;
	Tue,  6 Jun 2023 22:34:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F3344B3FEB;
	Tue,  6 Jun 2023 22:34:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 501221946A45;
	Tue,  6 Jun 2023 22:34:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D05D019465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 22:34:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C34C61121315; Tue,  6 Jun 2023 22:34:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC66D1121314
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 22:34:21 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2D931C0512D
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 22:34:21 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-fCasdxO-OGuVn1pTp5ZwSQ-1; Tue,
 06 Jun 2023 18:34:19 -0400
X-MC-Unique: fCasdxO-OGuVn1pTp5ZwSQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q6fFU-00DbEm-Vv; Tue, 06 Jun 2023 22:33:57 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue,  6 Jun 2023 23:33:37 +0100
Message-Id: <20230606223346.3241328-6-willy@infradead.org>
In-Reply-To: <20230606223346.3241328-1-willy@infradead.org>
References: <20230606223346.3241328-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v2 05/14] gfs2: Support ludicrously large
 folios in gfs2_trans_add_databufs()
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
 Luis Chamberlain <mcgrof@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

We may someday support folios larger than 4GB, so use a size_t for
the byte count within a folio to prevent unpleasant truncations.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Tested-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 6 +++---
 fs/gfs2/aops.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 3a2be1901e1e..1c407eba1e30 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -38,13 +38,13 @@
 
 
 void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct folio *folio,
-			     unsigned int from, unsigned int len)
+			     size_t from, size_t len)
 {
 	struct buffer_head *head = folio_buffers(folio);
 	unsigned int bsize = head->b_size;
 	struct buffer_head *bh;
-	unsigned int to = from + len;
-	unsigned int start, end;
+	size_t to = from + len;
+	size_t start, end;
 
 	for (bh = head, start = 0; bh != head || !start;
 	     bh = bh->b_this_page, start = end) {
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

