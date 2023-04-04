Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4736D70CF
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 01:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680651644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=M/r2yyBxa2UjizT7DIESb3jdVn4T1vcr3JZCxz3Un80=;
	b=N9mOJRI2jANmuIywfov5D879sq2wcnisA/3KdDm2hsMZIygBQpLj9Tagfe8iswpztjpJOi
	SyMkt7WJ7PKMFeQB3bB3A+FkXLB+IXIgo3jdjjQZ5ylPfP+fjsiAckI12IJMm9faxmnPQs
	ZPC4IF54715qHESeUE7OQioXeud679Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-wyC1eR_0MvCSWjwse4jCwA-1; Tue, 04 Apr 2023 19:40:40 -0400
X-MC-Unique: wyC1eR_0MvCSWjwse4jCwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E96321C0896A;
	Tue,  4 Apr 2023 23:40:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8E35C35999;
	Tue,  4 Apr 2023 23:40:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E6931946A43;
	Tue,  4 Apr 2023 23:40:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5CE01946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 23:40:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9AEDE2166B29; Tue,  4 Apr 2023 23:40:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9383B2166B26
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 23:40:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 731C7101A531
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 23:40:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-fIaSbSaZP3mqvejHO1Q8Gw-1; Tue, 04 Apr 2023 19:40:36 -0400
X-MC-Unique: fIaSbSaZP3mqvejHO1Q8Gw-1
Received: by mail-pl1-f177.google.com with SMTP id iw3so32837681plb.6
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 16:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680651635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/r2yyBxa2UjizT7DIESb3jdVn4T1vcr3JZCxz3Un80=;
 b=TxG5+1i/HyS+TMBZidNhL7/9+7uSoVWlx/UQyZGHMEVxXLJILUTG33HFTHe8wXp7As
 LDKX/OsyTYMc0v75qzKv5ipk+Mi97k5TrfxYnfHLFym0Li7u4f+aTysTZa9ebLvApMrr
 gKjq7+EKLQ4JjQTdpvYOmTYgTFYpyHt1lkmLIpFv/nAGA4v51aq9ZL1Och4zcvG8W84+
 qTGZlK2z+nAqGvTB/yDYvoi3YDGll4wQKoBKQ1PtPmzKK+jphx9/pyWQgK6xkOcdJfLM
 3Nzl6i4JH6KsJ4vTXlqd0hzjL6kTAynWcVOdGo16HVHWnz1s09y6TDZwwUMSwgaSQuQ6
 wdqw==
X-Gm-Message-State: AAQBX9dZt4LpWoq79ljqcYJJ5u4s3pWki2GsmiZIQFbuoGPTzUACbUR0
 mVP1UREGCCvhcnTYYC9Y8Jldag==
X-Google-Smtp-Source: AKy350aGtUyDc7dXm54tao9SO1Z52DtK7YHUJoaBCaBA1TXOYmz5/48+4yE+r2PZyPM8LNhcT3l0sw==
X-Received: by 2002:a17:902:fb8c:b0:1a1:c945:4b23 with SMTP id
 lg12-20020a170902fb8c00b001a1c9454b23mr3916070plb.65.1680651635730; 
 Tue, 04 Apr 2023 16:40:35 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 q18-20020a170902b11200b001a216d44440sm8856651plr.200.2023.04.04.16.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 16:40:29 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pjqGB-00H7Og-Tt; Wed, 05 Apr 2023 09:40:19 +1000
Date: Wed, 5 Apr 2023 09:40:19 +1000
From: Dave Chinner <david@fromorbit.com>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230404234019.GM3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-7-aalbersh@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230404145319.2057051-7-aalbersh@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v2 06/23] fsverity: add drop_page()
 callout
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 04:53:02PM +0200, Andrey Albershteyn wrote:
> Allow filesystem to make additional processing on verified pages
> instead of just dropping a reference. This will be used by XFS for
> internal buffer cache manipulation in further patches. The btrfs,
> ext4, and f2fs just drop the reference.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> ---
>  fs/btrfs/verity.c         | 12 ++++++++++++
>  fs/ext4/verity.c          |  6 ++++++
>  fs/f2fs/verity.c          |  6 ++++++
>  fs/verity/read_metadata.c |  4 ++--
>  fs/verity/verify.c        |  6 +++---
>  include/linux/fsverity.h  | 10 ++++++++++
>  6 files changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> index c5ff16f9e9fa..4c2c09204bb4 100644
> --- a/fs/btrfs/verity.c
> +++ b/fs/btrfs/verity.c
> @@ -804,10 +804,22 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
>  			       pos, buf, size);
>  }
>  
> +/*
> + * fsverity op that releases the reference obtained by ->read_merkle_tree_page()
> + *
> + * @page:  reference to the page which can be released
> + *
> + */
> +static void btrfs_drop_page(struct page *page)
> +{
> +	put_page(page);
> +}
> +
>  const struct fsverity_operations btrfs_verityops = {
>  	.begin_enable_verity     = btrfs_begin_enable_verity,
>  	.end_enable_verity       = btrfs_end_enable_verity,
>  	.get_verity_descriptor   = btrfs_get_verity_descriptor,
>  	.read_merkle_tree_page   = btrfs_read_merkle_tree_page,
>  	.write_merkle_tree_block = btrfs_write_merkle_tree_block,
> +	.drop_page		 = &btrfs_drop_page,
>  };

Ok, that's a generic put_page() call.

....
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index f50e3b5b52c9..c2fc4c86af34 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -210,7 +210,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>  		if (is_hash_block_verified(vi, hpage, hblock_idx)) {
>  			memcpy_from_page(_want_hash, hpage, hoffset, hsize);
>  			want_hash = _want_hash;
> -			put_page(hpage);
> +			inode->i_sb->s_vop->drop_page(hpage);
>  			goto descend;

			fsverity_drop_page(hpage);

static inline void
fsverity_drop_page(struct inode *inode, struct page *page)
{
	if (inode->i_sb->s_vop->drop_page)
		inode->i_sb->s_vop->drop_page(page);
	else
		put_page(page);
}

And then you don't need to add the functions to each of the
filesystems nor make an indirect call just to run put_page().

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

