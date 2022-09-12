Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00F5B606B
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Sep 2022 20:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663007171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lkGrgC7rGv3gNtROZri1LZJW+W1eletv7YqP1zeCUhw=;
	b=IQIowK9cucdbNf7WXkcWbq6STXkmrcr+qoEg8UgQjxxT+mrC1+YDENfRwxJYDPNNTH37Ip
	fIPhx+fdPNoWHEfLLdqZSW85HFoEmlXAnDPnC2RnI5ziMMpwpQDtcX1SCyCnKilxxsCr9g
	cPuP8PO2Lad+6+9/R2rd9VWxR/HlW0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-ujB5Swr-O4C1sIO93QTnCQ-1; Mon, 12 Sep 2022 14:26:04 -0400
X-MC-Unique: ujB5Swr-O4C1sIO93QTnCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BD4F80A0BC;
	Mon, 12 Sep 2022 18:26:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E82DC15BA5;
	Mon, 12 Sep 2022 18:26:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1FA081946A46;
	Mon, 12 Sep 2022 18:26:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 96EAE1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Sep 2022 18:26:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8AC742166B2A; Mon, 12 Sep 2022 18:26:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8735E2166B26
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:26:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B1A88037AA
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:26:01 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-efQ_SWo1NiizCGf3pA_Q2g-1; Mon, 12 Sep 2022 14:25:59 -0400
X-MC-Unique: efQ_SWo1NiizCGf3pA_Q2g-1
Received: by mail-pj1-f45.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so13182968pja.5
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 11:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lkGrgC7rGv3gNtROZri1LZJW+W1eletv7YqP1zeCUhw=;
 b=LyA+qL1L+KlFAePqmlDHr3/DCMlMGfe6KgzDNQdnNwbVNPytwzBY1BrxHNcKfOTeHv
 WY/fbWZ8PK1+38dJaDob0xJEGNE5qFvfQpYyswTldl1cWd12vh+ZHGV1TJtm9QU2mou2
 DJvzRQZiM0/fmtAspTtFJSakAooZvTI780Cguoyh/JjAy3WeS9AHzoJpiAoWoV3JroaQ
 J1dRqUr40fAuMy83HmdV70D/OwMmy7M8eYdD3cpoLwYqeN3HSzn9lE6ErGNem9HlGh0v
 61WW9A71dxXc56snQpL8QS2u2JS6W9cYPKCFPppy0YSf+79qB4tblcB31tKMMhDme9ef
 m3WA==
X-Gm-Message-State: ACgBeo0kDxir5AbLeOLsrf6HN94UIxqy1wrdoy198j7sUNONqqHBMKBa
 xFvT+tejy/tZP9VF+0SGrcc=
X-Google-Smtp-Source: AA6agR7ugObnvvF7oyQiEw4Z3c3fWFD4/N8jwEvlip2DlQU6J5KyEtNgXLRq2aVr22deGLsWpY1Yvg==
X-Received: by 2002:a17:90b:1d8c:b0:202:abf5:4b21 with SMTP id
 pf12-20020a17090b1d8c00b00202abf54b21mr13212396pjb.162.1663007158527; 
 Mon, 12 Sep 2022 11:25:58 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:58 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:23 -0700
Message-Id: <20220912182224.514561-23-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v2 22/23] nilfs2: Convert
 nilfs_clear_dirty_pages() to use filemap_get_folios_tag()
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
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-kernel@vger.kernel.org,
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

Convert function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/page.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index 5c96084e829f..b66f4e988016 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -358,22 +358,22 @@ void nilfs_copy_back_pages(struct address_space *dmap,
  */
 void nilfs_clear_dirty_pages(struct address_space *mapping, bool silent)
 {
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	unsigned int i;
 	pgoff_t index = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
-	while (pagevec_lookup_tag(&pvec, mapping, &index,
-					PAGECACHE_TAG_DIRTY)) {
-		for (i = 0; i < pagevec_count(&pvec); i++) {
-			struct page *page = pvec.pages[i];
+	while (filemap_get_folios_tag(mapping, &index, (pgoff_t)-1,
+				PAGECACHE_TAG_DIRTY, &fbatch)) {
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			lock_page(page);
-			nilfs_clear_dirty_page(page, silent);
-			unlock_page(page);
+			folio_lock(folio);
+			nilfs_clear_dirty_page(&folio->page, silent);
+			folio_unlock(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.36.1

