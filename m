Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F372DF79
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jun 2023 12:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686652217;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8OeAqNdzPM4zuhihaPfn7sB9x1cVzXTGTHDzi2og3MQ=;
	b=hCj211DZzJAfeou8XhAMHRmG1lzxViN/I0bEx+P3kDKVYQ2fnSy0tYgMHl9WInpZNC3e+l
	kYFdscaoLiOpFHqayAMgXezBoLY79Lj04/5SoCvxL50UlrnlnAJZZQrLUAB69B53LkNpvY
	XEhubchRkF0Cn9zwXxeIWHEocpesWCk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-_AGXBookNDy7LQmUYYDArw-1; Tue, 13 Jun 2023 06:30:13 -0400
X-MC-Unique: _AGXBookNDy7LQmUYYDArw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E0AE801585;
	Tue, 13 Jun 2023 10:30:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 623F6492C1B;
	Tue, 13 Jun 2023 10:30:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5325219452C1;
	Tue, 13 Jun 2023 10:30:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 41263194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 13 Jun 2023 03:07:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2FC0140C20F5; Tue, 13 Jun 2023 03:07:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2853A40C20F4
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 03:07:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E17E101A58B
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 03:07:07 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277--ExDyJrkOWGDWHQDJcgEnw-1; Mon, 12 Jun 2023 23:06:57 -0400
X-MC-Unique: -ExDyJrkOWGDWHQDJcgEnw-1
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-650c89c7e4fso5467975b3a.0; 
 Mon, 12 Jun 2023 20:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686625616; x=1689217616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8OeAqNdzPM4zuhihaPfn7sB9x1cVzXTGTHDzi2og3MQ=;
 b=UWcwroU72NDpsaLi9b5ljKv8N5mNE+ra5a3vtKIAAgk7FQAQHsj055ClUn3j9v+7jO
 khH0wRIN1rYvHWaDL5pAS7Aep7D0yjgvWueFUNYzSTvWejZ5e/EXo/lHGPGZfAiB48XS
 fB7bxP8Xpmc+VznaWl3voGgY/8kLPZ9XaHxB5oDj+P7vFNfFLxt/V1fyYYzD/lXvz0xX
 lzl6fQmSQK2Yq2UG/drhLTCL46CPZG4uUVjWP4IfSp0BoKE6b/cm6niAChsOm7beGRaz
 UBiUaQo4hU/8EemFS88FwYVVGKmMUzD9C+o636VrrRVnT/9p5EPeSCVdj4YLsT7yggzn
 kevg==
X-Gm-Message-State: AC+VfDzIPBzCP4yIxGXTtaQKIKlgg5fW+bYQMYRLaF9/WrQYs9FwZ7Zu
 YlnwNaZyxZ7bD8R95KsK+2nXQKoh41JO9Q==
X-Google-Smtp-Source: ACHHUZ6K2RVfBHF4XbKXgWLqSIs5w4D5IUjF+1h+c2TaEnJRO7T1ZcZB3Xqwt2q3ImQevqOktJU/Xw==
X-Received: by 2002:a05:6a00:1a11:b0:643:59cd:6cad with SMTP id
 g17-20020a056a001a1100b0064359cd6cadmr13916138pfv.24.1686625616038; 
 Mon, 12 Jun 2023 20:06:56 -0700 (PDT)
Received: from oslab-pc.tsinghua.edu.cn ([166.111.139.112])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a62fb0c000000b0063b675f01a5sm7807191pfm.11.2023.06.12.20.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 20:06:55 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: rpeterso@redhat.com,
	agruenba@redhat.com
Date: Tue, 13 Jun 2023 11:06:37 +0800
Message-Id: <20230613030637.2934730-1-islituo@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 13 Jun 2023 10:30:04 +0000
Subject: [Cluster-devel] [PATCH] gfs2: Fix possible data races in
 gfs2_show_options()
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
Cc: cluster-devel@redhat.com, baijiaju1990@outlook.com,
 BassCheck <bass@buaa.edu.cn>, linux-kernel@vger.kernel.org,
 Tuo Li <islituo@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Some fields such as gt_logd_secs of the struct gfs2_tune are accessed 
without holding the lock gt_spin in gfs2_show_options():

  val = sdp->sd_tune.gt_logd_secs;
  if (val != 30)
    seq_printf(s, ",commit=%d", val);

And thus can cause data races when gfs2_show_options() and other functions
such as gfs2_reconfigure() are concurrently executed:

  spin_lock(&gt->gt_spin);
  gt->gt_logd_secs = newargs->ar_commit;

To fix these possible data races, the lock sdp->sd_tune.gt_spin is 
acquired before accessing the fields of gfs2_tune and released after these
accesses.

Reported-by: BassCheck <bass@buaa.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 fs/gfs2/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index a84bf6444bba..671adf38fe03 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1059,6 +1059,7 @@ static int gfs2_show_options(struct seq_file *s, struct dentry *root)
 	}
 	if (args->ar_discard)
 		seq_puts(s, ",discard");
+	spin_lock(&sdp->sd_tune.gt_spin);
 	val = sdp->sd_tune.gt_logd_secs;
 	if (val != 30)
 		seq_printf(s, ",commit=%d", val);
@@ -1070,6 +1071,7 @@ static int gfs2_show_options(struct seq_file *s, struct dentry *root)
 	val = sdp->sd_tune.gt_quota_quantum;
 	if (val != 60)
 		seq_printf(s, ",quota_quantum=%d", val);
+	spin_unlock(&sdp->sd_tune.gt_spin);
 	if (args->ar_statfs_percent)
 		seq_printf(s, ",statfs_percent=%d", args->ar_statfs_percent);
 	if (args->ar_errors != GFS2_ERRORS_DEFAULT) {
-- 
2.34.1

