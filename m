Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7EE34A459
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-sn8WyjTkNISuBd04PVe40w-1; Fri, 26 Mar 2021 05:31:16 -0400
X-MC-Unique: sn8WyjTkNISuBd04PVe40w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6856410866AB;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30ADF2E09A;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DFE81809C83;
	Fri, 26 Mar 2021 09:31:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C4EC012280 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECD442026D2E; Fri, 26 Mar 2021 09:12:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E23442026985
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66A7385A5BE
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:01 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-1ImzqWYDO4y4-o72hgBNkA-1; Fri, 26 Mar 2021 05:11:58 -0400
X-MC-Unique: 1ImzqWYDO4y4-o72hgBNkA-1
Received: by mail-ej1-f49.google.com with SMTP id w3so7324261ejc.4
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e231YlAtkWfHG8c7u1pVYJ7SLucjnEEbcHHLcgbxIik=;
	b=GObYN8ArklZ3YBcXMlGOK0tpEk9I8lG5PoRbN2gW4ti+0mbG9XvFGrjBt8ufMJLGF7
	Em4uOSh2uXvLaRRwZ4lUZePywQd/dVpwb81zePWLHurqbLQNIGPYImW/XlaOTMxv+So/
	I0i/NBR/2AZXFYHcd+6jY+dt+2fBbzYCgx+wuDg+4lKfQLUwXU62BBHJojb/f+jYuqp1
	xLJwTy8ikwmhr+vGsgLFNvXlDIF9oSrhk+6n04F4Amqie9vvLKo1bVdg5/KnmQFoH2WE
	ydzPuloPxJQcNKenqMpRqN65CFKpk0iLJRwBg6YTLThmMfHhuLPLlqAnXkUpt6pi1s/y
	R+jA==
X-Gm-Message-State: AOAM530/kEA2qig7rWj8nRJefZLvUFpkwKPswi5w1EBPDhEpfIkHLIW6
	p8nnF7xu48iUuER9KaxvTV6sbw==
X-Google-Smtp-Source: ABdhPJyzkQEInvqkeEGiWHxYD+6avG7XT2nMg7G0CsAqwnao1BpzqsusSFiPakEw6IpyQLFjv5y9MA==
X-Received: by 2002:a17:906:ae8d:: with SMTP id
	md13mr14160112ejb.275.1616749917798; 
	Fri, 26 Mar 2021 02:11:57 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.11.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:11:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:36 +0000
Message-Id: <20210326091151.311647-4-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 03/18] fs: gfs2: bmap: Demote half-complete
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

