Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D063865DE28
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672866908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/ONYMO0PIN9dk55uWmFjeEGp9OM+yknAPJhSRMx3xaw=;
	b=MgRLxc5M+KNV+vz9/4nJ2xhfAhchv/LlCGIccbXVB4307k072RIHhOhQ1qUgnDU6JDEnJT
	XqWJgiXZPErfqSLliSgPOJCLpyYc7ERZc6SnDuFt5bqq9BgOnxrcO6MJycNaXs2BdfEOq9
	ZVdoCwUXsrKeHmSJTQZ5hpY4V5p8c8c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-WX9a2LzhM9-CJBALR9mUhg-1; Wed, 04 Jan 2023 16:15:05 -0500
X-MC-Unique: WX9a2LzhM9-CJBALR9mUhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8A1E801779;
	Wed,  4 Jan 2023 21:15:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDF84C15BA0;
	Wed,  4 Jan 2023 21:15:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C513F1946594;
	Wed,  4 Jan 2023 21:15:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D49831946597 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 21:15:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AB7BA141511D; Wed,  4 Jan 2023 21:15:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3287140EBF5
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 893EB1818E47
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:02 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-EZyniU78P-eVFjzY_GbgoQ-1; Wed, 04 Jan 2023 16:15:00 -0500
X-MC-Unique: EZyniU78P-eVFjzY_GbgoQ-1
Received: by mail-pl1-f169.google.com with SMTP id c6so3994174pls.4
 for <cluster-devel@redhat.com>; Wed, 04 Jan 2023 13:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ONYMO0PIN9dk55uWmFjeEGp9OM+yknAPJhSRMx3xaw=;
 b=3AM5mUynYwqVHX6A5hQ0eXzR+FDAW22lZNe/gwJbS6C/l5sNtj2cyeyM59oqqmoSJG
 t17bDc4DP4N0xAD02TBmDeq3/YLSm32qSeDvhHWhsTs1Gbrk+Ep+LS2k9sZnk+sqTPnO
 W8uXlJmOxJnF+3v9Ewg0w8QTN0wLKbQcG9rtB5Qg1l2jb3o76jPMy/Kl3EoigiEbUCdC
 pSdFIeL3po1dPVG/Ar1cZtXg9Z3aNm2KvIuamS29nW6+hT1VWsLe8H8G7fGsebcosXv8
 Vj1PBtKMUMVnvB33C+SnHXN+udJQZIraELIQTHsh2+uW/IA3enJhvIDQIWWMbgIsseji
 SIyQ==
X-Gm-Message-State: AFqh2kpQtrOsG1+MHD2cdxm3SlBBzFaLithmRQ3lfnYPhhinTev8oqr3
 DPROatZ19c3u3hS1Wqtt8w0=
X-Google-Smtp-Source: AMrXdXvZLValNoGwSyObnfnQYoAH4bPSeKaHZWatAKcSnlYAPIvL07xJdtB6+9NqIK7AN3tdnyykVg==
X-Received: by 2002:a17:90b:2485:b0:226:b9ed:1788 with SMTP id
 nt5-20020a17090b248500b00226b9ed1788mr2782434pjb.31.1672866899803; 
 Wed, 04 Jan 2023 13:14:59 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:14:59 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:28 -0800
Message-Id: <20230104211448.4804-4-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v5 03/23] filemap: Convert
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
 linux-kernel@vger.kernel.org, Matthew Wilcow <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Converted function to use folios. This is in preparation for the removal
of find_get_pages_range_tag(). This change removes 2 calls to
compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcow (Oracle) <willy@infradead.org>
---
 mm/filemap.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 291bb3e0957a..85adbcf2d9a7 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -503,25 +503,27 @@ static void __filemap_fdatawait_range(struct address_space *mapping,
 {
 	pgoff_t index = start_byte >> PAGE_SHIFT;
 	pgoff_t end = end_byte >> PAGE_SHIFT;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned nr_folios;
+
+	folio_batch_init(&fbatch);
 
-	pagevec_init(&pvec);
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
2.38.1

