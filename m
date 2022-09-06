Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CF15ADCCF
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Sep 2022 03:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662426710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UXFqJo5GAIOF6o7wyHkdBTzU+C1sVte7GmJpIDlsUrM=;
	b=HBzv7Nz29gaZyyNfBdlpaPz7VhRWrzjCe14ry/7aceUBtt/hAKJVHBwXf4NZe5LrSUjsai
	oZjNZtLJBxcWo3feY8kkQjDstrufq64qBA3TXNzgwadwiQEeiT8ojmSmvUVIIZwK870DKB
	A95baFLvLif8wapHWoKIuwZD+EaldvQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-oUXp1ka-NIKgAG2t8w_8kg-1; Mon, 05 Sep 2022 21:11:43 -0400
X-MC-Unique: oUXp1ka-NIKgAG2t8w_8kg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3227801755;
	Tue,  6 Sep 2022 01:11:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF341C15BBD;
	Tue,  6 Sep 2022 01:11:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6757E194B966;
	Tue,  6 Sep 2022 01:11:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EC1DE1946A47 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Sep 2022 01:11:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 680452026D64; Tue,  6 Sep 2022 01:11:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6497A2026D4C
 for <cluster-devel@redhat.com>; Tue,  6 Sep 2022 01:11:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 449163C01D85
 for <cluster-devel@redhat.com>; Tue,  6 Sep 2022 01:11:38 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-601-vWFMzELONP21Q1x12U6cYw-1; Mon, 05 Sep 2022 21:11:34 -0400
X-MC-Unique: vWFMzELONP21Q1x12U6cYw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=joseph.qi@linux.alibaba.com; NM=1; PH=DS; RN=19; SR=0;
 TI=SMTPD_---0VOZFNX5_1662426383
Received: from 30.221.128.209(mailfrom:joseph.qi@linux.alibaba.com
 fp:SMTPD_---0VOZFNX5_1662426383) by smtp.aliyun-inc.com;
 Tue, 06 Sep 2022 09:06:25 +0800
Message-ID: <65f66ce6-7695-2884-23a9-378b5c9ca04f@linux.alibaba.com>
Date: Tue, 6 Sep 2022 09:06:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
 reiserfs-devel@vger.kernel.org, jack@suse.cz
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-9-yi.zhang@huawei.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20220901133505.2510834-9-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [Ocfs2-devel] [PATCH v2 08/14] ocfs2: replace
 ll_rw_block()
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
Cc: axboe@kernel.dk, almaz.alexandrovich@paragon-software.com, tytso@mit.edu,
 chengzhihao1@huawei.com, viro@zeniv.linux.org.uk, yukuai3@huawei.com,
 dushistov@mail.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/22 9:34 PM, Zhang Yi via Ocfs2-devel wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block() in ocfs2.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>

> ---
>  fs/ocfs2/aops.c  | 2 +-
>  fs/ocfs2/super.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
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
> index e2cc9eec287c..26b4c2bfee49 100644
> --- a/fs/ocfs2/super.c
> +++ b/fs/ocfs2/super.c
> @@ -1764,9 +1764,7 @@ static int ocfs2_get_sector(struct super_block *sb,
>  	if (!buffer_dirty(*bh))
>  		clear_buffer_uptodate(*bh);
>  	unlock_buffer(*bh);
> -	ll_rw_block(REQ_OP_READ, 1, bh);
> -	wait_on_buffer(*bh);
> -	if (!buffer_uptodate(*bh)) {
> +	if (bh_read(*bh, 0) < 0) {
>  		mlog_errno(-EIO);
>  		brelse(*bh);
>  		*bh = NULL;

