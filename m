Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB765DE57
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672866942;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x25JE3Kc6tv/CRPnK8Jr5HLS2sX0SCmIF/DAVcH2FqE=;
	b=FNhvsdpPiHPSqL1VvcdmCrYBI/ijWdzYKoqnMgHKlsbBF5ur1J3jTelQdFvqor3YpVAOCJ
	V9pQkZ8Y7eEg4BkW31fOy6hpDjFTUnbP0RVqcbAPHdwISR1MUm3oUOw3yhdapbfxbvqj6u
	8gcjsVP4R/azsg+JOP/mheTTuguFEi8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-7hIjGlA1PyupFULIYteSyw-1; Wed, 04 Jan 2023 16:15:39 -0500
X-MC-Unique: 7hIjGlA1PyupFULIYteSyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A0D785C07C;
	Wed,  4 Jan 2023 21:15:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CB96C15BAD;
	Wed,  4 Jan 2023 21:15:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 40FFB1946597;
	Wed,  4 Jan 2023 21:15:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 40D7419465A8 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 21:15:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B76F2166B31; Wed,  4 Jan 2023 21:15:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44ACC2166B30
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AB4685A588
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:18 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-dMdjHxYDM_WfdFmcwfXecA-1; Wed, 04 Jan 2023 16:15:15 -0500
X-MC-Unique: dMdjHxYDM_WfdFmcwfXecA-1
Received: by mail-pj1-f52.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so27602567pjq.1
 for <cluster-devel@redhat.com>; Wed, 04 Jan 2023 13:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x25JE3Kc6tv/CRPnK8Jr5HLS2sX0SCmIF/DAVcH2FqE=;
 b=S2Ko5d0GdFoexZzX/5FwcxrAO8F/RuaKVMafEbT8x28ZnBzBU2tNdKB7QRYyDJmPKS
 JBhph9Yawa1NoVJq5t7enbUm5xv/la+a4+tKfTC3qu0xBA+nTcvxsuK0Py7pRH/eN+90
 4TYWFk0ZtmC9PPHQgIKJoW6a4iYHCoxIhB3MYSPxua8RYrUfBbWziOGTB2glQjBNskjZ
 ByC8vpCywvDO9zFjwW8lycYRok084LfEBBgbF/qJMIInQQsP4n/MGj5g05hvz6l13i7J
 2MORJYCMD/YNK1HBp1jujYcpEBU3ncs6LDDUOsrLRVymkNMTmINpcsC/GBTgluXlZyd5
 wBGg==
X-Gm-Message-State: AFqh2kr5GGOmsYnvYeZ78orOPYg3lGCdmXIaydVlBibvEgl278LCaYQg
 K0bkm2rkHLmBe7T2GudlKV8=
X-Google-Smtp-Source: AMrXdXtcJ2y8j2tl71bGDNWcQ9VdexuFiNN6QmVTJEdgM9Lahf3FnPeatjjBv8JIR91dEL59PwjIKg==
X-Received: by 2002:a17:90a:930f:b0:225:be98:f5b5 with SMTP id
 p15-20020a17090a930f00b00225be98f5b5mr45592480pjo.23.1672866914778; 
 Wed, 04 Jan 2023 13:15:14 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:14 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:38 -0800
Message-Id: <20230104211448.4804-14-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v5 13/23] f2fs: Convert
 f2fs_sync_node_pages() to use filemap_get_folios_tag()
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
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1c5dc7a3207e..51e9f286f53a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1938,23 +1938,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				bool do_balance, enum iostat_type io_type)
 {
 	pgoff_t index;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	int step = 0;
 	int nwritten = 0;
 	int ret = 0;
-	int nr_pages, done = 0;
+	int nr_folios, done = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
 next_step:
 	index = 0;
 
-	while (!done && (nr_pages = pagevec_lookup_tag(&pvec,
-			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
+	while (!done && (nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
+				&index, (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+				&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 			bool submitted = false;
 
 			/* give a priority to WB_SYNC threads */
@@ -2029,7 +2030,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (--wbc->nr_to_write == 0)
 				break;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 
 		if (wbc->nr_to_write == 0) {
-- 
2.38.1

