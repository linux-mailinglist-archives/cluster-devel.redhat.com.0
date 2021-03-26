Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6507334A45B
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-xWb9ideCNtyZ8xfP03yHuw-1; Fri, 26 Mar 2021 05:31:17 -0400
X-MC-Unique: xWb9ideCNtyZ8xfP03yHuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1398210621A8;
	Fri, 26 Mar 2021 09:31:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03A2663632;
	Fri, 26 Mar 2021 09:31:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1E681809C82;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9CAIP012346 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E3E921CAC6D; Fri, 26 Mar 2021 09:12:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 988E421CAC6C
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80130185A7B4
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:10 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-_jIRv8W_OAavF8F54nWNcg-1; Fri, 26 Mar 2021 05:12:08 -0400
X-MC-Unique: _jIRv8W_OAavF8F54nWNcg-1
Received: by mail-ed1-f49.google.com with SMTP id z1so5474094edb.8
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lKzeLqRR981m8Q6V7H7TUSXK4XL8F6YSqoxMJOt3/UM=;
	b=Nmf71dKv3adbKYaI83r/XwCzRbv/UkftH0r8No+w+DFysiag7c1KjDSVizbM7lqFSN
	gxHqCNeYmYY1h+mf63w+eNMcub6pzgyWlODhlM4FUePH2rphKtzVfOUr9PRWx7lSpFZL
	+m7FD2gTFV75mgZxMN9d/8k2/LJFO444uDgVDkzHPq9p8VtoZImLIgN4zmUQGrrRMhCz
	7MxWppBdDcmfAB7h53JvqZdbuTjJ4tx0MYdgUS9LzeszsQEb3S6H94pRfHq0uywvwI4u
	LVpzqqeXmeXIzYJKkZGwFpsYfA8+k7DExSYpq6nDbRXJ7LBli+fiWnNafKh1WU00Dkti
	Oi/A==
X-Gm-Message-State: AOAM53348vsKSDrP3Y6Yk0K8VIvGDmDFHi6VQq/pfT7v0kZ3AfogyE8y
	4DPOnxvJLL5jOiEInsGrA22PIQ==
X-Google-Smtp-Source: ABdhPJxDJ3TiBWwBuIIIUl2qWtWahIpl4fU1w+mZcTN0WLXPxFS1sjSsGKtEcZ6XeObhTS29nlfXiw==
X-Received: by 2002:a50:fb10:: with SMTP id d16mr13900790edq.73.1616749926918; 
	Fri, 26 Mar 2021 02:12:06 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:46 +0000
Message-Id: <20210326091151.311647-14-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 13/18] fs: gfs2: quota: Fix incorrect param
	name in 'gfs2_quotad'
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

 fs/gfs2/quota.c:1542: warning: Function parameter or member 'data' not described in 'gfs2_quotad'
 fs/gfs2/quota.c:1542: warning: Excess function parameter 'sdp' description in 'gfs2_quotad'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/quota.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 6e173ae378c44..33520eed467c2 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1534,7 +1534,7 @@ void gfs2_wake_up_statfs(struct gfs2_sbd *sdp) {
 
 /**
  * gfs2_quotad - Write cached quota changes into the quota file
- * @sdp: Pointer to GFS2 superblock
+ * @data: Pointer to GFS2 superblock
  *
  */
 
-- 
2.27.0

