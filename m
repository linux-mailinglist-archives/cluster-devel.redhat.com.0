Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E4F5A7BB5
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 12:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661943099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8KZxa7BkROWFtCJZpT4HFztv+uWtNZCErlyLPEOrTQ4=;
	b=XOvrPJqDiM9vpbKgoNeBTHiLe75fd+/ryq1fMvQTcX83IwPQ8GJbm93mixertrIFEtqoLa
	ID15ORziJ1jy6mB4cD7TeDB+O+KbcbJ+StexdXDFruJ5cEcROXyjgve8ZvPZRhepwxyMfR
	hCJZF0MsXIsGwU+YzH0DpRR9WjPWbX0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-akAPGubqP9-IoEAlhhZGSQ-1; Wed, 31 Aug 2022 06:51:35 -0400
X-MC-Unique: akAPGubqP9-IoEAlhhZGSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FD62185A7B2;
	Wed, 31 Aug 2022 10:51:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BC814010E6E;
	Wed, 31 Aug 2022 10:51:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 839D21946A4B;
	Wed, 31 Aug 2022 10:51:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 88C751946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 10:51:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0CC3F403344; Wed, 31 Aug 2022 10:51:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08ABB492C3B
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 10:51:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E529280418F
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 10:51:29 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-636-Y5nFcs-BNhO5pmic7zJTkA-1; Wed,
 31 Aug 2022 06:51:27 -0400
X-MC-Unique: Y5nFcs-BNhO5pmic7zJTkA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 20E5A2227A;
 Wed, 31 Aug 2022 10:51:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09B1413A7C;
 Wed, 31 Aug 2022 10:51:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2vRKAi49D2OlbQAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 10:51:26 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 852B7A067B; Wed, 31 Aug 2022 12:51:25 +0200 (CEST)
Date: Wed, 31 Aug 2022 12:51:25 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831105125.mv2674t37yhns2sf@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-4-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-4-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 03/14] fs/buffer: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 31-08-22 15:21:00, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync IO path because it skip buffers
> which has been locked by others, it could lead to false positive EIO
> when submitting read IO. So stop using ll_rw_block(), switch to use new
> helpers which could guarantee buffer locked and submit IO if needed.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> ---
>  fs/buffer.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index a663191903ed..e14adc638bfe 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
...
> @@ -1342,7 +1342,8 @@ void __breadahead(struct block_device *bdev, sector_t block, unsigned size)
>  {
>  	struct buffer_head *bh = __getblk(bdev, block, size);
>  	if (likely(bh)) {
> -		ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, &bh);
> +		if (trylock_buffer(bh))
> +			__bh_read(bh, REQ_RAHEAD, false);

I suppose this can be bh_readahead()?

>  		brelse(bh);
>  	}
>  }

Otherwise the patch looks good.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

