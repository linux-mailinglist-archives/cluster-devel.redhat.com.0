Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49491542C34
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jun 2022 11:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654682381;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X7ko0a61KQIEYlZE2OolrSj5KPboqylHtHlNY2Rk0xk=;
	b=F1ZBKV7nGVwpm1amSwdtPceK5DJkuXaa61XrlbYg351fjJIqmMtnuKsCm7AmMc481IY06M
	sEL6qFXW4lEzwalvfzrn08SW92gCvf8Bvjzjxmp60xFdHkEs/CF2Vr/BE4Byszd5kne6L5
	O8oYNyGId7v27VhP1sfL4S86/0RV8j4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-rIlEWX_INm2sba1Flvvu0Q-1; Wed, 08 Jun 2022 05:59:40 -0400
X-MC-Unique: rIlEWX_INm2sba1Flvvu0Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 923523802125;
	Wed,  8 Jun 2022 09:59:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29B62492C3B;
	Wed,  8 Jun 2022 09:59:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8EF31947B92;
	Wed,  8 Jun 2022 09:59:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B49C31947042 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  8 Jun 2022 09:59:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8A7324328C9; Wed,  8 Jun 2022 09:59:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 869D6492C3B
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 09:59:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E9CC38025E3
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 09:59:36 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-Hhbg2yJPM-WwdSJc9Mw-Uw-1; Wed, 08 Jun 2022 05:59:35 -0400
X-MC-Unique: Hhbg2yJPM-WwdSJc9Mw-Uw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p24-20020a05600c1d9800b0039c51c2da19so2419004wms.0
 for <cluster-devel@redhat.com>; Wed, 08 Jun 2022 02:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=X7ko0a61KQIEYlZE2OolrSj5KPboqylHtHlNY2Rk0xk=;
 b=jYFQldKeInRK006cR6DfwWmGzBLzhDtioRN9zPHthv3gK/lY0Y/0J06BE/f7YUt8oF
 CaMmZkue6OeKN93+uzUr6VnROFtjwUgy+hlRxH1SZ9w51TkbnZuLUEF0y/om44dL5+1v
 HsJy/QyYHXX1VRckQ44j5vuwxta+mgffNxYjv6RNVwcrAwFUE9f5Tf23LbyYiFq0DjWH
 1W4Tz1LJ6tiNNgG2op7AI4UweYVrwXJikpSxn0a+U1hJtx0k+Fsj3jgb028G6C4jc+1/
 qitWZLj17ipJx6SRyZw75fKa2glWWr6hN8ub3S4GVsdtr99/IdeQyXNoMsmTpSQaQNhM
 HBTQ==
X-Gm-Message-State: AOAM531kh8HUrXGxHRHmC2xHFdYxC7+RADYjtWP3aB8pt0sAnLjquMuR
 QXSsnpyNJ43fU7xcE5O35NBP1hxwiPEPzuEYWBZ41KRxJoWPbXlFbYLB/xLNUqYvkyuFCnOzjNW
 +qd4TrwOoTiedVPnEIoJYog==
X-Received: by 2002:a05:600c:154d:b0:394:8d64:9166 with SMTP id
 f13-20020a05600c154d00b003948d649166mr33665190wmg.102.1654682374067; 
 Wed, 08 Jun 2022 02:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4BCTXIM51kCwL6Z6H/hpvqsMvzu1fv9X/GhiUOzp5r00CIAo0BKvmPAyhZ/PubqP5kGP1SQ==
X-Received: by 2002:a05:600c:154d:b0:394:8d64:9166 with SMTP id
 f13-20020a05600c154d00b003948d649166mr33665171wmg.102.1654682373804; 
 Wed, 08 Jun 2022 02:59:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:ad00:db2:4c6:8f3a:2ec4?
 (p200300cbc705ad000db204c68f3a2ec4.dip0.t-ipconnect.de.
 [2003:cb:c705:ad00:db2:4c6:8f3a:2ec4])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c1d9300b003942a244f39sm2898272wms.18.2022.06.08.02.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:59:33 -0700 (PDT)
Message-ID: <36cc5e2b-b768-ce1c-fa30-72a932587289@redhat.com>
Date: Wed, 8 Jun 2022 11:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Matthew Wilcox <willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-16-willy@infradead.org>
 <e4d017a4-556d-bb5f-9830-a8843591bc8d@redhat.com>
 <Yp9fj/Si2qyb61Y3@casper.infradead.org>
 <Yp+lU55H4igaV3pB@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Yp+lU55H4igaV3pB@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 15/20] balloon: Convert to migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 Rafael Aquini <aquini@redhat.com>, Minchan Kim <minchan@kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.22 21:21, Matthew Wilcox wrote:
