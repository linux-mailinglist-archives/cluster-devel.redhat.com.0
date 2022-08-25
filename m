Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 241435A0CB6
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Aug 2022 11:33:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661419991;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f93As8t+AUZuoeXw4IPmjspMtTl9iyRz8DSCXtau4WA=;
	b=gFqd85jXG3zQoDCMAJmV4wqbhIPY6Ij+eX0QMUvvOzJhFdFPIWdsCW3j+s+Oqoqsxu1Zru
	PmpTdn93BUAWYnIzxb1uVIZpbRRnPQQXeY7fdGWBV2aWXy5CDrgYegTjAIDmIGBUZ40Gwz
	zNZ0IOVG57aMbRrazHpzW3X9mNG48mA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-JaM03NwFORy8HKpp4gWedw-1; Thu, 25 Aug 2022 05:33:08 -0400
X-MC-Unique: JaM03NwFORy8HKpp4gWedw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46B6685A58A;
	Thu, 25 Aug 2022 09:33:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 816D4492CA6;
	Thu, 25 Aug 2022 09:33:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 672B41946A5E;
	Thu, 25 Aug 2022 09:33:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABCD71946A43 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 09:33:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8BDBD2166B29; Thu, 25 Aug 2022 09:33:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87CB82166B26
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 09:33:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C84C811130
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 09:33:03 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-8N2fVygzNnCGxt92RzDgpw-1; Thu, 25 Aug 2022 05:33:01 -0400
X-MC-Unique: 8N2fVygzNnCGxt92RzDgpw-1
Received: by mail-qk1-f200.google.com with SMTP id
 w17-20020a05620a425100b006b97978c693so16843019qko.19
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 02:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=f93As8t+AUZuoeXw4IPmjspMtTl9iyRz8DSCXtau4WA=;
 b=N3HETdAuJigRkzxgUZGbdsIEnhlOgXp1fn2VJytm/CmynIk7P93sjcQ35Rck5SV8bC
 sV7gpqrc/W6fND8WTGZVJEbS4WEmdqL2xs4PZkppRmsWCk7Joyeb/QYLEasDNW3LwPim
 W5+qXHahrMQ2JAjoiRCuZhX/T//1uVeo1jppJgJnmQz2BFfQ3QoAeZvcc5EmPjPvFK7r
 5YwIU27d3PvLgOWtizfEWjlvUD26hN3/x0A8yzKVVMSlbEWW807HZEsGFYRmQ84mYa2W
 TaezqVxb8XrDMtmLEr6+zAuZLj7Gj74y5QOO4MQ/Jb27AFtk8jP7pQlhF4EPvz45HqjP
 CKPw==
X-Gm-Message-State: ACgBeo1N7Y1e9QN962awCKy3LkwbZFGSYB70ZW0Z4++tBCPDFL3jXNAX
 W5QSG98Wp8P+uwbp3GXjDcmyvgkQ4yPIwHBgqHW5O5YOCyHs1gVfU7cvPBsR0w2DuU0FU1xV37k
 a3MxZSVqJuIZjHGiNHbqasA==
X-Received: by 2002:a05:620a:f83:b0:6bb:ac26:e566 with SMTP id
 b3-20020a05620a0f8300b006bbac26e566mr2204230qkn.779.1661419981137; 
 Thu, 25 Aug 2022 02:33:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5CMv5jYuA/JegCZgF/AkLiAH2iQsQFomqiCX+y/Zu+/FOx28tVRoV8HXTM6lhhC0eY1djUvQ==
X-Received: by 2002:a05:620a:f83:b0:6bb:ac26:e566 with SMTP id
 b3-20020a05620a0f8300b006bbac26e566mr2204217qkn.779.1661419980956; 
 Thu, 25 Aug 2022 02:33:00 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 k8-20020ac80748000000b0031ee918e9f9sm13368029qth.39.2022.08.25.02.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 02:33:00 -0700 (PDT)
Message-ID: <d53a4672-d068-c394-6ab1-058b2d72701f@redhat.com>
Date: Thu, 25 Aug 2022 10:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20220818210144.7915-1-wsa+renesas@sang-engineering.com>
 <bd7275c6-4ebe-de99-75c2-400cfa2e5026@redhat.com> <YwaFRvWw5hi/uWYs@shikoro>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <YwaFRvWw5hi/uWYs@shikoro>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH] gfs2: move from strlcpy with unused
 retval to strscpy
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/2022 21:08, Wolfram Sang wrote:
> Hi Andy.
> 
>>> -	strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
>>> -	strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
>>> +	strscpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
>>> +	strscpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
>>
>> Perhaps the size should be changed to GFS2_LOCKNAME_LEN to match the size of
>> the destination, too.
>>
>> With that addition, this patch fixes this syzkaller report:
>>
>> https://listman.redhat.com/archives/cluster-devel/2022-August/022755.html
> 
> Linus wrote another summary about strlcpy vs. strscpy use[1]. So, the
> size argument should be the size of the smaller buffer if the buffers
> are of different size. GFS2_LOCKNAME_LEN is smaller, so that looks
> suitable. Shall I resend the patch with the suggested change?

Yes, please. I can't speak for the gfs2 maintainers but I think it would 
be a good plan, as the combination of strscpy and the size change fixes 
a bug.

Andy

> 
> All the best,
> 
>     Wolfram
> 
> [1] https://lore.kernel.org/lkml/CAHk-=wi+xbVq++uqW9YgWpHjyBHNB8a-xad+Xp23-B+eodLCEA@mail.gmail.com/
> 

