Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E91087448A1
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Jul 2023 13:03:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688209391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AdQb4FrFT+I2J94SYjLHAc+jNqv4yyG6QC92JCt0yJs=;
	b=Di8du0yBcqgzmMgo5hl+4dAJw7Qo0Iypadi6ACIU+mI5H2/AkDf+fbl3uTfU8mixlhEioH
	LsRcFArcXW/WniozhOCyOooJOUpEGDP7GJm2AXWqNzkK2HboY8ruaiVFP3utkxHMd+yIBS
	9CiPe1TMtdneyiRZdbdXvNdui9uPIwo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-x3zHkHGaMGaoNPErxofxKg-1; Sat, 01 Jul 2023 07:03:07 -0400
X-MC-Unique: x3zHkHGaMGaoNPErxofxKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE3D104458A;
	Sat,  1 Jul 2023 11:03:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9BE714682F9;
	Sat,  1 Jul 2023 11:03:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 698201946A52;
	Sat,  1 Jul 2023 11:03:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 96EF51946A41 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  1 Jul 2023 11:03:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 65E3C14682FA; Sat,  1 Jul 2023 11:03:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E43014682F9
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 11:03:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38C1F185A791
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 11:03:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-hjSJ6GwYPw27Pz_rJqfpxQ-1; Sat, 01 Jul 2023 07:03:00 -0400
X-MC-Unique: hjSJ6GwYPw27Pz_rJqfpxQ-1
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso20200255e9.0; 
 Sat, 01 Jul 2023 04:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688209378; x=1690801378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWGxndxFRuvJGKVSHvTPl6o4SCgPzXA9gfeKu76hfZ8=;
 b=fUUzq2Ht/MIrhaakjY5JVGJG3PFQ0inwQqGhEsgHbz5FQWdliLeTJvOPXxSQJte+px
 1lJbf+VCZmMz22M0fcNWERk+HiUQRK112n7uD1bzkG0Ps5SVzLX78tYfWAA2tuOBbwbJ
 Z40bpGeq76IcHW22rCZZKA5aftPXAP5PBCgapJrlg2emdVWmCEiIZHugC7Z7wzlrgV3i
 tvh4wSeeftHK7fL5YDxlcdOjoCkcMGYQ7V9CuGWmJZFri2B0rDGHUzTTaMYvpWuLoo9t
 2b0GnTYufTxHM1mkkD9jvHI0GIjTMn4piNL288+2CUDz6B4CGuU42EoOj1eYJ7bo/s2O
 jzig==
X-Gm-Message-State: AC+VfDyITsewsMauvKgpNHdva6Vg+wVFGWvd2+6+M3oeWblddB1KZejM
 mWFQZblcK0mAgr9eXHUk33iUK1F/Yyc=
X-Google-Smtp-Source: ACHHUZ5eNBvrZwml4SSyLZDaHtQ4XOdgUt5JbWIIrVgzvtCcsFs0V1TjO8yLbYMcOsoKyanFGF/F8w==
X-Received: by 2002:a05:600c:d2:b0:3fa:d167:5348 with SMTP id
 u18-20020a05600c00d200b003fad1675348mr3965315wmm.1.1688209378160; 
 Sat, 01 Jul 2023 04:02:58 -0700 (PDT)
Received: from suse.localnet (host-212-171-6-230.pool212171.interbusiness.it.
 [212.171.6.230]) by smtp.gmail.com with ESMTPSA id
 n19-20020a7bc5d3000000b003fbd04ecdc6sm1279616wmk.5.2023.07.01.04.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 04:02:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Deepak R Varma <drv@mailo.com>
Date: Sat, 01 Jul 2023 13:02:55 +0200
Message-ID: <1804362.TLkxdtWsSY@suse>
In-Reply-To: <1955d9c440240f4c97efd80f3efca550871fe0ef.1688073459.git.drv@mailo.com>
References: <cover.1688073459.git.drv@mailo.com>
 <1955d9c440240f4c97efd80f3efca550871fe0ef.1688073459.git.drv@mailo.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH v3 1/6] gfs2: Replace kmap_atomic() by
 kmap_local_page() in stuffed_readpage
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
Cc: Deepak R Varma <drv@mailo.com>, Ira Weiny <ira.weiny@intel.com>,
 Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On gioved=EC 29 giugno 2023 23:49:29 CEST Deepak R Varma wrote:
> kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().
>=20
> Therefore, replace kmap_atomic() with kmap_local_page() in
> stuffed_readpage().
>=20
> kmap_atomic() disables page-faults and preemption (the latter only for
> !PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
> stuffed_readpage() does not depend on the above-mentioned side effects.
>=20
> Therefore, a mere replacement of the old API with the new one is all that
> is required (i.e., there is no need to explicitly add any calls to
> pagefault_disable() and/or preempt_disable()).
>=20
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

It LGTM, therefore, it is...

Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Changes in v3:
>    - split into 2 patches

NIT: I can't understand why you think the previous single patch needed to b=
e=20
split. Despite I can't understand why, I have nothing against it :-)

Thanks,

Fabio

P.S.: Next time please take note somewhere (maybe after the three dashes?)=
=20
that you are re-using my commit message word by word. I'd appreciate it :-)=
=20
However, it doesn't really matter much so please _don't_ send a newer patch=
=20
only for this little request.

>    - included in the patch set. Was sent as standalone patch previously
>=20
> Changes in v2:
>    - Update patch description to correct the replacement function name fr=
om
>      kmap_local_page to kmap_local_folio
>=20
>=20
>  fs/gfs2/aops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 3b41542d6697..3eac4f2f5c27 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -432,10 +432,10 @@ static int stuffed_readpage(struct gfs2_inode *ip,
> struct page *page) if (error)
>  =09=09return error;
>=20
> -=09kaddr =3D kmap_atomic(page);
> +=09kaddr =3D kmap_local_page(page);
>  =09memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
>  =09memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
> -=09kunmap_atomic(kaddr);
> +=09kunmap_local(kaddr);
>  =09flush_dcache_page(page);
>  =09brelse(dibh);
>  =09SetPageUptodate(page);
> --
> 2.34.1




