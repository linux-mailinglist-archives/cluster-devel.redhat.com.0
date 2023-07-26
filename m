Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C47631AC
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 11:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690363275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7Vnbbe8QuBX5IRYOyrvoqHk8WWyxAnIOQvNq7rt3Y5Y=;
	b=OGx+/Ps81lThUZX3yz8OVQNa+r0E1QXR/k3dNUshE766Bi8x79NYdBDqkOzv5AGoAJPCRf
	EEuuWLXkuqpLZxHWVViSgxw9Fq2lyfNES+hCduxS3plFEjkEywweqKX8ARcZMC9EmINaqd
	hDiWZB2ZByCY3B9rZPhAIrPMCEG7Oqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-vywT-Hk-O6CKFrEpfRMXfA-1; Wed, 26 Jul 2023 05:21:11 -0400
X-MC-Unique: vywT-Hk-O6CKFrEpfRMXfA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88E0380027F;
	Wed, 26 Jul 2023 09:21:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 772BA492CAC;
	Wed, 26 Jul 2023 09:21:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 42FD9194E00F;
	Wed, 26 Jul 2023 09:21:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 729191946A69 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 09:21:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4FF0F200B41D; Wed, 26 Jul 2023 09:21:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D88200BA74
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:21:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2835B185A7AE
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:21:09 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-zLUH5FwCON6W3ChH5qnEDA-1; Wed, 26 Jul 2023 05:21:05 -0400
X-MC-Unique: zLUH5FwCON6W3ChH5qnEDA-1
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-760dff4b701so80711139f.0
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 02:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363264; x=1690968064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Vnbbe8QuBX5IRYOyrvoqHk8WWyxAnIOQvNq7rt3Y5Y=;
 b=II76ZQHUTt2Hyki+x1bUs7mnFgCgVLB/haiP7/AuP3uxNWbDkfWcyT1R+FsEoYPJMp
 X+i9LCkbA5D1kO/U7mlozrPRYd1ZUF1EuvBMd506kRg/7q0Z+IuNtfHpxAs5A1tSfCR9
 VKSY5xKlpOjgwAPl2hu5vtotMTf21oBYTZ9CugKih6okqWQe8/AtHbTJwU4sbNA/liWr
 2IfY0TQmSWRyNouPCNKQWesWD13DyzF0UeYuqAbPLe59LiBQcKeJTDmyaR0YerIaeN54
 BkEjqy6V12x7kS+svR5SqOdbu1KxBnQOf//GNCH02xTE8Eysql/3kiEFQsLBV2XTtFPP
 iRLw==
X-Gm-Message-State: ABy/qLaIAaosGHJvw7StuQy7mrX0qePG2jO8hMfuOouXoEk1b4Zn7aEd
 vjSiMYRoi385ZO1sxfJi6IL1fw==
X-Google-Smtp-Source: APBJJlFD+0JL20cmcfz8xSZcxHSPSuKA9am5rBHzXLXGZAWVolxxOeef+bBAtrNC9deWoQ1MX3gUWg==
X-Received: by 2002:a6b:3b44:0:b0:787:1926:54ed with SMTP id
 i65-20020a6b3b44000000b00787192654edmr1450699ioa.1.1690363264233; 
 Wed, 26 Jul 2023 02:21:04 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a63b601000000b005638a70110bsm9005279pgf.65.2023.07.26.02.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:21:03 -0700 (PDT)
Message-ID: <0caf10e8-e54b-3c1b-7df5-d95adc757ba7@bytedance.com>
Date: Wed, 26 Jul 2023 17:20:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Dave Chinner <david@fromorbit.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
 <ZMDKjBCZH6+OP5gW@dread.disaster.area>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZMDKjBCZH6+OP5gW@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v2 03/47] mm: shrinker: add
 infrastructure for dynamically allocating shrinker
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
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

On 2023/7/26 15:26, Dave Chinner wrote:
> On Mon, Jul 24, 2023 at 05:43:10PM +0800, Qi Zheng wrote:
>> Currently, the shrinker instances can be divided into the following three
>> types:
>>
>> a) global shrinker instance statically defined in the kernel, such as
>>     workingset_shadow_shrinker.
>>
>> b) global shrinker instance statically defined in the kernel modules, such
>>     as mmu_shrinker in x86.
>>
>> c) shrinker instance embedded in other structures.
>>
>> For case a, the memory of shrinker instance is never freed. For case b,
>> the memory of shrinker instance will be freed after synchronize_rcu() when
>> the module is unloaded. For case c, the memory of shrinker instance will
>> be freed along with the structure it is embedded in.
>>
>> In preparation for implementing lockless slab shrink, we need to
>> dynamically allocate those shrinker instances in case c, then the memory
>> can be dynamically freed alone by calling kfree_rcu().
>>
>> So this commit adds the following new APIs for dynamically allocating
>> shrinker, and add a private_data field to struct shrinker to record and
>> get the original embedded structure.
>>
>> 1. shrinker_alloc()
>>
>> Used to allocate shrinker instance itself and related memory, it will
>> return a pointer to the shrinker instance on success and NULL on failure.
>>
>> 2. shrinker_free_non_registered()
>>
>> Used to destroy the non-registered shrinker instance.
> 
> This is a bit nasty
> 
>>
>> 3. shrinker_register()
>>
>> Used to register the shrinker instance, which is same as the current
>> register_shrinker_prepared().
>>
>> 4. shrinker_unregister()
> 
> rename this "shrinker_free()" and key the two different freeing
> cases on the SHRINKER_REGISTERED bit rather than mostly duplicating
> the two.

OK, will do in the next version.

> 
> void shrinker_free(struct shrinker *shrinker)
> {
> 	struct dentry *debugfs_entry = NULL;
> 	int debugfs_id;
> 
> 	if (!shrinker)
> 		return;
> 
> 	down_write(&shrinker_rwsem);
> 	if (shrinker->flags & SHRINKER_REGISTERED) {
> 		list_del(&shrinker->list);
> 		debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
> 	} else if (IS_ENABLED(CONFIG_SHRINKER_DEBUG)) {
> 		kfree_const(shrinker->name);
> 	}
> 
> 	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
> 		unregister_memcg_shrinker(shrinker);
> 	up_write(&shrinker_rwsem);
> 
> 	if (debugfs_entry)
> 		shrinker_debugfs_remove(debugfs_entry, debugfs_id);
> 
> 	kfree(shrinker->nr_deferred);
> 	kfree(shrinker);
> }
> EXPORT_SYMBOL_GPL(shrinker_free);

Ah, I will change all new APIs to use EXPORT_SYMBOL_GPL().

Thanks,
Qi

> 

