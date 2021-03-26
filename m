Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0013D34A465
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-6jy3UbyJMnSPBgKLtjvkzg-1; Fri, 26 Mar 2021 05:31:20 -0400
X-MC-Unique: 6jy3UbyJMnSPBgKLtjvkzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1524B5020D;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 028A56A8FA;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDFD11809C82;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9CDgf012363 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EABD21CAC6F; Fri, 26 Mar 2021 09:12:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3957F21CAC6C
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2051F811E93
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:13 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-471-tQtfOdHiPeyPjUq2SiXcYA-1; Fri, 26 Mar 2021 05:12:11 -0400
X-MC-Unique: tQtfOdHiPeyPjUq2SiXcYA-1
Received: by mail-ej1-f42.google.com with SMTP id l4so7279739ejc.10
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CK1kDFMaw5UzDowuwUYCibcsDvXfXP1I8E7qqThRaEU=;
	b=SOeJ7TnXIiZQM2keRjCtWzRECW/PntPeS5csL+uGS288uvG2Pqip2ppxnvF2nft025
	biwEr9rxFLcqLYgQRXGpezFhgEU8HVRujmx71uatVTOEGFFhDO1gFzlkMGVHjyTs5ytq
	ButGmn0q6nyFl9b2tmmwlzZVogFKcAKj0VyYVlPKWY5mFseW7JIbMl097I3W/M0hlxqO
	/NxuNcB3bqz3mbYLGC0u+sDYD9+GSB12/ZsmVFM+rK40r3uDAhlPU1ITH4k4tFe8IikX
	rfKPEnn8F8CaFXvcvSK0ziY/dpLN6tHNueXIllqa5hQv3w1zHyT2fNB5Mowcd1sfG/M/
	2KRA==
X-Gm-Message-State: AOAM532kqck4DQlWC2eOV2w5IiM8PfdoJQBjRxTUZG0usW4j0PU7Psgd
	/mspmIuEWGPI113RRrSeZw99yAGbvZsAwg==
X-Google-Smtp-Source: ABdhPJzUkCuX7Zprldus9CoL3wZ4OCF8Btg+3icBHDAkQD98rBiSLMizbOUGsRr6fr+EV7u6vxV+IA==
X-Received: by 2002:a17:906:f203:: with SMTP id
	gt3mr13827560ejb.346.1616749919627; 
	Fri, 26 Mar 2021 02:11:59 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.11.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:11:59 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:38 +0000
Message-Id: <20210326091151.311647-6-lee.jones@linaro.org>
In-Reply-To: <20210326091151.311647-1-lee.jones@linaro.org>
References: <20210326091151.311647-1-lee.jones@linaro.org>
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
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 05/18] fs: gfs2: log: Fix a couple of param
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

