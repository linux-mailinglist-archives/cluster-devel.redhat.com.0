Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2D716F0A
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 22:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685479628;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f0FfbwKrs0SBrp2l9jpO6xZkWlpiXTIvCrrrNrQOtjU=;
	b=GfhOwDZLxlJmyE7Mr3iD365o7pXTQ1/QyqwEkbW8dpV0e0lm1iE0nrIf2YXUR7ImD6Go90
	hfET+PdS5mFoUk5owKtOtm5qFEcyMm4OjUbSWUVMlE6idpPtjjou6uIGV1WUjqgZi42vN8
	BFSrVHMRg49ZntWJZM0eMmBNaW5BKHM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-TMGXxbwIO4SNLK4rb3h1NQ-1; Tue, 30 May 2023 16:47:05 -0400
X-MC-Unique: TMGXxbwIO4SNLK4rb3h1NQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE3C0811E7C;
	Tue, 30 May 2023 20:47:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 823F0492B00;
	Tue, 30 May 2023 20:47:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2536F19465A8;
	Tue, 30 May 2023 20:47:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58A8E19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 20:47:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 43FAF112132D; Tue, 30 May 2023 20:47:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CB01112132C
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 20:47:01 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1656980120A
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 20:47:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-jmc7WPD0NRKYMjZAse595g-1; Tue, 30 May 2023 16:46:57 -0400
X-MC-Unique: jmc7WPD0NRKYMjZAse595g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 248DF62F78;
 Tue, 30 May 2023 20:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EDBC4339C;
 Tue, 30 May 2023 20:41:09 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2af189d323fso2841901fa.1; 
 Tue, 30 May 2023 13:41:09 -0700 (PDT)
X-Gm-Message-State: AC+VfDx3a7J3jJqB/NPRTwWcePPW4DY0HrB3Vk8Fz4oZjg1rXppIt/h4
 SinK+Ft3pL506Fg/h10/3Tlrwe8SN0SIfx+Kqls=
X-Google-Smtp-Source: ACHHUZ7vuf2vQNikh852gIOeYbs1mAspWrnHLpuRQ0WVk/9d/YVdWPAiSzLnXbcDRj80He113UbugMRuu4yM7AjsQxc=
X-Received: by 2002:a2e:a222:0:b0:2af:18a9:782f with SMTP id
 i2-20020a2ea222000000b002af18a9782fmr4570675ljm.0.1685479267531; Tue, 30 May
 2023 13:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685461490.git.johannes.thumshirn@wdc.com>
 <d7cfd04d410accee4148d8c0e51230bcb8b4bb8f.1685461490.git.johannes.thumshirn@wdc.com>
In-Reply-To: <d7cfd04d410accee4148d8c0e51230bcb8b4bb8f.1685461490.git.johannes.thumshirn@wdc.com>
From: Song Liu <song@kernel.org>
Date: Tue, 30 May 2023 13:40:55 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6hZWx3Jx0UOc20mf06c5QS5vfDKF_nauzm0mLkr3Xhsw@mail.gmail.com>
Message-ID: <CAPhsuW6hZWx3Jx0UOc20mf06c5QS5vfDKF_nauzm0mLkr3Xhsw@mail.gmail.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v6 13/20] md: check for failure when
 adding pages in alloc_behind_master_bio
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Dave Kleikamp <shaggy@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, gouhao@uniontech.com,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 8:50=E2=80=AFAM Johannes Thumshirn
<johannes.thumshirn@wdc.com> wrote:
>
> alloc_behind_master_bio() can possibly add multiple pages to a bio, but i=
t
> is not checking for the return value of bio_add_page() if adding really
> succeeded.
>
> Check if the page adding succeeded and if not bail out.
>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/raid1.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> index 68a9e2d9985b..8283ef177f6c 100644
> --- a/drivers/md/raid1.c
> +++ b/drivers/md/raid1.c
> @@ -1147,7 +1147,10 @@ static void alloc_behind_master_bio(struct r1bio *=
r1_bio,
>                 if (unlikely(!page))
>                         goto free_pages;
>
> -               bio_add_page(behind_bio, page, len, 0);
> +               if (!bio_add_page(behind_bio, page, len, 0)) {
> +                       free_page(page);
> +                       goto free_pages;
> +               }
>
>                 size -=3D len;
>                 i++;
> --
> 2.40.1
>

