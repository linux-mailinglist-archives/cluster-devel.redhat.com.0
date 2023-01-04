Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3D465DE36
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672866918;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wfZkCFUzCyr5OXa7ytE85YOM9f5TCt/N2uJtwdJBiOM=;
	b=dL+lSqDKZjQaGnh7IrAszwZYW8/PMYayZxgCDtMdRoKY8rfDBjkn0ITDWrZgMp8U0JLlhH
	bxOEbwzeIbIkNyNtjg3okiOSLPllcBquHkgbpCTaFDB6Prxy06puJRuUZMc9FtxhGIQq0w
	dRSfFXHLYQUqfP+W5k5Y8fJgJwFuqoU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-mq87jtK2P0iFo7zGLTH83A-1; Wed, 04 Jan 2023 16:15:15 -0500
X-MC-Unique: mq87jtK2P0iFo7zGLTH83A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AAD21C0A596;
	Wed,  4 Jan 2023 21:15:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EBD040C2064;
	Wed,  4 Jan 2023 21:15:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0636D1946594;
	Wed,  4 Jan 2023 21:15:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 47FB01946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 21:15:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3AD1139D6D; Wed,  4 Jan 2023 21:15:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32CC435455
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 187F080234E
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:13 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-3zmkqbZ8NS2pkfQDJGGrIw-2; Wed, 04 Jan 2023 16:15:08 -0500
X-MC-Unique: 3zmkqbZ8NS2pkfQDJGGrIw-2
Received: by mail-pl1-f173.google.com with SMTP id c2so9656792plc.5
 for <cluster-devel@redhat.com>; Wed, 04 Jan 2023 13:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfZkCFUzCyr5OXa7ytE85YOM9f5TCt/N2uJtwdJBiOM=;
 b=5Zw20spnvLLGX25TxNPkY2Ka0VFgtjc10nQN/Sva2CRf20npPspzxcXaEQKzQUHfs9
 YJcKbfe9/4TW76p/HtWWuFqLotRy5wWehiN90NCdPVA4NaweDTTdfNhUBGbsrmWa4B2X
 /cqY+VPT1CRRntom045hofeGk5SL4b1uOnJ9l9QFEtqOzV+9lRudAn69Qcxb+08/EsLt
 H++2CBF7zdfGBcCsLtx4hTE8hppp/MIv23e3Dx0nCI8SkKefLYSMzCZU1PxgLkKp994Q
 MC6e+dkKS/pToGL5Cxk+r5nvdZwihgvCUisElAj7qtcMeHdeKHQqHaQx1EJMpbuWzKjo
 HUeQ==
X-Gm-Message-State: AFqh2kpmnuJASXKjECj66uG7MdmVZxOWxutcHkOQkFQWROrrYYPKfmPa
 /f2OHjHziHyyOoUygiyrOGs=
X-Google-Smtp-Source: AMrXdXtAkt1PiXf89KpZT/PVVs6pHX6w2TYw+klecmBeo8HqViRecFRkPGwHQvT7jR7OxpCa8lhGxg==
X-Received: by 2002:a17:90a:5d08:b0:219:4578:6409 with SMTP id
 s8-20020a17090a5d0800b0021945786409mr52643871pji.41.1672866907758; 
 Wed, 04 Jan 2023 13:15:07 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:07 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:33 -0800
Message-Id: <20230104211448.4804-9-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5 08/23] ceph: Convert
 ceph_writepages_start() to use filemap_get_folios_tag()
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Also some minor renaming for consistency.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 58 ++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 8c74871e37c9..905268bf9741 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -792,7 +792,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 	struct ceph_vino vino = ceph_vino(inode);
 	pgoff_t index, start_index, end = -1;
 	struct ceph_snap_context *snapc = NULL, *last_snapc = NULL, *pgsnapc;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	int rc = 0;
 	unsigned int wsize = i_blocksize(inode);
 	struct ceph_osd_request *req = NULL;
@@ -821,7 +821,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 	if (fsc->mount_options->wsize < wsize)
 		wsize = fsc->mount_options->wsize;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
 	start_index = wbc->range_cyclic ? mapping->writeback_index : 0;
 	index = start_index;
