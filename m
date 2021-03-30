Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8932F34EE27
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:45:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-N17P9w28MnWFOpL_FJ9OSg-1; Tue, 30 Mar 2021 12:45:21 -0400
X-MC-Unique: N17P9w28MnWFOpL_FJ9OSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B215180FCBA;
	Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B9275C5AE;
	Tue, 30 Mar 2021 16:45:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1DE11809C83;
	Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjBW2010769 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9AA412157F25; Tue, 30 Mar 2021 16:45:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 925732157F23
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8584802C1A
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:07 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-98-o0fKPSfBOXyoi8F-RBrDSg-1; Tue, 30 Mar 2021 12:45:05 -0400
X-MC-Unique: o0fKPSfBOXyoi8F-RBrDSg-1
Received: by mail-wr1-f42.google.com with SMTP id v4so16859717wrp.13
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e231YlAtkWfHG8c7u1pVYJ7SLucjnEEbcHHLcgbxIik=;
	b=B/XNBrlrYzj+aj4myDvOTrPWpK29+B6gpxj7F2k+yfBSKfb55pQDFBC/JpxBEQSAPH
	+ZAvISvVkOlsD2WP6+e5fQoQ4TVT694WhCPRUewuiSjb0gIB5er4hC+cCcHMMq2fVtNM
	yS87qQLzsbA9/O9RxmPypD7X2Nrr0MiqFLnbI2KGEVx7lLivrk+0buUlpUAk4Rg3a8eM
	uYJuH4RAgjN4xPi8X9C7w/sncUxtIMopV1gM94Klk//GRxP8rcctN5ZfoOG+aTNMNZ3O
	kYT2fctjecxkw0GLI4ew5/XXKUw4zRC9pIA9ENNXpKH4OhBseC9RJMl8oSDS4RpHXqdD
	vlmA==
X-Gm-Message-State: AOAM533ndwM2ktUn2JvJ4rl71Lye8JCTkbtlu8Pf7GCXOuLILSpKn0u3
	WhqDHeC6tE/VD22Vfk+gpTYCBg==
X-Google-Smtp-Source: ABdhPJzEfOIvt38mKaAHEVkJ2dm7wan3/OD+PYGAA+3Up4QG883khqnLq/ta1Mz1AqpeaDzWLvchtw==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr34237378wru.259.1617122704212;
	Tue, 30 Mar 2021 09:45:04 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:03 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:30 +0100
Message-Id: <20210330164458.1625478-4-lee.jones@linaro.org>
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 03/31] fs: gfs2: bmap: Demote half-complete
	kernel-doc headers fix others
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/bmap.c:1502: warning: Function parameter or member 'rd_gh' not described in 'sweep_bh_for_rgrps'
 fs/gfs2/bmap.c:1502: warning: Excess function parameter 'rg_gh' description in 'sweep_bh_for_rgrps'
 fs/gfs2/bmap.c:1671: warning: Function parameter or member 'sdp' not described in 'find_nonnull_ptr'
 fs/gfs2/bmap.c:1671: warning: Function parameter or member 'end_list' not described in 'find_nonnull_ptr'
 fs/gfs2/bmap.c:1671: warning: Function parameter or member 'end_aligned' not described in 'find_nonnull_ptr'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/bmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 7a358ae051851..7ff20db4999fb 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1477,7 +1477,7 @@ int gfs2_iomap_get_alloc(struct inode *inode, loff_t pos, loff_t length,
 /**
  * sweep_bh_for_rgrps - find an rgrp in a meta buffer and free blocks therein
  * @ip: inode
- * @rg_gh: holder of resource group glock
+ * @rd_gh: holder of resource group glock
  * @bh: buffer head to sweep
  * @start: starting point in bh
  * @end: end point in bh
@@ -1656,7 +1656,7 @@ static bool mp_eq_to_hgt(struct metapath *mp, __u16 *list, unsigned int h)
 	return true;
 }
 
-/**
+/*
  * find_nonnull_ptr - find a non-null pointer given a metapath and height
  * @mp: starting metapath
  * @h: desired height to search
-- 
2.27.0

