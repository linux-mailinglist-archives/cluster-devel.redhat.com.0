Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A955F5AA8FD
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Sep 2022 09:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662104569;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3W8eVECYUWOXPq8AmB0uwIDBTXoxHTg96669VXu7Qys=;
	b=E5Tp+pKhCgfd9RODbyxxSr+FEiO1bPEe/HHhOTdy8Lswj0pmqq4waABieC6oAUdR9vtlGC
	tgIL86vaRqwaPm8061o67ttbLdeJLehCS8bCipI8F3HW84V4rJo0YyAOh2kDEZP8i/4Rq5
	St/u1gHnEAal8O2S25JBgo+YcfBBDRI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-3Nbx1CkaPYCUws-qDrXq4Q-1; Fri, 02 Sep 2022 03:42:44 -0400
X-MC-Unique: 3Nbx1CkaPYCUws-qDrXq4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9781800DBF;
	Fri,  2 Sep 2022 07:42:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEA2C2026D4C;
	Fri,  2 Sep 2022 07:42:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B78FF194B966;
	Fri,  2 Sep 2022 07:42:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BEE361946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 22:02:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1AB82166B2C; Thu,  1 Sep 2022 22:02:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E03F2166B2A
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:02:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8289F976FE3
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:02:47 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-nHRPcEd3O0yRvzw-It6BUQ-1; Thu, 01 Sep 2022 18:02:45 -0400
X-MC-Unique: nHRPcEd3O0yRvzw-It6BUQ-1
Received: by mail-pl1-f176.google.com with SMTP id v5so88181plo.9
 for <cluster-devel@redhat.com>; Thu, 01 Sep 2022 15:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3W8eVECYUWOXPq8AmB0uwIDBTXoxHTg96669VXu7Qys=;
 b=eJc+9mrwOT00KdsMVo+z0Qj2QZnXyYOuJXrCBn7b2KcW2sWPu+BblHL7YIgOfhgZD8
 8yj8caeEM1KPvCmU6FdAEYO5NtxcTk2aNlNnqNs6aKPKnbp+B4r8fxsPB1+zX8gwbw0P
 fONwyrRFHcnh02A+A4JTLR0XV1kzdmLSaTkOqHRBAeO5Z+QNlxT7YNznbCGD5RGvGG1G
 G/CvXRfpsjtKs5reyuhrYaql4wa4Xj7HsedoGVW5P98UrlYl+Tu3gaI9PNUF4BaXcU3h
 /8RwgnjwjykYIRy0ZqHwi9/eomxGJwyJzsIKikPBWyx9M7EEqcZcYRw64svEpWGRCZZo
 AysQ==
X-Gm-Message-State: ACgBeo2nO/mLAxeiZDQEd47cPLIwYR2U+IspSiYtBTXpVs/tUA8slZcr
 +vB/Dpg73Cv+qMwyPDokbccMzRO2SyOX2A==
X-Google-Smtp-Source: AA6agR4+8BUAX2YkjXUvTou/rR9ObQ1uX2z42w4hYTYm88BqrnOHPc03kR7a6JZ8cWUAEetKKB6rvA==
X-Received: by 2002:a17:902:ecd2:b0:16e:d87f:d19e with SMTP id
 a18-20020a170902ecd200b0016ed87fd19emr32807669plh.75.1662069763246; 
 Thu, 01 Sep 2022 15:02:43 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:42 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:21 -0700
Message-Id: <20220901220138.182896-7-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Fri, 02 Sep 2022 07:42:41 +0000
Subject: [Cluster-devel] [PATCH 06/23] btrfs: Convert
 btree_write_cache_pages() to use filemap_get_folio_tag()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Converted function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/btrfs/extent_io.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index cf4f19e80e2f..d1fa072bfdd0 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4844,14 +4844,14 @@ int btree_write_cache_pages(struct address_space *mapping,
 	int ret = 0;
 	int done = 0;
 	int nr_to_write_done = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned int nr_folios;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	int scanned = 0;
 	xa_mark_t tag;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	if (wbc->range_cyclic) {
 		index = mapping->writeback_index; /* Start from prev offset */
 		end = -1;
@@ -4874,14 +4874,15 @@ int btree_write_cache_pages(struct address_space *mapping,
 	if (wbc->sync_mode == WB_SYNC_ALL)
 		tag_pages_for_writeback(mapping, index, end);
 	while (!done && !nr_to_write_done && (index <= end) &&
-	       (nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-			tag))) {
+	       (nr_folios = filemap_get_folios_tag(mapping, &index, end,
+					    tag, &fbatch))) {
 		unsigned i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			ret = submit_eb_page(page, wbc, &epd, &eb_context);
+			ret = submit_eb_page(&folio->page, wbc, &epd,
+					&eb_context);
 			if (ret == 0)
 				continue;
 			if (ret < 0) {
@@ -4896,7 +4897,7 @@ int btree_write_cache_pages(struct address_space *mapping,
 			 */
 			nr_to_write_done = wbc->nr_to_write <= 0;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	if (!scanned && !done) {
-- 
2.36.1

