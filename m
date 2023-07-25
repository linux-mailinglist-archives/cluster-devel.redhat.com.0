Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2276069F
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jul 2023 05:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690255713;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6wY4cILkEhsrpRf+mNddP0nleKOSU9sayj8Z5h0ToXM=;
	b=ecMgYjAnPVOt/2dN59K9hl8V/05AQQGRD/ALTX9LiA2xSz6KiqYtosEn+M/wOe7Kakxbxv
	6/7dtgRUKmV4qLW2V5MNU51E+5ImZrrlpnZOv4F4u5e8zyfP6AuKQ7SAchMlZ44Hc7x1mT
	/1opLMN/Y2UlsPkYFFMUVIzlqjIEv94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-ffAv_c1lMEafjn6qk1x0eg-1; Mon, 24 Jul 2023 23:28:26 -0400
X-MC-Unique: ffAv_c1lMEafjn6qk1x0eg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2DC8830DAE;
	Tue, 25 Jul 2023 03:28:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B0F546A3A9;
	Tue, 25 Jul 2023 03:28:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 43B861946A50;
	Tue, 25 Jul 2023 03:28:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 15FB61946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Jul 2023 03:28:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 035021454143; Tue, 25 Jul 2023 03:28:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEBEA1454145
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 03:28:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04783186E397
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 03:28:17 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-SreKx1PuOp6xSBj6xC-50A-1; Mon, 24 Jul 2023 23:28:11 -0400
X-MC-Unique: SreKx1PuOp6xSBj6xC-50A-1
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so1183676b3a.0
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 20:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690255690; x=1690860490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6wY4cILkEhsrpRf+mNddP0nleKOSU9sayj8Z5h0ToXM=;
 b=LyIFmQeKHjK2iBQJ9tmTinwiHuZyphmnmHgHk6GeqlVI3gz20/uZP8jdZcN/vfMz7Y
 F8IAjMiM1FE42aZnglEVYZTBc1gJWpJF6OQvFMcxNm2scjEKq6JAiRw5j6nj/l1kLgrF
 2rflBFgEuogJrVHv4NNNmMCWQrUCUlQ5q4viNvJRqXirbVLU+4zNb+xb2+BN0ZdY0Bya
 LwkN0fPAhbeULqv7aEkPK1oM0q5BunclU6z+XJcFxC8it9Um548glTwD+ljpe3mDFMPH
 zZwhE0u6rtQ9Qo2Kir/REQRkDbBkqUOGL9NLUt5qWspFMD3j38roaSWogJehXIOUxFJe
 b5rw==
X-Gm-Message-State: ABy/qLaHhA/MSHoJHjdXViMyrMwpEwggwF4tCAao72xCdnBo0M/rPEEx
 BqcEzRp566iDUpRDUpJrjJc0Vw==
X-Google-Smtp-Source: APBJJlHvnzRChS6v/nee9rDGEWxm9C29UVXVwYKOSH3HP5ue/guAsHAKmcdiSeukVqd30tCkGAz2cw==
X-Received: by 2002:a05:6a00:cd1:b0:677:bb4c:c321 with SMTP id
 b17-20020a056a000cd100b00677bb4cc321mr15272930pfv.0.1690255690395; 
 Mon, 24 Jul 2023 20:28:10 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([240e:694:e21:b::2]) by smtp.gmail.com with ESMTPSA id
 s3-20020aa78283000000b00682a9325ffcsm8407714pfm.5.2023.07.24.20.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:28:10 -0700 (PDT)
Message-ID: <bbd36d96-b6b8-08c3-1092-e3d0b255134a@bytedance.com>
Date: Tue, 25 Jul 2023 11:27:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
 <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
 <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH v2 01/47] mm: vmscan: move
 shrinker-related code into a separate file
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/25 11:23, Muchun Song wrote:
> 
> 
>> On Jul 25, 2023, at 11:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>>
>>
>> On 2023/7/25 10:35, Muchun Song wrote:
>>>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>>
>>>> The mm/vmscan.c file is too large, so separate the shrinker-related
>>>> code from it into a separate file. No functional changes.
>>>>
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>> ---
>>>> include/linux/shrinker.h |   3 +
>>>> mm/Makefile              |   4 +-
>>>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>>>> mm/vmscan.c              | 701 --------------------------------------
>>>> 4 files changed, 712 insertions(+), 703 deletions(-)
>>>> create mode 100644 mm/shrinker.c
>>>>
>>>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>>>> index 224293b2dd06..961cb84e51f5 100644
>>>> --- a/include/linux/shrinker.h
>>>> +++ b/include/linux/shrinker.h
>>>> @@ -96,6 +96,9 @@ struct shrinker {
>>>>   */
>>>> #define SHRINKER_NONSLAB (1 << 3)
>>>>
>>>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>>>> +    int priority);
>>> A good cleanup, vmscan.c is so huge.
>>> I'd like to introduce a new header in mm/ directory and contains those
>>> declarations of functions (like this and other debug function in
>>> shrinker_debug.c) since they are used internally across mm.
>>
>> How about putting them in the mm/internal.h file?
> 
> Either is fine to me.

OK, will do in the next version.

> 
>>
>>> Thanks.
> 
> 

