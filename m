Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522E766056
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Jul 2023 01:48:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690501738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UUZwd9FWje3LDYrkbylKOQ09XR3jrOmpTlI+8YbT+nI=;
	b=MZDADcOnu3C46SSOvF5K4LRVZkFWZGAnV/UlLdwVBOT5XgWqjGzCM6G3jQg5FSHMSvOkqp
	sPQYYDeD3WZgjKXKykdSBeJauAvSAGU3ablrcwkoGouSSDKLXmfAX00j4uT7v1/aSWSEsf
	9pvPD+A+TBnPGoh6MhU0VCts1558P1g=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-DNIlJ7AeMam_-3jKX38jnA-1; Thu, 27 Jul 2023 19:48:54 -0400
X-MC-Unique: DNIlJ7AeMam_-3jKX38jnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE064380051E;
	Thu, 27 Jul 2023 23:48:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B85FF7825;
	Thu, 27 Jul 2023 23:48:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A94FF1946A7C;
	Thu, 27 Jul 2023 23:48:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 734711946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 23:48:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4E4CEF7832; Thu, 27 Jul 2023 23:48:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46529F7825
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 23:48:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29408101A54E
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 23:48:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-30PFEky1NSSRBWXQy0mdzg-1; Thu, 27 Jul 2023 19:48:46 -0400
X-MC-Unique: 30PFEky1NSSRBWXQy0mdzg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA7BB61F8A;
 Thu, 27 Jul 2023 23:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5FDC433C7;
 Thu, 27 Jul 2023 23:48:39 +0000 (UTC)
Message-ID: <217f3a7e-7681-0da6-aaa7-252a1451f7ba@kernel.org>
Date: Fri, 28 Jul 2023 08:48:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Dave Chinner <david@fromorbit.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
 <ZML22YJi5vPBDEDj@dread.disaster.area>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <ZML22YJi5vPBDEDj@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v3 28/49] dm zoned: dynamically allocate
 the dm-zoned-meta shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/28/23 07:59, Dave Chinner wrote:
> On Thu, Jul 27, 2023 at 07:20:46PM +0900, Damien Le Moal wrote:
>> On 7/27/23 17:55, Qi Zheng wrote:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 zmd->mblk_shrinker->count_objects =3D dmz_=
mblock_shrinker_count;
>>>>> +=C2=A0=C2=A0=C2=A0 zmd->mblk_shrinker->scan_objects =3D dmz_mblock_s=
hrinker_scan;
>>>>> +=C2=A0=C2=A0=C2=A0 zmd->mblk_shrinker->seeks =3D DEFAULT_SEEKS;
>>>>> +=C2=A0=C2=A0=C2=A0 zmd->mblk_shrinker->private_data =3D zmd;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 shrinker_register(zmd->mblk_shrinker);
>>>>
>>>> I fail to see how this new shrinker API is better... Why isn't there a
>>>> shrinker_alloc_and_register() function ? That would avoid adding all t=
his code
>>>> all over the place as the new API call would be very similar to the cu=
rrent
>>>> shrinker_register() call with static allocation.
>>>
>>> In some registration scenarios, memory needs to be allocated in advance=
.
>>> So we continue to use the previous prealloc/register_prepared()
>>> algorithm. The shrinker_alloc_and_register() is just a helper function
>>> that combines the two, and this increases the number of APIs that
>>> shrinker exposes to the outside, so I choose not to add this helper.
>>
>> And that results in more code in many places instead of less code + a si=
mple
>> inline helper in the shrinker header file...
>=20
> It's not just a "simple helper" - it's a function that has to take 6
> or 7 parameters with a return value that must be checked and
> handled.
>=20
> This was done in the first versions of the patch set - the amount of
> code in each caller does not go down and, IMO, was much harder to
> read and determine "this is obviously correct" that what we have
> now.
>=20
>> So not adding that super simple
>> helper is not exactly the best choice in my opinion.
>=20
> Each to their own - I much prefer the existing style/API over having
> to go look up a helper function every time I want to check some
> random shrinker has been set up correctly....

OK. All fair points.


--=20
Damien Le Moal
Western Digital Research

