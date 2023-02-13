Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD99694D6F
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Feb 2023 17:54:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676307283;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rs7Mx5SEaEfq/itUk1q0itKISSyPB6oSEDiFzgq5/q0=;
	b=Ovb6Qai/PjMBPVfe6uoZMmPNADfG6nsBETcQ6izkEpa11dk1FP1enTKAEqyG51rFFvYv/M
	NCK5wXJ9bvajAxHNEVQYIaP+DAOWiNNKPS1NjQGfHqGD9s3OEwHGb9VpmhqfhovJ1hT3h4
	qAQTXN/yyhPYp0Of1d3Nm2fEEebkabs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-ZiYXPxUhPIyCQVE0XCU4MA-1; Mon, 13 Feb 2023 11:54:40 -0500
X-MC-Unique: ZiYXPxUhPIyCQVE0XCU4MA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14719811E6E;
	Mon, 13 Feb 2023 16:54:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 074D12166B26;
	Mon, 13 Feb 2023 16:54:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A3889194658F;
	Mon, 13 Feb 2023 16:54:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6969A1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 13 Feb 2023 16:54:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A251C16022; Mon, 13 Feb 2023 16:54:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02D0BC158BB
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 16:54:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB73F858F09
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 16:54:31 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-IJlCSEyYPVKMJRbe2BbPAg-1; Mon, 13 Feb 2023 11:54:30 -0500
X-MC-Unique: IJlCSEyYPVKMJRbe2BbPAg-1
Received: by mail-qv1-f70.google.com with SMTP id
 pv24-20020ad45498000000b0056ea549d728so2616729qvb.10
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 08:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rs7Mx5SEaEfq/itUk1q0itKISSyPB6oSEDiFzgq5/q0=;
 b=izBjkhraKRK96wE9P8PTj9RZaQuMXvEddrIG9xqOJ+OK9iHIKWN1ZZMTXZFtWOUZAp
 rBRhloBXYCr8HG67ghBwwtz8QY+BqsaBrU15loTH7Y9xgl8sSVlXPcqElUt621vUjv+s
 W9qzFv90QY80eYah9St0ppypnAkA9Acx5KYcmO5yPyo0wVJtMt4kxCKojTvCyN7a3K97
 uLIeAwJW+Pzb2yxJWcjrnck2RUeQgwwGtlg2iFmeNIBamVsmHi+KwWfCQuXh1CxYyIDT
 saEEqxuNik2xzr2CB8dMxcSHkQZfnK4QwLDKfYb9La7aVK0OO9a8oOOPRYbc5W+cAfq4
 hXbA==
X-Gm-Message-State: AO0yUKX2yEwS+tk6wRcijSUqNRmHAIpjlfv5k77JnGwCbkEwsGhAosHr
 05Pve5XitdecTWGPiDTM+ysn9UMJP0+O6XFmJEg92Z4lO0Z3e0Du05zYVs01JKSuLHWfif6Ua8l
 qW93jUsMhBcPohgcOQdqdlbENevg=
X-Received: by 2002:ac8:5f83:0:b0:3bb:7702:97f5 with SMTP id
 j3-20020ac85f83000000b003bb770297f5mr34370045qta.15.1676307270128; 
 Mon, 13 Feb 2023 08:54:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/cUstTfYf28Ml3YPNpYXRjjSaURydMEkteCQLQ62P03MVcc+V+phFbjddralnJw/M3kaCQuQ==
X-Received: by 2002:ac8:5f83:0:b0:3bb:7702:97f5 with SMTP id
 j3-20020ac85f83000000b003bb770297f5mr34370020qta.15.1676307269823; 
 Mon, 13 Feb 2023 08:54:29 -0800 (PST)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a379403000000b006bb29d932e1sm10124176qkd.105.2023.02.13.08.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:54:29 -0800 (PST)
Message-ID: <8e04ea90-b878-878d-71d0-776867546050@redhat.com>
Date: Mon, 13 Feb 2023 16:54:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Price <anprice@redhat.com>
To: =?UTF-8?Q?Valentin_Vidi=c4=87?= <vvidic@debian.org>
References: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
 <Y+fNfux8S615OSqd@valentin-vidic.from.hr>
 <27e6ad15-381b-12b9-3c3a-310bd886a94a@redhat.com>
In-Reply-To: <27e6ad15-381b-12b9-3c3a-310bd886a94a@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [ClusterLabs] gfs2-utils 3.5.0 released
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/02/2023 09:58, Andrew Price wrote:
> On 11/02/2023 17:16, Valentin Vidić wrote:
>> On Thu, Feb 09, 2023 at 01:12:58PM +0000, Andrew Price wrote:
>>> gfs2-utils contains the tools needed to create, check, modify and 
>>> inspect
>>> gfs2 filesystems along with support scripts needed on every gfs2 cluster
>>> node.
>>
>> Hi,
>>
>> Some tests seem to be failing for the new version in Debian:
>>
>> gfs2_edit tests
>>
>>   37: Save/restoremeta, defaults                      FAILED (edit.at:14)
>>   38: Save/restoremeta, no compression                FAILED (edit.at:24)
>>   39: Save/restoremeta, min. block size               FAILED (edit.at:34)
>>   40: Save/restoremeta, 4 journals                    FAILED (edit.at:44)
>>   41: Save/restoremeta, min. block size, 4 journals   FAILED (edit.at:54)
>>   42: Save metadata to /dev/null                      ok
>>
>> It seems this is all on 32-bit architectures, more info here:
>>
>> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armel&ver=3.5.0-1&stamp=1676127480&raw=0
>> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armhf&ver=3.5.0-1&stamp=1676127632&raw=0
>> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=i386&ver=3.5.0-1&stamp=1676127477&raw=0
>> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=mipsel&ver=3.5.0-1&stamp=1676130593&raw=0
>>
>> Can you check?
>>
> 
> The smoking gun is
> 
>      "stderr:
>      Error: File system is too small to restore this metadata.
>      File system is 524287 blocks. Restore block = 537439"
> 
> It's caused by size_t being used for a variable relating to file size 
> and it's too small in 32-bit environments.
> 
> It should be fixed by this commit: 
> https://pagure.io/fork/andyp/gfs2-utils/c/a3f3aadc789f214cd24606808f5d8a6608e10219
> 
> It's waiting for the CI queue to flush after last week's outage but it 
> should be in main shortly.

It's now in main: https://pagure.io/gfs2-utils/c/a3f3aadc

Andy

> I doubt we have any users on 32-bit architectures but perhaps we can get 
> a 32-bit test runner added to the CI pool to prevent these issues 
> slipping through anyway.
> 
> Are you happy to carry the patch or do you think this is worth a 3.5.1?
> 
> Thanks,
> Andy

