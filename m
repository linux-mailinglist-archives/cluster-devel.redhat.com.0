Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6E36F2E9407
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 12:23:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-5CvxTyZFN_6yQLWQXlk-1Q-1; Mon, 04 Jan 2021 06:23:31 -0500
X-MC-Unique: 5CvxTyZFN_6yQLWQXlk-1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A17C8CE648;
	Mon,  4 Jan 2021 11:23:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8752919713;
	Mon,  4 Jan 2021 11:23:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46BC84E58E;
	Mon,  4 Jan 2021 11:23:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BS3eD1W013201 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 27 Dec 2020 22:40:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AA8FD8179; Mon, 28 Dec 2020 03:40:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A41DA9D5B
	for <cluster-devel@redhat.com>; Mon, 28 Dec 2020 03:40:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C07580018D
	for <cluster-devel@redhat.com>; Mon, 28 Dec 2020 03:40:11 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-439-lnF7AUwXOqKEnZ9YVZ4ivw-1; Sun, 27 Dec 2020 22:40:08 -0500
X-MC-Unique: lnF7AUwXOqKEnZ9YVZ4ivw-1
Received: by mail-pl1-f169.google.com with SMTP id be12so5039169plb.4;
	Sun, 27 Dec 2020 19:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9ZsnfsGx/6gHWwdeAQR/Y1wC6ZOL+ifFY18pxrPRUEw=;
	b=g5JuwcF38rK+Ll/3s8EoSNvEkoWAYfTd078IdJ04RexyH4WqoD3Fji0atuvJGn08w4
	vqDP+dflxEhggWkRj7vYc4pPiN/wFZ3tdYY7H1SRyGTbqg0NvOH5V3bkaEVy4PVXUfvv
	h0TqZ+M2P9YquAwh4x+iaRksUZNY4xBGoXwy/9JIbNHVxfyUyBC8BnHBpcXMULYtMHwk
	7by1Q4iYWJsvbowGp2zT1qkrijp/l+ayWkGKRb8OBUzZyPaVxeUcP4YqNfMu8d2wZFJr
	RbPM8YQf5d4CpT5V2zKqz4W+OFq/9NRmDV90RYs1y2xDi4pfqw9VzgY+xegU9SzsQ77O
	7AVw==
X-Gm-Message-State: AOAM531iogofLNdjPcDrSsMtHJHmsfV1g4K0CkRPmLLLgv8Wv0m6ppxO
	H+6VJWRPqmPwDBWYX4T3lQxrHGto+ZE=
X-Google-Smtp-Source: ABdhPJwrxI3bvYN86x7BwRmVUvO2jrAglTpnL7ojzNKFZOjZxuj4wK4wp+4ucbPH4OVERWdSpFRJsA==
X-Received: by 2002:a17:90b:203:: with SMTP id
	fy3mr19546124pjb.231.1609126807161; 
	Sun, 27 Dec 2020 19:40:07 -0800 (PST)
Received: from bj03382pcu.spreadtrum.com ([117.18.48.82])
	by smtp.gmail.com with ESMTPSA id
	5sm34320527pff.125.2020.12.27.19.40.04
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Dec 2020 19:40:06 -0800 (PST)
From: Huangzhaoyang <huangzhaoyang@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, linux-kernel@vger.kernel.org
Date: Mon, 28 Dec 2020 11:40:00 +0800
Message-Id: <1609126800-19953-1-git-send-email-huangzhaoyang@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 06:23:24 -0500
Subject: [Cluster-devel] [PATCH] fs: amend SLAB_RECLAIM_ACCOUNT on
	gfs2_quotad_cachep
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

As gfs2_quotad_cachep has registered the shrinker, amending
SLAB_RECLAIM_ACCOUNT when create gfs2_quotad_cachep, which
make the slab acount to be presiced.

Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
 fs/gfs2/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index 136484e..db39de9 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -136,7 +136,7 @@ static int __init init_gfs2_fs(void)
 
 	gfs2_quotad_cachep = kmem_cache_create("gfs2_quotad",
 					       sizeof(struct gfs2_quota_data),
-					       0, 0, NULL);
+					       0, SLAB_RECLAIM_ACCOUNT, NULL);
 	if (!gfs2_quotad_cachep)
 		goto fail_cachep6;
 
-- 
1.9.1

