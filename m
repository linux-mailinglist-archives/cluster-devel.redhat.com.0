Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF55AA900
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Sep 2022 09:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662104578;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u20IhbDv0xijuh3aR+8LlcuRg0PXYMjLK8O6VaTOmnk=;
	b=Tws65+U0hQBTilPNMDQaBAvmzghCWgnsXfjQE1t/W0bB/iveDy4eGJB9FrE/55VzfUB6nz
	PNgioO2WKG+DxeFpVlag6vS0f3gYH9+HZnqF7hmHOcjIn9FzQH2OUtQiupn7ALTM1Fdo9u
	gceIz47xjMmb6w18S+5YlmJYDph5A+M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-68WOGD4RMVOBuqb-GBJiBg-1; Fri, 02 Sep 2022 03:42:45 -0400
X-MC-Unique: 68WOGD4RMVOBuqb-GBJiBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53AF818A652B;
	Fri,  2 Sep 2022 07:42:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 457C32026D07;
	Fri,  2 Sep 2022 07:42:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DB9B41940375;
	Fri,  2 Sep 2022 07:42:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 73F8A19426AB for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 22:02:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 59305112131E; Thu,  1 Sep 2022 22:02:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5593C1121314
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:02:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3965A85A58D
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:02:57 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-9hRRRCvRMtuoSV-IzJWqfw-2; Thu, 01 Sep 2022 18:02:55 -0400
X-MC-Unique: 9hRRRCvRMtuoSV-IzJWqfw-2
Received: by mail-pj1-f47.google.com with SMTP id mj6so280896pjb.1
 for <cluster-devel@redhat.com>; Thu, 01 Sep 2022 15:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u20IhbDv0xijuh3aR+8LlcuRg0PXYMjLK8O6VaTOmnk=;
 b=POLNS2+3l9RbYxiBAXd/xoMTPz6P/pyX3NeuATeRcKWHAcZqH1KYIDJmXHsXvVGbGi
 ARBImjUjMeGrrPAGd7uz8SRa5/AjAgDl9EIyfJnnUnzP/lh02sI8+8LC+bD40Fdr/lwt
 UTJ6dWPcJsoIFZyqQthzJNE2ss7hZF8SopfUPBJOHeK0r435aMv2c6jj3z16ZiOEzEka
 F6+7Dw/T1IEs/1Hq3uX5xrAlwJGVDCr1LsimJz8Kpx6DxeVwN2/VCKhCeuahWeZXJPQJ
 1guj+/X/1zvaSYxOVl2eSUiTXAIfg0/XMnpIasUHXu4jzYSAWQxzKFF5Pjj4vi4OT3Db
 tWjg==
X-Gm-Message-State: ACgBeo20ZQtuxJ8cTVU/8EMB23hjazU2B83BjZEar1Q4y8XXR8gnHZoV
 5+wONyp4s3ubdYchFdPQy+c=
X-Google-Smtp-Source: AA6agR6waYxvrYNGIdcgKs1/5thmnL5sLZmkmkWnOmiGx8YnNG4rEDeB7g25We+tjW8/c4dzFDCXuQ==
X-Received: by 2002:a17:90a:5996:b0:1fb:fb6:2adc with SMTP id
 l22-20020a17090a599600b001fb0fb62adcmr1264771pji.177.1662069774825; 
 Thu, 01 Sep 2022 15:02:54 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:54 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:29 -0700
Message-Id: <20220901220138.182896-15-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Fri, 02 Sep 2022 07:42:41 +0000
Subject: [Cluster-devel] [PATCH 14/23] f2fs: Convert
 f2fs_write_cache_pages() to use filemap_get_folios_tag()
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

Converted the function to use folios. This is in preparation for the
removal of find_get_pages_range_tag().

Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
of pagevec. This does NOT support large folios. The function currently
only utilizes folios of size 1 so this shouldn't cause any issues right
now.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/compress.c | 13 ++++-----
 fs/f2fs/data.c     | 67 +++++++++++++++++++++++++---------------------
 fs/f2fs/f2fs.h     |  5 ++--
 3 files changed, 46 insertions(+), 39 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 70e97075e535..e1bd2e859f64 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -841,10 +841,11 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
