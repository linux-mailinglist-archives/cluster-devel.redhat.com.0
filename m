Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0EA5AA8FA
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Sep 2022 09:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662104568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=STxbhiL9IoQUx8Fgwja3LTFavGfQLVFycqxgyDfQIlo=;
	b=acdcL6AQYRQsaFfGCA6RWKSle9ImOZAYZZy2LoOB3waBWbOgYtONCAeFFWIo8CewlIsehD
	YSuLgPFQuzpnvlrv2LRsWCrAkpEB5RXlwc0Qy2q0g/agbGE9Bdv3TiQS9Z0G+b/neQi+Ga
	XY4mk4d1zmPTdfhASolpE0ASCyPA6UA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-WLfV0DNcPgqyjkKLDHO2-w-1; Fri, 02 Sep 2022 03:42:45 -0400
X-MC-Unique: WLfV0DNcPgqyjkKLDHO2-w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6437A1C09CA9;
	Fri,  2 Sep 2022 07:42:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E625F492C3B;
	Fri,  2 Sep 2022 07:42:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2946A1940375;
	Fri,  2 Sep 2022 07:42:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9C7D919426AB for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 22:03:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 720464010FA0; Thu,  1 Sep 2022 22:03:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E101403D0D9
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:03:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FA813800C40
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 22:03:10 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-msUOPSnMMDao0NjodYxSTQ-2; Thu, 01 Sep 2022 18:03:01 -0400
X-MC-Unique: msUOPSnMMDao0NjodYxSTQ-2
Received: by mail-pj1-f53.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so3724659pjq.3
 for <cluster-devel@redhat.com>; Thu, 01 Sep 2022 15:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=STxbhiL9IoQUx8Fgwja3LTFavGfQLVFycqxgyDfQIlo=;
 b=kmLkv6TUTgjcGpHzizG6jJQ2qTwbzrmVr3NuUV4Rwk+ZmU0ajwpLiBDFHv316mYPDe
 C+3op13lihxXqKliLrwmX6EAeSMblS7IvR7UctEj6DqBz5O3F/z7uRzJ7WhbbhqUeIzP
 l82O3lJpfBevWxn9jZ5XGvMRHIFPU32lDsM+VuGX9ksFcsaayaRUrbzmBkBYneiHnzbr
 Spxmh3nFlNhDJSuwRFqqMjlgOSxT+ct0bfsgqnp64Sqdp33NGo7q65mmp8fd4redZwqK
 I01BlNqgqeoq699ymcU127XGpMuZOC5qLpPhUyL1p8AGpo0Y1oFS2KKwj7JMhlGK5aeJ
 Q+jA==
X-Gm-Message-State: ACgBeo0zn5EklKARH7PS/8rAAiUH9LmWjaN+85MW/56v8dVjiZyVVC+N
 9123yjMT8aEeRGGdCPTlHmwbPdv/iKBzCQ==
X-Google-Smtp-Source: AA6agR5hhXeukBftcpo4uj8qt2S1ZJNE07BNY5BMKr4j8Hs713UO7OgYoXkgvfwPLmscDaOkJk3Q/A==
X-Received: by 2002:a17:90b:212:b0:1fd:e61b:866a with SMTP id
 fy18-20020a17090b021200b001fde61b866amr1263582pjb.141.1662069780541; 
 Thu, 01 Sep 2022 15:03:00 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:03:00 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:33 -0700
Message-Id: <20220901220138.182896-19-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Fri, 02 Sep 2022 07:42:41 +0000
Subject: [Cluster-devel] [PATCH 18/23] nilfs2: Convert
 nilfs_lookup_dirty_data_buffers() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/nilfs2/segment.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 0afe0832c754..e95c667bdc8f 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -680,7 +680,7 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
 					      loff_t start, loff_t end)
 {
 	struct address_space *mapping = inode->i_mapping;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	pgoff_t index = 0, last = ULONG_MAX;
 	size_t ndirties = 0;
 	int i;
@@ -694,23 +694,26 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
 		index = start >> PAGE_SHIFT;
 		last = end >> PAGE_SHIFT;
 	}
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
  repeat:
 	if (unlikely(index > last) ||
-	    !pagevec_lookup_range_tag(&pvec, mapping, &index, last,
-				PAGECACHE_TAG_DIRTY))
+	      !filemap_get_folios_tag(mapping, &index, last,
+		      PAGECACHE_TAG_DIRTY, &fbatch))
 		return ndirties;
 
-	for (i = 0; i < pagevec_count(&pvec); i++) {
+	for (i = 0; i < folio_batch_count(&fbatch); i++) {
 		struct buffer_head *bh, *head;
-		struct page *page = pvec.pages[i];
+		struct folio *folio = fbatch.folios[i];
 
-		lock_page(page);
-		if (!page_has_buffers(page))
-			create_empty_buffers(page, i_blocksize(inode), 0);
-		unlock_page(page);
+		head = folio_buffers(folio);
+		folio_lock(folio);
+		if (!head) {
+			create_empty_buffers(&folio->page, i_blocksize(inode), 0);
+			head = folio_buffers(folio);
+		}
+		folio_unlock(folio);
 
-		bh = head = page_buffers(page);
+		bh = head;
 		do {
 			if (!buffer_dirty(bh) || buffer_async_write(bh))
 				continue;
@@ -718,13 +721,13 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
 			list_add_tail(&bh->b_assoc_buffers, listp);
 			ndirties++;
 			if (unlikely(ndirties >= nlimit)) {
-				pagevec_release(&pvec);
+				folio_batch_release(&fbatch);
 				cond_resched();
 				return ndirties;
 			}
 		} while (bh = bh->b_this_page, bh != head);
 	}
-	pagevec_release(&pvec);
+	folio_batch_release(&fbatch);
 	cond_resched();
 	goto repeat;
 }
-- 
2.36.1

