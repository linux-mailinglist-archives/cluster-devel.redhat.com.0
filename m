Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562F7448B6
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Jul 2023 13:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688210252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WmZPNj6+Ml6M5Q3RtDMGW/f9wABJ7h8DgcPjT/Bx/K0=;
	b=TkmiYD73yMEM3YvSBeLSR4DchpR7Ol2GMU0YFTI+SGZpkGhQ2B3MRyUYcOngGyY6ox0k0a
	+U90uuW4qNcznqGbi3IcYH4Wda3SbwSvsVE2LPnm/1a3CtIiWO2K0j8rDoNdrtSGwtK+SZ
	v3i1KjWBAEIsm1/u1VdfxGFWD8YjuQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-d26o4Q1gNfm_6q9c0mIlhQ-1; Sat, 01 Jul 2023 07:17:29 -0400
X-MC-Unique: d26o4Q1gNfm_6q9c0mIlhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F291A85A58A;
	Sat,  1 Jul 2023 11:17:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC23640C2063;
	Sat,  1 Jul 2023 11:17:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 341311946A4A;
	Sat,  1 Jul 2023 11:17:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F9501946595 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  1 Jul 2023 11:17:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B72E1121315; Sat,  1 Jul 2023 11:17:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 248781121314
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 11:17:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08C991C05AEA
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 11:17:26 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-N2qYY80xNnW1lp9V4SFtDA-1; Sat, 01 Jul 2023 07:17:24 -0400
X-MC-Unique: N2qYY80xNnW1lp9V4SFtDA-1
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3128fcd58f3so3208268f8f.1; 
 Sat, 01 Jul 2023 04:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688210242; x=1690802242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=df+h6oGnsbGeKd+U7g7lpcO2qynlZCdJkGfl7jYf+pA=;
 b=jE4zLjnKFM72SZ6oogEMyxdMxWxX/i+BU9Hnf1jyHy7C5dkxPUdxGkm+dR+RhF7g6r
 i5NFyD32Q/IbSUytxakVKqVfhRgrpYKe/guRCnJ/DahUwf192QOC0VnxfKClWm7jVEEd
 oisc3o0wMDasdXomb6Q8CCdJQHRQLkSOJm4ft0nbFCbhUb0HKD+kk8SjasOltTzvH16b
 9YPstxvybCT9qPaOlKDt1HvvAuIA0f5Gy/pDH8kI/GYwB0CDZ4z4mNiFMLzG6UwJhlnj
 6nEXVn9TEIfvyT2VJcmYLnTyj9LVGVd0BACxiUb/uBpWgQx3I7jJG/UEbvH7WxUI1ig0
 jgEQ==
X-Gm-Message-State: ABy/qLZSnB2nERieyQXtydBToKtT7dHGtdxj6k43I/RLvGZ3vc8WEMRl
 WngSVWbkocSMCGBajvIDsdW+vxBO04k=
X-Google-Smtp-Source: APBJJlENonAV0IBOUJNzIIwrFDKQBGpMZFiTS/gC79q2LiBxvDpM5KIZkUJmGNUdGxyj4vgFSogUhQ==
X-Received: by 2002:a5d:45d1:0:b0:313:fe1b:f447 with SMTP id
 b17-20020a5d45d1000000b00313fe1bf447mr3878752wrs.71.1688210242177; 
 Sat, 01 Jul 2023 04:17:22 -0700 (PDT)
Received: from suse.localnet (host-212-171-6-230.retail.telecomitalia.it.
 [212.171.6.230]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0030fb828511csm20584023wrz.100.2023.07.01.04.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 04:17:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Deepak R Varma <drv@mailo.com>
Date: Sat, 01 Jul 2023 13:17:20 +0200
Message-ID: <6543613.G0QQBjFxQf@suse>
In-Reply-To: <4d132d7aa9cc71f88e6e02c8f6fcb0fec56542aa.1688073459.git.drv@mailo.com>
References: <cover.1688073459.git.drv@mailo.com>
 <4d132d7aa9cc71f88e6e02c8f6fcb0fec56542aa.1688073459.git.drv@mailo.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v3 2/6] gfs2: Replace
 kmap_atomic()+memcpy by memcpy_from_page()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On gioved=EC 29 giugno 2023 23:50:07 CEST Deepak R Varma wrote:
> kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().
>=20
> kmap_atomic() disables page-faults and preemption (the latter only for
> !PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
> gfs2_internal_read() does not depend on the above-mentioned side effects.
>=20
> Further, memcpy_{from,to}_page() wrappers combine the
> {kmap, unmap}_local_page() blocks when they are intended exclusively to
> copy contents from/to the temporary mapped page. So, replace the
> kmap_atomic()/kunmap_automic()

s/kunmap_automic/kunmap_atomic/

> block by the memcpy_from_page() API call.
> This change allows to tidy-up code and also eliminate unused variable p.
>=20
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

I don't like to read the list of the functions replaced by the=20
memcpy_from_page() helper in the subject of the patch. These details are=20
better suited in commit messages.

Furthermore, you have not been consistent: "kmap_atomic()+memcpy" contains=
=20
parentheses only in one of the two functions. Both or none.

The thing that really matters here is that You are replacing the deprecated=
=20
kmap_atomic() with kmap_local_page(). This is what the subject should show.

Please cite the use of the suited helper _only_ within the commit message a=
nd=20
explain why it is preferred to open code kmap_local_page() + memcpy() +=20
kunmap_local().=20

> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Changes in v3:
>    - Split as a separate patch for conversion in gfs2_internal_read()


>    - Use memcpy_from_page() as suggested by Fabio and  Andreas G
>    - Included split version in patch set
>=20
> Changes in v2:
>    - Update patch description to correct the replacement function name
>      from kmap_local_folio to kmap_local _page
>=20
>=20
>=20
>  fs/gfs2/aops.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 3eac4f2f5c27..f47fed657763 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -489,7 +489,6 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *b=
uf,
> loff_t *pos, unsigned copied =3D 0;
>  =09unsigned amt;
>  =09struct page *page;
> -=09void *p;
>=20
>  =09do {
>  =09=09page =3D read_cache_page(mapping, index, gfs2_read_folio,=20
NULL);
> @@ -498,12 +497,12 @@ int gfs2_internal_read(struct gfs2_inode *ip, char=
=20
*buf,
> loff_t *pos, continue;
>  =09=09=09return PTR_ERR(page);
>  =09=09}
> -=09=09p =3D kmap_atomic(page);
> -=09=09amt =3D size - copied;
>  =09=09if (offset + size > PAGE_SIZE)
>  =09=09=09amt =3D PAGE_SIZE - offset;
> -=09=09memcpy(buf + copied, p + offset, amt);
> -=09=09kunmap_atomic(p);
> +=09=09else
> +=09=09=09amt =3D size - copied;

This is a different logical change. Please put it in a different patch with=
=20
proper subject and commit message.

Thanks,

Fabio=20

> +
> +=09=09memcpy_from_page(buf, page, offset, amt);
>  =09=09put_page(page);
>  =09=09copied +=3D amt;
>  =09=09index++;
> --
> 2.34.1




