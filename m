Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 71B0B34A45C
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-UZNjABKrNz2Spq9FnHoFQg-1; Fri, 26 Mar 2021 05:31:17 -0400
X-MC-Unique: UZNjABKrNz2Spq9FnHoFQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A3450203;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A3651037EB0;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08C844A704;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9CEO5012381 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4118D1050185; Fri, 26 Mar 2021 09:12:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CD651050182
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 256DB85A5A8
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:14 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-157-w8W96FaxNgeD2XftNHpN5g-1; Fri, 26 Mar 2021 05:12:09 -0400
X-MC-Unique: w8W96FaxNgeD2XftNHpN5g-1
Received: by mail-ej1-f44.google.com with SMTP id u9so7302734ejj.7
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FGLqWsMKMFzu8AgI6vn47Mo1M3gcJ+HFYMnTl8CpPNE=;
	b=s1Gd2XygqN5GwEDt4DvxwnUHkXrhrOJkuVl8LXNGChBq32ZxS1cd2NBzeRYn0KftI+
	LyKiEjWunOU+nAzgu712r7qVz94Q4lWc1gNjI7WAuawnKWK9mgk0XxaImQTL4EYv0Lp/
	iHPUw7RA8Jzx5tcsIpR4O5bFo4mw7gIiAbwV1lCr9P4utJG9/uQCvDEpRGkwnPNIbbII
	eiU7jo8XoVyUs+sgrdn7Okn3qvz5EU+SAW3RBaBLL2AmZdG72129D/259Uv+lzzNvjY3
	voJqmtyk9LhcT6KtySRLWG28i8WJt/CRF3bunMJmTDFuuzPAFwo0S1GdoFV/SN44LCt+
	sF6Q==
X-Gm-Message-State: AOAM533JY4p9BdHF44cazbx3W/p2C6+qLcChN4TKDdfrk1o3YykIc4UO
	hIClbWbBIHxbOovXyIrcc55dyg==
X-Google-Smtp-Source: ABdhPJy09Omtyxi7eHHuA/xo7XFKjicayB902xQdiYZUcSn7f/EGtDd2mkJihUZ+hpejdJAXbw0wow==
X-Received: by 2002:a17:907:20c7:: with SMTP id
	qq7mr13708003ejb.528.1616749928629; 
	Fri, 26 Mar 2021 02:12:08 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:48 +0000
Message-Id: <20210326091151.311647-16-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 15/18] fs: gfs2: recovery: Provide missing
	param descriptions and remove one other
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/recovery.c:169: warning: Function parameter or member 'head' not described in 'get_log_header'
 fs/gfs2/recovery.c:169: warning: Excess function parameter 'lh' description in 'get_log_header'
 fs/gfs2/recovery.c:199: warning: Function parameter or member 'pass' not described in 'foreach_descriptor'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/recovery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 2821737740055..26004d5431165 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -154,7 +154,7 @@ int __get_log_header(struct gfs2_sbd *sdp, const struct gfs2_log_header *lh,
  * get_log_header - read the log header for a given segment
  * @jd: the journal
  * @blk: the block to look at
- * @lh: the log header to return
+ * @head: the log header to return
  *
  * Read the log header for a given segement in a given journal.  Do a few
  * sanity checks on it.
@@ -187,6 +187,7 @@ static int get_log_header(struct gfs2_jdesc *jd, unsigned int blk,
  * @jd: the journal
  * @start: the first log header in the active region
  * @end: the last log header (don't process the contents of this entry))
+ * @pass: iteration number (foreach_descriptor() is called in a for() loop)
  *
  * Call a given function once for every log descriptor in the active
  * portion of the log.
-- 
2.27.0

