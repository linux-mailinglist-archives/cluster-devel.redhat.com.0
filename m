Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F231616771
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667405500;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CuuU7Td+QUT919J1WnVrpHag/XTS8dO5J3B4LUD/nEI=;
	b=P/XImruy/y5ZIYarN5r3hHRt3LGwqB+K6svZdBeYA8eIQsgOABNOASMxJlwL1OBJBKOTO1
	6jv5Na3B7mf/pc03Ax8WHoHEScmb0sjWOTCsfD2mjDu03YoogLA+jBkdAWGdWgYdZzQf95
	TtcdNaNQvmC7WLCudAihG77d3J2R/pw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-6VU4SyEVNAKWvnpVLvA94Q-1; Wed, 02 Nov 2022 12:11:31 -0400
X-MC-Unique: 6VU4SyEVNAKWvnpVLvA94Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3E56803D49;
	Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C733D40C94CE;
	Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B988419465B2;
	Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 508721946594 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 35B9D492B08; Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8F4492B09
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14EC4185A7A8
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-PNdF7O22MXKMC8IEyKF9Dg-1; Wed, 02 Nov 2022 12:11:26 -0400
X-MC-Unique: PNdF7O22MXKMC8IEyKF9Dg-1
Received: by mail-pj1-f49.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so2557648pjk.2
 for <cluster-devel@redhat.com>; Wed, 02 Nov 2022 09:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CuuU7Td+QUT919J1WnVrpHag/XTS8dO5J3B4LUD/nEI=;
 b=rzhwR9pAESdq6RWQFJVVLG+Weaq0Wt+7n4i6ST6TCPHycEXUGKK7TQEQXPBtfHU1sf
 o8XBldMklZwnCvO/H5qTkaCwDfVSxkYtzcwksZXqZNdGFK+TthlWC+5o3GQ27w5s3lft
 HaqjVptgZ5bvTpw1Kj/qGzoFLYVpgbsotjDyPOZ13gbuHY4Z3u8iEYTMiXKxONWdXTY+
 4DYc5zds2NLXNxstoCBydGgoe4iDUDqgKq1341m4guUBnL7jkzZB4mbeJeOO+PoSodi0
 EvP2M721KO44CnQRAKR3xcAmmrofMT5NdIOAwcXxe4IAf701tmtnh/hh2QFMBOtTDLGY
 I9DA==
X-Gm-Message-State: ACrzQf0ESv7xFWHVdE0/VBi8ati4gZTlByWNCptEH4VLqWkcDTpZzLO0
 s0LfBLm5jessHV3G0mjlziI=
X-Google-Smtp-Source: AMsMyM6I93ORgky9kjhOIjyftY7R2MXJmfWgHu6+CPmBQIrkt50BHJL8QLvp13RkJJ928M5oxPKLmA==
X-Received: by 2002:a17:902:aa02:b0:186:9395:4e82 with SMTP id
 be2-20020a170902aa0200b0018693954e82mr26138278plb.5.1667405485482; 
 Wed, 02 Nov 2022 09:11:25 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:25 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:20 -0700
Message-Id: <20221102161031.5820-13-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v4 12/23] f2fs: Convert
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
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, Chao Yu <chao@kernel.org>,
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

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e8b72336c096..a2f477cc48c7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1887,17 +1887,18 @@ static bool flush_dirty_inode(struct page *page)
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
@@ -1924,7 +1925,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 			}
 			unlock_page(page);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.38.1

