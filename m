Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8105B604A
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Sep 2022 20:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663007146;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YET10ng1nR0ea8GMjh+/irz/Zcx26qfqc4LRuHlkdsg=;
	b=O0xUPeOA1k4EOTZhoUP1WwxcoEa3tfeK548t/F0oUPQs66AYSXL9TyNELBAxema3ibg2vX
	MhZTKZ6NdmLXzadY4To/PlQl69y5LrnJ3gtWu91xwRpZ+7PEdaJlAzQPTXvaBqchumGBFn
	OpropJyurenC7xyPkhikEyxQPaYPbcw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-EWOsSXwZPIO_fYC2gkHTFw-1; Mon, 12 Sep 2022 14:25:42 -0400
X-MC-Unique: EWOsSXwZPIO_fYC2gkHTFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80D01101A54E;
	Mon, 12 Sep 2022 18:25:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7422840C6EC2;
	Mon, 12 Sep 2022 18:25:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E3F11946A48;
	Mon, 12 Sep 2022 18:25:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA0F11946A43 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Sep 2022 18:25:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF58F17582; Mon, 12 Sep 2022 18:25:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB66210EB8
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:25:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A30A9802E5D
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:25:39 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-NO4gLYuWOaSnAMxlIgga0w-1; Mon, 12 Sep 2022 14:25:37 -0400
X-MC-Unique: NO4gLYuWOaSnAMxlIgga0w-1
Received: by mail-pl1-f176.google.com with SMTP id jm11so9350601plb.13
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 11:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YET10ng1nR0ea8GMjh+/irz/Zcx26qfqc4LRuHlkdsg=;
 b=WA4zmZ04TRcDLGKXIj9x3v5xTx4gPHAPrBZUyJXMif8AahD2odr9LEPvp9vzOUpqTJ
 8YSnK2z49MnQSlJMTGbwIwKS1HqQb4glzheD5NK8ogmjRQlzCBH1EguEvk/V1MUt2E0f
 ymH4IwXStx+VERDKEXfTeL8aZumel2HdJmi0fBTg5xTJNbF2+RtezAmn9Dpb65DeerNp
 eNBIrnk69O/MEcmsINaQ0HARPi/huvXNZbtNT+PnHwdRcSOFrA7BHD9Kajz1QQnmqjZ+
 x2CNORelYdo47Y53K6yqSMCf+1l2mwL5OzrZr+wM9Ac7XL/vh1rdh85Qu/og5hIlFjWq
 vDzQ==
X-Gm-Message-State: ACgBeo0SNEU7HDcDmOjROJCl7aQr7/gz1tgJ2mOfUNIym+KZPTj8ARrN
 Mqfk6Yfk0TqvdeThGZ7SG3PH9mypB7ALlA==
X-Google-Smtp-Source: AA6agR7XZwnzw2DppXNHM2jt00EgZHgdqYAADme8SoBB2ov63KPo6ZhrqFFvSytcKiLABstme34owQ==
X-Received: by 2002:a17:90a:6783:b0:1fd:ab56:5af7 with SMTP id
 o3-20020a17090a678300b001fdab565af7mr25916929pjj.39.1663007136527; 
 Mon, 12 Sep 2022 11:25:36 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:36 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:10 -0700
Message-Id: <20220912182224.514561-10-vishal.moola@gmail.com>
In-Reply-To: <20220912182224.514561-1-vishal.moola@gmail.com>
References: <20220912182224.514561-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v2 09/23] cifs: Convert
 wdata_alloc_and_fillpages() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use folios. This is in preparation for the removal
of find_get_pages_range_tag(). Now also supports the use of large
folios.

Since tofind might be larger than the max number of folios in a
folio_batch (15), we loop through filling in wdata->pages pulling more
batches until we either reach tofind pages or run out of folios.

This function may not return all pages in the last found folio before
tofind pages are reached.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/cifs/file.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index fa738adc031f..c4da53b57369 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2517,14 +2517,41 @@ wdata_alloc_and_fillpages(pgoff_t tofind, struct address_space *mapping,
 			  unsigned int *found_pages)
 {
 	struct cifs_writedata *wdata;
-
+	struct folio_batch fbatch;
+	unsigned int i, idx, p, nr;
 	wdata = cifs_writedata_alloc((unsigned int)tofind,
 				     cifs_writev_complete);
 	if (!wdata)
 		return NULL;
 
-	*found_pages = find_get_pages_range_tag(mapping, index, end,
-				PAGECACHE_TAG_DIRTY, tofind, wdata->pages);
+	folio_batch_init(&fbatch);
+	*found_pages = 0;
+
+again:
+	nr = filemap_get_folios_tag(mapping, index, end,
+				PAGECACHE_TAG_DIRTY, &fbatch);
+	if (!nr)
+		goto out; /* No dirty pages left in the range */
+
+	for (i = 0; i < nr; i++) {
+		struct folio *folio = fbatch.folios[i];
+
+		idx = 0;
+		p = folio_nr_pages(folio);
+add_more:
+		wdata->pages[*found_pages] = folio_page(folio, idx);
+		if (++*found_pages == tofind) {
+			folio_batch_release(&fbatch);
+			goto out;
+		}
+		if (++idx < p) {
+			folio_ref_inc(folio);
+			goto add_more;
+		}
+	}
+	folio_batch_release(&fbatch);
+	goto again;
+out:
 	return wdata;
 }
 
-- 
2.36.1

