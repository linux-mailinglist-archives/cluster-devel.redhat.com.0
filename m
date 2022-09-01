Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A925AA8F6
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Sep 2022 09:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662104571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VVDEDDCx2d1u9kTxOO3+HYn0Qu0jVDr1kjF69+koZKM=;
	b=e+/FmNiyDNI/Mwt3BcT8jLlPhPkCIZs0LlGrAIXgYeEzYRyrR+H+pe0X1PVm7UglpFtEVA
	RsyD0wsmjmVWcQP5MyypDlbt9PwU8H+Eh+Jj8rEq/RD6wDVkx3BdPmdglz9kJtgljthrDO
	/kuY4MtS0fohzOQOtOHvGWuDxbUhYR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-xjMoYVgpNTyodbU0pxdkYQ-1; Fri, 02 Sep 2022 03:42:46 -0400
X-MC-Unique: xjMoYVgpNTyodbU0pxdkYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 779DA806007;
	Fri,  2 Sep 2022 07:42:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C1EE14152E0;
	Fri,  2 Sep 2022 07:42:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5CB26194B966;
	Fri,  2 Sep 2022 07:42:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE6F31946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 22:02:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3E5A945D0; Thu,  1 Sep 2022 22:02:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D00AE18ECC
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:02:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4459185A794
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:02:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-TCEwZcxQNkSXUo--zPp_pA-1; Thu, 01 Sep 2022 18:02:53 -0400
X-MC-Unique: TCEwZcxQNkSXUo--zPp_pA-1
Received: by mail-pl1-f174.google.com with SMTP id y1so118492plb.2
 for <cluster-devel@redhat.com>; Thu, 01 Sep 2022 15:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VVDEDDCx2d1u9kTxOO3+HYn0Qu0jVDr1kjF69+koZKM=;
 b=7dWcL60pTFOIkR7BqXtq98Crk6JG7O5+y+L9r1xrJrFOByPQDZOi/Uh0znwUoBUPwZ
 lZbPLelrePZbmyp/tk30rcD5MQ+afoKvb+vOX3gSaHTbtXrPgRgqDmwObAsPGPV/aXsU
 nTclBxBcoiuX0AEA2IDCZ//dclUF8oO0aetMWtvm6h0EIgxufWQ7os4C7irGaJK5YY4a
 bKCx75NG1XgylYDoynhpr5TuCbCrfMR+sYCy/Oqa8P+qSuf4ec7JcQFNL5Is3DifDFG1
 f+KEfcjAsoo9uwi49gGixMSgeXk1FzVzLTSnqcLPXOEHDGCOG884/WikzrNHNmiPn7KB
 AfkA==
X-Gm-Message-State: ACgBeo1J8bzn5Src5CXU9KW3Pb2QsVmgAaBsArDkYZA2o5ewCfVBrYnK
 gEYLy5JKWZNgI2uxCy8SigI=
X-Google-Smtp-Source: AA6agR66Ea/tFozfkhDfcVtnv3hw9p6c/dgn9A3H0n8S4fBp6aMTRwJJz8RoIdyCPNF25qzur+Vgow==
X-Received: by 2002:a17:90a:9309:b0:1fa:d28b:3751 with SMTP id
 p9-20020a17090a930900b001fad28b3751mr1262365pjo.189.1662069771948; 
 Thu, 01 Sep 2022 15:02:51 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:51 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:27 -0700
Message-Id: <20220901220138.182896-13-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-1-vishal.moola@gmail.com>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Fri, 02 Sep 2022 07:42:41 +0000
Subject: [Cluster-devel] [PATCH 12/23] f2fs: Convert
 f2fs_flush_inline_data() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use folios. This is in preparation for the removal
of find_get_pages_tag(). Does NOT support large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a3c5eedfcf64..c2b54c58392a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1885,17 +1885,18 @@ static bool flush_dirty_inode(struct page *page)
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 {
 	pgoff_t index = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	int nr_folios;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
-	while ((nr_pages = pagevec_lookup_tag(&pvec,
-			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
+	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
+					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+					&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 
 			if (!IS_DNODE(page))
 				continue;
@@ -1922,7 +1923,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 			}
 			unlock_page(page);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.36.1

