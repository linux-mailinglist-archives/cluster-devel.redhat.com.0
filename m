Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1DC23A124
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Aug 2020 10:39:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Zm276kQ7OKyNPJC0RZ542g-1; Mon, 03 Aug 2020 04:39:07 -0400
X-MC-Unique: Zm276kQ7OKyNPJC0RZ542g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D15BF8064AC;
	Mon,  3 Aug 2020 08:39:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1566487E38;
	Mon,  3 Aug 2020 08:39:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F16379A110;
	Mon,  3 Aug 2020 08:39:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VLSVwP020781 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 17:28:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4994C115589E; Fri, 31 Jul 2020 21:28:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B5D2115589A
	for <cluster-devel@redhat.com>; Fri, 31 Jul 2020 21:28:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD640185A797
	for <cluster-devel@redhat.com>; Fri, 31 Jul 2020 21:28:28 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-PrlcwYf3N6iuXrd-2ECpIQ-1; Fri, 31 Jul 2020 17:28:24 -0400
X-MC-Unique: PrlcwYf3N6iuXrd-2ECpIQ-1
Received: by mail-lf1-f68.google.com with SMTP id d2so11946492lfj.1;
	Fri, 31 Jul 2020 14:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2LM9wmlkgT4PsRWE1wCcqgQWCXbjCWE/5JCh3nJ0oCA=;
	b=NvJNvvKGY3qPjqWtHJBY/yUaB/cTQ5yyfpf0S0VsU91nyWQ1oviGcWzsRsbwpCu8Xr
	1v0m6EOS47EqUDTfefoQKCV/1HXMkWRfKYNaz192z/wjvS7HERa/txr/DUbJ5XR++n/K
	LWTBZZSMBt9IvFHq9Ehe2Xka3w+RFtOPaHXcA3aq0HjBXejCFkF++zaBCYM8WH8Y4hvk
	7jYHUfuVNZbj0QavCtG3H+n0/TqTDJSHOpoq+gnqtWVAXQsaf5LBfL/1ymq8pxCfJjJg
	w7ngeqER5+NCMYwUGwd3qTT1ChBlZHs2LfrwgcZdnnajizVpsJo0/dgWJs5D10kRV6vu
	0Lyg==
X-Gm-Message-State: AOAM533HQxRjYHsQurhkoU5XEafke1YacxPR00b4RDdlxbxRqpu9Zi2M
	bnT8DhIGoNbc3v6pfcVje3sDkHqla2U=
X-Google-Smtp-Source: ABdhPJx5rpPcTf6BM7go7zcF82POs7Vn/gQAL/VNoJB8vwJy+X5By9cH+RyEn/BuffP3aKBK6Z020Q==
X-Received: by 2002:a19:e50:: with SMTP id 77mr2864709lfo.188.1596230902010;
	Fri, 31 Jul 2020 14:28:22 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
	[37.110.38.130]) by smtp.googlemail.com with ESMTPSA id
	y1sm2643326lfb.45.2020.07.31.14.28.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Jul 2020 14:28:21 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat,  1 Aug 2020 00:28:18 +0300
Message-Id: <20200731212818.10782-1-efremov@linux.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 03 Aug 2020 04:38:59 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	Denis Efremov <efremov@linux.com>
Subject: [Cluster-devel] [PATCH] gfs2: Use kvmalloc instead of opencoded
	kmalloc/vmalloc
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Use kvmalloc instead of opencoded kmalloc/vmalloc condition.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 fs/gfs2/dir.c   | 23 ++++-------------------
 fs/gfs2/quota.c |  5 +----
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index c0f2875c946c..5d2a708fae9c 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -352,9 +352,7 @@ static __be64 *gfs2_dir_get_hash_table(struct gfs2_inode *ip)
 		return ERR_PTR(-EIO);
 	}
 
-	hc = kmalloc(hsize, GFP_NOFS | __GFP_NOWARN);
-	if (hc == NULL)
-		hc = __vmalloc(hsize, GFP_NOFS);
+	hc = kvmalloc(hsize, GFP_NOFS);
 
 	if (hc == NULL)
 		return ERR_PTR(-ENOMEM);
@@ -1320,18 +1318,6 @@ static int do_filldir_main(struct gfs2_inode *dip, struct dir_context *ctx,
 	return 0;
 }
 
-static void *gfs2_alloc_sort_buffer(unsigned size)
-{
-	void *ptr = NULL;
-
-	if (size < KMALLOC_MAX_SIZE)
-		ptr = kmalloc(size, GFP_NOFS | __GFP_NOWARN);
-	if (!ptr)
-		ptr = __vmalloc(size, GFP_NOFS);
-	return ptr;
-}
-
-
 static int gfs2_set_cookies(struct gfs2_sbd *sdp, struct buffer_head *bh,
 			    unsigned leaf_nr, struct gfs2_dirent **darr,
 			    unsigned entries)
@@ -1409,7 +1395,8 @@ static int gfs2_dir_read_leaf(struct inode *inode, struct dir_context *ctx,
 	 * 99 is the maximum number of entries that can fit in a single
 	 * leaf block.
 	 */
-	larr = gfs2_alloc_sort_buffer((leaves + entries + 99) * sizeof(void *));
+	larr = kvmalloc_array(leaves + entries + 99,
+			      sizeof(void *), GFP_NOFS);
 	if (!larr)
 		goto out;
 	darr = (struct gfs2_dirent **)(larr + leaves);
@@ -1985,9 +1972,7 @@ static int leaf_dealloc(struct gfs2_inode *dip, u32 index, u32 len,
 
 	memset(&rlist, 0, sizeof(struct gfs2_rgrp_list));
 
-	ht = kzalloc(size, GFP_NOFS | __GFP_NOWARN);
-	if (ht == NULL)
-		ht = __vmalloc(size, GFP_NOFS | __GFP_NOWARN | __GFP_ZERO);
+	ht = kvzalloc(size, GFP_NOFS);
 	if (!ht)
 		return -ENOMEM;
 
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 4b67d47a7e00..204b34f38e5c 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1362,10 +1362,7 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
 	bm_size = DIV_ROUND_UP(sdp->sd_quota_slots, 8 * sizeof(unsigned long));
 	bm_size *= sizeof(unsigned long);
 	error = -ENOMEM;
-	sdp->sd_quota_bitmap = kzalloc(bm_size, GFP_NOFS | __GFP_NOWARN);
-	if (sdp->sd_quota_bitmap == NULL)
-		sdp->sd_quota_bitmap = __vmalloc(bm_size, GFP_NOFS |
-						 __GFP_ZERO);
+	sdp->sd_quota_bitmap = kvzalloc(bm_size, GFP_NOFS);
 	if (!sdp->sd_quota_bitmap)
 		return error;
 
-- 
2.26.2

