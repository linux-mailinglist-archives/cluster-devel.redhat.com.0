Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1414E4736
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Mar 2022 21:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647979715;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mxlwc4d7bWY4T3wpJII8XK0GCpC5WYKxcBaKgEq1xpU=;
	b=aAillyrd6dVyoBjsXhvuteHR3upL+6a0Si0Ahi94UtAtvaSsRPbfLR3gwMdDGtkUN2rmx+
	EmiY5qSsTO2RQisLdAL1G1iynCJpd5fG8194TwrS4PUjxC4s8hk+OpIPAiOgwVlLpQumUN
	koJ4xbRKFNgPoeW+PgTz09WeQvWpWSE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-pRXpq_iMPgCE5HVwwU1PEw-1; Tue, 22 Mar 2022 16:08:31 -0400
X-MC-Unique: pRXpq_iMPgCE5HVwwU1PEw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2E03C01B93;
	Tue, 22 Mar 2022 20:08:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6DDC40317E;
	Tue, 22 Mar 2022 20:08:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 646DE1940347;
	Tue, 22 Mar 2022 20:08:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EDF2A1949762 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Mar 2022 20:08:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BA2811417201; Tue, 22 Mar 2022 20:08:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6A6F1400C2F
 for <cluster-devel@redhat.com>; Tue, 22 Mar 2022 20:08:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92ED61C05EB4
 for <cluster-devel@redhat.com>; Tue, 22 Mar 2022 20:08:28 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-HWM61wnxOQGKB2veu4hhwA-1; Tue, 22 Mar 2022 16:08:27 -0400
X-MC-Unique: HWM61wnxOQGKB2veu4hhwA-1
Received: by mail-wm1-f72.google.com with SMTP id
 4-20020a05600c274400b0038c8ab2e835so1344461wmw.1
 for <cluster-devel@redhat.com>; Tue, 22 Mar 2022 13:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=Mxlwc4d7bWY4T3wpJII8XK0GCpC5WYKxcBaKgEq1xpU=;
 b=jHQ6JqfcH8ugEngwAICZzkJtNlBBf0CJnNO4OUgSucB3M3sQtb7wSCeimWwAGJSFts
 8oYjTy+om2WL6bHUxa7kRwOcNQ2XL/rfBse4aheP+dqe8wWPlIp1/WFWT4ZbCBoe36gj
 kJeHzlG4zZlZSQXvXcqSV6tUFf3vpn3Ueqh8GVjJjpy1gV5NaUp+uA5pGC/jkNoT1zAh
 pP+2lOWCCLu0KKW1NCmSMCyCc58wSupT4bWH1Q2w3Ie9rUIREhRnbcnFienMuxzUUUKE
 q9eSDtl0Ad9zAUcLpuKM1YaYAg6Kh/tm0boLGUM+CnfI981Nt6rTh6n29JgH0wwYL67a
 AOcw==
X-Gm-Message-State: AOAM531k8YTHhSSKYbSkj7A2Ct6FHSc997qEuD8JjyXRGiMG+zVn7FOO
 WD5U+dG15ROj8c9olaG3bbPWd2RQpCK+yL5bIkGekDAaRsBOj4TaLxXFuYC5zts02wympyT06sr
 vVj5YX6Tf4DgpciuzVLEgzVUJ6zg0Eb6HO9bAgkkNaZOaffkq7G4hfcsvsy2flZXGVaLY6JEm
X-Received: by 2002:a05:600c:4b83:b0:38c:49b5:5bfc with SMTP id
 e3-20020a05600c4b8300b0038c49b55bfcmr5699906wmp.33.1647979706069; 
 Tue, 22 Mar 2022 13:08:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHklhFGcpFpdjzFsri8ur2z0lc0t/OtC/OP6dJifSIrEA4qwOv7dS9yBpybqTJLG0g40WbNg==
X-Received: by 2002:a05:600c:4b83:b0:38c:49b5:5bfc with SMTP id
 e3-20020a05600c4b8300b0038c49b55bfcmr5699881wmp.33.1647979705792; 
 Tue, 22 Mar 2022 13:08:25 -0700 (PDT)
Received: from [192.168.1.145]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a5d66c5000000b00203fd25f4ecsm9936314wrw.16.2022.03.22.13.08.25
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 13:08:25 -0700 (PDT)
Message-ID: <f2a5d2f7-0e10-6c55-2719-30ce9317484e@redhat.com>
Date: Tue, 22 Mar 2022 20:08:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
References: <20220322190551.357960-1-anprice@redhat.com>
In-Reply-To: <20220322190551.357960-1-anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] gfs2: Make sure FITRIM minlen is
 rounded up to fs block size
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2022 19:05, Andrew Price wrote:
> Per fstrim(8) we must round up the minlen argument to the fs block size.
> The current calculation doesn't take into account devices that have a
> discard granularity and requested minlen less than 1 fs block, so the
> value can get shifted away to zero in the translation to fs blocks.
> 
> The zero minlen passed to gfs2_rgrp_send_discards() then allows
> sb_issue_discard() to be called with nr_sects == 0 which returns -EINVAL
> and results in gfs2_rgrp_send_discards() returning -EIO.

Adding test results. xfstests interprets fstrim failures as "FITRIM not 
supported" and doesn't run them, so I got these results:

5.17:

Ran: generic/260 generic/288 generic/537
Not run: generic/260 generic/288 generic/537
Passed all 3 tests

5.17 + patch:

Ran: generic/260 generic/288 generic/537
Passed all 3 tests

(Those 3 tests are in the ones in the 'quick' and 'trim' groups)

Andy

> Make sure minlen is never < 1 fs block by taking the max of the
> requested minlen and the fs block size before comparing to the device's
> discard granularity and shifting to fs blocks.
> 
> Fixes: 076f0faa764ab ("GFS2: Fix FITRIM argument handling")
> Signed-off-by: Andrew Price <anprice@redhat.com>
> ---
>   fs/gfs2/rgrp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 0fb3c01bc557..a34945cbf32a 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -1415,7 +1415,8 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
>   
>   	start = r.start >> bs_shift;
>   	end = start + (r.len >> bs_shift);
> -	minlen = max_t(u64, r.minlen,
> +	minlen = max_t(u64, r.minlen, sdp->sd_sb.sb_bsize);
> +	minlen = max_t(u64, minlen,
>   		       q->limits.discard_granularity) >> bs_shift;
>   
>   	if (end <= start || minlen > sdp->sd_max_rg_data)

