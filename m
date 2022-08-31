Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE55A7C57
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 13:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661946173;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XrNkIM9koqnVx0iIIXA2kZMeNNiavp0FWSmtqMYA0AU=;
	b=cv+QQiNZzkgVD5MNDLPtSjFVW11S/thfjUy8BbbEzII22uDi5frmQzh3QocoUGtxZIu2HB
	77vqIaeUGjuBE9cyINYscm3MNKziHYt4UvAp62eqD71JkP0528OqhD6sACDs7ZBP3nyRyv
	4bRXtAO0xQ8rH/ejNuyJVz+EDM0GJqY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-HmyAdUNvM32Tm1H6085QUA-1; Wed, 31 Aug 2022 07:42:50 -0400
X-MC-Unique: HmyAdUNvM32Tm1H6085QUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46C5F85A585;
	Wed, 31 Aug 2022 11:42:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A33E2166B26;
	Wed, 31 Aug 2022 11:42:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 394181946A4B;
	Wed, 31 Aug 2022 11:42:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D7891946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 11:31:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C59F492CA2; Wed, 31 Aug 2022 11:31:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38D76492C3B
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:31:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F36729DD9B6
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:31:41 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-561-Mfnk8NGZPqmqfK5R3pO7mw-1; Wed,
 31 Aug 2022 07:31:36 -0400
X-MC-Unique: Mfnk8NGZPqmqfK5R3pO7mw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 584321F893;
 Wed, 31 Aug 2022 11:31:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 422571332D;
 Wed, 31 Aug 2022 11:31:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JKAjEJdGD2NefwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 11:31:35 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id D7D52A067B; Wed, 31 Aug 2022 13:31:34 +0200 (CEST)
Date: Wed, 31 Aug 2022 13:31:34 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831113134.fdmklqore4uglz7g@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-9-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-9-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 08/14] ocfs2: replace ll_rw_block()
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

On Wed 31-08-22 15:21:05, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block() in ocfs2.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> ---
>  fs/ocfs2/aops.c  | 2 +-
>  fs/ocfs2/super.c | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
> index af4157f61927..1d65f6ef00ca 100644
> --- a/fs/ocfs2/aops.c
> +++ b/fs/ocfs2/aops.c
> @@ -636,7 +636,7 @@ int ocfs2_map_page_blocks(struct page *page, u64 *p_blkno,
>  			   !buffer_new(bh) &&
>  			   ocfs2_should_read_blk(inode, page, block_start) &&
>  			   (block_start < from || block_end > to)) {
> -			ll_rw_block(REQ_OP_READ, 1, &bh);
> +			bh_read_nowait(bh, 0);
>  			*wait_bh++=bh;
>  		}
>  
> diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
> index e2cc9eec287c..4050f35bbd0c 100644
> --- a/fs/ocfs2/super.c
> +++ b/fs/ocfs2/super.c
> @@ -1763,10 +1763,7 @@ static int ocfs2_get_sector(struct super_block *sb,
>  	lock_buffer(*bh);
>  	if (!buffer_dirty(*bh))
>  		clear_buffer_uptodate(*bh);
> -	unlock_buffer(*bh);
> -	ll_rw_block(REQ_OP_READ, 1, bh);
> -	wait_on_buffer(*bh);
> -	if (!buffer_uptodate(*bh)) {
> +	if (bh_read_locked(*bh, 0)) {
>  		mlog_errno(-EIO);
>  		brelse(*bh);
>  		*bh = NULL;

I would just use bh_read() here and drop bh_read_locked() altogether...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

