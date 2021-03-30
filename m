Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 24C5F34EE3F
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271--YVgPmLcNCGXjvPoV0vuwQ-1; Tue, 30 Mar 2021 12:47:29 -0400
X-MC-Unique: -YVgPmLcNCGXjvPoV0vuwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8FA31005D54;
	Tue, 30 Mar 2021 16:47:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5964189C7;
	Tue, 30 Mar 2021 16:47:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83BAE4A7C8;
	Tue, 30 Mar 2021 16:47:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjDhW010785 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F10A6CAA4; Tue, 30 Mar 2021 16:45:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68D796CAAF
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A08D8805F48
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-RPB_Zn4UMv6lQRZSmLrnsw-1; Tue, 30 Mar 2021 12:45:07 -0400
X-MC-Unique: RPB_Zn4UMv6lQRZSmLrnsw-1
Received: by mail-wm1-f44.google.com with SMTP id
	m20-20020a7bcb940000b029010cab7e5a9fso10696089wmi.3
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CK1kDFMaw5UzDowuwUYCibcsDvXfXP1I8E7qqThRaEU=;
	b=XcU3zOJaWicZRX11exz4X44YLJO6CbcStmlkQfrG0DfhRUteil5WYi+ZXWtI1f/EPq
	TvI1i8D5aJLBd2aFiTIroT9HWrZVf/XuXzuMSaRGTZcP7AgesdylfutOtS+Evsk5m+Kp
	4WiKg/KiwS3TZhF2G9bCac4/NqDf1yT+AcKFXHUKuNKpyGO2MTjzSovQYJ0BrbVU2/Yo
	QzFIkO3R0iR2gqjTRNCl4A6qkuwq/nLW76nCUAd8R33ACBnaALF6MlMczecXpdvkMN98
	/+DPzAU1v2cLDRc/sC+57os0BThMb4c9e5Sf+WneKBY9ny7BhFEJR5Clw/d69xCSHGWB
	gfLg==
X-Gm-Message-State: AOAM531Z7UiQAS61Cd2cjQqxseL0jJK0ZrPRxxZFQhpvykUHARtY3yeu
	E4oFtmIvufnvD2ZjYsEnX+MexQ==
X-Google-Smtp-Source: ABdhPJz28j/uD7FuqUixWwq5qLpY3pHLYHj/jkVvU+7XaCJUQEcBnEoyuGHg4dDqgRCH0icBZOCY5Q==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr5131430wmc.65.1617122706228; 
	Tue, 30 Mar 2021 09:45:06 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:32 +0100
Message-Id: <20210330164458.1625478-6-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 05/31] fs: gfs2: log: Fix a couple of param
	descriptions and demote non-conformant headers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/log.c:76: warning: Excess function parameter 'mapping' description in 'gfs2_remove_from_ail'
 fs/gfs2/log.c:97: warning: Function parameter or member 'tr' not described in 'gfs2_ail1_start_one'
 fs/gfs2/log.c:97: warning: Function parameter or member 'plug' not described in 'gfs2_ail1_start_one'
 fs/gfs2/log.c:97: warning: Excess function parameter 'ai' description in 'gfs2_ail1_start_one'
 fs/gfs2/log.c:278: warning: Function parameter or member 'sdp' not described in 'gfs2_ail_empty_tr'
 fs/gfs2/log.c:278: warning: Function parameter or member 'tr' not described in 'gfs2_ail_empty_tr'
 fs/gfs2/log.c:278: warning: Function parameter or member 'head' not described in 'gfs2_ail_empty_tr'
 fs/gfs2/log.c:1174: warning: Function parameter or member 'sdp' not described in 'gfs2_merge_trans'
 fs/gfs2/log.c:1174: warning: Excess function parameter 'old' description in 'gfs2_merge_trans'
 fs/gfs2/log.c:1293: warning: Function parameter or member 'data' not described in 'gfs2_logd'
 fs/gfs2/log.c:1293: warning: Excess function parameter 'sdp' description in 'gfs2_logd'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/log.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6410281546f92..eef33cd251e4b 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -65,7 +65,6 @@ unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct)
 
 /**
  * gfs2_remove_from_ail - Remove an entry from the ail lists, updating counters
- * @mapping: The associated mapping (maybe NULL)
  * @bd: The gfs2_bufdata to remove
  *
  * The ail lock _must_ be held when calling this function
@@ -81,12 +80,10 @@ void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
 	brelse(bd->bd_bh);
 }
 
-/**
+/*
  * gfs2_ail1_start_one - Start I/O on a part of the AIL
  * @sdp: the filesystem
  * @wbc: The writeback control structure
- * @ai: The ail structure
- *
  */
 
 static int gfs2_ail1_start_one(struct gfs2_sbd *sdp,
@@ -269,7 +266,7 @@ static void gfs2_log_update_head(struct gfs2_sbd *sdp)
 	sdp->sd_log_head = new_head;
 }
 
-/**
+/*
  * gfs2_ail_empty_tr - empty one of the ail lists of a transaction
  */
 
@@ -1166,7 +1163,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 /**
  * gfs2_merge_trans - Merge a new transaction into a cached transaction
- * @old: Original transaction to be expanded
+ * @sdp: the filesystem
  * @new: New transaction to be merged
  */
 
@@ -1283,7 +1280,7 @@ static inline int gfs2_ail_flush_reqd(struct gfs2_sbd *sdp)
 
 /**
  * gfs2_logd - Update log tail as Active Items get flushed to in-place blocks
- * @sdp: Pointer to GFS2 superblock
+ * @data: Pointer to GFS2 superblock
  *
  * Also, periodically check to make sure that we're using the most recent
  * journal index.
-- 
2.27.0

