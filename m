Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE772C905
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 16:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686581790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EWfdXpIdfDJZpYzboPX3kYEQzzE7pUlyt9jBVFc64BI=;
	b=fAfOTovwqC//wdaDjgn+TO8FIKoQ1JYjyiJUVSHKeyMMRrFPu2gHFsSk+gbvynS6aA7NjK
	A0z7mSQ+jZ7jNAjMwvHyp72riq0pi8tNk38fUilxddYQsbAl9AuecObVzqAJaZ309UZcee
	yu1r6vSxGIiINOhCYyqTj/hBBiuDEu8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-nWTW2NO9MiWdZumZaNN2JA-1; Mon, 12 Jun 2023 10:56:24 -0400
X-MC-Unique: nWTW2NO9MiWdZumZaNN2JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 486B828135A1;
	Mon, 12 Jun 2023 14:56:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 246F91C559;
	Mon, 12 Jun 2023 14:56:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AEA9A19465B9;
	Mon, 12 Jun 2023 14:56:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C8306194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 14:56:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7560F492CAC; Mon, 12 Jun 2023 14:56:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E297492CA6
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 14:56:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 497651C03366
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 14:56:18 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-eWy90FJcPdCT5Al9q-vG0g-1; Mon, 12 Jun 2023 10:56:11 -0400
X-MC-Unique: eWy90FJcPdCT5Al9q-vG0g-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1b3a82ef241so19125225ad.2
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 07:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686581770; x=1689173770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWfdXpIdfDJZpYzboPX3kYEQzzE7pUlyt9jBVFc64BI=;
 b=ZTyoOLE74PA+VNHxrJzYpjqL5P4ahAPa0lBXYD/117MSvmcM+GZlNhCz5RT91RaPV2
 GRBgqbiqw7WGBwGD/lAjh8XpVNtXV72tBbYiAmZUwJpNTIvZn8wW2uvpdlr9yCmUvhxr
 PoTiwXMaDcFTZAo+XMKHC+BKfQmRh9xTn8JQquEnGjyRTBH4Rau0/9CNRCFsW0lHS08M
 DaRRi8LotWJ78xHBWZkrgVmotAwFoHrvrD29T9bV7IdiMKY4nay01CtBs6+doLspoyVe
 7ZZxwVqkHtI3lruiQHz3/XAleUGj/Ps8qo6kzxbwgMDxbk8b1DZqz33lYxl7iGKHgR6h
 mfQQ==
X-Gm-Message-State: AC+VfDw//TotSdOZP5z5bi9hdM9+TbE+uifc6N+8XzN2S5qE7XSPYKrx
 /oCUnkhvz3adP1EEZAqzoYyTp1cozA5po6ghCPOpWq3TsCdpH53vhinJwLJPB7q3S/qrDnpjVPm
 DuFERWVS8JH34Z2MugAwok8k+dwpaboYoR97h6Q==
X-Received: by 2002:a17:902:d501:b0:1b0:663e:4b10 with SMTP id
 b1-20020a170902d50100b001b0663e4b10mr8124988plg.64.1686581769946; 
 Mon, 12 Jun 2023 07:56:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5F4JnPH+bodUDIgaDgDCosCL/hsVt8/mY9GxNS+4WLDt43tcD/6XGfI8T6kDtfd3xxHzS41A0CCNg9qiVE02Q=
X-Received: by 2002:a17:902:d501:b0:1b0:663e:4b10 with SMTP id
 b1-20020a170902d50100b001b0663e4b10mr8124973plg.64.1686581769669; Mon, 12 Jun
 2023 07:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230612053646.585721-1-hch@lst.de>
In-Reply-To: <20230612053646.585721-1-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 12 Jun 2023 16:55:58 +0200
Message-ID: <CAHc6FU4p6OQGi-fU-9QYUXUHUfcnRnH7U3F9ZqMuSQguZiqj+Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH] gfs2: set FMODE_CAN_ODIRECT instead of
 a dummy direct_IO method
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 7:54=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> Since commit a2ad63daa88b ("VFS: add FMODE_CAN_ODIRECT file flag") file
> systems can just set the FMODE_CAN_ODIRECT flag at open time instead of
> wiring up a dummy direct_IO method to indicate support for direct I/O.
>
> Remove .direct_IO from gfs2_aops, and set FMODE_CAN_ODIRECT in
> gfs2_open_common for regular files that do not use data journalling.

Thanks, added to for-next.

Andreas

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/gfs2/aops.c | 1 -
>  fs/gfs2/file.c | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index a5f4be6b9213ed..d95125714ebb38 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -750,7 +750,6 @@ static const struct address_space_operations gfs2_aop=
s =3D {
>         .release_folio =3D iomap_release_folio,
>         .invalidate_folio =3D iomap_invalidate_folio,
>         .bmap =3D gfs2_bmap,
> -       .direct_IO =3D noop_direct_IO,
>         .migrate_folio =3D filemap_migrate_folio,
>         .is_partially_uptodate =3D iomap_is_partially_uptodate,
>         .error_remove_page =3D generic_error_remove_page,
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 300844f50dcd28..dcb2b7dd2269cf 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -630,6 +630,9 @@ int gfs2_open_common(struct inode *inode, struct file=
 *file)
>                 ret =3D generic_file_open(inode, file);
>                 if (ret)
>                         return ret;
> +
> +               if (!gfs2_is_jdata(GFS2_I(inode)))
> +                       file->f_mode |=3D FMODE_CAN_ODIRECT;
>         }
>
>         fp =3D kzalloc(sizeof(struct gfs2_file), GFP_NOFS);
> --
> 2.39.2
>

