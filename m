Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 735965A7C13
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 13:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661944590;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MRx8k6tf8EVQNjQIGFIame1sUsAVK8et6tEwceGHhl8=;
	b=c12wj5NKKswfY3ButsAzWq1A57d6/H61iEIdkLorXk+M/bhQ5ueGWrfu1Eg6bTv+8Sw9h2
	3X1Ih9REE3sCeI0wQ0GlFwqnhX9Z/NZ12tSN5dE3OVWt58HoY2IEt9Ch78+1Qm+5mix/0S
	XUsYH1N3H2u6bWjnrhEiawfjw/MF4NM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-o6HQJtpNMRmnvu8j9tgb2g-1; Wed, 31 Aug 2022 07:16:24 -0400
X-MC-Unique: o6HQJtpNMRmnvu8j9tgb2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E18E3C0D19F;
	Wed, 31 Aug 2022 11:16:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72D652026D4C;
	Wed, 31 Aug 2022 11:16:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6DB291946A4B;
	Wed, 31 Aug 2022 11:16:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A96F1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 11:16:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 295EB40B40C7; Wed, 31 Aug 2022 11:16:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25BEA40CF8EE
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:16:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ECAE296A60F
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:16:21 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-330-zB7j2f1QO9q7PjsNDnjx9g-1; Wed,
 31 Aug 2022 07:16:17 -0400
X-MC-Unique: zB7j2f1QO9q7PjsNDnjx9g-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E78B521C15;
 Wed, 31 Aug 2022 11:16:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2EED13A7C;
 Wed, 31 Aug 2022 11:16:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6ZF7M/5CD2OpeAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 11:16:14 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 66DF7A067B; Wed, 31 Aug 2022 13:16:14 +0200 (CEST)
Date: Wed, 31 Aug 2022 13:16:14 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831111614.z5pfchnj5mzqug6s@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-15-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-15-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 14/14] fs/buffer: remove
 bh_submit_read() helper
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 31-08-22 15:21:11, Zhang Yi wrote:
> bh_submit_read() has no user anymore, just remove it.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/buffer.c                 | 25 -------------------------
>  include/linux/buffer_head.h |  1 -
>  2 files changed, 26 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index d1d09e2dacc2..fa7c2dbcef4c 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -3029,31 +3029,6 @@ void __bh_read_batch(struct buffer_head *bhs[],
>  }
>  EXPORT_SYMBOL(__bh_read_batch);
>  
> -/**
> - * bh_submit_read - Submit a locked buffer for reading
> - * @bh: struct buffer_head
> - *
> - * Returns zero on success and -EIO on error.
> - */
> -int bh_submit_read(struct buffer_head *bh)
> -{
> -	BUG_ON(!buffer_locked(bh));
> -
> -	if (buffer_uptodate(bh)) {
> -		unlock_buffer(bh);
> -		return 0;
> -	}
> -
> -	get_bh(bh);
> -	bh->b_end_io = end_buffer_read_sync;
> -	submit_bh(REQ_OP_READ, bh);
> -	wait_on_buffer(bh);
> -	if (buffer_uptodate(bh))
> -		return 0;
> -	return -EIO;
> -}
> -EXPORT_SYMBOL(bh_submit_read);
> -
>  void __init buffer_init(void)
>  {
>  	unsigned long nrpages;
> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
> index 1c93ff8c8f51..576f3609ac4e 100644
> --- a/include/linux/buffer_head.h
> +++ b/include/linux/buffer_head.h
> @@ -230,7 +230,6 @@ int submit_bh(blk_opf_t, struct buffer_head *);
>  void write_boundary_block(struct block_device *bdev,
>  			sector_t bblock, unsigned blocksize);
>  int bh_uptodate_or_lock(struct buffer_head *bh);
> -int bh_submit_read(struct buffer_head *bh);
>  int __bh_read(struct buffer_head *bh, blk_opf_t op_flags, bool wait);
>  void __bh_read_batch(struct buffer_head *bhs[],
>  		     int nr, blk_opf_t op_flags, bool force_lock);
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

