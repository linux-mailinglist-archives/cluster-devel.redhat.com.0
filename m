Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E44073FD13
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jun 2023 15:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687873553;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ke8XtFgDnQ3FKSI0uaIkAHLijeswZt+d/C720oEmj8g=;
	b=ECtGu+KsEtsMKuKb2PJG19Km4uxwOx99X5YLAqqQtt9BwjA81aL0zqOvP0xei6cB22C0nY
	7yS58SVMf5rtqhweD2lyMtolaMIQqC9z1UtJENCD0yegV/OOEY7D7V6P1z2Sojnxe1nr0Y
	7L36fmP9cKUv/sO2/HktFpN+sR2/CwA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-auQRettaNWOmutU8gw9GLw-1; Tue, 27 Jun 2023 09:45:46 -0400
X-MC-Unique: auQRettaNWOmutU8gw9GLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E42D3811811;
	Tue, 27 Jun 2023 13:45:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B17F14682FA;
	Tue, 27 Jun 2023 13:45:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 070051946589;
	Tue, 27 Jun 2023 13:45:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 51D991946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 27 Jun 2023 13:45:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1DABA111F3B6; Tue, 27 Jun 2023 13:45:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16D89111F3B0
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 13:45:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB1BD85A58A
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 13:45:35 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-5kIlJ-NxP9OGUYX6Vgf2aw-1; Tue, 27 Jun 2023 09:45:34 -0400
X-MC-Unique: 5kIlJ-NxP9OGUYX6Vgf2aw-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1b8303cd306so300505ad.2
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 06:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687873533; x=1690465533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ke8XtFgDnQ3FKSI0uaIkAHLijeswZt+d/C720oEmj8g=;
 b=BAc93Slw0MT5AvwKQXVHDjjqyfedAsujGc8pAewTu4b3FckMHpO27Hj9Cj3fj19jMy
 hBKN77I6W8lHaoK/BJCHoADZaccQLsvviPPKZXx/odB6IRs0FkF3nr5SntrCGOEhPc4Q
 VNwVKZ/OVPA88uaHjdAAPWxRer5KbLPJkSvp3SBDvxl0YcPD99X1LcsmDD0aNERk8cQZ
 EScOiYES4bhPs3nx1vdbYUi75zPpuuQXihKERxoJnRXvhyJ0iG+RltjLplUOza24c67l
 OBLXdTp4Wcu292/CbHr9zhaWZNNTewYBcEY8OB2P6BtcnBSGi5vifxnDIkXfaWenf1LO
 W0TQ==
X-Gm-Message-State: AC+VfDyq2UR8PUh94FbgQ1d25hh5PXbq3JajmYAuegnEgqgNpnzU8ruD
 hcSUA4ROg3/CoZJI8ZVaGjwvlPp6h660HlWFYh2liaxQSA0eMP+RapEGYDELHCbi1zXCkoG5n4R
 8dTYHhgsdGJpd3Z63YZk7WUpA7Xa4KJc9G4c2+w==
X-Received: by 2002:a17:902:b193:b0:1b5:1654:96d4 with SMTP id
 s19-20020a170902b19300b001b5165496d4mr7092074plr.4.1687873533136; 
 Tue, 27 Jun 2023 06:45:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6IthMHxZNbH8GTaGgIOza/GtvEVEKrKV37oXPkunKMrBHpu386zDko3S+M9ZBeuKxpniGopjQCoXrgnCg6hFs=
X-Received: by 2002:a17:902:b193:b0:1b5:1654:96d4 with SMTP id
 s19-20020a170902b19300b001b5165496d4mr7092055plr.4.1687873532820; Tue, 27 Jun
 2023 06:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <ZJk1XTtgLFxIcxzp@bu2204.myguest.virtualbox.org>
In-Reply-To: <ZJk1XTtgLFxIcxzp@bu2204.myguest.virtualbox.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 27 Jun 2023 15:45:20 +0200
Message-ID: <CAHc6FU6P-BK=rU2w6JcswJsf93TwgvtUNNBe8LU4n2djuNjn_Q@mail.gmail.com>
To: Deepak R Varma <drv@mailo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v2] gfs2: Replace deprecated
 kmap_atomic() by kmap_local_page()
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
Cc: Sumitra Sharma <sumitraartsy@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 8:51=E2=80=AFAM Deepak R Varma <drv@mailo.com> wrot=
e:
> kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().

I'll apply this, convert the remaining instances of kmap_atomic(), and
switch to memcpy_{from,to}_page() where appropriate.

Thanks,
Andreas

> Therefore, replace kmap_atomic() with kmap_local_page() in
> gfs2_internal_read() and stuffed_readpage().
>
> kmap_atomic() disables page-faults and preemption (the latter only for
> !PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
> gfs2_internal_read() and stuffed_readpage() does not depend on the
> above-mentioned side effects.
>
> Therefore, a mere replacement of the old API with the new one is all that
> is required (i.e., there is no need to explicitly add any calls to
> pagefault_disable() and/or preempt_disable()).
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Note: The Patch is build tested only. I will be happy to run recommended =
testing
> with some guidance if required.
>
> Changes in v2:
>    - Update patch description to correct the replacement function name fr=
om
>      kmap_local_folio to kmap_local _page
>
>
>  fs/gfs2/aops.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 3b41542d6697..7bd92054d353 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -432,10 +432,10 @@ static int stuffed_readpage(struct gfs2_inode *ip, =
struct page *page)
>         if (error)
>                 return error;
>
> -       kaddr =3D kmap_atomic(page);
> +       kaddr =3D kmap_local_page(page);
>         memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
>         memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
> -       kunmap_atomic(kaddr);
> +       kunmap_local(kaddr);
>         flush_dcache_page(page);
>         brelse(dibh);
>         SetPageUptodate(page);
> @@ -498,12 +498,12 @@ int gfs2_internal_read(struct gfs2_inode *ip, char =
*buf, loff_t *pos,
>                                 continue;
>                         return PTR_ERR(page);
>                 }
> -               p =3D kmap_atomic(page);
> +               p =3D kmap_local_page(page);
>                 amt =3D size - copied;
>                 if (offset + size > PAGE_SIZE)
>                         amt =3D PAGE_SIZE - offset;
>                 memcpy(buf + copied, p + offset, amt);
> -               kunmap_atomic(p);
> +               kunmap_local(p);
>                 put_page(page);
>                 copied +=3D amt;
>                 index++;
> --
> 2.34.1
>
>
>

