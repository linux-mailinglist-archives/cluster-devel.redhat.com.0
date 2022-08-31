Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36C5A7BDD
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 13:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661943897;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7rUfy2mjgKSZvW8Hv+C3XQ3MWeegbpsZkXWtmcFePxA=;
	b=R7I47fKK74g6hlJDfF2AJDDfJPOOZ/cSErqTZgZl1KYPKm7zuRoyujiNiKj3or5VxRt4Gi
	y6tUNrg+Mmh2fTRGDBCetlcTVWPfiGoYhXwFDomj3ioooHNtcpp4UTqJAZLrMxQTpfvbE6
	2SeOBcujI/jnxWrfi/TDNECJH3pNvIo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-qgxAES1lMzuRrBRgykxMGA-1; Wed, 31 Aug 2022 07:04:54 -0400
X-MC-Unique: qgxAES1lMzuRrBRgykxMGA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3E3F185A7B2;
	Wed, 31 Aug 2022 11:04:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60A29492C3B;
	Wed, 31 Aug 2022 11:04:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4546A1946A4B;
	Wed, 31 Aug 2022 11:04:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D14F51946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 11:04:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BE1CD2166B2A; Wed, 31 Aug 2022 11:04:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA9292166B26
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:04:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9801E85A589
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:04:51 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-628-nMxxDzn3MXqAv964fV7fBg-1; Wed,
 31 Aug 2022 07:04:49 -0400
X-MC-Unique: nMxxDzn3MXqAv964fV7fBg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4591121E98;
 Wed, 31 Aug 2022 11:04:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E68F13A7C;
 Wed, 31 Aug 2022 11:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FO5ZC1BAD2NVcwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 11:04:48 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 83F66A067B; Wed, 31 Aug 2022 13:04:47 +0200 (CEST)
Date: Wed, 31 Aug 2022 13:04:47 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831110447.4qm5cme3kenfa5cd@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-10-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-10-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 09/14] reiserfs: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 31-08-22 15:21:06, Zhang Yi wrote:
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
> index 94addfcefede..699b1b8d5b73 100644
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
> +	bh_read_batch(log_blocks, get_desc_trans_len(desc));
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
> +	bh_readahead_batch(&bhlist[1], j - 1, 0);
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
> index c88cd2ce0665..8b1db82b6949 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1702,9 +1702,7 @@ static int read_super_block(struct super_block *s, int offset)
>  /* after journal replay, reread all bitmap and super blocks */
>  static int reread_meta_blocks(struct super_block *s)
>  {
> -	ll_rw_block(REQ_OP_READ, 1, &SB_BUFFER_WITH_SB(s));
> -	wait_on_buffer(SB_BUFFER_WITH_SB(s));
> -	if (!buffer_uptodate(SB_BUFFER_WITH_SB(s))) {
> +	if (bh_read(SB_BUFFER_WITH_SB(s), 0)) {
>  		reiserfs_warning(s, "reiserfs-2504", "error reading the super");
>  		return 1;
>  	}
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

