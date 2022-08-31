Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F35A7C75
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 13:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661946611;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5+rM2lTGNhrVO3gYxx12OLcCQeOaRRJa6UF4G+0StiQ=;
	b=c6tUndV9dST7j86UrZaTI5U107NkEpXA9DEJiuBx2N0bzf+Raahs+Zi3P9mMqZz3TuqD7z
	SZQnE6zABtR9+Wj6yVQlvmwUkf5pigsQHOktz4IZ4LClwx+prBHiz5xfaEutpADczXkIOd
	XKtflOBfzRmZB4p2AKGnm8hpSxkykUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-GTIw0cqoOsm4K47Bp3lyfA-1; Wed, 31 Aug 2022 07:50:06 -0400
X-MC-Unique: GTIw0cqoOsm4K47Bp3lyfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A8EB101A58F;
	Wed, 31 Aug 2022 11:50:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EFB3A1415117;
	Wed, 31 Aug 2022 11:50:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C23621946A4B;
	Wed, 31 Aug 2022 11:50:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC5001946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 11:30:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 75B8E2166B2A; Wed, 31 Aug 2022 11:30:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71FC42166B26
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:30:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 587E53C16183
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:30:35 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-6-0AsqYSYhNBqdiRnuWm0tIw-1; Wed,
 31 Aug 2022 07:30:31 -0400
X-MC-Unique: 0AsqYSYhNBqdiRnuWm0tIw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6107A1F893;
 Wed, 31 Aug 2022 11:30:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08A861332D;
 Wed, 31 Aug 2022 11:30:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L8viAVZGD2PhfgAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 11:30:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 54102A067B; Wed, 31 Aug 2022 13:30:29 +0200 (CEST)
