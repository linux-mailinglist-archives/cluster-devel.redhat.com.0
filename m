Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB3601988
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666038316;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VPyaEfnfsN/s28KIqk5JK9av//7f4plsWX6QMWBWYvw=;
	b=T4yxTOwXmXFww8CKyrvmMsw2HW204oFumaEARlWZ5Bjh5aFYIFhxulAp2beVmOYeyapWNL
	hCxRcl3GZLR43apdlvpluvKFXlYPRp+jqHzIX6AJUtYb3bYa9bEczHr3uw/FovZUn3wVJt
	ZOkmZBdlbmxCXvVe474HCQCWUcClHV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-HkeGvwVqN2Wu4MAaEAdLSw-1; Mon, 17 Oct 2022 16:25:13 -0400
X-MC-Unique: HkeGvwVqN2Wu4MAaEAdLSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75FB587B2A2;
	Mon, 17 Oct 2022 20:25:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6ADE4112131E;
	Mon, 17 Oct 2022 20:25:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5F1F01946597;
	Mon, 17 Oct 2022 20:25:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEDA9194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 17 Oct 2022 20:25:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C1B0940398B1; Mon, 17 Oct 2022 20:25:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9F43414A815
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 20:25:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A03378027EC
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 20:25:10 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-6bQfDMnvOjKKCz3bkqbCng-2; Mon, 17 Oct 2022 16:25:07 -0400
X-MC-Unique: 6bQfDMnvOjKKCz3bkqbCng-2
Received: by mail-pj1-f49.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so12039644pjb.2
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 13:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPyaEfnfsN/s28KIqk5JK9av//7f4plsWX6QMWBWYvw=;
 b=LMivKig6xeUjwHDXmaq6XOuzTZ9DhqrHx3E6ZcvBkQVudML/zb4AweWs615qkV1JwB
 126H3bsk3KrV+vhcNVB5ijmHrKYOm24G30vNltjvJC6mDlwdRd2/CR30bSkyIO7gjKfb
 gBNxNsZT64bFpbvbPgyrTGcW+to7pHe7TXjLJKHgKO8RjWIpowmIwMgjkxAp0OXnI8aO
 6v8BTGiHgBHCE//KAUtvVSPpeZhvXRxmClYmXqypCPr7viUBVBKV770DVfYWvxNGa5Q1
 435SwMy/uoTBJg/6fZo85YnAXDMwKxKd2nuIsU+NsIRZmLZVUtYz+ruwGpckk0Rfw0aI
 fbAQ==
X-Gm-Message-State: ACrzQf0SuHLT43yyMIjqGZ2/waJIN4ivpTsUY7yxrjNKo/QJX2A6w6El
 4P4FaCH7aIrmbT42US66Pts=
X-Google-Smtp-Source: AMsMyM7v1A0Nwi1EfmmDwlAxUHQ5Y+/Mfh5CmuQv94z7lhNxS6TEescrW3W2GC19QPdRPdkxp8Fsag==
X-Received: by 2002:a17:90a:4216:b0:20d:2891:157 with SMTP id
 o22-20020a17090a421600b0020d28910157mr35557408pjg.47.1666038307198; 
 Mon, 17 Oct 2022 13:25:07 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:06 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:41 -0700
Message-Id: <20221017202451.4951-14-vishal.moola@gmail.com>
In-Reply-To: <20221017202451.4951-1-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v3 13/23] f2fs: Convert
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
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a2f477cc48c7..38f32b4d61dc 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1935,23 +1935,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
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
@@ -2026,7 +2027,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (--wbc->nr_to_write == 0)
 				break;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 
 		if (wbc->nr_to_write == 0) {
-- 
2.36.1

