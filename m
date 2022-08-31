Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816E5A7B7B
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 12:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661942364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=D/VhxrZABrIw51+gKZ04o+QPEhbTuW7VzunFJgXY7yw=;
	b=Hh9JJFk9u4NXxIZikqxJ6bxhDfeK4xnQiLDGXLIwOzzocbD5rdPUaRfNYejEu/miRTGfB7
	NOUd5ajGq0WDKDX61DhYmVdRaPH3n5GOVZLccZ6VbAnJn91ZQSVxujtH8tFbpVsoSTx6g9
	Utn93Gl2HMYjzh24g2k/b2kl809X0wo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-fIOHDZhFOCKV4MNyLTxIsA-1; Wed, 31 Aug 2022 06:39:21 -0400
X-MC-Unique: fIOHDZhFOCKV4MNyLTxIsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C3F1185A7A4;
	Wed, 31 Aug 2022 10:39:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F87D1121314;
	Wed, 31 Aug 2022 10:39:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 63F811946A4B;
	Wed, 31 Aug 2022 10:39:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13D641946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 10:39:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2DE12026D64; Wed, 31 Aug 2022 10:39:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE5422026D4C
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 10:39:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A19851C0519D
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 10:39:15 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-373-55sqQ7obMYCxWTiy7KFEEQ-1; Wed,
 31 Aug 2022 06:39:13 -0400
X-MC-Unique: 55sqQ7obMYCxWTiy7KFEEQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 80EC221A53;
 Wed, 31 Aug 2022 10:39:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6549613A7C;
 Wed, 31 Aug 2022 10:39:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aB+rGFA6D2M7aAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 10:39:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id E49DCA067B; Wed, 31 Aug 2022 12:39:11 +0200 (CEST)
Date: Wed, 31 Aug 2022 12:39:11 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831103911.ubrkxc3yf46bdme3@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-2-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-2-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 01/14] fs/buffer: remove
 __breadahead_gfp()
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
Cc: axboe@kernel.dk, almaz.alexandrovich@paragon-software.com,
 ntfs3@lists.linux.dev, jack@suse.cz, chengzhihao1@huawei.com, mark@fasheh.com,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 cluster-devel@redhat.com, viro@zeniv.linux.org.uk, yukuai3@huawei.com,
 linux-fsdevel@vger.kernel.org, tytso@mit.edu, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, dushistov@mail.ru, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 31-08-22 15:20:58, Zhang Yi wrote:
> No one use __breadahead_gfp() and sb_breadahead_unmovable() any more,
> remove them.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/buffer.c                 | 11 -----------
>  include/linux/buffer_head.h |  8 --------
>  2 files changed, 19 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 55e762a58eb6..a0b70b3239f3 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -1348,17 +1348,6 @@ void __breadahead(struct block_device *bdev, sector_t block, unsigned size)
>  }
>  EXPORT_SYMBOL(__breadahead);
>  
> -void __breadahead_gfp(struct block_device *bdev, sector_t block, unsigned size,
> -		      gfp_t gfp)
> -{
> -	struct buffer_head *bh = __getblk_gfp(bdev, block, size, gfp);
> -	if (likely(bh)) {
> -		ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, &bh);
> -		brelse(bh);
> -	}
> -}
> -EXPORT_SYMBOL(__breadahead_gfp);
> -
>  /**
>   *  __bread_gfp() - reads a specified block and returns the bh
>   *  @bdev: the block_device to read from
> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
> index 089c9ade4325..c3863c417b00 100644
> --- a/include/linux/buffer_head.h
> +++ b/include/linux/buffer_head.h
> @@ -214,8 +214,6 @@ struct buffer_head *__getblk_gfp(struct block_device *bdev, sector_t block,
>  void __brelse(struct buffer_head *);
>  void __bforget(struct buffer_head *);
>  void __breadahead(struct block_device *, sector_t block, unsigned int size);
> -void __breadahead_gfp(struct block_device *, sector_t block, unsigned int size,
> -		  gfp_t gfp);
>  struct buffer_head *__bread_gfp(struct block_device *,
>  				sector_t block, unsigned size, gfp_t gfp);
>  void invalidate_bh_lrus(void);
> @@ -340,12 +338,6 @@ sb_breadahead(struct super_block *sb, sector_t block)
>  	__breadahead(sb->s_bdev, block, sb->s_blocksize);
>  }
>  
> -static inline void
> -sb_breadahead_unmovable(struct super_block *sb, sector_t block)
> -{
> -	__breadahead_gfp(sb->s_bdev, block, sb->s_blocksize, 0);
> -}
> -
>  static inline struct buffer_head *
>  sb_getblk(struct super_block *sb, sector_t block)
>  {
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

