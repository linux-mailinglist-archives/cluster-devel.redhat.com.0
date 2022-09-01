Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA475A9C26
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 17:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662047432;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bXMDzUM1+Lt+ZSThjbm8wHTNDhe4lR0BR+Ul6jNDnQY=;
	b=cqeQ80Dvg9caL5B5KrI0DmJIuxXzNasiFF+VL9fElrhpjcV0/9gdipqiT3KFpjR0mWCDfX
	TDvNhrAVnJxHMWTXMmxJKWsHs2mpqkkYzgcE9hYeDDRZKSWhU1ZfvF8c+Iolzg1fcse/eE
	DvwGJEBtLSp6O0fpsz2Wj0CIR25ZO8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-eiyCBpHqM6mAYZ-HS01TsA-1; Thu, 01 Sep 2022 11:50:27 -0400
X-MC-Unique: eiyCBpHqM6mAYZ-HS01TsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 807D818A0164;
	Thu,  1 Sep 2022 15:50:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F0AD1121314;
	Thu,  1 Sep 2022 15:50:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3DFBF1942685;
	Thu,  1 Sep 2022 15:50:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9E1971946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 15:50:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 81D5C40B40CB; Thu,  1 Sep 2022 15:50:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E25140B40C7
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:50:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63900811E76
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:50:14 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-605-QTxMSyurMi2c6fUnCM4Clg-1; Thu,
 01 Sep 2022 11:50:10 -0400
X-MC-Unique: QTxMSyurMi2c6fUnCM4Clg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D37DE2292E;
 Thu,  1 Sep 2022 15:50:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C402813A89;
 Thu,  1 Sep 2022 15:50:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q/LUL6/UEGPwAwAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Sep 2022 15:50:07 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 41E74A067C; Thu,  1 Sep 2022 17:50:07 +0200 (CEST)
Date: Thu, 1 Sep 2022 17:50:07 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220901155007.nelecqohvd4plqqy@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-7-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220901133505.2510834-7-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v2 06/14] jbd2: replace ll_rw_block()
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

On Thu 01-09-22 21:34:57, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block() in
> journal_get_superblock(). We also switch to new bh_readahead_batch()
> for the buffer array readahead path.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/jbd2/journal.c  | 15 ++++++---------
>  fs/jbd2/recovery.c | 16 ++++++++++------
>  2 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
> index 6350d3857c89..140b070471c0 100644
> --- a/fs/jbd2/journal.c
> +++ b/fs/jbd2/journal.c
> @@ -1893,19 +1893,16 @@ static int journal_get_superblock(journal_t *journal)
>  {
>  	struct buffer_head *bh;
>  	journal_superblock_t *sb;
> -	int err = -EIO;
> +	int err;
>  
>  	bh = journal->j_sb_buffer;
>  
>  	J_ASSERT(bh != NULL);
> -	if (!buffer_uptodate(bh)) {
> -		ll_rw_block(REQ_OP_READ, 1, &bh);
> -		wait_on_buffer(bh);
> -		if (!buffer_uptodate(bh)) {
> -			printk(KERN_ERR
> -				"JBD2: IO error reading journal superblock\n");
> -			goto out;
> -		}
> +	err = bh_read(bh, 0);
> +	if (err < 0) {
> +		printk(KERN_ERR
> +			"JBD2: IO error reading journal superblock\n");
> +		goto out;
>  	}
>  
>  	if (buffer_verified(bh))
> diff --git a/fs/jbd2/recovery.c b/fs/jbd2/recovery.c
> index f548479615c6..1f878c315b03 100644
> --- a/fs/jbd2/recovery.c
> +++ b/fs/jbd2/recovery.c
> @@ -100,7 +100,7 @@ static int do_readahead(journal_t *journal, unsigned int start)
>  		if (!buffer_uptodate(bh) && !buffer_locked(bh)) {
>  			bufs[nbufs++] = bh;
>  			if (nbufs == MAXBUF) {
> -				ll_rw_block(REQ_OP_READ, nbufs, bufs);
> +				bh_readahead_batch(nbufs, bufs, 0);
>  				journal_brelse_array(bufs, nbufs);
>  				nbufs = 0;
>  			}
> @@ -109,7 +109,7 @@ static int do_readahead(journal_t *journal, unsigned int start)
>  	}
>  
>  	if (nbufs)
> -		ll_rw_block(REQ_OP_READ, nbufs, bufs);
> +		bh_readahead_batch(nbufs, bufs, 0);
>  	err = 0;
>  
>  failed:
> @@ -152,9 +152,14 @@ static int jread(struct buffer_head **bhp, journal_t *journal,
>  		return -ENOMEM;
>  
>  	if (!buffer_uptodate(bh)) {
> -		/* If this is a brand new buffer, start readahead.
> -                   Otherwise, we assume we are already reading it.  */
> -		if (!buffer_req(bh))
> +		/*
> +		 * If this is a brand new buffer, start readahead.
> +		 * Otherwise, we assume we are already reading it.
> +		 */
> +		bool need_readahead = !buffer_req(bh);
> +
> +		bh_read_nowait(bh, 0);
> +		if (need_readahead)
>  			do_readahead(journal, offset);
>  		wait_on_buffer(bh);
>  	}
> @@ -687,7 +692,6 @@ static int do_one_pass(journal_t *journal,
>  					mark_buffer_dirty(nbh);
>  					BUFFER_TRACE(nbh, "marking uptodate");
>  					++info->nr_replays;
> -					/* ll_rw_block(WRITE, 1, &nbh); */
>  					unlock_buffer(nbh);
>  					brelse(obh);
>  					brelse(nbh);
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

