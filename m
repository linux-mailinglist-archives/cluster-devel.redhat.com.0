Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D2514C69
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Apr 2022 16:08:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651241332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UivoAbBzisS3PG7oWBofxDd0NA7/2p+/oQuAHuVxcd8=;
	b=ZyRDUSebaLX8M6URKB+4YiZqjDDSqijVmU7//eXx+IOEXYWY4rnAbhXyrW5pyecrocTnhb
	dVFmqeN7ojpWs1SigsA7+2kskGTRt3Z8KFfeeapQdKByvCZdJxgPzQ80Vr9MAb9HUi+TAU
	HnuINUrSe5IXi7ZDkZ7BfYzCS56FpkM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-Fhto-UR3PEChmd8eSeuwWg-1; Fri, 29 Apr 2022 10:08:51 -0400
X-MC-Unique: Fhto-UR3PEChmd8eSeuwWg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51C8380418B;
	Fri, 29 Apr 2022 14:08:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5E5E401E9C;
	Fri, 29 Apr 2022 14:08:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 441A31947057;
	Fri, 29 Apr 2022 14:08:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D57C9194704B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 29 Apr 2022 14:08:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 71C18455D87; Fri, 29 Apr 2022 14:08:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DF58455D6D
 for <cluster-devel@redhat.com>; Fri, 29 Apr 2022 14:08:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B4EC185A79C
 for <cluster-devel@redhat.com>; Fri, 29 Apr 2022 14:08:42 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-ZBU-3fSGOFyw4DzRhPaMrw-1; Fri, 29 Apr 2022 10:08:39 -0400
X-MC-Unique: ZBU-3fSGOFyw4DzRhPaMrw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g9-20020a1c4e09000000b0038f20d94f01so5930651wmh.8
 for <cluster-devel@redhat.com>; Fri, 29 Apr 2022 07:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=UivoAbBzisS3PG7oWBofxDd0NA7/2p+/oQuAHuVxcd8=;
 b=o/fTfaELM5NTV5ij5MoJ3XUI+TVV6Y/yafdlcLf8B5g5KDBk5wJjOFbXLhRBtdgJbC
 sVkBYHtJZSsU3eZgz/jdY+JeUhW6sfHZPM5U9Iqf35l6D44K7TDNZ6zgyDvxzpkhEf4q
 FFciuRIJ7Cf6ATGoEqIxl1o8ZdadzJ0u1l1VxVoVUiTI8IIDmQNvJXP6OGhl+4NP+Uke
 NHkjLP/H5xYzQ8VePD+AeM7eAIkaWWuE3hgkxp2uSOf6xT3bT7atQRjI0JXxUoIdDP+p
 9r7a/wmlHvLjKtFyL4hTb5zT2uq/WSa54HWQ7fJ/dJxtQZOCKuYJ139Z1ZX2GnKQ0Xjs
 jNyA==
X-Gm-Message-State: AOAM531SL3iIdbp6xXKWBVZaJS/OBd27QkwIOwTvFcRbWCFKhKLl0WOu
 2s9bFnHSsi42omcwx5F471jzRnlqOfobI2gU1XlVRgGNfxZKW7XW+0tBBQ2WDmTZhOfsgvs3bZx
 JgDfF/eJ2XCwU/wK8PaoJ7w==
X-Received: by 2002:a5d:584e:0:b0:20a:9034:e312 with SMTP id
 i14-20020a5d584e000000b0020a9034e312mr32060137wrf.518.1651241318528; 
 Fri, 29 Apr 2022 07:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHKot4AVpTJvaj2dPbiCebjIArs4xeLBtlbnFIx8E0XQDZn/hUSU9eTwk1GQAMSfbe0M5KyQ==
X-Received: by 2002:a5d:584e:0:b0:20a:9034:e312 with SMTP id
 i14-20020a5d584e000000b0020a9034e312mr32060116wrf.518.1651241318251; 
 Fri, 29 Apr 2022 07:08:38 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7437837wmb.48.2022.04.29.07.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 07:08:37 -0700 (PDT)
Message-ID: <4f808327-b831-f546-8d3f-5dfdf849bdef@redhat.com>
Date: Fri, 29 Apr 2022 15:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Andrew Price <anprice@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>
References: <20220405120847.583327-1-anprice@redhat.com>
 <b5fcfcbd-104f-ea1a-f808-769c7bd8b91f@redhat.com>
In-Reply-To: <b5fcfcbd-104f-ea1a-f808-769c7bd8b91f@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/04/2022 16:49, Andrew Price wrote:
> On 05/04/2022 13:08, Andrew Price wrote:
>> The bug that 27ca8273f ("gfs2: Make sure FITRIM minlen is rounded up to
>> fs block size") fixes was a little confusing as the user saw
>> "Input/output error" which masked the -EINVAL that sb_issue_discard()
>> returned.
>>
>> sb_issue_discard() can fail for various reasons, so we should return its
>> return value from gfs2_rgrp_send_discards() to avoid all errors being
>> reported as IO errors.
>>
>> This improves error reporting for FITRIM and makes no difference to the
>> -o discard code path because the return value from
>> gfs2_rgrp_send_discards() gets thrown away in that case (and the option
>> switches off). Presumably that's why it was ok to just return -EIO in
>> the past, before FITRIM was implemented.
>>
>> Tested with xfstests.
> 
> Can I get a thumbs-up or thumbs-down for this patch? It's pretty 
> straightforward. I just don't want it to get forgotten about.
> 
> Cheers,
> Andy

Please could you take this patch?

Cheers,
Andy

>> Signed-off-by: Andrew Price <anprice@redhat.com>
>> ---
>>
>> I don't see this in for-next yet so I've updated the commit log to 
>> include more
>> details.
>>
>>   fs/gfs2/rgrp.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
>> index 801ad9f4f2be..886343cc05ab 100644
>> --- a/fs/gfs2/rgrp.c
>> +++ b/fs/gfs2/rgrp.c
>> @@ -1315,7 +1315,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd 
>> *sdp, u64 offset,
>>       u64 blk;
>>       sector_t start = 0;
>>       sector_t nr_blks = 0;
>> -    int rv;
>> +    int rv = -EIO;
>>       unsigned int x;
>>       u32 trimmed = 0;
>>       u8 diff;
>> @@ -1371,7 +1371,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd 
>> *sdp, u64 offset,
>>       if (sdp->sd_args.ar_discard)
>>           fs_warn(sdp, "error %d on discard request, turning discards 
>> off for this filesystem\n", rv);
>>       sdp->sd_args.ar_discard = 0;
>> -    return -EIO;
>> +    return rv;
>>   }
>>   /**
> 

