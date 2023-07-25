Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC022760663
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jul 2023 05:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690254591;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
	b=drE0qDzBn+Uowilgbmoqtaq9X2mfkbmaxDDicI6tCdvq0AHzv4x7HUgT8Rk/NEZytR+VPJ
	j+TstKOY/5kmDrTMXXMqcoHu5WVNUil7201VgHiMHryVDhVYNRpm2rZ/L1Ea3a5bQOWvlo
	Z7W1Gsv9NYhEntiQffD+mR1ySkvsMEI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-ZhDHYpeBN1GMGGpVX3JNpw-1; Mon, 24 Jul 2023 23:09:46 -0400
X-MC-Unique: ZhDHYpeBN1GMGGpVX3JNpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB6741C04340;
	Tue, 25 Jul 2023 03:09:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B93F140C206F;
	Tue, 25 Jul 2023 03:09:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E3381946A50;
	Tue, 25 Jul 2023 03:09:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C252B1946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Jul 2023 03:09:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8AAA0C2C85A; Tue, 25 Jul 2023 03:09:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81606C2C858
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 03:09:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 450DF3C02574
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 03:09:25 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-LW1n32osMZGox-7GxUymFA-1; Mon, 24 Jul 2023 23:09:23 -0400
X-MC-Unique: LW1n32osMZGox-7GxUymFA-1
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-25e847bb482so707983a91.1
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 20:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690254562; x=1690859362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
 b=YJ8dSn/W6/ISYcO64v/9shmP53wxH504nidloPqgVrTT4dALumSTl9lkXVwRNEWW0J
 jL0IHbwqV9efRzeiK/CU7e59sNnsXOWRsf8BECQROz2lpgzMkBhtKNEWaTUHilARQAUA
 nA7WKtebPtQNd/+3YD2oLeA9+DdifDXSz42str6MyNJ9DAiJbaAp9B8Ndlk5v87y+Jt4
 yJFYXn8hNyTBoOddEpIlUG3GM4pcaYQ2SLv6IxoRGby63EJqiyLVpa2boMpZPG9Hb0vJ
 vHTw+38KpaFHQSJWUgh0rX0PbEWGaQJdlVnhwJga/ZcAwfTT6kOwOZVgQFiEkfJPQB0m
 ZvGA==
X-Gm-Message-State: ABy/qLaKhmLwZNVjppdm8LAbdC2tU2LG28MoUQ6LZwF4hyr9VVm+O04A
 l0Zst/yvXqkeXn41+yfysvpUdQ==
X-Google-Smtp-Source: APBJJlEruF0WFFXXZAOwcLJKfTF/P8Yek4Wx/bwgxp4VRr2IRHJr9OEk7izXq54CPTEEiNehAqKYyg==
X-Received: by 2002:a17:90a:50f:b0:263:730b:f568 with SMTP id
 h15-20020a17090a050f00b00263730bf568mr10246975pjh.3.1690254562043; 
 Mon, 24 Jul 2023 20:09:22 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 21-20020a17090a199500b002633fa95ac2sm9540001pji.13.2023.07.24.20.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:09:21 -0700 (PDT)
Message-ID: <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
Date: Tue, 25 Jul 2023 11:09:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/25 10:35, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The mm/vmscan.c file is too large, so separate the shrinker-related
>> code from it into a separate file. No functional changes.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> include/linux/shrinker.h |   3 +
>> mm/Makefile              |   4 +-
>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>> mm/vmscan.c              | 701 --------------------------------------
>> 4 files changed, 712 insertions(+), 703 deletions(-)
>> create mode 100644 mm/shrinker.c
>>
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index 224293b2dd06..961cb84e51f5 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -96,6 +96,9 @@ struct shrinker {
>>   */
>> #define SHRINKER_NONSLAB (1 << 3)
>>
>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>> +			   int priority);
> 
> A good cleanup, vmscan.c is so huge.
> 
> I'd like to introduce a new header in mm/ directory and contains those
> declarations of functions (like this and other debug function in
> shrinker_debug.c) since they are used internally across mm.

How about putting them in the mm/internal.h file?

> 
> Thanks.
> 

