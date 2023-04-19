Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE376E7E14
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Apr 2023 17:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681917601;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Tk4ILYUitykXDNv2nAhy0f5ydU+4a31pQqGhvmwhdPk=;
	b=D39NyNHwG246/7vsIQAoPLes72V1ummbFJrZR9ho7a3nHU4DvjUCebnDOUcc1QL8iO9oxc
	e3xJPHFmX9bgxfrxTSLocCkewfReBE1L6Pm91eKBoLM5lblabqldkU7hj63VNk16p7lbTW
	FS3DvO00x3bret3Ho3stbxG7PKOlYF8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-1G3H3zE7MRuZNMXbbAjNKg-1; Wed, 19 Apr 2023 11:19:57 -0400
X-MC-Unique: 1G3H3zE7MRuZNMXbbAjNKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B0EC88B7A6;
	Wed, 19 Apr 2023 15:19:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABD081121314;
	Wed, 19 Apr 2023 15:19:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 671E319465B3;
	Wed, 19 Apr 2023 15:19:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEC8519465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 19 Apr 2023 15:19:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BCD77637A2; Wed, 19 Apr 2023 15:19:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B55DF2958
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 15:19:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96CCA1C189A8
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 15:19:47 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-uahI8ew-PKuTKwwzohWwAw-1; Wed, 19 Apr 2023 11:19:46 -0400
X-MC-Unique: uahI8ew-PKuTKwwzohWwAw-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-24732cc0c8fso2439292a91.3
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 08:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681917584; x=1684509584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tk4ILYUitykXDNv2nAhy0f5ydU+4a31pQqGhvmwhdPk=;
 b=ZEleHIc02mShHWSmCw4+1molivDEMBA9dkfBsPsCB2TuC8QGcGi8/0vceR4j3VtK0c
 7lCXvd4xpxjvP34QSFS3pWxJg4QypknN6y4JF2VxpaloG7i/fvYHpC52a8rufNqUdvOx
 YJwPxxudjIK8Uur1utJYb0jUjcddx+IEb7kw6RZ4fL8x55uB9KQqimGL32nm1BAmOkrY
 Fo6pO4NGcvvjkeyUSgaxWaxPxijmlYjgRuDt7oQ+I/sL4b2egQeh+ukIJdOOHn59P70Z
 oJI0QZCt9wr8UeWARChPy/wKm1D30ZZwaBP/QOczvW12nmKw/Q223GZKK37avjS6JQGP
 JmPQ==
X-Gm-Message-State: AAQBX9fxX7QtaLr0AYkOteQ6FmvP3G7viE8f+gG1h18VUEEZZRMh7bFJ
 sU01bYV6rdt2Os+5qD1l2rs7e3DAhUNcxxY1WQmfnXQStGJR5r5behO6eXJs6faVtZJZ0UE5sBI
 ZR9wPQ6pThhyCK7eKEQ63tzuqhy2Gl54HPuMYH00UY+KWP8iC
X-Received: by 2002:a17:90a:2ca4:b0:247:fec:3cf with SMTP id
 n33-20020a17090a2ca400b002470fec03cfmr1032466pjd.9.1681917584664; 
 Wed, 19 Apr 2023 08:19:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZilzTP35l+fCVfSRmyAr7TA2z2HByJ2c77EoLXxjUVlBIE5WaJ/vbFqG27YJf1gGuB7p5La9B7yskBhiQ6yjg=
X-Received: by 2002:a17:90a:2ca4:b0:247:fec:3cf with SMTP id
 n33-20020a17090a2ca400b002470fec03cfmr1032449pjd.9.1681917584368; Wed, 19 Apr
 2023 08:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230419140929.5924-1-jth@kernel.org>
 <20230419140929.5924-12-jth@kernel.org>
In-Reply-To: <20230419140929.5924-12-jth@kernel.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 19 Apr 2023 17:19:31 +0200
Message-ID: <CAHc6FU6U1yZguZGeCc7BUqd1Qm4+SSRK8xbNZWBUSXTk_jjvVQ@mail.gmail.com>
To: Johannes Thumshirn <jth@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v3 11/19] gfs: use __bio_add_page for
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, linux-mm@kvack.org,
 dm-devel@redhat.com, hch@lst.de,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, willy@infradead.org,
 cluster-devel@redhat.com, kch@nvidia.com, snitzer@kernel.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, hare@suse.de,
 dsterba@suse.com, axboe@kernel.dk, linux-raid@vger.kernel.org,
 damien.lemoal@wdc.com, song@kernel.org, johannes.thumshirn@wdc.com,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 4:10=E2=80=AFPM Johannes Thumshirn <jth@kernel.org>=
 wrote:
>
> From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>
> The GFS superblock reading code uses bio_add_page() to add a page to a
> newly created bio. bio_add_page() can fail, but the return value is never
> checked.

It's GFS2, not GFS, but otherwise this is obviously fine, thanks.

> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
>
> This brings us a step closer to marking bio_add_page() as __must_check.
>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

> ---
>  fs/gfs2/ops_fstype.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 6de901c3b89b..e0cd0d43b12f 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -254,7 +254,7 @@ static int gfs2_read_super(struct gfs2_sbd *sdp, sect=
or_t sector, int silent)
>
>         bio =3D bio_alloc(sb->s_bdev, 1, REQ_OP_READ | REQ_META, GFP_NOFS=
);
>         bio->bi_iter.bi_sector =3D sector * (sb->s_blocksize >> 9);
> -       bio_add_page(bio, page, PAGE_SIZE, 0);
> +       __bio_add_page(bio, page, PAGE_SIZE, 0);
>
>         bio->bi_end_io =3D end_bio_io_page;
>         bio->bi_private =3D page;
> --
> 2.39.2
>

