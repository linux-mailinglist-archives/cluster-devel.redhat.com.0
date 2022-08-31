Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1957B5A7BEE
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 13:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661944017;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fC4OsrDuMtbzIR8fy3GPw0L2C+sIfBr0jgJX1os99Vs=;
	b=SWZMtfVUjvGzYrB/FjBVxMMlBtVT55mJG5P1otBHJHzOZGEhNcFM8ta241rOi6aGgJ5Hkn
	Lvh3DK2DtqdcRSFawjjndvwt67gEYP5ipCjhVDJ7QUbN/pBgsJfIbWTnctl32X+7L6TOJk
	gV6tBsAxTGPLbB54afoACQQfr176Qv4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-zWviZF3qOay9HuZy3ZDBIA-1; Wed, 31 Aug 2022 07:06:53 -0400
X-MC-Unique: zWviZF3qOay9HuZy3ZDBIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D1853810D21;
	Wed, 31 Aug 2022 11:06:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 218B22166B26;
	Wed, 31 Aug 2022 11:06:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D2E21946A4B;
	Wed, 31 Aug 2022 11:06:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9C94F1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 11:06:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66FE42166B2B; Wed, 31 Aug 2022 11:06:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 637A72166B2A
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:06:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46F4A8032FB
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:06:50 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-135-wn8PvgAFM6GVFJLc0HJ1kg-1; Wed,
 31 Aug 2022 07:06:46 -0400
X-MC-Unique: wn8PvgAFM6GVFJLc0HJ1kg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 218171F924;
 Wed, 31 Aug 2022 11:06:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B77913A7C;
 Wed, 31 Aug 2022 11:06:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3h/IAsVAD2NudAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 11:06:45 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A1524A067B; Wed, 31 Aug 2022 13:06:44 +0200 (CEST)
Date: Wed, 31 Aug 2022 13:06:44 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831110644.id62rsymhziex2ch@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-13-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-13-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 12/14] fs/buffer: remove ll_rw_block()
 helper
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 31-08-22 15:21:09, Zhang Yi wrote:
> Now that all ll_rw_block() users has been replaced to new safe helpers,
> we just remove it here.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/buffer.c                 | 63 +++----------------------------------
>  include/linux/buffer_head.h |  1 -
>  2 files changed, 4 insertions(+), 60 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index e14adc638bfe..d1d09e2dacc2 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -152,7 +152,7 @@ static void __end_buffer_read_notouch(struct buffer_head *bh, int uptodate)
>  
>  /*
>   * Default synchronous end-of-IO handler..  Just mark it up-to-date and
> - * unlock the buffer. This is what ll_rw_block uses too.
> + * unlock the buffer.
>   */
>  void end_buffer_read_sync(struct buffer_head *bh, int uptodate)
>  {
> @@ -491,8 +491,8 @@ int inode_has_buffers(struct inode *inode)
>   * all already-submitted IO to complete, but does not queue any new
>   * writes to the disk.
>   *
> - * To do O_SYNC writes, just queue the buffer writes with ll_rw_block as
> - * you dirty the buffers, and then use osync_inode_buffers to wait for
> + * To do O_SYNC writes, just queue the buffer writes with write_dirty_buffer
> + * as you dirty the buffers, and then use osync_inode_buffers to wait for
>   * completion.  Any other dirty buffers which are not yet queued for
>   * write will not be flushed to disk by the osync.
>   */
> @@ -1807,7 +1807,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
>  		/*
>  		 * The page was marked dirty, but the buffers were
>  		 * clean.  Someone wrote them back by hand with
> -		 * ll_rw_block/submit_bh.  A rare case.
> +		 * write_dirty_buffer/submit_bh.  A rare case.
>  		 */
>  		end_page_writeback(page);
>  
> @@ -2714,61 +2714,6 @@ int submit_bh(blk_opf_t opf, struct buffer_head *bh)
>  }
>  EXPORT_SYMBOL(submit_bh);
>  
> -/**
> - * ll_rw_block: low-level access to block devices (DEPRECATED)
> - * @opf: block layer request operation and flags.
> - * @nr: number of &struct buffer_heads in the array
> - * @bhs: array of pointers to &struct buffer_head
> - *
> - * ll_rw_block() takes an array of pointers to &struct buffer_heads, and
> - * requests an I/O operation on them, either a %REQ_OP_READ or a %REQ_OP_WRITE.
> - * @opf contains flags modifying the detailed I/O behavior, most notably
> - * %REQ_RAHEAD.
> - *
> - * This function drops any buffer that it cannot get a lock on (with the
> - * BH_Lock state bit), any buffer that appears to be clean when doing a write
> - * request, and any buffer that appears to be up-to-date when doing read
> - * request.  Further it marks as clean buffers that are processed for
> - * writing (the buffer cache won't assume that they are actually clean
> - * until the buffer gets unlocked).
> - *
> - * ll_rw_block sets b_end_io to simple completion handler that marks
> - * the buffer up-to-date (if appropriate), unlocks the buffer and wakes
> - * any waiters. 
> - *
> - * All of the buffers must be for the same device, and must also be a
> - * multiple of the current approved size for the device.
> - */
> -void ll_rw_block(const blk_opf_t opf, int nr, struct buffer_head *bhs[])
> -{
> -	const enum req_op op = opf & REQ_OP_MASK;
> -	int i;
> -
> -	for (i = 0; i < nr; i++) {
> -		struct buffer_head *bh = bhs[i];
> -
> -		if (!trylock_buffer(bh))
> -			continue;
> -		if (op == REQ_OP_WRITE) {
> -			if (test_clear_buffer_dirty(bh)) {
> -				bh->b_end_io = end_buffer_write_sync;
> -				get_bh(bh);
> -				submit_bh(opf, bh);
> -				continue;
> -			}
> -		} else {
> -			if (!buffer_uptodate(bh)) {
> -				bh->b_end_io = end_buffer_read_sync;
> -				get_bh(bh);
> -				submit_bh(opf, bh);
> -				continue;
> -			}
> -		}
> -		unlock_buffer(bh);
> -	}
> -}
> -EXPORT_SYMBOL(ll_rw_block);
> -
>  void write_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags)
>  {
>  	lock_buffer(bh);
> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
> index 8a01c07c0418..1c93ff8c8f51 100644
> --- a/include/linux/buffer_head.h
> +++ b/include/linux/buffer_head.h
> @@ -223,7 +223,6 @@ struct buffer_head *alloc_buffer_head(gfp_t gfp_flags);
>  void free_buffer_head(struct buffer_head * bh);
>  void unlock_buffer(struct buffer_head *bh);
>  void __lock_buffer(struct buffer_head *bh);
> -void ll_rw_block(blk_opf_t, int, struct buffer_head * bh[]);
>  int sync_dirty_buffer(struct buffer_head *bh);
>  int __sync_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags);
>  void write_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags);
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

