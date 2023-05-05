Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B46F7E1B
	for <lists+cluster-devel@lfdr.de>; Fri,  5 May 2023 09:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683272684;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0tqg3ZeGWGHqhyT6IhHFJr7/m5Cy6Prf+agChgWiUDI=;
	b=COOVIB/p3qZ7EYX/xYSztHkA+kAxZXtOXtLXcEyM81oy6NOG6QxSzU7zIbtjaeVCsUqbco
	07VtNmxnNCMpmwScqi5BcpRHgVyqxV+MU85PsKkQVbFkmFksvZ90x1YB8u2Bn11R5MMHJK
	7RdwOyLp79WMD8SXD5ZA7pme5GYQCIY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-9_l1YSeWNVWwtAGoYVTZTw-1; Fri, 05 May 2023 03:44:40 -0400
X-MC-Unique: 9_l1YSeWNVWwtAGoYVTZTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EB0D1C06EDE;
	Fri,  5 May 2023 07:44:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43451492C13;
	Fri,  5 May 2023 07:44:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 038841946A4A;
	Fri,  5 May 2023 07:44:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E7451946A43 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  5 May 2023 07:44:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 06D1B2026D25; Fri,  5 May 2023 07:44:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F41EE2026D16
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 07:44:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D77A71824604
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 07:44:36 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-2lRMqC1aM_CH_U02R87lSA-1; Fri, 05 May 2023 03:44:35 -0400
X-MC-Unique: 2lRMqC1aM_CH_U02R87lSA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so56510425e9.0
 for <cluster-devel@redhat.com>; Fri, 05 May 2023 00:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683272674; x=1685864674;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0tqg3ZeGWGHqhyT6IhHFJr7/m5Cy6Prf+agChgWiUDI=;
 b=iKHETNX1l3mREdk3aPn8U+Bi70R4rjMLPo2vtI4/+f8TdmJLbkREHBaqVOLnA3MsiN
 Ut6nXk/nF+d5TcZrXZif7Lwy3kb8c6FYPY9FJKjZGC8TBMvAsYUT7Ux7xbWN1EJCpLr9
 cSE3YNDu9oSHYSjpuiqUNjwPMA8R+CyxUbiwV52YlFnx6ThRIeloc+Y98sNRnT5fTo74
 0gBoxoLX41P8tF8cHE1Arc77JgJblvmix9UN1auovCCkuYalG39S20M+Vsp725XjXRbd
 KzntBL2NuQoF5O1UlQh8928DSwT1X2vzFrV6KZ/UMJiqevDo4yMFEW6BHzBp3Nc43hOD
 3mzA==
X-Gm-Message-State: AC+VfDwKdbzwQSxycZJZwVrtyDqp2kcoEyQty5pZ410p4b1HXDAk1CZE
 rPJtA+h0/UMwUWX+NoEg6P2F7sxrJHCeAkqXS7Eyy/myu2VGsMM3YmWCqsFGzXrTuiSFNMKST44
 M2/wdDGLwHzrI2GzzQ5MVyUFF2cBG7g==
X-Received: by 2002:a5d:4d0b:0:b0:306:d736:2c50 with SMTP id
 z11-20020a5d4d0b000000b00306d7362c50mr2961079wrt.16.1683272674466; 
 Fri, 05 May 2023 00:44:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yxmeWO3YZER2yz2eFQ25AoRtCdCLtNao7eAHuy13RPxb2GDjHF2jz+1LXZzUgQ1ymQw2vRw==
X-Received: by 2002:a5d:4d0b:0:b0:306:d736:2c50 with SMTP id
 z11-20020a5d4d0b000000b00306d7362c50mr2961068wrt.16.1683272674211; 
 Fri, 05 May 2023 00:44:34 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d6b91000000b00306337e5464sm1503118wrx.44.2023.05.05.00.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 00:44:33 -0700 (PDT)
Message-ID: <d388a721-fac9-3b3a-497b-9aee3aec7066@redhat.com>
Date: Fri, 5 May 2023 08:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Bob Peterson <rpeterso@redhat.com>
References: <20230504174322.384715-1-rpeterso@redhat.com>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <20230504174322.384715-1-rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH] gfs2: ignore rindex_update failure in
 dinode_dealloc
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bob,

On 04/05/2023 18:43, Bob Peterson wrote:
> Before this patch function gfs2_dinode_dealloc would abort if it got a
> bad return code from gfs2_rindex_update. The problem is that it left the
> dinode in the unlinked (not free) state, which meant subsequent fsck
> would clean it up and flag an error. That meant some of our QE tests
> would fail.

As I understand it the test is an interrupted rename loop workload and 
gfs2_grow at the same time, and the bad return code is -EINTR, right?

> The sole purpose of gfs2_rindex_update, in this code path, is to read in
> any newer rgrps added by gfs2_grow. But since this is a delete operation
> it won't actually use any of those new rgrps. It can really only twiddle
> the bits from "Unlinked" to "Free" in an existing rgrp. Therefore the
> error should not prevent the transition from unlinked to free.
> 
> This patch makes gfs2_dinode_dealloc ignore the bad return code and
> proceed with freeing the dinode so the QE tests will not be tripped up.

Is it really ok to ignore all potential errors here? I wonder if it 
should just ignore -EINTR (or whichever error the test produces) so that 
it can still fail well for errors like -EIO.

Cheers,
Andy

> 
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>   fs/gfs2/super.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index d3b5c6278be0..1f23d7845123 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1131,9 +1131,7 @@ static int gfs2_dinode_dealloc(struct gfs2_inode *ip)
>   		return -EIO;
>   	}
>   
> -	error = gfs2_rindex_update(sdp);
> -	if (error)
> -		return error;
> +	gfs2_rindex_update(sdp);



>   
>   	error = gfs2_quota_hold(ip, NO_UID_QUOTA_CHANGE, NO_GID_QUOTA_CHANGE);
>   	if (error)

