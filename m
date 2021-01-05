Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 12D512EA755
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Jan 2021 10:32:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-GtDj-EdxNV2uOTOMyFfeRA-1; Tue, 05 Jan 2021 04:32:52 -0500
X-MC-Unique: GtDj-EdxNV2uOTOMyFfeRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 903ED9CC09;
	Tue,  5 Jan 2021 09:32:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 640FC5D9CC;
	Tue,  5 Jan 2021 09:32:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6495180954D;
	Tue,  5 Jan 2021 09:32:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1050lcPr025054 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 19:47:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF5572026D48; Tue,  5 Jan 2021 00:47:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5A52026D47
	for <cluster-devel@redhat.com>; Tue,  5 Jan 2021 00:47:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75F40811E85
	for <cluster-devel@redhat.com>; Tue,  5 Jan 2021 00:47:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-388-XbdQ1-txPS-33LHrkfzPZw-1; Mon, 04 Jan 2021 19:47:31 -0500
X-MC-Unique: XbdQ1-txPS-33LHrkfzPZw-1
Received: by mail-pl1-f174.google.com with SMTP id b8so15470818plx.0;
	Mon, 04 Jan 2021 16:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hlRh4oR4QpLbEXotkI1bQimJOvMdeHexVCVFkFuCov0=;
	b=RWWAtaIIfqRYHUXUZxyNioUfzv0WWrJ9fOdWPeRKfqAe4shBpIW/4nUOSgjBWGVX1L
	iMTwplDxmG9N/RexTXuqrJ/M4zTodUlKRizSxGtZXb/xRQcwn1LqBFWe2BloKzeUE7Sg
	FtsEG7NUmWCtoGD27vE7PKoTmmSIYTJkgaYPPMAPei0HWceFNi9+mKhpqMopOkF8Esyp
	8F0YIw38psZ/mviNADEEujC/h+LT9U14sh1atyoqCTgjFYDwcb/foWys6wI31tncUMuE
	tNz1508HmBcbyo93zvvQf7kVrRaK3qACf/N8UzKeL0afW2yKimkAxwLChjsfiIQFu8TL
	+SRA==
X-Gm-Message-State: AOAM533WgyVIF75VS6rtwftEap84tYQjWy/Ph/eHuklNDZnsiODybQiC
	z4bNFYoM1OJDH+NZCxBjxRugTKFUMQY=
X-Google-Smtp-Source: ABdhPJw9PEqwAhVUYHWm5Lr1VgNwOZcwQSPBYRTxhR3LPWVjFWZ1theobGWAhkG9EVtZ8+jSvO4jeA==
X-Received: by 2002:a17:90a:49c5:: with SMTP id
	l5mr1475905pjm.116.1609807649994; 
	Mon, 04 Jan 2021 16:47:29 -0800 (PST)
Received: from bj03382pcu.spreadtrum.com ([117.18.48.82])
	by smtp.gmail.com with ESMTPSA id
	p21sm56310706pfn.15.2021.01.04.16.47.27
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2021 16:47:29 -0800 (PST)
From: Huangzhaoyang <huangzhaoyang@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, linux-kernel@vger.kernel.org
Date: Tue,  5 Jan 2021 08:47:22 +0800
Message-Id: <1609807642-31552-1-git-send-email-huangzhaoyang@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 Jan 2021 04:32:39 -0500
Subject: [Cluster-devel] [PATCH v2] fs: amend SLAB_RECLAIM_ACCOUNT on gfs2
	related slab cache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

As gfs2_quotad_cachep and gfs2_glock_cachep have registered
the shrinker, amending SLAB_RECLAIM_ACCOUNT when creating
them, which make the slab acount to be presiced.

Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
v2: add gfs2_glock_cachep for same operation
---
---
 fs/gfs2/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index 136484e..23144a7 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -100,7 +100,7 @@ static int __init init_gfs2_fs(void)
 	error = -ENOMEM;
 	gfs2_glock_cachep = kmem_cache_create("gfs2_glock",
 					      sizeof(struct gfs2_glock),
-					      0, 0,
+					      0, SLAB_RECLAIM_ACCOUNT,
 					      gfs2_init_glock_once);
 	if (!gfs2_glock_cachep)
 		goto fail_cachep1;
@@ -136,7 +136,7 @@ static int __init init_gfs2_fs(void)
 
 	gfs2_quotad_cachep = kmem_cache_create("gfs2_quotad",
 					       sizeof(struct gfs2_quota_data),
-					       0, 0, NULL);
+					       0, SLAB_RECLAIM_ACCOUNT, NULL);
 	if (!gfs2_quotad_cachep)
 		goto fail_cachep6;
 
-- 
1.9.1

