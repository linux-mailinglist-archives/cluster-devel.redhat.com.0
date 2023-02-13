Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7054C694222
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Feb 2023 10:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676282335;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cyUp39UE023N0bBUEv6S5/2ntzW0udbKXDUlMNZ3sCM=;
	b=A9BjlzM6Fa0pfblkKJU860CPmcCZpAoL5YfiXiIAp6BnfXyNHhm6z5JNrHHqFaTDd4VatD
	x8BfgJwSOfB/z50BrMRq1prUfRRjW3KqahMYYmpYTcIxUo4OpTzCL5mGrqitN59f8I7D2L
	iseP4fORYKKIZYGuMcznGnBZfZS1s8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-vzvtfyrRPdOLoWtHkKp7HQ-1; Mon, 13 Feb 2023 04:58:52 -0500
X-MC-Unique: vzvtfyrRPdOLoWtHkKp7HQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 778AD19705B2;
	Mon, 13 Feb 2023 09:58:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC174C16022;
	Mon, 13 Feb 2023 09:58:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E01B194658F;
	Mon, 13 Feb 2023 09:58:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7B0E1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 13 Feb 2023 09:58:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C762E18EC7; Mon, 13 Feb 2023 09:58:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFE3218EC5
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 09:58:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B5FC100F901
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 09:58:47 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-C8fKEzwbO0mHj3brkIqDzw-1; Mon, 13 Feb 2023 04:58:46 -0500
X-MC-Unique: C8fKEzwbO0mHj3brkIqDzw-1
Received: by mail-qt1-f198.google.com with SMTP id
 a24-20020ac87218000000b003bb7c7a82f7so7014032qtp.9
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 01:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cyUp39UE023N0bBUEv6S5/2ntzW0udbKXDUlMNZ3sCM=;
 b=FcxUyK7M/26wGC/DwZFVcFTVvJp44cpbdTSiw1s9H0/70ROzEnSPoogNiOVpW1R3Nk
 xD8KRsbBYelv+hqQp4vPDlp7KvpJQ3bOVYNBkcJTXgqxB0eXEFpRsVrWnM60nCGnNuaK
 i+8rA8n/iU0zRQoU0rPfzj+Dz5geMuQMJHB/K6spiAskzBFlcO+DqdKbDgcdVnIY2Pi+
 WvH0d6t7DFJkEK737sbwtb2+BpNd3EybQ9aa98tOqj6CX2/xMZCZT9cDOTb5KB/HCdt0
 YYU/RDAXCGS9LETthwBO6D7G1E42EKP83uV4HupEoLW9kIz9UP8GeVwSQ2KZmASf6pRw
 Bimg==
X-Gm-Message-State: AO0yUKWvxsMVNm9MbuGUv3okFi15GCC97knRciCXCG2hKQnwhclqou3Z
 p2pUlmYgxsgghmrpUJZhNJvJkI6tPER3XVGKHg11q9aGekwc3I3l0R6gDvscfg+iT/XVAiSYsTV
 mB8ppEg//ewClmf9RJeBtjiJXiCw=
X-Received: by 2002:ac8:57d0:0:b0:3b9:f076:26c7 with SMTP id
 w16-20020ac857d0000000b003b9f07626c7mr42506723qta.10.1676282326021; 
 Mon, 13 Feb 2023 01:58:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8dhMUadh7VYlo8/yJJaUUB0vm0+tJujV3bEUS2t83pbSDYufAE8fRWiEs+z1dPuBh3dPq5Lg==
X-Received: by 2002:ac8:57d0:0:b0:3b9:f076:26c7 with SMTP id
 w16-20020ac857d0000000b003b9f07626c7mr42506712qta.10.1676282325778; 
 Mon, 13 Feb 2023 01:58:45 -0800 (PST)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 r6-20020ae9dd06000000b0071d7ade87afsm9298395qkf.67.2023.02.13.01.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:58:45 -0800 (PST)
Message-ID: <27e6ad15-381b-12b9-3c3a-310bd886a94a@redhat.com>
Date: Mon, 13 Feb 2023 09:58:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: =?UTF-8?Q?Valentin_Vidi=c4=87?= <vvidic@debian.org>
References: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
 <Y+fNfux8S615OSqd@valentin-vidic.from.hr>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <Y+fNfux8S615OSqd@valentin-vidic.from.hr>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 "Fabio M. Di Nitto" <fdinitto@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/02/2023 17:16, Valentin Vidić wrote:
> On Thu, Feb 09, 2023 at 01:12:58PM +0000, Andrew Price wrote:
>> gfs2-utils contains the tools needed to create, check, modify and inspect
>> gfs2 filesystems along with support scripts needed on every gfs2 cluster
>> node.
> 
> Hi,
> 
> Some tests seem to be failing for the new version in Debian:
> 
> gfs2_edit tests
> 
>   37: Save/restoremeta, defaults                      FAILED (edit.at:14)
>   38: Save/restoremeta, no compression                FAILED (edit.at:24)
>   39: Save/restoremeta, min. block size               FAILED (edit.at:34)
>   40: Save/restoremeta, 4 journals                    FAILED (edit.at:44)
>   41: Save/restoremeta, min. block size, 4 journals   FAILED (edit.at:54)
>   42: Save metadata to /dev/null                      ok
> 
> It seems this is all on 32-bit architectures, more info here:
> 
> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armel&ver=3.5.0-1&stamp=1676127480&raw=0
> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armhf&ver=3.5.0-1&stamp=1676127632&raw=0
> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=i386&ver=3.5.0-1&stamp=1676127477&raw=0
> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=mipsel&ver=3.5.0-1&stamp=1676130593&raw=0
> 
> Can you check?
> 

The smoking gun is

     "stderr:
     Error: File system is too small to restore this metadata.
     File system is 524287 blocks. Restore block = 537439"

It's caused by size_t being used for a variable relating to file size 
and it's too small in 32-bit environments.

It should be fixed by this commit: 
https://pagure.io/fork/andyp/gfs2-utils/c/a3f3aadc789f214cd24606808f5d8a6608e10219

It's waiting for the CI queue to flush after last week's outage but it 
should be in main shortly.

I doubt we have any users on 32-bit architectures but perhaps we can get 
a 32-bit test runner added to the CI pool to prevent these issues 
slipping through anyway.

Are you happy to carry the patch or do you think this is worth a 3.5.1?

Thanks,
Andy

