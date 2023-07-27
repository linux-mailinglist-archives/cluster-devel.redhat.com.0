Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2CE764A3C
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 10:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690445274;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bO4yc6b0222dRNj48HoFyPuU9QjRVolFKKVhhMGpLKw=;
	b=E09zWlx810nwn3OZ/0F2X8QpJ24MGiE/E8mggS/rpxubVsKYAUNJf44qDeQ73GShCqRB3N
	MXWV2qBGY+o0aCdNuv1u88nTsYpEf7jIXZya1UEuFlUtmtS5bfrjaAZ83IOXvi21dzdNYP
	CVoYwlT9mibY3MNDSpr98PrMJtlTZ+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-IEjdDvbKOoStj0se28ALAg-1; Thu, 27 Jul 2023 04:07:47 -0400
X-MC-Unique: IEjdDvbKOoStj0se28ALAg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F727185A7A3;
	Thu, 27 Jul 2023 08:07:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 400CC492B01;
	Thu, 27 Jul 2023 08:07:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 039731946A72;
	Thu, 27 Jul 2023 08:07:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 36CC81946A6C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 08:07:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1584740C206F; Thu, 27 Jul 2023 08:07:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DEE840C2063
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:07:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E65B93C100B6
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:07:44 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Z7rrNNUqMW-72CXSOYR7rA-1; Thu, 27 Jul 2023 04:07:40 -0400
X-MC-Unique: Z7rrNNUqMW-72CXSOYR7rA-1
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-682b1768a0bso174676b3a.0
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 01:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445259; x=1691050059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bO4yc6b0222dRNj48HoFyPuU9QjRVolFKKVhhMGpLKw=;
 b=Mi8ZdGb/9TfPm4lJtDJrFFZ0UB2s4ioj8mO/66vpfWzzg+iyMQuAoanBFM/vVuKjQO
 8LDY5DBl4ZEIglXYzVI1eATrKqNnQKjFhuL90Ihpaf7B/W2L+GvQmuBmQPKe/XGHdCMF
 wP2smOjV0Q5/IIp30+ZKDMOSmu6GRgi+7NZov+x1rgzAZ+LF7eebS9RFwCEJIniDZ9i0
 wT73Us+l2ZTM4Zf8uTeDdiocAuQT62Bqff+ous1Py54MxYvC7Yn5bti2tk57VPsm5Zj9
 b1Xob6g1b1x7y7mCsKh5r9URFcy4izJtGof/tJw2eamqXm0TH+3BYkOD8SQ3MudVc2o2
 nTLw==
X-Gm-Message-State: ABy/qLYVcdV6eXaJ/kvpfqEfgMdFaSxGQtoWt7cMqZibS6assDxg1n1l
 qtSVvELk73KNYWhntuFogfmZJQ==
X-Google-Smtp-Source: APBJJlEtjuu7JvMViG/zI1+BRK6QgnXajX34xFKdSMMqB1WswZOW9mIhLIlLvIrLtx031P4ulw5hGg==
X-Received: by 2002:a05:6a20:9381:b0:137:8f19:1de7 with SMTP id
 x1-20020a056a20938100b001378f191de7mr6160325pzh.0.1690445259706; 
 Thu, 27 Jul 2023 01:07:39 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:07:39 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:22 +0800
Message-Id: <20230727080502.77895-10-zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH v3 09/49] xenbus/backend: dynamically
 allocate the xen-backend shrinker
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use new APIs to dynamically allocate the xen-backend shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/xen/xenbus/xenbus_probe_backend.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_backend.c b/drivers/xen/xenbus/xenbus_probe_backend.c
index da96c260e26b..929c41a5ccee 100644
--- a/drivers/xen/xenbus/xenbus_probe_backend.c
+++ b/drivers/xen/xenbus/xenbus_probe_backend.c
@@ -284,13 +284,9 @@ static unsigned long backend_shrink_memory_count(struct shrinker *shrinker,
 	return 0;
 }
 
-static struct shrinker backend_memory_shrinker = {
-	.count_objects = backend_shrink_memory_count,
-	.seeks = DEFAULT_SEEKS,
-};
-
 static int __init xenbus_probe_backend_init(void)
 {
+	struct shrinker *backend_memory_shrinker;
 	static struct notifier_block xenstore_notifier = {
 		.notifier_call = backend_probe_and_watch
 	};
@@ -305,8 +301,16 @@ static int __init xenbus_probe_backend_init(void)
 
 	register_xenstore_notifier(&xenstore_notifier);
 
-	if (register_shrinker(&backend_memory_shrinker, "xen-backend"))
-		pr_warn("shrinker registration failed\n");
+	backend_memory_shrinker = shrinker_alloc(0, "xen-backend");
+	if (!backend_memory_shrinker) {
+		pr_warn("shrinker allocation failed\n");
+		return 0;
+	}
+
+	backend_memory_shrinker->count_objects = backend_shrink_memory_count;
+	backend_memory_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(backend_memory_shrinker);
 
 	return 0;
 }
-- 
2.30.2

