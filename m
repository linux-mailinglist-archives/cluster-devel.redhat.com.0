Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F036D4039
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Apr 2023 11:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680513773;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cnyyTNSoAZhzH+Cr4XZCGYVN7DGnCBwMV6jLESx5x3U=;
	b=OcLcVgP2PmO5iSatQomZgfKhdb1UanCEwMMlXLICLru6Q4W1cD8MLh/vMEY4T0PhuzF29T
	h2ozrjIlmG8pNBKwvXrPgDr2QucfkJosLtpvudKPY8tOQd32u7X41DgfYYvDK4V0UjN1/i
	ApItTwFOMefaZYRD0iuPhZDXLqs+VYQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-CmCGN-BeNP2eZAyJQHkx9w-1; Mon, 03 Apr 2023 05:22:48 -0400
X-MC-Unique: CmCGN-BeNP2eZAyJQHkx9w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F333787B2BC;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7FD2492C13;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9A6811946A72;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E916219465BC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 31 Mar 2023 18:14:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D2F81C15BB8; Fri, 31 Mar 2023 18:14:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA92FC15BA0
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 18:14:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD04A101A531
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 18:14:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-CgTbE5QbOYqWsXgT241DLg-1; Fri, 31 Mar 2023 14:14:07 -0400
X-MC-Unique: CgTbE5QbOYqWsXgT241DLg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1960D62B26;
 Fri, 31 Mar 2023 18:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8041EC4339C;
 Fri, 31 Mar 2023 18:14:05 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id h25so30016428lfv.6;
 Fri, 31 Mar 2023 11:14:05 -0700 (PDT)
X-Gm-Message-State: AAQBX9cTVgtL5S+kgH/5jF3+0usx+74dPPZ5WWxzkJU50rqoC8X319XH
 N1YLBbQMjpPLkhbqzqqBuoRKc33DUSQG00hwKCg=
X-Google-Smtp-Source: AKy350bGczgf8cOPQ3B8DjpL0OvNqhqJf0gVtuLTkWI0qZ++fzJqZuNXbM/Tji+xZXn5DWwX7QOe8uol0L5QJx5bU4Q=
X-Received: by 2002:ac2:5610:0:b0:4dd:a4e1:4861 with SMTP id
 v16-20020ac25610000000b004dda4e14861mr8251248lfd.3.1680286443592; Fri, 31 Mar
 2023 11:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
 <8b8a3bb2db8c5183ef36c1810f2ac776ac526327.1680172791.git.johannes.thumshirn@wdc.com>
In-Reply-To: <8b8a3bb2db8c5183ef36c1810f2ac776ac526327.1680172791.git.johannes.thumshirn@wdc.com>
From: Song Liu <song@kernel.org>
Date: Fri, 31 Mar 2023 11:13:51 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7a+mpn+VprfA2mC5Fc+M9BFq8i6d-y+-o5G1u5dOsk2Q@mail.gmail.com>
Message-ID: <CAPhsuW7a+mpn+VprfA2mC5Fc+M9BFq8i6d-y+-o5G1u5dOsk2Q@mail.gmail.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 03 Apr 2023 09:22:43 +0000
Subject: Re: [Cluster-devel] [PATCH v2 17/19] md: raid1: check if adding
 pages to resync bio fails
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
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 David Sterba <dsterba@suse.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 3:44=E2=80=AFAM Johannes Thumshirn
<johannes.thumshirn@wdc.com> wrote:
>
> Check if adding pages to resync bio fails and if bail out.
>
> As the comment above suggests this cannot happen, WARN if it actually
> happens.
>
> This way we can mark bio_add_pages as __must_check.
>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  drivers/md/raid1-10.c |  7 ++++++-
>  drivers/md/raid10.c   | 12 ++++++++++--
>  2 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
> index e61f6cad4e08..c21b6c168751 100644
> --- a/drivers/md/raid1-10.c
> +++ b/drivers/md/raid1-10.c
> @@ -105,7 +105,12 @@ static void md_bio_reset_resync_pages(struct bio *bi=
o, struct resync_pages *rp,
>                  * won't fail because the vec table is big
>                  * enough to hold all these pages
>                  */

We know these won't fail. Shall we just use __bio_add_page?

Thanks,
Song

> -               bio_add_page(bio, page, len, 0);
> +               if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
> +                       bio->bi_status =3D BLK_STS_RESOURCE;
> +                       bio_endio(bio);
> +                       return;
> +               }
> +
>                 size -=3D len;
>         } while (idx++ < RESYNC_PAGES && size > 0);
>  }
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index 6c66357f92f5..5682dba52fd3 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -3808,7 +3808,11 @@ static sector_t raid10_sync_request(struct mddev *=
mddev, sector_t sector_nr,
>                          * won't fail because the vec table is big enough
>                          * to hold all these pages
>                          */
> -                       bio_add_page(bio, page, len, 0);
> +                       if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
> +                               bio->bi_status =3D BLK_STS_RESOURCE;
> +                               bio_endio(bio);
> +                               goto giveup;
> +                       }
>                 }
>                 nr_sectors +=3D len>>9;
>                 sector_nr +=3D len>>9;
> @@ -4989,7 +4993,11 @@ static sector_t reshape_request(struct mddev *mdde=
v, sector_t sector_nr,
>                          * won't fail because the vec table is big enough
>                          * to hold all these pages
>                          */
> -                       bio_add_page(bio, page, len, 0);
> +                       if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
> +                               bio->bi_status =3D BLK_STS_RESOURCE;
> +                               bio_endio(bio);
> +                               return sectors_done; /* XXX: is this corr=
ect? */
> +                       }
>                 }
>                 sector_nr +=3D len >> 9;
>                 nr_sectors +=3D len >> 9;
> --
> 2.39.2
>

