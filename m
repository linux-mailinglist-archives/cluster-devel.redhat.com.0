Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 523475A9C62
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 17:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662047987;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2ZHzkmvovrbUUNg7omW+A+uLbWs5jnT10RXVkkl6wFY=;
	b=LPB8sf4g2hFU4kAVh5Zs9na//i1zEg9kC+XtfxoF9In45e8Bjs16NPBxZI8N/tq0vPcq5y
	tpPrP6ykR52C9zhrGQksihFkoWXOelBaGF4+m7HSgiYyA0D9T1pI4VmJwQTIRRaezQR7yo
	xYQowG63HfNv+1phn2/JTSPcrGMk+JA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-lGnTU3xSPfSnWk8ZL19Ypw-1; Thu, 01 Sep 2022 11:59:41 -0400
X-MC-Unique: lGnTU3xSPfSnWk8ZL19Ypw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CC8A811E83;
	Thu,  1 Sep 2022 15:59:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 907F740C141D;
	Thu,  1 Sep 2022 15:59:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6918F1942685;
	Thu,  1 Sep 2022 15:59:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F8FF1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 15:58:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E664A945D0; Thu,  1 Sep 2022 15:58:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E298518ECC
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:58:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7A5A3C10153
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:58:51 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-632-5e_NBJY2NYaUUBWAeP9Uww-1; Thu,
 01 Sep 2022 11:58:44 -0400
X-MC-Unique: 5e_NBJY2NYaUUBWAeP9Uww-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84A7E22B10;
 Thu,  1 Sep 2022 15:58:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E2AC13A89;
 Thu,  1 Sep 2022 15:58:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YhzfGq/WEGO1BwAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Sep 2022 15:58:39 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id E78B9A067C; Thu,  1 Sep 2022 17:58:38 +0200 (CEST)
Date: Thu, 1 Sep 2022 17:58:38 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220901155838.24kdcxwaduc4c7pr@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-11-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220901133505.2510834-11-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v2 10/14] udf: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 01-09-22 21:35:01, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block(). We also switch to
> new bh_readahead_batch() helper for the buffer array readahead path.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me.

								Honza

> ---
>  fs/udf/dir.c       | 2 +-
>  fs/udf/directory.c | 2 +-
>  fs/udf/inode.c     | 8 +-------
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/udf/dir.c b/fs/udf/dir.c
> index cad3772f9dbe..be640f4b2f2c 100644
> --- a/fs/udf/dir.c
> +++ b/fs/udf/dir.c
> @@ -130,7 +130,7 @@ static int udf_readdir(struct file *file, struct dir_context *ctx)
>  					brelse(tmp);
>  			}
>  			if (num) {
> -				ll_rw_block(REQ_OP_READ | REQ_RAHEAD, num, bha);
> +				bh_readahead_batch(num, bha, REQ_RAHEAD);
>  				for (i = 0; i < num; i++)
>  					brelse(bha[i]);
>  			}
> diff --git a/fs/udf/directory.c b/fs/udf/directory.c
> index a2adf6293093..16bcf2c6b8b3 100644
> --- a/fs/udf/directory.c
> +++ b/fs/udf/directory.c
> @@ -89,7 +89,7 @@ struct fileIdentDesc *udf_fileident_read(struct inode *dir, loff_t *nf_pos,
>  					brelse(tmp);
>  			}
>  			if (num) {
> -				ll_rw_block(REQ_OP_READ | REQ_RAHEAD, num, bha);
> +				bh_readahead_batch(num, bha, REQ_RAHEAD);
>  				for (i = 0; i < num; i++)
>  					brelse(bha[i]);
>  			}
> diff --git a/fs/udf/inode.c b/fs/udf/inode.c
> index 8d06daed549f..dce6ae9ae306 100644
> --- a/fs/udf/inode.c
> +++ b/fs/udf/inode.c
> @@ -1211,13 +1211,7 @@ struct buffer_head *udf_bread(struct inode *inode, udf_pblk_t block,
>  	if (!bh)
>  		return NULL;
>  
> -	if (buffer_uptodate(bh))
> -		return bh;
> -
> -	ll_rw_block(REQ_OP_READ, 1, &bh);
> -
> -	wait_on_buffer(bh);
> -	if (buffer_uptodate(bh))
> +	if (bh_read(bh, 0) >= 0)
>  		return bh;
>  
>  	brelse(bh);
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

