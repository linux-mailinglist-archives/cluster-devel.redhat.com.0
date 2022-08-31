Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 349F95A7BCD
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 12:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661943536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HxNI+0U0e7Zv/ZQHFt2fp30OwTNw2GytjeLFyfJkdIU=;
	b=Dbqs2Xxi+Jczc9xY4kIDRijeeM8p1VtHfT9wt8JmPEiJBHiJYmy1fXLkvggMPKXbyrQ7j9
	OqMl5KOXef0m9Wl1z0P9TYnbaMN+cCLaMCE0CFe/A1RM2Q1h5HSQf3c+HfK1YhwyNWImzJ
	8pLKiy1Lo3jg8TGBxUV9+n+9JBS74FA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-kDUYf78ONBeSnProPNKbEg-1; Wed, 31 Aug 2022 06:58:52 -0400
X-MC-Unique: kDUYf78ONBeSnProPNKbEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 826B5800124;
	Wed, 31 Aug 2022 10:58:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 684F6C15BB3;
	Wed, 31 Aug 2022 10:58:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9CC31946A4B;
	Wed, 31 Aug 2022 10:58:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5B4E61946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 10:58:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BCA401410F3C; Wed, 31 Aug 2022 10:58:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B89E41415133
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 10:58:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0535101A54E
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 10:58:48 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-580-15BKXVGkM1upcdJGlNeDOg-1; Wed,
 31 Aug 2022 06:58:47 -0400
X-MC-Unique: 15BKXVGkM1upcdJGlNeDOg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 89F7E221B9;
 Wed, 31 Aug 2022 10:58:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7640313A7C;
 Wed, 31 Aug 2022 10:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 64nUHOU+D2O5cAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 10:58:45 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 0F038A067B; Wed, 31 Aug 2022 12:58:45 +0200 (CEST)
Date: Wed, 31 Aug 2022 12:58:45 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831105845.mwfkh2prb557ajyr@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-7-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-7-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 06/14] jbd2: replace ll_rw_block()
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

On Wed 31-08-22 15:21:03, Zhang Yi wrote:
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
>  fs/jbd2/journal.c  |  7 +++----
>  fs/jbd2/recovery.c | 16 ++++++++++------
>  2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
> index 6350d3857c89..5a903aae6aad 100644
> --- a/fs/jbd2/journal.c
> +++ b/fs/jbd2/journal.c
> @@ -1893,15 +1893,14 @@ static int journal_get_superblock(journal_t *journal)
>  {
>  	struct buffer_head *bh;
>  	journal_superblock_t *sb;
> -	int err = -EIO;
> +	int err;
>  
>  	bh = journal->j_sb_buffer;
>  
>  	J_ASSERT(bh != NULL);
>  	if (!buffer_uptodate(bh)) {
> -		ll_rw_block(REQ_OP_READ, 1, &bh);
> -		wait_on_buffer(bh);
> -		if (!buffer_uptodate(bh)) {
> +		err = bh_read(bh, 0);
> +		if (err) {
>  			printk(KERN_ERR
>  				"JBD2: IO error reading journal superblock\n");
>  			goto out;
> diff --git a/fs/jbd2/recovery.c b/fs/jbd2/recovery.c
> index f548479615c6..ee56a30b71cf 100644
> --- a/fs/jbd2/recovery.c
> +++ b/fs/jbd2/recovery.c
> @@ -100,7 +100,7 @@ static int do_readahead(journal_t *journal, unsigned int start)
>  		if (!buffer_uptodate(bh) && !buffer_locked(bh)) {
>  			bufs[nbufs++] = bh;
>  			if (nbufs == MAXBUF) {
> -				ll_rw_block(REQ_OP_READ, nbufs, bufs);
> +				bh_readahead_batch(bufs, nbufs, 0);
>  				journal_brelse_array(bufs, nbufs);
>  				nbufs = 0;
>  			}
> @@ -109,7 +109,7 @@ static int do_readahead(journal_t *journal, unsigned int start)
>  	}
>  
>  	if (nbufs)
> -		ll_rw_block(REQ_OP_READ, nbufs, bufs);
> +		bh_readahead_batch(bufs, nbufs, 0);
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