@@ -869,7 +869,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 
 	while (!done && index <= end) {
 		int num_ops = 0, op_idx;
-		unsigned i, pvec_pages, max_pages, locked_pages = 0;
+		unsigned i, nr_folios, max_pages, locked_pages = 0;
 		struct page **pages = NULL, **data_pages;
 		struct page *page;
 		pgoff_t strip_unit_end = 0;
@@ -879,13 +879,13 @@ static int ceph_writepages_start(struct address_space *mapping,
 		max_pages = wsize >> PAGE_SHIFT;
 
 get_more_pages:
-		pvec_pages = pagevec_lookup_range_tag(&pvec, mapping, &index,
-						end, PAGECACHE_TAG_DIRTY);
-		dout("pagevec_lookup_range_tag got %d\n", pvec_pages);
-		if (!pvec_pages && !locked_pages)
+		nr_folios = filemap_get_folios_tag(mapping, &index,
+				end, PAGECACHE_TAG_DIRTY, &fbatch);
+		dout("pagevec_lookup_range_tag got %d\n", nr_folios);
+		if (!nr_folios && !locked_pages)
 			break;
-		for (i = 0; i < pvec_pages && locked_pages < max_pages; i++) {
-			page = pvec.pages[i];
+		for (i = 0; i < nr_folios && locked_pages < max_pages; i++) {
+			page = &fbatch.folios[i]->page;
 			dout("? %p idx %lu\n", page, page->index);
 			if (locked_pages == 0)
 				lock_page(page);  /* first page */
@@ -995,7 +995,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				len = 0;
 			}
 
-			/* note position of first page in pvec */
+			/* note position of first page in fbatch */
 			dout("%p will write page %p idx %lu\n",
 			     inode, page, page->index);
 
@@ -1005,30 +1005,30 @@ static int ceph_writepages_start(struct address_space *mapping,
 				fsc->write_congested = true;
 
 			pages[locked_pages++] = page;
-			pvec.pages[i] = NULL;
+			fbatch.folios[i] = NULL;
 
 			len += thp_size(page);
 		}
 
 		/* did we get anything? */
 		if (!locked_pages)
-			goto release_pvec_pages;
+			goto release_folios;
 		if (i) {
 			unsigned j, n = 0;
-			/* shift unused page to beginning of pvec */
-			for (j = 0; j < pvec_pages; j++) {
-				if (!pvec.pages[j])
+			/* shift unused page to beginning of fbatch */
+			for (j = 0; j < nr_folios; j++) {
+				if (!fbatch.folios[j])
 					continue;
 				if (n < j)
-					pvec.pages[n] = pvec.pages[j];
+					fbatch.folios[n] = fbatch.folios[j];
 				n++;
 			}
-			pvec.nr = n;
+			fbatch.nr = n;
 
-			if (pvec_pages && i == pvec_pages &&
+			if (nr_folios && i == nr_folios &&
 			    locked_pages < max_pages) {
-				dout("reached end pvec, trying for more\n");
-				pagevec_release(&pvec);
+				dout("reached end fbatch, trying for more\n");
+				folio_batch_release(&fbatch);
 				goto get_more_pages;
 			}
 		}
@@ -1164,10 +1164,10 @@ static int ceph_writepages_start(struct address_space *mapping,
 		if (wbc->nr_to_write <= 0 && wbc->sync_mode == WB_SYNC_NONE)
 			done = true;
 
-release_pvec_pages:
-		dout("pagevec_release on %d pages (%p)\n", (int)pvec.nr,
-		     pvec.nr ? pvec.pages[0] : NULL);
-		pagevec_release(&pvec);
+release_folios:
+		dout("folio_batch release on %d folios (%p)\n", (int)fbatch.nr,
+		     fbatch.nr ? fbatch.folios[0] : NULL);
+		folio_batch_release(&fbatch);
 	}
 
 	if (should_loop && !done) {
@@ -1184,15 +1184,17 @@ static int ceph_writepages_start(struct address_space *mapping,
 			unsigned i, nr;
 			index = 0;
 			while ((index <= end) &&
-			       (nr = pagevec_lookup_tag(&pvec, mapping, &index,
-						PAGECACHE_TAG_WRITEBACK))) {
+			       (nr = filemap_get_folios_tag(mapping, &index,
+						(pgoff_t)-1,
+						PAGECACHE_TAG_WRITEBACK,
+						&fbatch))) {
 				for (i = 0; i < nr; i++) {
-					page = pvec.pages[i];
+					page = &fbatch.folios[i]->page;
 					if (page_snap_context(page) != snapc)
 						continue;
 					wait_on_page_writeback(page);
 				}
-				pagevec_release(&pvec);
+				folio_batch_release(&fbatch);
 				cond_resched();
 			}
 		}
-- 
2.38.1

