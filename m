Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD85BEAD6
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Sep 2022 18:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663690189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6lov/6mYGN93K3/qacusfg3nw3VRmiQXUrN362vlCSw=;
	b=TG41i2rLVyT6G4Wqo24/R78+I9V0P7KPfp2KHtWoeQ1hXgf/HiN5dm0RD9Pl3lEoKFbDoT
	+hxXs8EJekuNH6HvnyiGoGrl1VnXFYMgCqhdJAi3iosJUrncRyAywhYBZgd2/rsuN4B0Aw
	FEMoqGtlDMFPhEIYdewHm7Dq8KCP49U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-I8DGRGSsPhOuKDAfwmW2hQ-1; Tue, 20 Sep 2022 12:09:47 -0400
X-MC-Unique: I8DGRGSsPhOuKDAfwmW2hQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E79C2811E87;
	Tue, 20 Sep 2022 16:09:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1425940C2064;
	Tue, 20 Sep 2022 16:09:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C2D40194658D;
	Tue, 20 Sep 2022 16:09:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5C5EB1946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 20 Sep 2022 16:09:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2D8B5112131B; Tue, 20 Sep 2022 16:09:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 268ED1121315
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 16:09:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFCA185A583
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 16:01:44 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-q0LF_m3wMNe2hqpvfMcXfg-1; Tue, 20 Sep 2022 12:01:43 -0400
X-MC-Unique: q0LF_m3wMNe2hqpvfMcXfg-1
Received: by mail-pj1-f72.google.com with SMTP id
 o23-20020a17090aac1700b002006b02384fso6697307pjq.3
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 09:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6lov/6mYGN93K3/qacusfg3nw3VRmiQXUrN362vlCSw=;
 b=t7+Uz9iOtsS5v009KsdSbuSu6UbBOwCJvyhBMX14INpMciWWSvJ2IR31kvkcy/UOfw
 4MlrfNRAu+HLrokQf7hMfxck1veAZfAkaBYVVs2TdlmjmbicVvg8gkgaOwrAqN+vNwHI
 iyCstpdbLDtXRPEcW3gdpWR36mIvtNhqc3kjy2sko1B10DRTP4CG00tD0D8uFiboV+DJ
 W9aNHAUNHk/v5PDjZyQD11+YNox8tpqMpM5mt1khwG2Tw2eyv/ZTS7Wdaw2Ur3IO0/C+
 4bD1qmcqNRfx2yCjvieWtyxv6Qkj9IBSz3tm+KmB7zhusI1etjxpd38RjTPPDD2DojCY
 OPYg==
X-Gm-Message-State: ACrzQf1lTpYukk9NleOoBXDw6GamvrHklpJEj+ENZR2+wfjffQcrmbbl
 yIWGwIUNIkZ4+G1UXSBgFqlJF3uT2QjyPrfY9tO+PmjZrsPHnbCz+JXqMSqO9oKQV5zDAPFZ6kC
 WAJ3OowrCGCEa3Dg8jK7l0v79E6KbGy8zV1ovgQ==
X-Received: by 2002:a05:6a00:15c9:b0:541:1767:4ce2 with SMTP id
 o9-20020a056a0015c900b0054117674ce2mr23606134pfu.30.1663689702362; 
 Tue, 20 Sep 2022 09:01:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wZiNZFUiENsew7NkHWq7QezNou5zO1SeUb0aYoSM54RQWJ5p2h2jmCIlU8wbcAS0B/fL0fQijHR9CiyyMLOs=
X-Received: by 2002:a05:6a00:15c9:b0:541:1767:4ce2 with SMTP id
 o9-20020a056a0015c900b0054117674ce2mr23606120pfu.30.1663689702096; Tue, 20
 Sep 2022 09:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220830185213.77259-1-rpeterso@redhat.com>
In-Reply-To: <20220830185213.77259-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 20 Sep 2022 18:01:30 +0200
Message-ID: <CAHc6FU4Wb9+JM6ZMgqVpQgEYFZS9YFZW3s-cSNOMF7-5FXbPqw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH] gfs2: Register fs after creating
 workqueues
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 30, 2022 at 8:52 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, the gfs2 file system was registered prior to creating
> the three workqueues. In some cases this allowed dlm to send recovery
> work to a workqueue that did not yet exist because gfs2 was still
> initializing.
>
> This patch changes the order of gfs2's initialization routine so it only
> registers the file system after the work queues are created.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/main.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
> index 14ae9de76277..afcb32854f14 100644
> --- a/fs/gfs2/main.c
> +++ b/fs/gfs2/main.c
> @@ -151,14 +151,6 @@ static int __init init_gfs2_fs(void)
>         if (error)
>                 goto fail_shrinker;
>
> -       error = register_filesystem(&gfs2_fs_type);
> -       if (error)
> -               goto fail_fs1;
> -
> -       error = register_filesystem(&gfs2meta_fs_type);
> -       if (error)
> -               goto fail_fs2;
> -
>         error = -ENOMEM;
>         gfs_recovery_wq = alloc_workqueue("gfs_recovery",
>                                           WQ_MEM_RECLAIM | WQ_FREEZABLE, 0);
> @@ -180,11 +172,23 @@ static int __init init_gfs2_fs(void)
>                 goto fail_mempool;
>
>         gfs2_register_debugfs();
> +       error = register_filesystem(&gfs2_fs_type);
> +       if (error)
> +               goto fail_fs1;
> +
> +       error = register_filesystem(&gfs2meta_fs_type);
> +       if (error)
> +               goto fail_fs2;
> +
>
>         pr_info("GFS2 installed\n");
>
>         return 0;
>
> +fail_fs2:
> +       unregister_filesystem(&gfs2_fs_type);
> +fail_fs1:
> +       mempool_destroy(gfs2_page_pool);
>  fail_mempool:
>         destroy_workqueue(gfs2_freeze_wq);
>  fail_wq3:
> @@ -192,10 +196,6 @@ static int __init init_gfs2_fs(void)
>  fail_wq2:
>         destroy_workqueue(gfs_recovery_wq);
>  fail_wq1:
> -       unregister_filesystem(&gfs2meta_fs_type);
> -fail_fs2:
> -       unregister_filesystem(&gfs2_fs_type);
> -fail_fs1:
>         unregister_shrinker(&gfs2_qd_shrinker);
>  fail_shrinker:
>         kmem_cache_destroy(gfs2_trans_cachep);
> --
> 2.37.2
>

Pushed to for-next.

Thanks,
Andreas