> On Tue, Jun 07, 2022 at 03:24:15PM +0100, Matthew Wilcox wrote:
>> On Tue, Jun 07, 2022 at 09:36:21AM +0200, David Hildenbrand wrote:
>>> On 06.06.22 22:40, Matthew Wilcox (Oracle) wrote:
>>>>  const struct address_space_operations balloon_aops = {
>>>> -	.migratepage = balloon_page_migrate,
>>>> +	.migrate_folio = balloon_migrate_folio,
>>>>  	.isolate_page = balloon_page_isolate,
>>>>  	.putback_page = balloon_page_putback,
>>>>  };
>>>
>>> I assume you're working on conversion of the other callbacks as well,
>>> because otherwise, this ends up looking a bit inconsistent and confusing :)
>>
>> My intention was to finish converting aops for the next merge window.
>>
>> However, it seems to me that we goofed back in 2016 by merging
>> commit bda807d44454.  isolate_page() and putback_page() should
>> never have been part of address_space_operations.
>>
>> I'm about to embark on creating a new migrate_operations struct
>> for drivers to use that contains only isolate/putback/migrate.
>> No filesystem uses isolate/putback, so those can just be deleted.
>> Both migrate_operations & address_space_operations will contain a
>> migrate callback.

That makes sense to me. I wonder if there was a design
decision/discussion behind that. CCing Rafael.

@Rafael, full mail at

https://lkml.kernel.org/r/Yp+lU55H4igaV3pB@casper.infradead.org

> 
> Well, that went more smoothly than I thought it would.
> 
> I can't see a nice way to split this patch up (other than making secretmem
> its own patch).  We just don't have enough bits in struct page to support
> both ways of handling PageMovable at the same time, so we can't convert
> one driver at a time.  The diffstat is pretty compelling.

Yes, splitting rather overcomplicates stuff.

> 
> The patch is on top of this patch series; I think it probably makes
> sense to shuffle it to be first, to avoid changing these drivers to
> folios, then changing them back.

Absolutely.

> 
> Questions:
> 
> Is what I've done with zsmalloc acceptable?  The locking in that
> file is rather complex.
> 
> Can we now eliminate balloon_mnt / balloon_fs from cmm.c?  I haven't even
> compiled thatfile , but it seems like the filesystem serves no use now.
> 
> Similar question for vmw_balloon.c, although I have compiled that.

IIRC, virtio-balloon, cmm and vmw_balloon all have the mnt/fs just for
page migration purposes. So if one can get rid of them, all should be
able to get rid of them. Essentially everything that uses the balloon
compaction framework.

That should go into separate patches then.

> 
> ---
> 
> I just spotted a bug with zs_unregister_migration(); it won't compile
> without CONFIG_MIGRATION.  I'll fix that up if the general approach is
> acceptable.
> 
>  arch/powerpc/platforms/pseries/cmm.c |   13 --------
>  drivers/misc/vmw_balloon.c           |   10 ------
>  include/linux/balloon_compaction.h   |    6 +---
>  include/linux/fs.h                   |    2 -
>  include/linux/migrate.h              |   27 ++++++++++++++----
>  include/linux/page-flags.h           |    2 -
>  mm/balloon_compaction.c              |   18 ++++++------
>  mm/compaction.c                      |   29 ++++++++-----------
>  mm/migrate.c                         |   23 ++++++++-------
>  mm/secretmem.c                       |    6 ----
>  mm/util.c                            |    4 +-
>  mm/z3fold.c                          |   45 ++++++------------------------
>  mm/zsmalloc.c                        |   52 +++++++++--------------------------
>  13 files changed, 83 insertions(+), 154 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
> index 15ed8206c463..2ecbab3db723 100644
> --- a/arch/powerpc/platforms/pseries/cmm.c
> +++ b/arch/powerpc/platforms/pseries/cmm.c
> @@ -578,23 +578,10 @@ static int cmm_balloon_compaction_init(void)
>  		return rc;
>  	}
>  
> -	b_dev_info.inode = alloc_anon_inode(balloon_mnt->mnt_sb);
> -	if (IS_ERR(b_dev_info.inode)) {
> -		rc = PTR_ERR(b_dev_info.inode);
> -		b_dev_info.inode = NULL;
> -		kern_unmount(balloon_mnt);
> -		balloon_mnt = NULL;
> -		return rc;
> -	}
> -
> -	b_dev_info.inode->i_mapping->a_ops = &balloon_aops;


Are you missing similar updates to drivers/virtio/virtio_balloon.c ?

At least, there we're also using balloon_aops, so this patch shouldn't
compile.


Skimming over it, nothing else jumped at me.

-- 
Thanks,

David / dhildenb