Date: Wed, 31 Aug 2022 13:30:29 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831113029.fsywbjzk4qw24qdc@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-3-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-3-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 02/14] fs/buffer: add some new buffer
 read helpers
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 31-08-22 15:20:59, Zhang Yi wrote:
> Current ll_rw_block() helper is fragile because it assumes that locked
> buffer means it's under IO which is submitted by some other who hold
> the lock, it skip buffer if it failed to get the lock, so it's only
> safe on the readahead path. Unfortunately, now that most filesystems
> still use this helper mistakenly on the sync metadata read path. There
> is no guarantee that the one who hold the buffer lock always submit IO
> (e.g. buffer_migrate_folio_norefs() after commit 88dbcbb3a484 ("blkdev:
> avoid migration stalls for blkdev pages"), it could lead to false
> positive -EIO when submitting reading IO.
> 
> This patch add some friendly buffer read helpers to prepare replace
> ll_rw_block() and similar calls. We can only call bh_readahead_[]
> helpers for the readahead paths.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

This looks mostly good. Just a few small nits below.

> diff --git a/fs/buffer.c b/fs/buffer.c
> index a0b70b3239f3..a663191903ed 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -3017,6 +3017,74 @@ int bh_uptodate_or_lock(struct buffer_head *bh)
>  }
>  EXPORT_SYMBOL(bh_uptodate_or_lock);
>  
> +/**
> + * __bh_read - Submit read for a locked buffer
> + * @bh: struct buffer_head
> + * @op_flags: appending REQ_OP_* flags besides REQ_OP_READ
> + * @wait: wait until reading finish
> + *
> + * Returns zero on success or don't wait, and -EIO on error.
> + */
> +int __bh_read(struct buffer_head *bh, blk_opf_t op_flags, bool wait)
> +{
> +	int ret = 0;
> +
> +	BUG_ON(!buffer_locked(bh));
> +
> +	if (buffer_uptodate(bh)) {
> +		unlock_buffer(bh);
> +		return ret;
> +	}
> +
> +	get_bh(bh);
> +	bh->b_end_io = end_buffer_read_sync;
> +	submit_bh(REQ_OP_READ | op_flags, bh);
> +	if (wait) {
> +		wait_on_buffer(bh);
> +		if (!buffer_uptodate(bh))
> +			ret = -EIO;
> +	}
> +	return ret;
> +}
> +EXPORT_SYMBOL(__bh_read);
> +
> +/**
> + * __bh_read_batch - Submit read for a batch of unlocked buffers
> + * @bhs: a batch of struct buffer_head
> + * @nr: number of this batch
> + * @op_flags: appending REQ_OP_* flags besides REQ_OP_READ
> + * @force_lock: force to get a lock on the buffer if set, otherwise drops any
> + *              buffer that cannot lock.
> + *
> + * Returns zero on success or don't wait, and -EIO on error.
> + */
> +void __bh_read_batch(struct buffer_head *bhs[],
> +		     int nr, blk_opf_t op_flags, bool force_lock)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr; i++) {
> +		struct buffer_head *bh = bhs[i];
> +
> +		if (buffer_uptodate(bh))
> +			continue;
> +		if (!trylock_buffer(bh)) {
> +			if (!force_lock)
> +				continue;
> +			lock_buffer(bh);
> +		}

This would be a bit more efficient for the force_lock case like:

		if (force_lock)
			lock_buffer(bh);
		else
			if (!trylock_buffer(bh))
				continue;

> +		if (buffer_uptodate(bh)) {
> +			unlock_buffer(bh);
> +			continue;
> +		}
> +
> +		bh->b_end_io = end_buffer_read_sync;
> +		get_bh(bh);
> +		submit_bh(REQ_OP_READ | op_flags, bh);
> +	}
> +}
> +EXPORT_SYMBOL(__bh_read_batch);
> +
>  /**
>   * bh_submit_read - Submit a locked buffer for reading
>   * @bh: struct buffer_head
> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
> index c3863c417b00..8a01c07c0418 100644
> --- a/include/linux/buffer_head.h
> +++ b/include/linux/buffer_head.h
> @@ -232,6 +232,9 @@ void write_boundary_block(struct block_device *bdev,
>  			sector_t bblock, unsigned blocksize);
>  int bh_uptodate_or_lock(struct buffer_head *bh);
>  int bh_submit_read(struct buffer_head *bh);
> +int __bh_read(struct buffer_head *bh, blk_opf_t op_flags, bool wait);
> +void __bh_read_batch(struct buffer_head *bhs[],
> +		     int nr, blk_opf_t op_flags, bool force_lock);
>  
>  extern int buffer_heads_over_limit;
>  
> @@ -399,6 +402,40 @@ static inline struct buffer_head *__getblk(struct block_device *bdev,
>  	return __getblk_gfp(bdev, block, size, __GFP_MOVABLE);
>  }
>  
> +static inline void bh_readahead(struct buffer_head *bh, blk_opf_t op_flags)
> +{
> +	if (trylock_buffer(bh))
> +		__bh_read(bh, op_flags, false);
> +}
> +
> +static inline void bh_read_nowait(struct buffer_head *bh, blk_opf_t op_flags)
> +{
> +	lock_buffer(bh);
> +	__bh_read(bh, op_flags, false);
> +}
> +
> +static inline int bh_read(struct buffer_head *bh, blk_opf_t op_flags)
> +{
> +	lock_buffer(bh);
> +	return __bh_read(bh, op_flags, true);
> +}

I would use bh_uptodate_or_lock() helper in the above two functions to
avoid locking the buffer in case it is already uptodate.

> +
> +static inline int bh_read_locked(struct buffer_head *bh, blk_opf_t op_flags)
> +{
> +	return __bh_read(bh, op_flags, true);
> +}

I would just drop this helper. Both ext2 and ocfs2 which use it can avoid
it very easily (by using bh_read()). 

> +
> +static inline void bh_read_batch(struct buffer_head *bhs[], int nr)
> +{
> +	__bh_read_batch(bhs, nr, 0, true);
> +}
> +
> +static inline void bh_readahead_batch(struct buffer_head *bhs[], int nr,
> +				      blk_opf_t op_flags)
> +{
> +	__bh_read_batch(bhs, nr, op_flags, false);
> +}
> +

It is more common to have number of elements in the array as the first
argument and the array as the second one in the kernel. So rather:

static inline void bh_read_batch(int nr, struct buffer_head *bhs[])

and similarly for bh_readahead_batch().

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