-				int index, int nr_pages, bool uptodate)
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc,
+				struct folio_batch *fbatch,
+				int index, int nr_folios, bool uptodate)
 {
-	unsigned long pgidx = pages[index]->index;
+	unsigned long pgidx = fbatch->folios[index]->index;
 	int i = uptodate ? 0 : 1;
 
 	/*
@@ -854,13 +855,13 @@ bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 	if (uptodate && (pgidx % cc->cluster_size))
 		return false;
 
-	if (nr_pages - index < cc->cluster_size)
+	if (nr_folios - index < cc->cluster_size)
 		return false;
 
 	for (; i < cc->cluster_size; i++) {
-		if (pages[index + i]->index != pgidx + i)
+		if (fbatch->folios[index + i]->index != pgidx + i)
 			return false;
-		if (uptodate && !PageUptodate(pages[index + i]))
+		if (uptodate && !folio_test_uptodate(fbatch->folios[index + i]))
 			return false;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index aa3ccddfa037..f87b9644b10b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2917,7 +2917,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 {
 	int ret = 0;
 	int done = 0, retry = 0;
-	struct page *pages[F2FS_ONSTACK_PAGES];
+	struct folio_batch fbatch;
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
 	struct bio *bio = NULL;
 	sector_t last_block;
@@ -2938,7 +2938,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		.private = NULL,
 	};
 #endif
-	int nr_pages;
+	int nr_folios;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
@@ -2948,6 +2948,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int submitted = 0;
 	int i;
 
+	folio_batch_init(&fbatch);
+
 	if (get_dirty_pages(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
@@ -2973,13 +2975,13 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && !retry && (index <= end)) {
-		nr_pages = find_get_pages_range_tag(mapping, &index, end,
-				tag, F2FS_ONSTACK_PAGES, pages);
-		if (nr_pages == 0)
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				tag, &fbatch);
+		if (nr_folios == 0)
 			break;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 			bool need_readd;
 readd:
 			need_readd = false;
@@ -2996,7 +2998,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				}
 
 				if (!f2fs_cluster_can_merge_page(&cc,
-								page->index)) {
+								folio->index)) {
 					ret = f2fs_write_multi_pages(&cc,
 						&submitted, wbc, io_type);
 					if (!ret)
@@ -3005,27 +3007,28 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				}
 
 				if (unlikely(f2fs_cp_error(sbi)))
-					goto lock_page;
+					goto lock_folio;
 
 				if (!f2fs_cluster_is_empty(&cc))
-					goto lock_page;
+					goto lock_folio;
 
 				if (f2fs_all_cluster_page_ready(&cc,
-					pages, i, nr_pages, true))
+					&fbatch, i, nr_pages, true))
 					goto lock_page;
 
 				ret2 = f2fs_prepare_compress_overwrite(
 							inode, &pagep,
-							page->index, &fsdata);
+							folio->index, &fsdata);
 				if (ret2 < 0) {
 					ret = ret2;
 					done = 1;
 					break;
 				} else if (ret2 &&
 					(!f2fs_compress_write_end(inode,
-						fsdata, page->index, 1) ||
+						fsdata, folio->index, 1) ||
 					 !f2fs_all_cluster_page_ready(&cc,
-						pages, i, nr_pages, false))) {
+						&fbatch, i, nr_folios,
+						false))) {
 					retry = 1;
 					break;
 				}
@@ -3038,46 +3041,47 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				break;
 			}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-lock_page:
+lock_folio:
 #endif
-			done_index = page->index;
+			done_index = folio->index;
 retry_write:
-			lock_page(page);
+			folio_lock(folio);
 
-			if (unlikely(page->mapping != mapping)) {
+			if (unlikely(folio->mapping != mapping)) {
 continue_unlock:
-				unlock_page(page);
+				folio_unlock(folio);
 				continue;
 			}
 
-			if (!PageDirty(page)) {
+			if (!folio_test_dirty(folio)) {
 				/* someone wrote it for us */
 				goto continue_unlock;
 			}
 
-			if (PageWriteback(page)) {
+			if (folio_test_writeback(folio)) {
 				if (wbc->sync_mode != WB_SYNC_NONE)
-					f2fs_wait_on_page_writeback(page,
+					f2fs_wait_on_page_writeback(
+							&folio->page,
 							DATA, true, true);
 				else
 					goto continue_unlock;
 			}
 
-			if (!clear_page_dirty_for_io(page))
+			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 			if (f2fs_compressed_file(inode)) {
-				get_page(page);
-				f2fs_compress_ctx_add_page(&cc, page);
+				folio_get(folio);
+				f2fs_compress_ctx_add_page(&cc, &folio->page);
 				continue;
 			}
 #endif
-			ret = f2fs_write_single_data_page(page, &submitted,
-					&bio, &last_block, wbc, io_type,
-					0, true);
+			ret = f2fs_write_single_data_page(&folio->page,
+					&submitted, &bio, &last_block,
+					wbc, io_type, 0, true);
 			if (ret == AOP_WRITEPAGE_ACTIVATE)
-				unlock_page(page);
+				folio_unlock(folio);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 result:
 #endif
@@ -3101,7 +3105,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					}
 					goto next;
 				}
-				done_index = page->index + 1;
+				done_index = folio->index +
+					folio_nr_pages(folio);
 				done = 1;
 				break;
 			}
@@ -3115,7 +3120,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (need_readd)
 				goto readd;
 		}
-		release_pages(pages, nr_pages);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3c7cdb70fe2e..dcb28240f724 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4196,8 +4196,9 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 				block_t blkaddr, bool in_task);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
-				int index, int nr_pages, bool uptodate);
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc,
+		struct folio_batch *fbatch, int index, int nr_folios,
+		bool uptodate);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
-- 
2.36.1

