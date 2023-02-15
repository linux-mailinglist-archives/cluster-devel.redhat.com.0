Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B922697597
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Feb 2023 05:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676436956;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9GGT9qYr7YSEso0EnGrvwGRntkBCvKyhXwX87H5B6xY=;
	b=Rl6pxREPQMBiW77xYyh10LCY1GL+bx+eoPJ8osMaqSeQDDueH+LkLjC/YlVtcAz1cSfJjs
	DkkdRqUVIjrvPaPR5t99hRNVNxmvMF0opez75r/b3MJ8YjaXfymF4CtgfQRH24A0/AS8am
	x23q/DqbWbt3dxw+GKx2fzs8Ho2bjls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-B-DpReWtPUe5oFOTFSJJsQ-1; Tue, 14 Feb 2023 23:55:49 -0500
X-MC-Unique: B-DpReWtPUe5oFOTFSJJsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11A5485A5B1;
	Wed, 15 Feb 2023 04:55:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF0151C55A;
	Wed, 15 Feb 2023 04:55:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AAF6B1946595;
	Wed, 15 Feb 2023 04:55:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C7EE01946586 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 15 Feb 2023 04:55:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AA7D1111E415; Wed, 15 Feb 2023 04:55:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2F24111E413
 for <cluster-devel@redhat.com>; Wed, 15 Feb 2023 04:55:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 613348028B0
 for <cluster-devel@redhat.com>; Wed, 15 Feb 2023 04:55:45 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-rwkLOwIMN3-9ycP_DqFr1Q-1; Tue, 14 Feb 2023 23:55:39 -0500
X-MC-Unique: rwkLOwIMN3-9ycP_DqFr1Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 lf9-20020a170907174900b0087861282038so11347505ejc.6
 for <cluster-devel@redhat.com>; Tue, 14 Feb 2023 20:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9GGT9qYr7YSEso0EnGrvwGRntkBCvKyhXwX87H5B6xY=;
 b=3f+TjXznnhvuli9TPsjztKyalZteg0x4jXsW/Fuc1I5nOu4QmN0MXK//sPRn7JEg/G
 oE+j9jK/XkT5G33y/Y+DxVz4lF98QP4odQff0HFhkGxcFOBBrZQMQdKvQaxd/q4uB16u
 F3tOv0vNVV/RztAWmZq0LBF7941xRxrtOZ+OEqFJ8bQxhLB9yxPnOrOulzBOjJxsRDWm
 ydmrx990RFsxsI8Gb68b6OiK1zzc+mlPIoPtQgck95UjjBjQ9E36/3mbwK0FbObJHPsH
 J+Uv46B52Y1FOdU9Lj4bjjnmz8pSUKWibdeFp8vs5OBUXAI/FrZ+fA7ib13EaxZaOEW0
 vstQ==
X-Gm-Message-State: AO0yUKUPzXEqnwGm1wMx0G3Hv0VoaOxMrParjgpaBAiPj2ANlJwtLe8v
 UeZpgMr1I84jueAnVxB7yLlj3z9ISGSEAVFDJKztRFLKY8pdtzVXPlGiJmI8YTll9H53hNqtxD+
 IuwdoyR3pBTWqPHOUHKbjng==
X-Received: by 2002:a17:906:a287:b0:88d:9cf8:2dbb with SMTP id
 i7-20020a170906a28700b0088d9cf82dbbmr960057ejz.12.1676436937933; 
 Tue, 14 Feb 2023 20:55:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/eI4BvypUArC7zS+FqJeyPWi8c1EyikVzag9wgfGeG/5f9DhQx1k+kqgDWzNphksF4bHsATw==
X-Received: by 2002:a17:906:a287:b0:88d:9cf8:2dbb with SMTP id
 i7-20020a170906a28700b0088d9cf82dbbmr960050ejz.12.1676436937608; 
 Tue, 14 Feb 2023 20:55:37 -0800 (PST)
Received: from [192.168.0.200] (87-59-200-15-cable.dk.customer.tdc.net.
 [87.59.200.15]) by smtp.gmail.com with ESMTPSA id
 r27-20020a170906351b00b008b132c5ea47sm1459047eja.153.2023.02.14.20.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 20:55:37 -0800 (PST)
Message-ID: <46f838d2-96d5-5109-95c5-9e7056bee87c@redhat.com>
Date: Wed, 15 Feb 2023 05:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Valentin Vidic <vvidic@debian.org>
References: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
 <Y+fNfux8S615OSqd@valentin-vidic.from.hr>
 <27e6ad15-381b-12b9-3c3a-310bd886a94a@redhat.com>
 <417a9b47-f893-2a9e-25f1-bb7e9feb20e2@redhat.com>
 <Y+vsdnFHPJifPzE/@valentin-vidic.from.hr>
From: "Fabio M. Di Nitto" <fdinitto@redhat.com>
In-Reply-To: <Y+vsdnFHPJifPzE/@valentin-vidic.from.hr>
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



On 14/02/2023 21.17, Valentin Vidic wrote:
> On Tue, Feb 14, 2023 at 06:18:55AM +0100, Fabio M. Di Nitto wrote:
>> The process would have to look like:
>>
>> <deploy amd64 debian image and add to CI> (usual)
>> apt-get install <list of packages + 32 bit versions of them>
>> git clone gfs2-utils
>> export CFLAGS/LDFLAGS/CC or whatever env var
>> <normal build bits go here>
>> ./autogen.sh
>> ./configure..
>> make
>> make <tests>
>>
>> Using other build tools like debbuild or mock has been problematic in the
>> past for other projects, might not be the case for gfs2-utils.
>>
>> so you can try that all in a local VM and let me know the steps, then we can
>> add it to CI.
> 
> Sure, the commands to build and test a 32-bit version look like this for me:
> 
> dpkg --add-architecture i386

doh.. didn´t think of cross compilation.

> apt-get update
> apt-get install --yes build-essential crossbuild-essential-i386 autoconf automake autopoint autotools-dev bison flex check:i386 libblkid-dev:i386 libbz2-dev:i386 libncurses-dev:i386 libtool pkg-config:i386 zlib1g-dev:i386
> ./configure --build=x86_64-linux-gnu --host=i686-linux-gnu
> make
> make check
> 

ack perfect, we already have a Debian CI builder dedicated to arm cross 
compilation, we can tweak it to add i386 as well.

Thanks
Fabio

