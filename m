Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4481B34EE3A
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-oOOd0f_wPIunRosqGyd5Xg-1; Tue, 30 Mar 2021 12:47:05 -0400
X-MC-Unique: oOOd0f_wPIunRosqGyd5Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9AA61005D62;
	Tue, 30 Mar 2021 16:47:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95B6B10016DB;
	Tue, 30 Mar 2021 16:47:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76CC218155DD;
	Tue, 30 Mar 2021 16:47:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjKPX010881 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB4142166B44; Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5B402166B2D
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B14D585A5B5
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-518-1MD_T5fPPN6w46bdp6p5OA-1; Tue, 30 Mar 2021 12:45:17 -0400
X-MC-Unique: 1MD_T5fPPN6w46bdp6p5OA-1
Received: by mail-wr1-f51.google.com with SMTP id z2so16885095wrl.5
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FGLqWsMKMFzu8AgI6vn47Mo1M3gcJ+HFYMnTl8CpPNE=;
	b=ama65IgDh2v12yqkZBxEHRciyAX3CVCATF5aAn6/q1vSK4hsGuVEiqNfDSE54E82P8
	7bCJsPnOGnHHuWZ9WoQxfcPo0HbujtP0lMAd1xsjj82c7Bht0DhUJjM21qD7ORS7iNwI
	Ffd9c2FQriJX+O02YUoicA82G0GogGIsQpPWx9oqkoDC5qfGhvxKcV4JZ4RWN/7VyXpR
	f8S2g5EsQzesEBV35uOZWtYhp35//6/iVG01Qn8FhRLlbjvPvSv7Ben5VGhpFWs0np1N
	5vyE3iCVYPueaWvwkXKM12r93E5Wu2lkGjAIyqesNH/NAAgzSIPu8bJFRV8Cr1bZkj/9
	RtIg==
X-Gm-Message-State: AOAM532BXDKZkY/AwQJTiTic5I/ZHIQlo/dvyMr4EcxGifGoaZcDSn3C
	Xiq1wyUVY6Y0wC/DqhPEF0nWUw==
X-Google-Smtp-Source: ABdhPJzUAIEBCF/coONe9qTuIaNbIWSdajRwOSR6JlpTYwJ5gWcoN4SvarRGJvPz9oSpzL2RmmJV5w==
X-Received: by 2002:adf:bc01:: with SMTP id s1mr35009295wrg.240.1617122715996; 
	Tue, 30 Mar 2021 09:45:15 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:15 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:42 +0100
Message-Id: <20210330164458.1625478-16-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 15/31] fs: gfs2: recovery: Provide missing
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

