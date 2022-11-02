Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F86167AC
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Nov 2022 17:14:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667405641;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K9oQGBma55+7a0HBQARXA8wNbnmnkmU7HtFBuB0SMcU=;
	b=a0CFUk9WkDURHlA+PltqSgVoh+YY+v/stwN/bubcPCheqWMZ1qNMtMjxTG5O97WZXVn4YX
	1EmXSLWXYrkXOsAzEFL9mFcEo0HDlBnSHTI3ZFflF9t6Zjd9xCPkB4bSDlQE4LI6CiqWar
	5/Z8DITYkX2Vjt2Yo9RsGSC9AgYQ1VM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-LS11tEMhPqSJmxx62xMOjA-1; Wed, 02 Nov 2022 12:13:22 -0400
X-MC-Unique: LS11tEMhPqSJmxx62xMOjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F105F811E75;
	Wed,  2 Nov 2022 16:11:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E630A2166B2B;
	Wed,  2 Nov 2022 16:11:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C917019465B2;
	Wed,  2 Nov 2022 16:11:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 496871946594 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Nov 2022 16:11:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F05D40C2086; Wed,  2 Nov 2022 16:11:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36AB740C2065
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BBE6811E75
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-Dr5szXlkMt6vWqwSyzF1rw-1; Wed, 02 Nov 2022 12:11:22 -0400
X-MC-Unique: Dr5szXlkMt6vWqwSyzF1rw-1
Received: by mail-pl1-f179.google.com with SMTP id u6so17009567plq.12
 for <cluster-devel@redhat.com>; Wed, 02 Nov 2022 09:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9oQGBma55+7a0HBQARXA8wNbnmnkmU7HtFBuB0SMcU=;
 b=Ecr9fgFL7E7XUTMinmoPqdruP02JiCXmogUQbthBu2C5WEUbWWhT+cA/gSGif/BnAN
 kpqZ1WK84s8i8fKTBpXuvz0W49hrpesJHc583DEkfWt+P7MdqZxR+yN+dbJZAb80reVF
 8M5O4azPjxzlAqjCLGfbdX1Bnj5E2061Lpg1Y6i5B80D6gKQuAlGTsg+kb1jn+H8NSo3
 +6x6EMvw1GQBdjiTwzF3woMdNzqQEDn1sJGRvzomyD31yS1R2M2cqUHOZLPs5uV9j0Wx
 tTo4ZLCTv6yPYLoFu0d2VdthXowWzw/7MwbHN78slPOKcQ+C8Ml9hP5Co/wOiwGnVi2z
 XIvA==
X-Gm-Message-State: ACrzQf2NlPEfMV6cA0Smicyk6bFXDFTZrxk1yVLAhI/UwpGtUtNOCMbP
 qS0B235d+nWB2K5Q5Defsps=
X-Google-Smtp-Source: AMsMyM6/72+MYEmeobRp0nXOdIc9AWtvXPDkE1Loq96kr4fO9Vd06b8/zC8fQ3xgY4YxH0AYxNXhtQ==
X-Received: by 2002:a17:90a:3c8a:b0:213:8043:4b7f with SMTP id
 g10-20020a17090a3c8a00b0021380434b7fmr34554910pjc.99.1667405480651; 
 Wed, 02 Nov 2022 09:11:20 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:20 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:17 -0700
Message-Id: <20221102161031.5820-10-vishal.moola@gmail.com>
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH v4 09/23] cifs: Convert
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This is in preparation for the removal of find_get_pages_range_tag(). Now also
supports the use of large folios.

Since tofind might be larger than the max number of folios in a
folio_batch (15), we loop through filling in wdata->pages pulling more
batches until we either reach tofind pages or run out of folios.

This function may not return all pages in the last found folio before
tofind pages are reached.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/cifs/file.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index f6ffee514c34..789fd0397cb4 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2520,14 +2520,40 @@ wdata_alloc_and_fillpages(pgoff_t tofind, struct address_space *mapping,
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
+		folio_ref_inc(folio);
+		if (++*found_pages == tofind) {
+			folio_batch_release(&fbatch);
+			goto out;
+		}
+		if (++idx < p)
+			goto add_more;
+	}
+	folio_batch_release(&fbatch);
+	goto again;
+out:
 	return wdata;
 }
 
-- 
2.38.1

