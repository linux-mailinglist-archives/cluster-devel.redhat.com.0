Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C25A9BFF
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 17:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662047127;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TGEgeznG1OoqVsgqPHcmjmzJchioOiRQWcLMKbDIADU=;
	b=HZK4p/2/tYPuTOx89b5RfDEPXgoQavlB3wkB+AxfP21/4LaL31jxj/Si4LY9m1P375EZjj
	+KSuX7bmujW6+eac+k7KpHyXz6rFAUxwxEIwXqX/5BEwDs78PBiAkGZ+c/uACbJUn2615n
	GAN3W4guflZ7S9XYt9eR21MK51RxC9c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-JTp_th6RN3C9U-QZlVJpdw-1; Thu, 01 Sep 2022 11:45:22 -0400
X-MC-Unique: JTp_th6RN3C9U-QZlVJpdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C76373C0ED5D;
	Thu,  1 Sep 2022 15:45:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBA05C15BBA;
	Thu,  1 Sep 2022 15:45:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8CA911942685;
	Thu,  1 Sep 2022 15:45:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D6CBE1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 15:44:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C350118ECC; Thu,  1 Sep 2022 15:44:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFA404C819
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:44:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D44B101A54E
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:44:15 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-537-CtGhD2AdOmeSB8nCjMhAwQ-1; Thu,
 01 Sep 2022 11:44:13 -0400
X-MC-Unique: CtGhD2AdOmeSB8nCjMhAwQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D38682189E;
 Thu,  1 Sep 2022 15:44:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B93EF13A89;
 Thu,  1 Sep 2022 15:44:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wyI0LUrTEGPufwAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Sep 2022 15:44:10 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id F4103A067C; Thu,  1 Sep 2022 17:44:09 +0200 (CEST)
Date: Thu, 1 Sep 2022 17:44:09 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220901154409.dcyvtknzzdjhuzas@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-3-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220901133505.2510834-3-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v2 02/14] fs/buffer: add some new buffer
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 01-09-22 21:34:53, Zhang Yi wrote:
> Current ll_rw_block() helper is fragile because it assumes that locked
> buffer means it's under IO which is submitted by some other who holds
> the lock, it skip buffer if it failed to get the lock, so it's only
> safe on the readahead path. Unfortunately, now that most filesystems
> still use this helper mistakenly on the sync metadata read path. There
> is no guarantee that the one who holds the buffer lock always submit IO
> (e.g. buffer_migrate_folio_norefs() after commit 88dbcbb3a484 ("blkdev:
> avoid migration stalls for blkdev pages"), it could lead to false
> positive -EIO when submitting reading IO.
> 
> This patch add some friendly buffer read helpers to prepare replacing
> ll_rw_block() and similar calls. We can only call bh_readahead_[]
> helpers for the readahead paths.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/buffer.c                 | 65 +++++++++++++++++++++++++++++++++++++
>  include/linux/buffer_head.h | 38 ++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index a0b70b3239f3..a6bc769e665d 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -3017,6 +3017,71 @@ int bh_uptodate_or_lock(struct buffer_head *bh)
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
> + * @nr: entry number of the buffer batch
> + * @bhs: a batch of struct buffer_head
> + * @op_flags: appending REQ_OP_* flags besides REQ_OP_READ
> + * @force_lock: force to get a lock on the buffer if set, otherwise drops any
> + *              buffer that cannot lock.
> + *
> + * Returns zero on success or don't wait, and -EIO on error.
> + */
> +void __bh_read_batch(int nr, struct buffer_head *bhs[],
> +		     blk_opf_t op_flags, bool force_lock)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr; i++) {
> +		struct buffer_head *bh = bhs[i];
> +
> +		if (buffer_uptodate(bh))
> +			continue;
> +
> +		if (force_lock)
> +			lock_buffer(bh);
> +		else
> +			if (!trylock_buffer(bh))
> +				continue;
> +
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
> index c3863c417b00..6d09785bed9f 100644
> --- a/include/linux/buffer_head.h
> +++ b/include/linux/buffer_head.h
> @@ -232,6 +232,9 @@ void write_boundary_block(struct block_device *bdev,
>  			sector_t bblock, unsigned blocksize);
>  int bh_uptodate_or_lock(struct buffer_head *bh);
>  int bh_submit_read(struct buffer_head *bh);
> +int __bh_read(struct buffer_head *bh, blk_opf_t op_flags, bool wait);
> +void __bh_read_batch(int nr, struct buffer_head *bhs[],
> +		     blk_opf_t op_flags, bool force_lock);
>  
>  extern int buffer_heads_over_limit;
>  
> @@ -399,6 +402,41 @@ static inline struct buffer_head *__getblk(struct block_device *bdev,
>  	return __getblk_gfp(bdev, block, size, __GFP_MOVABLE);
>  }
>  
> +static inline void bh_readahead(struct buffer_head *bh, blk_opf_t op_flags)
> +{
> +	if (!buffer_uptodate(bh) && trylock_buffer(bh)) {
> +		if (!buffer_uptodate(bh))
> +			__bh_read(bh, op_flags, false);
> +		else
> +			unlock_buffer(bh);
> +	}
> +}
> +
> +static inline void bh_read_nowait(struct buffer_head *bh, blk_opf_t op_flags)
> +{
> +	if (!bh_uptodate_or_lock(bh))
> +		__bh_read(bh, op_flags, false);
> +}
> +
> +/* Returns 1 if buffer uptodated, 0 on success, and -EIO on error. */
> +static inline int bh_read(struct buffer_head *bh, blk_opf_t op_flags)
> +{
> +	if (bh_uptodate_or_lock(bh))
> +		return 1;
> +	return __bh_read(bh, op_flags, true);
> +}
> +
> +static inline void bh_read_batch(int nr, struct buffer_head *bhs[])
> +{
> +	__bh_read_batch(nr, bhs, 0, true);
> +}
> +
> +static inline void bh_readahead_batch(int nr, struct buffer_head *bhs[],
> +				      blk_opf_t op_flags)
> +{
> +	__bh_read_batch(nr, bhs, op_flags, false);
> +}
> +
>  /**
>   *  __bread() - reads a specified block and returns the bh
>   *  @bdev: the block_device to read from
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

