Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 89ADC34A45E
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-_-maQML8NjSX2B1hgLbuXg-1; Fri, 26 Mar 2021 05:31:17 -0400
X-MC-Unique: _-maQML8NjSX2B1hgLbuXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FED310621B0;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E4936EF54;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 139FE1800232;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C61N012298 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC7DBFA749; Fri, 26 Mar 2021 09:12:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2194FA745
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6264802816
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:06 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
	[209.85.218.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-366-l2VfCglhMvOHhfLMgQBR2A-1; Fri, 26 Mar 2021 05:12:03 -0400
X-MC-Unique: l2VfCglhMvOHhfLMgQBR2A-1
Received: by mail-ej1-f51.google.com with SMTP id jy13so7329154ejc.2
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G+FYFjvrmmmlFKosOJsmCEZQd+qs37SblTzL1IxaAKE=;
	b=q2JA1oBYFuJOGG6YLHXtIqzfW+1I3h8T8p45korBAd0oVenVWO3IkOH3+EUJUbMYTf
	lKsfxbPMp/Y6rmEqbyH6wYAFLV2uo+Ii3xVWTMUyVHwOoZETxCFulo1+yiLOMKkXLpeu
	vYDf1U+E+lyxItflDGDaAHzGPQWfWy/OBoMZg9Rqd10VX7HFetIe5FSYHOlwGS+vV9dA
	Ja6IWKx6+Z/6XQq2nz4sMQJKjpG5N452febRJ9wh969ERy2Jz48w5ZL3PH+ZtIhePydw
	bp/ank5ydhjYnWjCb5cSbnmhIYkzEBY3ynlrhCT8eN73T2qR5JHx/EmRuFl9j5Y9nJrx
	LmZQ==
X-Gm-Message-State: AOAM533/EX0fTLJojZZshrqwI4hAaHsQd9yyqzQkwyLQ+2xzalJLTqII
	ZeVAXUDZGKRlDHo6E1iARUMf3A==
X-Google-Smtp-Source: ABdhPJzJeHGCo0UYLImqJUYfxFQqyhHWKtiEd4YJgZAOfwlyGncAVLLUb2T/YZs7JQPGaRKXaTnlrA==
X-Received: by 2002:a17:906:3395:: with SMTP id
	v21mr14305432eja.322.1616749922360; 
	Fri, 26 Mar 2021 02:12:02 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:41 +0000
Message-Id: <20210326091151.311647-9-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 08/18] fs: gfs2: aops: Fix a little
	potential doc-rot
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/aops.c:560: warning: Function parameter or member 'rac' not described in 'gfs2_readahead'
 fs/gfs2/aops.c:560: warning: Excess function parameter 'file' description in 'gfs2_readahead'
 fs/gfs2/aops.c:560: warning: Excess function parameter 'mapping' description in 'gfs2_readahead'
 fs/gfs2/aops.c:560: warning: Excess function parameter 'pages' description in 'gfs2_readahead'
 fs/gfs2/aops.c:560: warning: Excess function parameter 'nr_pages' description in 'gfs2_readahead'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/aops.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index cc4f987687f3c..23b5be3db044c 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -540,10 +540,7 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
 
 /**
  * gfs2_readahead - Read a bunch of pages at once
- * @file: The file to read from
- * @mapping: Address space info
- * @pages: List of pages to read
- * @nr_pages: Number of pages to read
+ * @rac: Read-ahead control structure
  *
  * Some notes:
  * 1. This is only for readahead, so we can simply ignore any things
-- 
2.27.0

