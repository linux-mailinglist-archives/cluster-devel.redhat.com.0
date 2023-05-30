Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D347166C0
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 17:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685459630;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=vye8gB1vOKUzz58ckJ8yXN12XsS7VmnNhEIxChnaCeU=;
	b=GCNqPBrobEXEz0CLwU2CwhdgRxj/ubiZqMnOGbkJRkY5FueEwVf0x9yXt3NjE6Kjhnwak3
	J31rlfy2vKI8z1GUUxLJw6flUswkP5kCO9vEH3hIswcMoe6/dOA0PjVXO/hFV7ZESp5awb
	S08TKmusrsxFjE6GSYMR3vy4PjrSrJ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-X7NDE1KGMjamSCaMnIBGFA-1; Tue, 30 May 2023 11:13:46 -0400
X-MC-Unique: X7NDE1KGMjamSCaMnIBGFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 016E58115B0;
	Tue, 30 May 2023 15:13:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF09440CFD46;
	Tue, 30 May 2023 15:13:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DD3519465BC;
	Tue, 30 May 2023 15:13:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D430119465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 15:13:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BE0F8140EBD7; Tue, 30 May 2023 15:13:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A93F140EBB8;
 Tue, 30 May 2023 15:13:39 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 34UFDdMG006630; Tue, 30 May 2023 11:13:39 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 34UFDc58006626; Tue, 30 May 2023 11:13:38 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 30 May 2023 11:13:38 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
In-Reply-To: <20230502101934.24901-17-johannes.thumshirn@wdc.com>
Message-ID: <alpine.LRH.2.21.2305301045220.3943@file01.intranet.prod.int.rdu2.redhat.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
 <20230502101934.24901-17-johannes.thumshirn@wdc.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [dm-devel] [PATCH v5 16/20] dm-crypt: check if
 adding pages to clone bio fails
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
Cc: "axboe @ kernel . dk" <axboe@kernel.dk>, shaggy@kernel.org,
 damien.lemoal@wdc.com, cluster-devel@redhat.com, kch@nvidia.com,
 linux-mm@kvack.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 snitzer@kernel.org, jfs-discussion@lists.sourceforge.net, willy@infradead.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, song@kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org, linux-raid@vger.kernel.org,
 hch@lst.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII



On Tue, 2 May 2023, Johannes Thumshirn wrote:

> Check if adding pages to clone bio fails and if it does retry with
> reclaim. This mirrors the behaviour of page allocation in
> crypt_alloc_buffer().
> 
> This way we can mark bio_add_pages as __must_check.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>  drivers/md/dm-crypt.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 8b47b913ee83..b234dc089cee 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -1693,7 +1693,14 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned int size)
>  
>  		len = (remaining_size > PAGE_SIZE) ? PAGE_SIZE : remaining_size;
>  
> -		bio_add_page(clone, page, len, 0);
> +		if (!bio_add_page(clone, page, len, 0)) {
> +			mempool_free(page, &cc->page_pool);
> +			crypt_free_buffer_pages(cc, clone);
> +			bio_put(clone);
> +			gfp_mask |= __GFP_DIRECT_RECLAIM;
> +			goto retry;
> +
> +		}
>  
>  		remaining_size -= len;
>  	}

Hi

I nack this. This just adds code that can't ever be executed.

dm-crypt already allocates enough entries in the vector (see "unsigned int 
nr_iovecs = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;"), so bio_add_page can't 
fail.

If you want to add __must_check to bio_add_page, you should change the 
dm-crypt code to:
if (!bio_add_page(clone, page, len, 0)) {
	WARN(1, "this can't happen");
	return NULL;
}
and not write recovery code for a can't-happen case.

Mikulas

