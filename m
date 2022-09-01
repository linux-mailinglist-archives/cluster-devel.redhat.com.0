Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 123615A9C45
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 17:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662047571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=q8YiT/4hwzXdCPEllSvmSZIP1os1aETg6NXJXjqiNLQ=;
	b=SiOWvSxxqedAVjiLUk+O1Cu/f1XMBVfo3PaW3T9a1s8LFeWoL2R08dfDxTSIhFlMpyY7ei
	TBwjLFUJsRwYPRzZUffL4672p+cy2rJUnGfGe2qy/KmU+TaNlUZaiD2UJhVz/ZadARqlyy
	pG7Jtvarw7O2BNHE/J0B05TPYBW0PH4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-ZBWjhfRONEuRyNdxdgqQDQ-1; Thu, 01 Sep 2022 11:52:49 -0400
X-MC-Unique: ZBWjhfRONEuRyNdxdgqQDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3044B8039B5;
	Thu,  1 Sep 2022 15:52:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24F3818ECC;
	Thu,  1 Sep 2022 15:52:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E37971942685;
	Thu,  1 Sep 2022 15:52:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B60191946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 15:52:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B0E622026D64; Thu,  1 Sep 2022 15:52:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD3752026D4C
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:52:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93355823F13
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:52:45 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-150-Wvg3F4svM6KDlLPp5AtM9A-1; Thu,
 01 Sep 2022 11:52:39 -0400
X-MC-Unique: Wvg3F4svM6KDlLPp5AtM9A-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 858EF201E1;
 Thu,  1 Sep 2022 15:52:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 767A913A89;
 Thu,  1 Sep 2022 15:52:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zNbpHETVEGMPBQAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Sep 2022 15:52:36 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id D721AA067C; Thu,  1 Sep 2022 17:52:35 +0200 (CEST)
Date: Thu, 1 Sep 2022 17:52:35 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220901155235.4m3hrnxk65wbimco@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-10-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220901133505.2510834-10-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v2 09/14] reiserfs: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 01-09-22 21:35:00, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read/write path because it cannot
> guarantee that submitting read/write IO if the buffer has been locked.
> We could get false positive EIO after wait_on_buffer() in read path if
> the buffer has been locked by others. So stop using ll_rw_block() in
> reiserfs. We also switch to new bh_readahead_batch() helper for the
> buffer array readahead path.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>


Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/reiserfs/journal.c | 11 ++++++-----
>  fs/reiserfs/stree.c   |  4 ++--
>  fs/reiserfs/super.c   |  4 +---
>  3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 94addfcefede..9f62da7471c9 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -868,7 +868,7 @@ static int write_ordered_buffers(spinlock_t * lock,
>  		 */
>  		if (buffer_dirty(bh) && unlikely(bh->b_page->mapping == NULL)) {
>  			spin_unlock(lock);
> -			ll_rw_block(REQ_OP_WRITE, 1, &bh);
> +			write_dirty_buffer(bh, 0);
>  			spin_lock(lock);
>  		}
>  		put_bh(bh);
> @@ -1054,7 +1054,7 @@ static int flush_commit_list(struct super_block *s,
>  		if (tbh) {
>  			if (buffer_dirty(tbh)) {
>  		            depth = reiserfs_write_unlock_nested(s);
> -			    ll_rw_block(REQ_OP_WRITE, 1, &tbh);
> +			    write_dirty_buffer(tbh, 0);
>  			    reiserfs_write_lock_nested(s, depth);
>  			}
>  			put_bh(tbh) ;
> @@ -2240,7 +2240,7 @@ static int journal_read_transaction(struct super_block *sb,
>  		}
>  	}
>  	/* read in the log blocks, memcpy to the corresponding real block */
> -	ll_rw_block(REQ_OP_READ, get_desc_trans_len(desc), log_blocks);
> +	bh_read_batch(get_desc_trans_len(desc), log_blocks);
>  	for (i = 0; i < get_desc_trans_len(desc); i++) {
>  
>  		wait_on_buffer(log_blocks[i]);
> @@ -2342,10 +2342,11 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
>  		} else
>  			bhlist[j++] = bh;
>  	}
> -	ll_rw_block(REQ_OP_READ, j, bhlist);
> +	bh = bhlist[0];
> +	bh_read_nowait(bh, 0);
> +	bh_readahead_batch(j - 1, &bhlist[1], 0);
>  	for (i = 1; i < j; i++)
>  		brelse(bhlist[i]);
> -	bh = bhlist[0];
>  	wait_on_buffer(bh);
>  	if (buffer_uptodate(bh))
>  		return bh;
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 9a293609a022..84c12a1947b2 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -579,7 +579,7 @@ static int search_by_key_reada(struct super_block *s,
>  		if (!buffer_uptodate(bh[j])) {
>  			if (depth == -1)
>  				depth = reiserfs_write_unlock_nested(s);
> -			ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, bh + j);
> +			bh_readahead(bh[j], REQ_RAHEAD);
>  		}
>  		brelse(bh[j]);
>  	}
> @@ -685,7 +685,7 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,
>  			if (!buffer_uptodate(bh) && depth == -1)
>  				depth = reiserfs_write_unlock_nested(sb);
>  
> -			ll_rw_block(REQ_OP_READ, 1, &bh);
> +			bh_read_nowait(bh, 0);
>  			wait_on_buffer(bh);
>  
>  			if (depth != -1)
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index c88cd2ce0665..a5ffec0c7517 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1702,9 +1702,7 @@ static int read_super_block(struct super_block *s, int offset)
>  /* after journal replay, reread all bitmap and super blocks */
>  static int reread_meta_blocks(struct super_block *s)
>  {
> -	ll_rw_block(REQ_OP_READ, 1, &SB_BUFFER_WITH_SB(s));
> -	wait_on_buffer(SB_BUFFER_WITH_SB(s));
> -	if (!buffer_uptodate(SB_BUFFER_WITH_SB(s))) {
> +	if (bh_read(SB_BUFFER_WITH_SB(s), 0) < 0) {
>  		reiserfs_warning(s, "reiserfs-2504", "error reading the super");
>  		return 1;
>  	}
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

