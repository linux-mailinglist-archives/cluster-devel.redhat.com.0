Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE86F430C
	for <lists+cluster-devel@lfdr.de>; Tue,  2 May 2023 13:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683028271;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kdZho8b0P96S/DuDI1xyFnU41Cvk0heUauLxuFmvVg0=;
	b=fpjbafHiU3Q6/iaAoUKXiG9/jf/gzI4hJFFqOQwH4VMZ8teiMhf+0k1YD2R6Z0OkmHWHZD
	yHJIQ252ZOwIfPUzKeDMbuJ12X6M2uY7jSYhfLhEdwZvcyFnnogmHTPdJ4bGNKUTOciT2q
	4V2chQ1wTwQiDBS47JtaUhf4ZUEUgLY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-rzwB9xvKMcu-ORHaUkrf6g-1; Tue, 02 May 2023 07:51:08 -0400
X-MC-Unique: rzwB9xvKMcu-ORHaUkrf6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D669985A5A3;
	Tue,  2 May 2023 11:51:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F34861410F24;
	Tue,  2 May 2023 11:51:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B89D71946597;
	Tue,  2 May 2023 11:51:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE984194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 May 2023 11:51:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CF79B1121331; Tue,  2 May 2023 11:51:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C80B9112132E
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 11:51:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACB721C068D2
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 11:51:05 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-5A73lf5yO9KF71O4LtadsA-1; Tue, 02 May 2023 07:51:04 -0400
X-MC-Unique: 5A73lf5yO9KF71O4LtadsA-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3f17f39d3deso49220381cf.3
 for <cluster-devel@redhat.com>; Tue, 02 May 2023 04:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683028264; x=1685620264;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kdZho8b0P96S/DuDI1xyFnU41Cvk0heUauLxuFmvVg0=;
 b=KjvREIhfUcILnfqv6jF1o2Jaa4EfchMhz8tgW4NFzZntBAKGC46Dka6UdZOALersnE
 ZJk6EJw4Awy3PodZXc71ocsZXOamfZkO02e+NKxL4ZIzogdZaO0oPI3uyRz7KlvcVocB
 ORDD/lRK1XBnM0wOHRq1WoOyTIPUirA5kIYaXMJQsdjcwI2uWbltMSmr2TpIhfawDqVs
 NWokY6NDGou/tEY0XeEiWGhS/pHfL3YgGi2Ckn1Zzs5W3rXEG7qoI4AocFAw1ueYw0oQ
 cRMOG1A/Ga6MKCBMU6bgGc49G4XunyEp8CojO8+NMgZoxmzI65yTRF4ClIPGxpPyUmm2
 tWmQ==
X-Gm-Message-State: AC+VfDw842xzM6sTkYwt7JCnPWLVeUzvI61I93UsrAzDNuNpwQHWWWag
 98Y93GydAoFPrucmQ4d/oMbF0CAIiU0XMrzaE8DmYzo/NQ98szHY/p5/xSupgioLdaH0JTAI7ey
 NtBSjeuk1wffk/AVFI16htQ==
X-Received: by 2002:a05:622a:30f:b0:3ef:337b:4fcb with SMTP id
 q15-20020a05622a030f00b003ef337b4fcbmr28295416qtw.64.1683028264044; 
 Tue, 02 May 2023 04:51:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Vrqw+pKj/0O/fsSqYR2NNR+qseAedVJ76NoenSc8LVgBigL4KUU+oPaikQc4zPyJmE8NtjQ==
X-Received: by 2002:a05:622a:30f:b0:3ef:337b:4fcb with SMTP id
 q15-20020a05622a030f00b003ef337b4fcbmr28295396qtw.64.1683028263837; 
 Tue, 02 May 2023 04:51:03 -0700 (PDT)
Received: from ?IPV6:2601:883:c200:210:6ae9:ce2:24c9:b87b?
 ([2601:883:c200:210:6ae9:ce2:24c9:b87b])
 by smtp.gmail.com with ESMTPSA id
 fd9-20020a05622a4d0900b003d65e257f10sm6632958qtb.79.2023.05.02.04.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 04:51:02 -0700 (PDT)
Message-ID: <5f3ddda1-2c7d-811c-ffd5-5fc237def2eb@redhat.com>
Date: Tue, 2 May 2023 07:51:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 "axboe @ kernel . dk" <axboe@kernel.dk>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
 <20230502101934.24901-10-johannes.thumshirn@wdc.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <20230502101934.24901-10-johannes.thumshirn@wdc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v5 09/20] gfs2: use __bio_add_page for
 adding single page to bio
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
Cc: linux-block@vger.kernel.org, damien.lemoal@wdc.com, kch@nvidia.com,
 shaggy@kernel.org, song@kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, snitzer@kernel.org,
 jfs-discussion@lists.sourceforge.net, willy@infradead.org, ming.lei@redhat.com,
 cluster-devel@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 hare@suse.de, linux-fsdevel@vger.kernel.org, linux-raid@vger.kernel.org,
 hch@lst.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/23 6:19 AM, Johannes Thumshirn wrote:
> The GFS2 superblock reading code uses bio_add_page() to add a page to a
> newly created bio. bio_add_page() can fail, but the return value is never
> checked.
> 
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
> 
> This brings us a step closer to marking bio_add_page() as __must_check.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>   fs/gfs2/ops_fstype.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 9af9ddb61ca0..cd962985b058 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -254,7 +254,7 @@ static int gfs2_read_super(struct gfs2_sbd *sdp, sector_t sector, int silent)
>   
>   	bio = bio_alloc(sb->s_bdev, 1, REQ_OP_READ | REQ_META, GFP_NOFS);
>   	bio->bi_iter.bi_sector = sector * (sb->s_blocksize >> 9);
> -	bio_add_page(bio, page, PAGE_SIZE, 0);
> +	__bio_add_page(bio, page, PAGE_SIZE, 0);
>   
>   	bio->bi_end_io = end_bio_io_page;
>   	bio->bi_private = page;
Hi Johannes,

So...I see 6 different calls to bio_add_page() in gfs2.
Why change this particular bio_add_page() to __bio_add_page() and not 
the other five?

Regards,

Bob Peterson

