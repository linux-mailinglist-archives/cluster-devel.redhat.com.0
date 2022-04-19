Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28850721D
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Apr 2022 17:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650383370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eVMLtYOlJldAoCh1Ugj+7H8fSYWFVrLwSWNyc80gEXc=;
	b=S/ks4eEn92HzkIP3EoGFsM3Y7Uj0XYrsISf1Tvlol5AJVOm860BXAzxj3WVo4DcT3yg1QK
	7n7ncpACKz2kU+PZCkG4ubkPV2Oae1g5J7dTzX1nZ9DtyopM/EH18daGuDgqMHm+mixJEf
	oVt6N6Z7KFFVLsSFLrWMC2Zs0IfuzVs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534--gfMyDr-PEuyFONyEltThQ-1; Tue, 19 Apr 2022 11:49:27 -0400
X-MC-Unique: -gfMyDr-PEuyFONyEltThQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04054801E80;
	Tue, 19 Apr 2022 15:49:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2846B1415125;
	Tue, 19 Apr 2022 15:49:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ADB921940340;
	Tue, 19 Apr 2022 15:49:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE74E1947BBF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 15:49:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0445C53528; Tue, 19 Apr 2022 15:49:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC295C53524
 for <cluster-devel@redhat.com>; Tue, 19 Apr 2022 15:49:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CDFF3C172C0
 for <cluster-devel@redhat.com>; Tue, 19 Apr 2022 15:49:21 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-J-pshL3YNF2PRxZYeRfOJw-1; Tue, 19 Apr 2022 11:49:12 -0400
X-MC-Unique: J-pshL3YNF2PRxZYeRfOJw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020adfc392000000b00207a2102f9bso2031226wrf.7
 for <cluster-devel@redhat.com>; Tue, 19 Apr 2022 08:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:cc:in-reply-to
 :content-transfer-encoding;
 bh=eVMLtYOlJldAoCh1Ugj+7H8fSYWFVrLwSWNyc80gEXc=;
 b=6L1XYgk/603HTgnPm3JFAt4/4+DCmK9hgiMo0aMuCLQS6q5mOMaKQlxleQCs5bLbx4
 Bz4et8rzDxi/UfJmBvf+oDmWqEvM+H7Mv6NeiNVcIk4ecSO6ibOKFNUZlNVR/WOBDwhW
 n+a7kP9gNydU3556MpbWia5WFdh7fvUGI6mZoiY8YFmFbA/UYDxfd8MYMaq7WBCLQJKn
 2xYfUKOru4xabK0P3aht4Nx5yZjq6LVG4YjKqEnb5EscKjxbbNCybOayiRMRCpAZ1iY3
 5v/jtam56MreZqp96ZvtyK2YX54zY10QsCxy17hTqi1MQfl4l/K7ujS9/kC8OKUGlpYS
 sQAw==
X-Gm-Message-State: AOAM530pd4nDCmwWIk7X+LSqDSjnF59+C/bHUtJOjNKZ7mCXAtTO37w2
 qeGyHpvXOUZV3X0vKq7A4t3bq5nF0GhkVS7PUwI6mSUw8tEmmLUISz2LCKKf/t7FtZn6urajIMR
 NyMaF0/jGzCpHcCxaLHUIMg==
X-Received: by 2002:a5d:4307:0:b0:207:8e25:6cfa with SMTP id
 h7-20020a5d4307000000b002078e256cfamr12445572wrq.434.1650383351536; 
 Tue, 19 Apr 2022 08:49:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdG/jMXQBiOU3qFugrkCKtBdOn0nRuT/FArqZAPuOEi07yli1sJ9dk2Wy0EMRspzJIiR/jrQ==
X-Received: by 2002:a5d:4307:0:b0:207:8e25:6cfa with SMTP id
 h7-20020a5d4307000000b002078e256cfamr12445561wrq.434.1650383351366; 
 Tue, 19 Apr 2022 08:49:11 -0700 (PDT)
Received: from [192.168.1.145]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a1c2b03000000b00392a3e6280bsm2629961wmr.8.2022.04.19.08.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 08:49:10 -0700 (PDT)
Message-ID: <b5fcfcbd-104f-ea1a-f808-769c7bd8b91f@redhat.com>
Date: Tue, 19 Apr 2022 16:49:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Andrew Price <anprice@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>
References: <20220405120847.583327-1-anprice@redhat.com>
In-Reply-To: <20220405120847.583327-1-anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH RESEND] gfs2: Return more useful errors
 from gfs2_rgrp_send_discards()
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2022 13:08, Andrew Price wrote:
> The bug that 27ca8273f ("gfs2: Make sure FITRIM minlen is rounded up to
> fs block size") fixes was a little confusing as the user saw
> "Input/output error" which masked the -EINVAL that sb_issue_discard()
> returned.
> 
> sb_issue_discard() can fail for various reasons, so we should return its
> return value from gfs2_rgrp_send_discards() to avoid all errors being
> reported as IO errors.
> 
> This improves error reporting for FITRIM and makes no difference to the
> -o discard code path because the return value from
> gfs2_rgrp_send_discards() gets thrown away in that case (and the option
> switches off). Presumably that's why it was ok to just return -EIO in
> the past, before FITRIM was implemented.
> 
> Tested with xfstests.

Can I get a thumbs-up or thumbs-down for this patch? It's pretty 
straightforward. I just don't want it to get forgotten about.

Cheers,
Andy

> Signed-off-by: Andrew Price <anprice@redhat.com>
> ---
> 
> I don't see this in for-next yet so I've updated the commit log to include more
> details.
> 
>   fs/gfs2/rgrp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 801ad9f4f2be..886343cc05ab 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -1315,7 +1315,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
>   	u64 blk;
>   	sector_t start = 0;
>   	sector_t nr_blks = 0;
> -	int rv;
> +	int rv = -EIO;
>   	unsigned int x;
>   	u32 trimmed = 0;
>   	u8 diff;
> @@ -1371,7 +1371,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
>   	if (sdp->sd_args.ar_discard)
>   		fs_warn(sdp, "error %d on discard request, turning discards off for this filesystem\n", rv);
>   	sdp->sd_args.ar_discard = 0;
> -	return -EIO;
> +	return rv;
>   }
>   
>   /**

