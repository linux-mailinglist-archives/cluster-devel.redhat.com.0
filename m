Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C00717311
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 03:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685496051;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A01mJZWigLgezUnV+6dXqqpEC4ipjaiko+YjTTqLPGc=;
	b=RQVKrwB72vwiX6TdxQqfgL0wIaoEzmRNnDW6F2xVmjegCcBu8nbWeWOXbBfW3k9tdI+1fb
	T7wHGAnzWD9n4vhFUxGVk71OwPB4uN/zdba/5vG3M/FWRQ1rocraKwzpI9oV8QJ0Zt6Dw8
	7pVb2v7k3wg7GeSoMo43OsXmm/MU+ic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-XJNsu6dZPcesp1H_ASETwg-1; Tue, 30 May 2023 21:20:48 -0400
X-MC-Unique: XJNsu6dZPcesp1H_ASETwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 213868032FA;
	Wed, 31 May 2023 01:20:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9DEB140EBD7;
	Wed, 31 May 2023 01:20:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 33EC719465B2;
	Wed, 31 May 2023 01:20:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AB0641946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 01:20:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8825A40C2007; Wed, 31 May 2023 01:20:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 801D840C2006
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 01:20:43 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60A613C02194
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 01:20:43 +0000 (UTC)
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-Rg_WBqyLNIam6w8QB-N24A-1; Tue, 30 May 2023 21:20:34 -0400
X-MC-Unique: Rg_WBqyLNIam6w8QB-N24A-1
X-QQ-mid: bizesmtp81t1685496025tw3oxnvp
Received: from [10.7.13.54] ( [113.200.76.118])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 31 May 2023 09:20:22 +0800 (CST)
X-QQ-SSF: 01400000000000C0G000000A0000000
X-QQ-FEAT: W+onFc5Tw4MXg9NmrArDYuEAjJHK4eL16p2bcGANAmu997qLZ+ujaV0s8Z1f/
 Nzmi8pNaWsKZP3Jmi5RKnu6nb+dCbNyrwOCVF3RhlVA1YBbFzgt8Coml9Vf2MloZUnDRpkl
 ADpUgJE8XNtjVow/bv7ZzhCNWk6I9WYmKFl0SSM5YLTrc8oT51rizMWMAPqdm1XDAhtCWWX
 DTqIUQa3efIfkNOAZX6/Yw4UnTUT6YoTYppGEuFOveHR6P5KZuNwCsuXN+Ey1bBhqyCVvPN
 eC3evk9wk+U3FfRn1CeZLX4tO4xCLND+a2cq7UCdAoJE6IMuJmrs5xNI56H1bmPeS+O61qR
 RBvgLchUjYteu3Ao0qfjQZGWJn29WS3hcVcO44C5o7MX+jf/j0=
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16526261309428552688
Message-ID: <594B3D441ED28D0D+301afc15-d56d-4b9b-dc94-c97c658df05c@uniontech.com>
Date: Wed, 31 May 2023 09:20:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1685461490.git.johannes.thumshirn@wdc.com>
 <f67cc9c310bed1e3c3302ea1c206da7d5ebc14cb.1685461490.git.johannes.thumshirn@wdc.com>
From: Gou Hao <gouhao@uniontech.com>
In-Reply-To: <f67cc9c310bed1e3c3302ea1c206da7d5ebc14cb.1685461490.git.johannes.thumshirn@wdc.com>
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
Subject: Re: [Cluster-devel] [PATCH v6 04/20] fs: buffer: use __bio_add_page
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
Reply-To: f67cc9c310bed1e3c3302ea1c206da7d5ebc14cb.1685461490.git.johannes.thumshirn@wdc.com
Cc: linux-raid@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 cluster-devel@redhat.com, Chaitanya Kulkarni <kch@nvidia.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: uniontech.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/23 23:49, Johannes Thumshirn wrote:

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


Reviewed-by: Gou Hao <gouhao@uniontech.com>

> ---
>   fs/buffer.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/buffer.c b/fs/buffer.c
> index a7fc561758b1..63da30ce946a 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2760,8 +2760,7 @@ static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
>   
>   	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
>   
> -	bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
> -	BUG_ON(bio->bi_iter.bi_size != bh->b_size);
> +	__bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
>   
>   	bio->bi_end_io = end_bio_bh_io_sync;
>   	bio->bi_private = bh;

