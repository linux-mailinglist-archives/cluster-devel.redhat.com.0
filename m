Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA8269586D
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Feb 2023 06:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676351951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AKNwmmwuvKO5nn2Tq2VwG+JXdhZ4g1fDu8Iuc19dFz4=;
	b=OpaqRS19DzeHRnmBV0XogxdlcC4BjEqTWw23idnwwff1ovpHc4hOjH49bA3XmIlmggzXhj
	qU3PKdoGLvmV0ShAp4SbBkNeAviO+icAEmhxORE8tQ+oJrhEfjxxsdKZ1ZC2P4IGSbM/Xf
	YoDNvJmBYy1vslXlJ60DimuLgYWyMXs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-2aInEeR2PPS0SQsol2ZkIA-1; Tue, 14 Feb 2023 00:19:07 -0500
X-MC-Unique: 2aInEeR2PPS0SQsol2ZkIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A34EF971080;
	Tue, 14 Feb 2023 05:19:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BD5018EC7;
	Tue, 14 Feb 2023 05:19:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 10FA4194658F;
	Tue, 14 Feb 2023 05:19:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E1E01946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Feb 2023 05:19:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E36FB1121319; Tue, 14 Feb 2023 05:19:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3D41121318
 for <cluster-devel@redhat.com>; Tue, 14 Feb 2023 05:19:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE68101A55E
 for <cluster-devel@redhat.com>; Tue, 14 Feb 2023 05:19:03 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-2UC2rF6XNAWEnwa4fZntYQ-1; Tue, 14 Feb 2023 00:19:00 -0500
X-MC-Unique: 2UC2rF6XNAWEnwa4fZntYQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso9026021edc.7
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 21:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AKNwmmwuvKO5nn2Tq2VwG+JXdhZ4g1fDu8Iuc19dFz4=;
 b=D99rSoLHHsAUjmpcLDtKipWFYZiAGoFGTqBlxdgWnrbd5n+yVtUMPzrUt7iythFmGG
 fs2zrl6tFVlZS2aH6arrAAZShZxWS+QYmkFDdqX7kdQD96nyxvr74/60WuZW6S8URvYG
 qCVfRMIH7a8flgcRJ70rs4Cw6jBBlNU401mfVWc5Eq2M638lWSF8Eg96mlDiD/1A8T/P
 fCYsMtu5aEew2sEwrjMMzNa6qDzhnyOujEntfOZBUoEdU4k2Ddav5ES4wAWVEYApqXKp
 jJqwIhjiNvSz4YBUbnJVSGkP+W7wrs+q3kqweqGryggnMRj1i8q2YkWm3rwBMklFVsV0
 qz4A==
X-Gm-Message-State: AO0yUKWjYhiqY8aqZULpWYrJAEoGNY3v17HmHG11CM1+I5SbIgcPaFlO
 CRokipGaBTv0fYPJRdqKEpsllC9rDVv47AV1nZXjDYW7egMK/+ZdkrWv74DXkjnnTglR4fHI8Bw
 BX/0RXh7BA3ixaQICcO7ofA==
X-Received: by 2002:a17:906:2518:b0:88f:a236:69e6 with SMTP id
 i24-20020a170906251800b0088fa23669e6mr1599888ejb.7.1676351939049; 
 Mon, 13 Feb 2023 21:18:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+8Yx5U4RXjpmJnz8fTTuLTufMBumuoqYA+n5g8dTuqZVuMfRJ91n4qXYgBMHdr6OZ3d2z55g==
X-Received: by 2002:a17:906:2518:b0:88f:a236:69e6 with SMTP id
 i24-20020a170906251800b0088fa23669e6mr1599878ejb.7.1676351938770; 
 Mon, 13 Feb 2023 21:18:58 -0800 (PST)
Received: from [192.168.0.200] (87-59-200-15-cable.dk.customer.tdc.net.
 [87.59.200.15]) by smtp.gmail.com with ESMTPSA id
 k16-20020a170906681000b0087223b8d6efsm7826570ejr.16.2023.02.13.21.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 21:18:56 -0800 (PST)
Message-ID: <417a9b47-f893-2a9e-25f1-bb7e9feb20e2@redhat.com>
Date: Tue, 14 Feb 2023 06:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Andrew Price <anprice@redhat.com>, =?UTF-8?Q?Valentin_Vidi=c4=87?=
 <vvidic@debian.org>
References: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
 <Y+fNfux8S615OSqd@valentin-vidic.from.hr>
 <27e6ad15-381b-12b9-3c3a-310bd886a94a@redhat.com>
From: "Fabio M. Di Nitto" <fdinitto@redhat.com>
In-Reply-To: <27e6ad15-381b-12b9-3c3a-310bd886a94a@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/02/2023 10.58, Andrew Price wrote:
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
> 
> I doubt we have any users on 32-bit architectures but perhaps we can get 
> a 32-bit test runner added to the CI pool to prevent these issues 
> slipping through anyway.

We had to drop i686 from CI for lack of BaseOS support of 32bit 
OpenStack / Cloud images.

Also, other HA tools like pacemaker, have dropped 32bit support a while 
back. Not sure it´s worth the troubles any more.

If Valentin has an easy way to setup a 64 bit Debian based that will 
build a 32bit env with easy envvar overrides, I am happy to add it to 
the pool for gfs2-utils, but I am not going to build pure i686 images 
for that.

The process would have to look like:

<deploy amd64 debian image and add to CI> (usual)
apt-get install <list of packages + 32 bit versions of them>
git clone gfs2-utils
export CFLAGS/LDFLAGS/CC or whatever env var
<normal build bits go here>
./autogen.sh
./configure..
make
make <tests>

Using other build tools like debbuild or mock has been problematic in 
the past for other projects, might not be the case for gfs2-utils.

so you can try that all in a local VM and let me know the steps, then we 
can add it to CI.

Fabio


