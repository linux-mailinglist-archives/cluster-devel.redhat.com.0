Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD4715918
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 10:54:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685436876;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y0a3qrgW7xR5mo053x8YAAt5HhAI7uPhIOS31nE1PP4=;
	b=GU5SKgCnwR1RYmadPnZrrDBDV46MzaLfjEgALYQ2fyOgw+xGfT9UbZYdfHp49ixhb/jGS2
	oq1hTYvNgBbGt/wEg9hHmOclgxGWsVIPy9VOCG/yCXh2WFCU/cY325sG/84a95aj1natpW
	o30ZfySCqNFYhN2PdTUHhKbTCypkaww=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-15lwGyj5MIiHsVihPi1hyQ-1; Tue, 30 May 2023 04:54:29 -0400
X-MC-Unique: 15lwGyj5MIiHsVihPi1hyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 711052A2AD54;
	Tue, 30 May 2023 08:54:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6240740CFD09;
	Tue, 30 May 2023 08:54:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EF04419465A3;
	Tue, 30 May 2023 08:54:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9847E194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 06:14:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5824E40CF8F7; Tue, 30 May 2023 06:14:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5099240CF8F6
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 06:13:59 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3188D185A78E
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 06:13:59 +0000 (UTC)
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-e5qLxzAzNhOovj045_HJBw-1; Tue, 30 May 2023 02:13:57 -0400
X-MC-Unique: e5qLxzAzNhOovj045_HJBw-1
X-QQ-mid: bizesmtp65t1685426547tmy4xja6
Received: from localhost.localdomain ( [113.200.76.118])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 30 May 2023 14:02:24 +0800 (CST)
X-QQ-SSF: 01400000000000C0G000000A0000000
X-QQ-FEAT: znfcQSa1hKaNoAA+Wu37XwpK1cksC/6aTghWFSS0JvJasQfz+eIO2zJLQRT6i
 rEM1DjNn+cMKUMmMkYKxNVhiJ/YaqYwyOdwJn8trVVHL4FwWqRIC1gXasm0tl2QcgbOhP2j
 LvZhKTr8+O0f7WbJ7aEKXPBecA76aTyilAsJsTVqnedMXbBhFAnGHPVXjv6vLMsjW6YvPyi
 i1gtBueSiPnfPmNzUzOGPtA6xO9BEI1yiGrXZ0be9XSQujkY1RIoTVJFJr5g/q5q1gPvFUS
 ZEKOIIEP+REIXrHWhBXhZbB8seLB4k9ZUsPfQMlMU4/yyaVrRkuBNBwcOqvR1A5Vgs91htm
 UZo1RdQcwSh9F4y0PRV2IDwcHtWLTFF1d191XBv6COHtM1tov3TE4c2SwkUPUQ1WWsDxlmz
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6104239791662094715
From: gouhao@uniontech.com
To: johannes.thumshirn@wdc.com
Date: Tue, 30 May 2023 14:02:22 +0800
Message-Id: <20230530060222.14892-1-gouhao@uniontech.com>
In-Reply-To: <20230502101934.24901-5-johannes.thumshirn@wdc.com>
References: <20230502101934.24901-5-johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 30 May 2023 08:54:23 +0000
Subject: Re: [Cluster-devel] [PATCH v5 04/20] fs: buffer: use __bio_add_page
 to add single page to bio
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, damien.lemoal@wdc.com,
 kch@nvidia.com, shaggy@kernel.org, song@kernel.org,
 damien.lemoal@opensource.wdc.com, snitzer@kernel.org,
 jfs-discussion@lists.sourceforge.net, willy@infradead.org, ming.lei@redhat.com,
 cluster-devel@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 hare@suse.de, linux-fsdevel@vger.kernel.org, linux-raid@vger.kernel.org,
 hch@lst.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: uniontech.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

> 
> The buffer_head submission code uses bio_add_page() to add a page to a
> newly created bio. bio_add_page() can fail, but the return value is never
> checked.
> 
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
> 
> This brings us a step closer to marking bio_add_page() as __must_check.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>  fs/buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index a7fc561758b1..5abc26d8399d 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2760,7 +2760,7 @@ static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
>  
>  	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
>  
> -	bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
> +	__bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
>  	BUG_ON(bio->bi_iter.bi_size != bh->b_size);
Can `BUG_ON` be deleted now ?
>  
>  	bio->bi_end_io = end_bio_bh_io_sync;
> -- 
> 2.40.0
--
thanks,
Gou Hao

