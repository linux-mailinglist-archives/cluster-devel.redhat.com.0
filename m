Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6310F77CA1F
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Aug 2023 11:15:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692090914;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=;
	b=ZcDbsd6ednrQIgCOn3FgxmPNIjED0jgrjqC0gGPMbFKYkx3dzZDOAdAZwBfzGqRJGBL2S0
	bGyTyqhgvOg18gWOvQk5IQ0m+1si3FQccOOWjczbR3TvMpuZdhhE+19bkun9TjL7wxfIRD
	rjlHzE2VwTW7F/UfYD6kL6LwlR2UEhk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-N0HpvFqqNBmGgeYjOf-4sw-1; Tue, 15 Aug 2023 05:15:07 -0400
X-MC-Unique: N0HpvFqqNBmGgeYjOf-4sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEB108DC671;
	Tue, 15 Aug 2023 09:15:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 764EBC15BAE;
	Tue, 15 Aug 2023 09:15:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 17B89194658F;
	Tue, 15 Aug 2023 09:15:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E65BB1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 15 Aug 2023 09:15:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C5A1CC15BAE; Tue, 15 Aug 2023 09:15:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE39DC15BAD
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 09:15:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994DB3801BE3
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 09:15:04 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-zmOF4JFQMa6X54il-ZdCrA-1; Tue, 15 Aug 2023 05:15:02 -0400
X-MC-Unique: zmOF4JFQMa6X54il-ZdCrA-1
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1bb91c20602so9096525ad.0
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 02:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692090901; x=1692695701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=;
 b=AHxZzH3OrMNswDBGd0espE1eeeSj9UAwXFJGGF24ddJiCPZHxCYfJFyRprKwtUfnkS
 M2keVUtNJMFzJpAMrf2pYunh50nmn6y2olBIGEoUPs8xog+5xqowwtlAb6kDY3eEtGD7
 zegbg1TaHz7cL/N0V19mpQnVYu1KFJ+UIAv24SUndHjpv2V7b3/Xpc+l9+aNoAkvwqCk
 nnyP3khbLHAqrv80rsCADBOAFVrU0YWqY+HI9wxFSE6lH6OZyPUATMaLMtXDyxdAhhh9
 xcs9yj/t5jxPvqLh/89sWujLgit8AnOWUUpcPZ+pPTk693bNV6lC3caH237nYVVbvnZl
 oqRQ==
X-Gm-Message-State: AOJu0YzyoT9SXIN6blTQTOkF/RHg/vkJR/1dKv1yl9jXWDmiUHI630zS
 H+C+/n+O7Hf8ZamgEBSbYRI/MQ==
X-Google-Smtp-Source: AGHT+IGKaQyK0d17VyjHV7p/Fr8yAF+2JMAJsl65uoihXD9UcmAUSi1eF134pFnOBdZUKl9ThFMr5Q==
X-Received: by 2002:a17:902:e5c8:b0:1bb:83ec:832 with SMTP id
 u8-20020a170902e5c800b001bb83ec0832mr13866844plf.2.1692090901535; 
 Tue, 15 Aug 2023 02:15:01 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([240e:694:e21:b::2]) by smtp.gmail.com with ESMTPSA id
 io13-20020a17090312cd00b001b39ffff838sm10630843plb.25.2023.08.15.02.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 02:15:01 -0700 (PDT)
Message-ID: <4f64cd2d-90e8-7902-7ef7-1ac58d51b2a8@bytedance.com>
Date: Tue, 15 Aug 2023 17:14:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
To: Muchun Song <muchun.song@linux.dev>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-2-zhengqi.arch@bytedance.com>
 <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v4 01/48] mm: move some shrinker-related
 function declarations to mm/internal.h
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
 Linux-MM <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, simon.horman@corigine.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/8/15 16:36, Muchun Song wrote:
> 
> 
>> On Aug 7, 2023, at 19:08, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The following functions are only used inside the mm subsystem, so it's
>> better to move their declarations to the mm/internal.h file.
>>
>> 1. shrinker_debugfs_add()
>> 2. shrinker_debugfs_detach()
>> 3. shrinker_debugfs_remove()
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> One nit bellow.
> 
> [...]
> 
>> +
>> +/*
>> + * shrinker related functions
>> + */
> 
> This is a multi-comment format. "/* shrinker related functions. */" is
> the right one-line format of comment.

Will do.

Thanks,
Qi

> 
>> +
>> +#ifdef CONFIG_SHRINKER_DEBUG
>> +extern int shrinker_debugfs_add(struct shrinker *shrinker);
>> +extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>> +      int *debugfs_id);
>> +extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>> +    int debugfs_id);
>> +#else /* CONFIG_SHRINKER_DEBUG */
>> +static inline int shrinker_debugfs_add(struct shrinker *shrinker)
>> +{
>> +	return 0;
>> +}
>> +static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>> +     int *debugfs_id)
>> +{
>> +	*debugfs_id = -1;
>> +	return NULL;
>> +}
>> +static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>> +	int debugfs_id)
>> +{
>> +}
>> +#endif /* CONFIG_SHRINKER_DEBUG */
>> +
>> #endif /* __MM_INTERNAL_H */
>> -- 
>> 2.30.2
>>
> 

