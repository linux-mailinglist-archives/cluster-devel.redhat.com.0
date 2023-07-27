Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204D764A79
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 10:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690445405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GSWsN00ewH1CUxuL2on0amogNZtYjpfZMPk3tXk1MLc=;
	b=Q+gLtuotOzMcyBBWFT//bib0S+lvGkLCtTwNfDpt2nDPPZHl3lrJJnES7J/dpUnvsL8odH
	MLz6KHrwZVbBA+Mq0/QAH2ZqNlekRXEgQvLf7bgTi756VpQOKpBJVinDXT3LjHgp0P89i6
	WKoZAWmrYTvI6s0EtNBrvXs8edKGIQw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-g2f9wamTO4SAIAZjbpZMwQ-1; Thu, 27 Jul 2023 04:10:04 -0400
X-MC-Unique: g2f9wamTO4SAIAZjbpZMwQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24B9A1C0754B;
	Thu, 27 Jul 2023 08:10:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1835A492C13;
	Thu, 27 Jul 2023 08:10:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B75D71946A72;
	Thu, 27 Jul 2023 08:10:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E93D1946A6C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 08:09:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D0464094DC2; Thu, 27 Jul 2023 08:09:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55CCB4094DC0
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:09:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 381CB8870D4
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:09:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-MRwtZtfhOYuh5WAn0DKsnQ-1; Thu, 27 Jul 2023 04:09:42 -0400
X-MC-Unique: MRwtZtfhOYuh5WAn0DKsnQ-1
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-686f74a8992so77705b3a.1
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 01:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445381; x=1691050181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GSWsN00ewH1CUxuL2on0amogNZtYjpfZMPk3tXk1MLc=;
 b=FLIeBk0cKhOStyw1hPRkY6DjNj6UdBy/dbsEnOwa6mUaFg8IYUTwjNVGrsJ6rg36Nm
 tnHL63xj4Z2P9lF3SlQikesLcvk418FsLXHyqiWBkqVr3VTiQgrd9u1AA5LuKT7ZZlqb
 Fg5khI9lT5Vpyw0FUtvJAgGmNECb1C2/Lo+HANcXqc8nzurvgopAxEbpMETaQardZkOY
 UTQPFokWSKy31xMU7/ghNuw3LksJ094NqGMMp/icjHg13gQbBM6xpttEhNezMkIjW9jR
 jgl+ZKUdhh5qfhinMal/T4tWTwn8KrldVO6ESqIVrno+rce6yz0WEo/t3SejJ/dV9S5I
 IdQA==
X-Gm-Message-State: ABy/qLbf/ma1MDATRxU5XxxLpERUyNm2WCv7RBgSfnD/1R+uf15Ig/cM
 jt2aNYtqiCs1MsPHTv17bVXj1g==
X-Google-Smtp-Source: APBJJlHVjyqYSo1ak3Z7chV1yhtxMPzG2+b/e8BLYdWQhXdIbtZlkhi04HlfYJAG9z5TWY/X++2RBQ==
X-Received: by 2002:a05:6a20:729a:b0:100:b92b:e8be with SMTP id
 o26-20020a056a20729a00b00100b92be8bemr5576237pzk.2.1690445381598; 
 Thu, 27 Jul 2023 01:09:41 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:09:41 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:32 +0800
Message-Id: <20230727080502.77895-20-zhengqi.arch@bytedance.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v3 19/49] rcu: dynamically allocate the
 rcu-lazy shrinker
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
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use new APIs to dynamically allocate the rcu-lazy shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 kernel/rcu/tree_nocb.h | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index 5598212d1f27..e1c59c33738a 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -1396,13 +1396,6 @@ lazy_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 
 	return count ? count : SHRINK_STOP;
 }
-
-static struct shrinker lazy_rcu_shrinker = {
-	.count_objects = lazy_rcu_shrink_count,
-	.scan_objects = lazy_rcu_shrink_scan,
-	.batch = 0,
-	.seeks = DEFAULT_SEEKS,
-};
 #endif // #ifdef CONFIG_RCU_LAZY
 
 void __init rcu_init_nohz(void)
@@ -1410,6 +1403,7 @@ void __init rcu_init_nohz(void)
 	int cpu;
 	struct rcu_data *rdp;
 	const struct cpumask *cpumask = NULL;
+	struct shrinker * __maybe_unused lazy_rcu_shrinker;
 
 #if defined(CONFIG_NO_HZ_FULL)
 	if (tick_nohz_full_running && !cpumask_empty(tick_nohz_full_mask))
@@ -1436,8 +1430,16 @@ void __init rcu_init_nohz(void)
 		return;
 
 #ifdef CONFIG_RCU_LAZY
-	if (register_shrinker(&lazy_rcu_shrinker, "rcu-lazy"))
-		pr_err("Failed to register lazy_rcu shrinker!\n");
+	lazy_rcu_shrinker = shrinker_alloc(0, "rcu-lazy");
+	if (!lazy_rcu_shrinker) {
+		pr_err("Failed to allocate lazy_rcu shrinker!\n");
+	} else {
+		lazy_rcu_shrinker->count_objects = lazy_rcu_shrink_count;
+		lazy_rcu_shrinker->scan_objects = lazy_rcu_shrink_scan;
+		lazy_rcu_shrinker->seeks = DEFAULT_SEEKS;
+
+		shrinker_register(lazy_rcu_shrinker);
+	}
 #endif // #ifdef CONFIG_RCU_LAZY
 
 	if (!cpumask_subset(rcu_nocb_mask, cpu_possible_mask)) {
-- 
2.30.2

