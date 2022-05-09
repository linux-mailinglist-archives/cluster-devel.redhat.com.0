Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC951FA23
	for <lists+cluster-devel@lfdr.de>; Mon,  9 May 2022 12:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652092885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1o2eIts7zj0N+/VwGP20u9in3jO/7ji1D6RzirQLfkk=;
	b=PsFv1R3WMr2kEoOKArMAn3m8UMkl9SSd9H3C4GGM5VwD4ED4PM7oUXN+JE6j40JLubT+VG
	KR24Uf7QzSwuf4wH5M66/5AX+QHpl3CgKlsg7aMvZKmEWramnYNX+4YQc9KcdE1vW5SFLy
	EhR/uCG9/MRz31Y45p8nPI/2dD77GeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-ji8iHiGeOPKrHXZAbBMlrw-1; Mon, 09 May 2022 06:41:22 -0400
X-MC-Unique: ji8iHiGeOPKrHXZAbBMlrw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1823800B21;
	Mon,  9 May 2022 10:41:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A49CA42D4EE;
	Mon,  9 May 2022 10:41:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B914194705D;
	Mon,  9 May 2022 10:41:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E79441947052 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  9 May 2022 10:41:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1D5740D282A; Mon,  9 May 2022 10:41:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DFF040D2829
 for <cluster-devel@redhat.com>; Mon,  9 May 2022 10:41:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8543B86B8AB
 for <cluster-devel@redhat.com>; Mon,  9 May 2022 10:41:18 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-EpRV7EPxPZ2wub4CKBFv9w-1; Mon, 09 May 2022 06:41:17 -0400
X-MC-Unique: EpRV7EPxPZ2wub4CKBFv9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso5614121wrp.21
 for <cluster-devel@redhat.com>; Mon, 09 May 2022 03:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=1o2eIts7zj0N+/VwGP20u9in3jO/7ji1D6RzirQLfkk=;
 b=zIj+KO+rSZLHCJ5BTwuLlZ+W+5yudmro99/9fmQekYIvR/0EzZ+7G1Xn2YZkIBt0oz
 d9zfXzZWPpuRZG2jFMRXYv6JETb1KPNastV9zeFPUgnCo68iCesbxksfOj8PstPFU4vY
 II4Q4n1PY85gtuvln0kuFEq/RPtAvHJf+FNppRfS1pv6fbjadR6U3CHHBIpyNpEo1zWF
 gqROS13nBnPMfFk1Njgg0HubXhcAwyUeibWgj6a4DTi+lSFLgxHBkyM6gFRdem0u20J1
 hRzMnUlG+vKFZOokNww7v366062NmU8HFjXZoC+p7qXSjM6Zt3icYcNxloeYGCNGSmiO
 9Ynw==
X-Gm-Message-State: AOAM531BmSjfcXaKQ7ftjTmtPMy3Zk3gaSwBoBFB9hw4EPq89hLhmzuc
 MaD8nD5C1fn/M0tOvXgTv8n7m+ArB4iU+2W3ehAtLaFyK3CalI2/36DE/aMyObpbIMfg0O0bn3c
 tcw+7YrMEDch3cuCambMa6w==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr22142461wmj.38.1652092876276; 
 Mon, 09 May 2022 03:41:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCjR849Yfk5SBT+0Wf6lt+X3FSRa6JxDF8Kpwvivm4dA362NDNPjtyOM0Up/+dpDr305/yNg==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr22142440wmj.38.1652092876052; 
 Mon, 09 May 2022 03:41:16 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c264b00b0039444973258sm18965247wmy.0.2022.05.09.03.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 03:41:15 -0700 (PDT)
Message-ID: <5488b93e-96c8-9007-9ee4-667247fa8c30@redhat.com>
Date: Mon, 9 May 2022 11:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Andrew Price <anprice@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>
References: <20220405120847.583327-1-anprice@redhat.com>
 <b5fcfcbd-104f-ea1a-f808-769c7bd8b91f@redhat.com>
 <4f808327-b831-f546-8d3f-5dfdf849bdef@redhat.com>
In-Reply-To: <4f808327-b831-f546-8d3f-5dfdf849bdef@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/04/2022 15:08, Andrew Price wrote:
> On 19/04/2022 16:49, Andrew Price wrote:
>> On 05/04/2022 13:08, Andrew Price wrote:
>>> The bug that 27ca8273f ("gfs2: Make sure FITRIM minlen is rounded up to
>>> fs block size") fixes was a little confusing as the user saw
>>> "Input/output error" which masked the -EINVAL that sb_issue_discard()
>>> returned.
>>>
>>> sb_issue_discard() can fail for various reasons, so we should return its
>>> return value from gfs2_rgrp_send_discards() to avoid all errors being
>>> reported as IO errors.
>>>
>>> This improves error reporting for FITRIM and makes no difference to the
>>> -o discard code path because the return value from
>>> gfs2_rgrp_send_discards() gets thrown away in that case (and the option
>>> switches off). Presumably that's why it was ok to just return -EIO in
>>> the past, before FITRIM was implemented.
>>>
>>> Tested with xfstests.
>>
>> Can I get a thumbs-up or thumbs-down for this patch? It's pretty 
>> straightforward. I just don't want it to get forgotten about.
>>
>> Cheers,
>> Andy
> 
> Please could you take this patch?
> 
> Cheers,
> Andy

For convenience, I've pushed this patch to gitlab:

   git fetch https://gitlab.com/andyprice/linux.git discard_errors
   git show FETCH_HEAD

Cheers,
Andy

>>> Signed-off-by: Andrew Price <anprice@redhat.com>
>>> ---
>>>
>>> I don't see this in for-next yet so I've updated the commit log to 
>>> include more
>>> details.
>>>
>>>   fs/gfs2/rgrp.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
>>> index 801ad9f4f2be..886343cc05ab 100644
>>> --- a/fs/gfs2/rgrp.c
>>> +++ b/fs/gfs2/rgrp.c
>>> @@ -1315,7 +1315,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd 
>>> *sdp, u64 offset,
>>>       u64 blk;
>>>       sector_t start = 0;
>>>       sector_t nr_blks = 0;
>>> -    int rv;
>>> +    int rv = -EIO;
>>>       unsigned int x;
>>>       u32 trimmed = 0;
>>>       u8 diff;
>>> @@ -1371,7 +1371,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd 
>>> *sdp, u64 offset,
>>>       if (sdp->sd_args.ar_discard)
>>>           fs_warn(sdp, "error %d on discard request, turning discards 
>>> off for this filesystem\n", rv);
>>>       sdp->sd_args.ar_discard = 0;
>>> -    return -EIO;
>>> +    return rv;
>>>   }
>>>   /**
>>
> 

