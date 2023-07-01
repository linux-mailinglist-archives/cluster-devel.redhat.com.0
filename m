Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21D744979
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Jul 2023 15:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688219662;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yJCrpO8UUHO/qSvUjiz1LapAtYFUYCYICHSFkp0cvvU=;
	b=QbG/lxuIp9bDvBTNIV5NZC3RemwnMTHWvLL9bJNJ8Aej/iG1RisNlgaPAn2wUqLNoEW55p
	fHHRB4nm8YBppwbRakUG3o7z+jdO0vq43RlkqlLRYKZmiuxn4oLjCFQ2qEqyf65so3BZlc
	TEqKYQ31m2lhseEoVTxKoz2SrMWzV0I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-nniQmCxmNn-ALIVrlr6LdQ-1; Sat, 01 Jul 2023 09:54:17 -0400
X-MC-Unique: nniQmCxmNn-ALIVrlr6LdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FE6B3811F21;
	Sat,  1 Jul 2023 13:54:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EE76F5CFF;
	Sat,  1 Jul 2023 13:54:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 00EC51946A48;
	Sat,  1 Jul 2023 13:54:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2C3F1946595 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  1 Jul 2023 13:54:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5A3E048FB01; Sat,  1 Jul 2023 13:54:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51C85492B02
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 13:54:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC6FB2823802
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 13:54:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-7muuIHElMF6Alt8K2r4GeA-1; Sat, 01 Jul 2023 09:54:10 -0400
X-MC-Unique: 7muuIHElMF6Alt8K2r4GeA-1
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3fbc0981756so26399995e9.0; 
 Sat, 01 Jul 2023 06:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688219648; x=1690811648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OMMsvHxXHZc/OFAWSLiE/7BBNcrGZ7HGVVSJpHQ4oU=;
 b=GCPrfl3uph/9wCZdXM/BguFmWfbCTbmD3BjkpCCBB1jGrwcuw+cp5tfhRsWuSxn6Xe
 7WskiJM4Q7P6+GkNVQWFnKZEzJV1GK05EFBbks4cXOCz2pkncqlsKFtNkJlfnwRnBFG/
 LYPsPTy12qX1NLHVjO+/Dol2SQzdF2jeGb6v4SjXAQ4/HaPYimD/5loKeq7FSu0KpmuQ
 IW8D7WmlLBVqZg4CBaGbIvArJUc8+4LYZhWurh8MT/TWX9lYrvXdH/0drbOQ/fymXQlH
 PZMAMxxan8YoW3Lyswx28zqESV/wE/1y6G+TZ69Hutz8x2IzuIC0IEoA15rIVgc0AUEc
 jdLw==
X-Gm-Message-State: ABy/qLbs8FSxNVteWzTZIDayF0DPJzMrovkAw3iFI2cMOnW21TA5MA/h
 SBKvysg15mmTtUoWq3MeRqWHWcgDhrM=
X-Google-Smtp-Source: APBJJlEvmncnJLiIiHUhRiWxw7Jv6npdvAFV6FmDI7Gddi0kszH6KRyxdntb5Xw3trZaH6qkKJGZrQ==
X-Received: by 2002:adf:ed8a:0:b0:313:f0d7:a46 with SMTP id
 c10-20020adfed8a000000b00313f0d70a46mr4054894wro.3.1688219648426; 
 Sat, 01 Jul 2023 06:54:08 -0700 (PDT)
Received: from suse.localnet (host-82-49-237-33.retail.telecomitalia.it.
 [82.49.237.33]) by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c211400b003fbb618f7adsm7712397wml.15.2023.07.01.06.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 06:54:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Deepak R Varma <drv@mailo.com>
Date: Sat, 01 Jul 2023 15:54:06 +0200
Message-ID: <2235268.iZASKD2KPV@suse>
In-Reply-To: <4bed561513ba76486ea3fc87f97e6c646f98cbe7.1688073459.git.drv@mailo.com>
References: <cover.1688073459.git.drv@mailo.com>
 <4bed561513ba76486ea3fc87f97e6c646f98cbe7.1688073459.git.drv@mailo.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v3 6/6] gfs2: Replace kmap_atomic() by
 kmap_local_page() in gfs2_write_buf_to_page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On gioved=EC 29 giugno 2023 23:52:27 CEST Deepak R Varma wrote:
> kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().

Deepak,

Again please refer to documentation and/or Ira's deprecation patch. The=20
reasons why are in one of my previous messages.

> Therefore, replace kmap_atomic() with kmap_local_page() in
> gfs2_write_buf_to_page().
>=20
> kmap_atomic() disables page-faults and preemption (the latter only for
> !PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
> gfs2_write_buf_to_page() does not depend on the above-mentioned side
> effects.
>=20
> Therefore, a mere replacement of the old API with the new one is all that
> is required (i.e., there is no need to explicitly add any calls to
> pagefault_disable() and/or preempt_disable()).
>
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Changes in v3:
>    - Patch included in patch set
>=20
> Changes in v2:
>    - None
>=20
>=20
>  fs/gfs2/quota.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 386ca770ce2e..e5767133aeea 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -764,10 +764,10 @@ static int gfs2_write_buf_to_page(struct gfs2_inode=
=20
*ip,
> unsigned long index, }
>=20
>  =09/* Write to the page, now that we have setup the buffer(s) */
> -=09kaddr =3D kmap_atomic(page);
> +=09kaddr =3D kmap_local_page(page);
>
Well, if this page could come from HIGHMEM, how about memcpy_to_page()?=20
Otherwise, (if it cannot come from HIGHMEM) we don't need to kmap*() it.=20

Can you please take a look at the allocation's flags?

Thanks,

Fabio
>
>  =09memcpy(kaddr + off, buf, bytes);
>  =09flush_dcache_page(page);
> -=09kunmap_atomic(kaddr);
> +=09kunmap_local(kaddr);
>  =09unlock_page(page);
>  =09put_page(page);
>=20
> --
> 2.34.1




