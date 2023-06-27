Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBC73FB4A
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jun 2023 13:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687866137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FIL+GiVWztuAUbzlrUg+/VQ2fH40OyYMWyiOiH+1bN0=;
	b=AcZH0VhAuqwj1p02pRyzgAUWsfibPoWJChXcCEbkhxR8j1oakHfz05Zwgk3en3t8ZB72qd
	eLmUtbQP+GkZm5LmzJm1W2sA+4lwRIU2gDfAntpdpSTuRYTS5Hlyg+mKXp92jVEqckWhAw
	0IJrX7EaACcUdfMrtOXY2mP2JxiPQz4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-39Pk4JWCPDex0mZp01jVDw-1; Tue, 27 Jun 2023 07:42:11 -0400
X-MC-Unique: 39Pk4JWCPDex0mZp01jVDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAF2980123E;
	Tue, 27 Jun 2023 11:42:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58B8C48FB01;
	Tue, 27 Jun 2023 11:42:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3972B1946589;
	Tue, 27 Jun 2023 11:42:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 85A561946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 27 Jun 2023 11:42:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6DA6F48FB01; Tue, 27 Jun 2023 11:42:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65BCA400E88
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 11:42:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46E8290ED20
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 11:42:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-7hbgkRekPC6Wyf5fOzWzrA-1; Tue, 27 Jun 2023 07:42:04 -0400
X-MC-Unique: 7hbgkRekPC6Wyf5fOzWzrA-1
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4fb7769f15aso2843979e87.0; 
 Tue, 27 Jun 2023 04:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687866122; x=1690458122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6VSnLiTkQ1dzquJmbrvFVUB5iYnq0MwIQjudEDRHCVs=;
 b=cIXOz3IkXO1Q4zVgsFBDbrYxxTwtUvCPzSvmsUlFR/DTJTCH12b8Xa3aLanrsI/KQ9
 c8YCA5dfGHIFyYOiL7aKntsup60KXTrWsSglhwT4xahAe7WvA1uA5pGNb7J9uKk7ySwI
 pQ4jrZ5TJGaG6GuVQX2KrM61Wjrhijzci049lCKYOmnqCMXFwP/VPAz9KStSJihqvDWg
 MV2yrpxNd8xftpphAzm2GfPCCsJllkkUVgDVShs8Lm8zFMepnclTLcNPBIOvoZutwlVo
 XhIDleIExrO9qDo+llGZAEzgLjlMJeN3ehKmYH2ygGuyc21/Re+e2h1hluSbPz+cgJZx
 tmAA==
X-Gm-Message-State: AC+VfDyqdTXhyJlm/UDYZ8hGgbMvoELMrRBJEpxFBd4do66F/L0M0g40
 5R02Sbx3rYFWWy4mvVXF5gAY6yUOLzk=
X-Google-Smtp-Source: ACHHUZ7Xx3+/qq+mhRlzocpzunZ2Y2YOr1cogfwyoCPxXHsIFYZkW00vQnl44DxBd2W+PuxK0+CXyw==
X-Received: by 2002:a05:6512:3b8e:b0:4fb:744e:17db with SMTP id
 g14-20020a0565123b8e00b004fb744e17dbmr4917328lfv.1.1687866122079; 
 Tue, 27 Jun 2023 04:42:02 -0700 (PDT)
Received: from suse.localnet (host-79-12-109-185.retail.telecomitalia.it.
 [79.12.109.185]) by smtp.gmail.com with ESMTPSA id
 f4-20020a1c6a04000000b003fba2734f1esm1815198wmc.1.2023.06.27.04.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 04:42:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Deepak R Varma <drv@mailo.com>
Date: Tue, 27 Jun 2023 13:41:59 +0200
Message-ID: <14943541.tv2OnDr8pf@suse>
In-Reply-To: <ZJk1XTtgLFxIcxzp@bu2204.myguest.virtualbox.org>
References: <ZJk1XTtgLFxIcxzp@bu2204.myguest.virtualbox.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Deepak R Varma <drv@mailo.com>, Ira Weiny <ira.weiny@intel.com>,
 Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On luned=EC 26 giugno 2023 08:51:09 CEST Deepak R Varma wrote:
> kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().
>=20
> Therefore, replace kmap_atomic() with kmap_local_page() in
> gfs2_internal_read() and stuffed_readpage().
>=20
> kmap_atomic() disables page-faults and preemption (the latter only for
> !PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
> gfs2_internal_read() and stuffed_readpage() does not depend on the
> above-mentioned side effects.
>=20
> Therefore, a mere replacement of the old API with the new one is all that
> is required (i.e., there is no need to explicitly add any calls to
> pagefault_disable() and/or preempt_disable()).
>=20
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Note: The Patch is build tested only. I will be happy to run recommended
> testing with some guidance if required.
>=20
> Changes in v2:
>    - Update patch description to correct the replacement function name fr=
om
>      kmap_local_folio to kmap_local _page

Ah, well done. I didn't note this with the comment on v1.
=20
>  fs/gfs2/aops.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 3b41542d6697..7bd92054d353 100644
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
> @@ -498,12 +498,12 @@ int gfs2_internal_read(struct gfs2_inode *ip, char=
=20
*buf,
> loff_t *pos, continue;
>  =09=09=09return PTR_ERR(page);
>  =09=09}
> -=09=09p =3D kmap_atomic(page);
> +=09=09p =3D kmap_local_page(page);
>  =09=09amt =3D size - copied;
>  =09=09if (offset + size > PAGE_SIZE)
>  =09=09=09amt =3D PAGE_SIZE - offset;
>  =09=09memcpy(buf + copied, p + offset, amt);

As said in the comment on v1, the memcpy_from_page() helper is better suite=
d=20
here, unless you noted something that prevents its use and that I'm not abl=
e=20
to see at the moment.

Thanks,

Fabio

> -=09=09kunmap_atomic(p);
> +=09=09kunmap_local(p);
>  =09=09put_page(page);
>  =09=09copied +=3D amt;
>  =09=09index++;
> --
> 2.34.1




