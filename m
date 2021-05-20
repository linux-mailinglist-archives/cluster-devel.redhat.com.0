Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D5C6438AD94
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 14:06:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-EWF19qGeNnObbNyraWRYqQ-1; Thu, 20 May 2021 08:06:14 -0400
X-MC-Unique: EWF19qGeNnObbNyraWRYqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 849B880EF84;
	Thu, 20 May 2021 12:06:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22CD75C233;
	Thu, 20 May 2021 12:06:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C21DE5BBED;
	Thu, 20 May 2021 12:06:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KC0w8v028102 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 08:00:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71369113B68; Thu, 20 May 2021 12:00:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CCC8113B6C
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 12:00:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A90429124D3
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 12:00:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-109-nUFs70KQMK-0P5Pvk619Ag-1; Thu, 20 May 2021 08:00:47 -0400
X-MC-Unique: nUFs70KQMK-0P5Pvk619Ag-1
Received: by mail-wm1-f47.google.com with SMTP id
	s5-20020a7bc0c50000b0290147d0c21c51so5058881wmh.4
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 05:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tJNYQv+xEA1wfp6mz1jq9VUq+K1lyhIQv7cIqEk5KA4=;
	b=l8OkZLjVrVMWvT+ZjNTHNNg/zFWI/VxWabeZS+KZY/+BDFEGae4h/gZ7d/mWq8Mu0O
	8OkD1qOrVPYNTWDxJ7Z8ipt+WkP7hsJOl18Dkc2ejQp6IjmpnHmNQfJcvxt+hO/l1nl6
	ui1LGXWU7b0u9/mDiqdogDrjxuc/PnxC0MHOBJOGlNVGuB/x+pYqb7DXn2JRQxCnkfdc
	vJFj28BA/PQpPnmoUz8nIm40isBgZuQhqbR7ZXgvbZ/jr63j/HBRTdjh8FeBzGRG8HTf
	hiSmo21+/DgN3c28FyluhJK5CPJ/Sx1cW8aJ/6c0UPynhj0tpGJn7cSM7rFoCyNg+A3+
	pSmg==
X-Gm-Message-State: AOAM531JIn9Ogh3Dv36brnJxyI+SUifAHUwKytNJs6oFMB3M7CiuR6Q2
	Bb3tHHIDNO3jlCngHE3ZosGmPg==
X-Google-Smtp-Source: ABdhPJzTmMB/tS2lgvkPwTkWWFlnUpaA0R/NZVga4amPvKQfGv4bMO7uNd/9j7jLe7nvz9MjY2WvMA==
X-Received: by 2002:a05:600c:35d3:: with SMTP id
	r19mr3685613wmq.3.1621512046307; 
	Thu, 20 May 2021 05:00:46 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
	by smtp.gmail.com with ESMTPSA id
	s199sm8848269wme.43.2021.05.20.05.00.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 May 2021 05:00:45 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 20 May 2021 13:00:29 +0100
Message-Id: <20210520120043.3462759-2-lee.jones@linaro.org>
In-Reply-To: <20210520120043.3462759-1-lee.jones@linaro.org>
References: <20210520120043.3462759-1-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 01/15] fs: gfs2: bmap: Demote half-complete
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
 fs/gfs2/bmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 0bcf11a9987ba..edf6004b643ac 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1658,7 +1658,7 @@ static bool mp_eq_to_hgt(struct metapath *mp, __u16 *list, unsigned int h)
 	return true;
 }
 
-/**
+/*
  * find_nonnull_ptr - find a non-null pointer given a metapath and height
  * @sdp: The superblock
  * @mp: starting metapath
-- 
2.31.1

