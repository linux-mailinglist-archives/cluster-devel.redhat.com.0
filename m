Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F0C61676F
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667405500;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UZvXQK7eydj6IBrzU3IQ20y8xajH5CKQhE5ttfKWvGg=;
	b=DpoUpIp5V/0/Q/TY+7kwCdvbZv0dBPLXXLQXiyITZS0AK1YyY/rFBgG6IoCN8qMS+MBaCY
	u3ydrphzN+gpeJtJkg/vUyvXXiX7Gmu3EhX3680Ys69/yoJymv+k6FeOFSSweUYpA8MqU8
	CLyWUlYoGYREYsgM1ShOP5rVzdLNGIQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-htJN2CEgNeqPxduz2QsFQA-1; Wed, 02 Nov 2022 12:11:35 -0400
X-MC-Unique: htJN2CEgNeqPxduz2QsFQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B6D23C0F674;
	Wed,  2 Nov 2022 16:11:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F6381121314;
	Wed,  2 Nov 2022 16:11:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0292E19465B3;
	Wed,  2 Nov 2022 16:11:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C375A19465B2 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Nov 2022 16:11:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8C2D1121320; Wed,  2 Nov 2022 16:11:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0B641121314
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D7E12A5955A
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-fF7ITxION46__Glem5V9gg-1; Wed, 02 Nov 2022 12:11:30 -0400
X-MC-Unique: fF7ITxION46__Glem5V9gg-1
Received: by mail-pf1-f171.google.com with SMTP id m6so16863017pfb.0
 for <cluster-devel@redhat.com>; Wed, 02 Nov 2022 09:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZvXQK7eydj6IBrzU3IQ20y8xajH5CKQhE5ttfKWvGg=;
 b=qnbFvsNVmyRcUrdd+jzI39Wc6JwpCK0KQ8FCyFICzxjSu/V5IXlfZxPmwV+F64eXru
 xe1nFst3Q5m/O0IkhnUu8spkBqGWB16gq/eEI9f4Xu4+k2OhxbRP3pZHU5EaLqpDodok
 I2aDFbul+DHeE3Il7kcdBfcp8hKWHnDlzK2Hoy8a8MypIWqcWW4BpsMy2vE5US4ehIj3
 H4MSvRORWlcF5cXJsWDmYEqlsKa8FcsNn4u1wBzVTnaAeqHIRTAIGTtJZgFWWWRhTwNQ
 eHVrex1iBMQh2O3q4S8J0lt2OWBZ9jS3Y5dFHZNC3fLndKcfSBphiKiNqRq2O4u13JI6
 PZEw==
X-Gm-Message-State: ACrzQf1t2nOmMqaZ++s8CgE7KZUKPpF60sAp+aKC3jW6vJ+EvjMM6jVT
 dUEgcEhz2kplmYF7art1xSs=
X-Google-Smtp-Source: AMsMyM4Mu8mWuuJ9LsgyTXKiaDYuEixqiDshaCcEnGHSJqDXPNt4rQCX6PHQQ4mtu+d6jEWOcHwjbw==
X-Received: by 2002:a05:6a00:999:b0:56c:3d0d:96fe with SMTP id
 u25-20020a056a00099900b0056c3d0d96femr26077443pfg.12.1667405489645; 
 Wed, 02 Nov 2022 09:11:29 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:29 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:23 -0700
Message-Id: <20221102161031.5820-16-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v4 15/23] f2fs: Convert last_fsync_dnode()
 to use filemap_get_folios_tag()
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

Convert to use a folio_batch instead of pagevec. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/node.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 38f32b4d61dc..3e1764960a96 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1515,23 +1515,24 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	pgoff_t index;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	struct page *last_page = NULL;
-	int nr_pages;
+	int nr_folios;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	index = 0;
 
-	while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
-				PAGECACHE_TAG_DIRTY))) {
+	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
+					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+					&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 
 			if (unlikely(f2fs_cp_error(sbi))) {
 				f2fs_put_page(last_page, 0);
-				pagevec_release(&pvec);
+				folio_batch_release(&fbatch);
 				return ERR_PTR(-EIO);
 			}
 
@@ -1562,7 +1563,7 @@ static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 			last_page = page;
 			unlock_page(page);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	return last_page;
-- 
2.38.1

