Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A95AA8FE
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Sep 2022 09:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662104575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e1eM0qi5kNEXaBuV4o8U+3ZrhdfXdzoi+l/ai4waThY=;
	b=b3l7dpj0eXmCPMJkEL107VW/4iDkjBvMeFfcxXOpbm2IcyRJ0IV7wR/ETEECIhn0T67BUJ
	mbYCKK3GHfLXuFJzavG7xOgQoyl0h8b8uaCashlLDiTRpIZf6KFdYPgjTehgbUmmWe/z+3
	TLmYm47BM+w3gFJEsqegQmeZPrUjOsY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-iAkHjIyWORCszd5S4AIimw-1; Fri, 02 Sep 2022 03:42:44 -0400
X-MC-Unique: iAkHjIyWORCszd5S4AIimw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AF3E18A653C;
	Fri,  2 Sep 2022 07:42:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF434010FCC;
	Fri,  2 Sep 2022 07:42:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7AF84194B96D;
	Fri,  2 Sep 2022 07:42:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C8D5F1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 22:02:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF0D3400EAB6; Thu,  1 Sep 2022 22:02:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB10F400EA8F
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:02:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 957F73800C31
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:02:49 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-4Ab2cccCPwigcwa25EvrLg-1; Thu, 01 Sep 2022 18:02:39 -0400
X-MC-Unique: 4Ab2cccCPwigcwa25EvrLg-1
Received: by mail-pj1-f41.google.com with SMTP id q3so257153pjg.3
 for <cluster-devel@redhat.com>; Thu, 01 Sep 2022 15:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=e1eM0qi5kNEXaBuV4o8U+3ZrhdfXdzoi+l/ai4waThY=;
 b=1zfHg0PQS1TsVpnoDjXEiLy5A8cowOF0muzdyZJWBX9BXWX3OAbL3yNFEHoKF36bwn
 wXufr3idSULIYlWkZCzFBMg0MaOil+4EmPvvkpfMJmqb3QgzSBfmbUhkcm3lz4msqHFQ
 30h+/lEYI4ep8OJ7Uz2yRkW01SanWlsEmqQe+mlSTRiFVVL6fMQ8uzf2AFG/nzf6ha7p
 3mML0dCdjONOHgV7udY6bXUJVw9jgqut4UGIQcgI6juWn3ocGN6JNhXakWYvjIjDy6dT
 O3X8+4jz/MdroUjAzTPYZvEp40Jbdwlu2AAeuHyF+IdCNTdf4Sqcb6XR6vAFNPicI8PG
 y7CA==
X-Gm-Message-State: ACgBeo0X8dAE6lBdpYQ7nQ4q2Bu3GxrfWM+Wv48n5LGUHctJAo/zsDCr
 b9cCbApbm6vNbVGq71y9SO0=
X-Google-Smtp-Source: AA6agR79ut39yeQZLj/LWKnnlXRQp19F2hOxIhYbazSQ5kgq5xXWtmAM1WGiML8jodYQoBXi0CNqGg==
X-Received: by 2002:a17:90b:2bca:b0:1fd:a06b:ef4f with SMTP id
 ru10-20020a17090b2bca00b001fda06bef4fmr1267475pjb.201.1662069758626; 
 Thu, 01 Sep 2022 15:02:38 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:38 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:18 -0700
Message-Id: <20220901220138.182896-4-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Fri, 02 Sep 2022 07:42:41 +0000
Subject: [Cluster-devel] [PATCH 03/23] filemap: Convert
 __filemap_fdatawait_range() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Converted function to use folios. This is in preparation for the removal
of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 mm/filemap.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 3ded72a65668..435fc53b3f2f 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -503,28 +503,30 @@ static void __filemap_fdatawait_range(struct address_space *mapping,
 {
 	pgoff_t index = start_byte >> PAGE_SHIFT;
 	pgoff_t end = end_byte >> PAGE_SHIFT;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned nr_folios;
 
 	if (end_byte < start_byte)
 		return;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
+
 	while (index <= end) {
 		unsigned i;
 
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index,
-				end, PAGECACHE_TAG_WRITEBACK);
-		if (!nr_pages)
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				PAGECACHE_TAG_WRITEBACK, &fbatch);
+
+		if (!nr_folios)
 			break;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			wait_on_page_writeback(page);
-			ClearPageError(page);
+			folio_wait_writeback(folio);
+			folio_clear_error(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.36.1

