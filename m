Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B20616783
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667405506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BlC7rcv7uN/Ok17R0azuMVwGkvRCqLRr8I16XJ1l0Zg=;
	b=Hc83p52pqfYMCiXGWPwBeQuieYeyLKSuFxS7pJY2H2qkMEOuroPvIisFg8kZLF6bcgij5L
	PVNvTHunfXfdRfRudfv8vpz5uCTFi3JcfE4luIwY/qZejHmRjAtd4Y57PWzZ12HlYDV0iY
	56afj86HOw1t75VW7UxAF8Yik10Hkpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-RnYrR_2iOSu4ufXEGyZ-kw-1; Wed, 02 Nov 2022 12:11:43 -0400
X-MC-Unique: RnYrR_2iOSu4ufXEGyZ-kw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 147AC803D49;
	Wed,  2 Nov 2022 16:11:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09E322024CBB;
	Wed,  2 Nov 2022 16:11:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D851519465B2;
	Wed,  2 Nov 2022 16:11:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE0FF1946594 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Nov 2022 16:11:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9E9112166B2D; Wed,  2 Nov 2022 16:11:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97C6D2166B2B
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DB47857F90
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:40 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-fkhdUCSEOvKq17Rxqleqyw-1; Wed, 02 Nov 2022 12:11:38 -0400
X-MC-Unique: fkhdUCSEOvKq17Rxqleqyw-1
Received: by mail-pf1-f170.google.com with SMTP id z26so3684508pff.1
 for <cluster-devel@redhat.com>; Wed, 02 Nov 2022 09:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BlC7rcv7uN/Ok17R0azuMVwGkvRCqLRr8I16XJ1l0Zg=;
 b=1B7d9PBzQOnBQxxsCLVIopqjGYKpuAJZd56dI7gwfPxGLOmZvUzK8WPK5pbZiNzDzF
 Wgdv7pr0XJYMunj/TYMiUE2CKqX0dVUuulbLYULoL+b/W3dklDgwsYYr4i6sOjoamEOk
 YlIAQgyImFikbRmGZMdZj9O5hLpb5F4bUOulJORJqPMDW/zjBeobxQmfZKwX4ndmc6jW
 EVFtN9CVth+HLaGORQAQKvSzbTpsXYFCMX2UQXkk+QLWGvVWcfymRhtIuGP5Z860fy0U
 +As1bnvJf4a4MNg/mfijcfPxnfPMBa3cAYLDgIUOSULtsHDK6+/MXbu1VQEYpsnjwe2o
 EuBg==
X-Gm-Message-State: ACrzQf1GjXqH/DkP+2YIqL1QXkDFhMeoqXEj/QgXHO77lbGAQYz3cBoz
 jlPAHpK1cMquPsHVu2yD/DQ=
X-Google-Smtp-Source: AMsMyM4j3s90xT9i6LYsmPHnxhpVulb37Bk4oCPHgBg+ghAVYd6bcWusmh3MWIob26u2e/+gVRMdDw==
X-Received: by 2002:a63:85c8:0:b0:46e:c387:c85f with SMTP id
 u191-20020a6385c8000000b0046ec387c85fmr22258571pgd.105.1667405497249; 
 Wed, 02 Nov 2022 09:11:37 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:36 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:28 -0700
Message-Id: <20221102161031.5820-21-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v4 20/23] nilfs2: Convert
 nilfs_btree_lookup_dirty_buffers() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag(). This change removes 1 call to
compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/btree.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
index b9d15c3df3cc..da6a19eede9a 100644
--- a/fs/nilfs2/btree.c
+++ b/fs/nilfs2/btree.c
@@ -2141,7 +2141,7 @@ static void nilfs_btree_lookup_dirty_buffers(struct nilfs_bmap *btree,
 	struct inode *btnc_inode = NILFS_BMAP_I(btree)->i_assoc_inode;
 	struct address_space *btcache = btnc_inode->i_mapping;
 	struct list_head lists[NILFS_BTREE_LEVEL_MAX];
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	struct buffer_head *bh, *head;
 	pgoff_t index = 0;
 	int level, i;
@@ -2151,19 +2151,19 @@ static void nilfs_btree_lookup_dirty_buffers(struct nilfs_bmap *btree,
 	     level++)
 		INIT_LIST_HEAD(&lists[level]);
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
-	while (pagevec_lookup_tag(&pvec, btcache, &index,
-					PAGECACHE_TAG_DIRTY)) {
-		for (i = 0; i < pagevec_count(&pvec); i++) {
-			bh = head = page_buffers(pvec.pages[i]);
+	while (filemap_get_folios_tag(btcache, &index, (pgoff_t)-1,
+				PAGECACHE_TAG_DIRTY, &fbatch)) {
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			bh = head = folio_buffers(fbatch.folios[i]);
 			do {
 				if (buffer_dirty(bh))
 					nilfs_btree_add_dirty_buffer(btree,
 								     lists, bh);
 			} while ((bh = bh->b_this_page) != head);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 
-- 
2.38.1

