Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 81920766016
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Jul 2023 00:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690498795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8CTrna5t3S7P99W+zrM1I2ApZYIkXTVQedDFVAI6oIw=;
	b=f+KaNqHZPKMlY4E6t/fZAuBeGErcPXk5DB2QmGmh9P0QWXBm7RxyzqfcsHJWqYjSUsXEKg
	I5/FxfXZ8Dl9qWnLXJ0AH7A6TRri147cdDQ4p1Cahf8sfZhTMUJ7vapxdZrIe65VJzj5VH
	/khOkr0PgsAHagipjs/zdUPN+/Aln0k=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-hONCF2JWOc6fRgX8fZrH2A-1; Thu, 27 Jul 2023 18:59:52 -0400
X-MC-Unique: hONCF2JWOc6fRgX8fZrH2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92601283476D;
	Thu, 27 Jul 2023 22:59:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B454492B02;
	Thu, 27 Jul 2023 22:59:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5650919452C8;
	Thu, 27 Jul 2023 22:59:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A46C61946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 22:59:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4042846A3A9; Thu, 27 Jul 2023 22:59:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37F52492C13
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 22:59:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 168523810785
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 22:59:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-SfBDpX7KOh6WXL3qLTfOgg-1; Thu, 27 Jul 2023 18:59:42 -0400
X-MC-Unique: SfBDpX7KOh6WXL3qLTfOgg-1
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-686ba29ccb1so940086b3a.1
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 15:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690498781; x=1691103581;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8CTrna5t3S7P99W+zrM1I2ApZYIkXTVQedDFVAI6oIw=;
 b=TsAAFdeIO8Ci+Fi8ivqygpPHCXbXJZF7iI0eZBT1zNJuIs6uf+xmYe7/4QX3WUezwd
 eWb0zTI+V+Ui2Ou5fFSOb85mfHm5yU6uF7OdyZbkdX8eRZ4vIcJtwEmUcJtw0xIoT0CG
 mZ8OYGVeif+zeQCF0OsRqg8LvNeaWfkaaMcslpwKJemztm5SGR4sku5vDuM4v+y+eaiO
 ecLTunhYeEgMSmI9DdK/KUely+3r0+71ReyFKM7bskhJ0MuDQaTijt5V9SWz8BUowK18
 Kcnrng2JOhA0JUSxI/pEQUvJhwIO4h/ZUDbmB3pdUH8nRjmImupEuxrBWlQuN11tWbiq
 ykQw==
X-Gm-Message-State: ABy/qLbs/GWDPk61kO5epK572Yy/YT7bi/xvZShl/8XeSQskIMkxaYwy
 UXxb34aCh9HTDj/ZGytT2je4zA==
X-Google-Smtp-Source: APBJJlGFE8oAcAZu2XvzWjC5bjR81v7OIjjTfZ8m+EaEe6Rjpq3cuwvHN3I08mErFwOZJpneP9Ly1g==
X-Received: by 2002:a05:6a00:17a8:b0:64d:42b9:6895 with SMTP id
 s40-20020a056a0017a800b0064d42b96895mr61072pfg.5.1690498780930; 
 Thu, 27 Jul 2023 15:59:40 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au.
 [49.186.119.116]) by smtp.gmail.com with ESMTPSA id
 p24-20020aa78618000000b0068702b66ab1sm1115813pfn.174.2023.07.27.15.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:59:40 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qP9xJ-00BKKZ-1O;
 Fri, 28 Jul 2023 08:59:37 +1000
Date: Fri, 28 Jul 2023 08:59:37 +1000
From: Dave Chinner <david@fromorbit.com>
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <ZML22YJi5vPBDEDj@dread.disaster.area>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 27, 2023 at 07:20:46PM +0900, Damien Le Moal wrote:
> On 7/27/23 17:55, Qi Zheng wrote:
> >>>           goto err;
> >>>       }
> >>>   +    zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
> >>> +    zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
> >>> +    zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
> >>> +    zmd->mblk_shrinker->private_data = zmd;
> >>> +
> >>> +    shrinker_register(zmd->mblk_shrinker);
> >>
> >> I fail to see how this new shrinker API is better... Why isn't there a
> >> shrinker_alloc_and_register() function ? That would avoid adding all this code
> >> all over the place as the new API call would be very similar to the current
> >> shrinker_register() call with static allocation.
> > 
> > In some registration scenarios, memory needs to be allocated in advance.
> > So we continue to use the previous prealloc/register_prepared()
> > algorithm. The shrinker_alloc_and_register() is just a helper function
> > that combines the two, and this increases the number of APIs that
> > shrinker exposes to the outside, so I choose not to add this helper.
> 
> And that results in more code in many places instead of less code + a simple
> inline helper in the shrinker header file...

It's not just a "simple helper" - it's a function that has to take 6
or 7 parameters with a return value that must be checked and
handled.

This was done in the first versions of the patch set - the amount of
code in each caller does not go down and, IMO, was much harder to
read and determine "this is obviously correct" that what we have
now.

> So not adding that super simple
> helper is not exactly the best choice in my opinion.

Each to their own - I much prefer the existing style/API over having
to go look up a helper function every time I want to check some
random shrinker has been set up correctly....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

