Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE774492A
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Jul 2023 15:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688217430;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EtoSLZ6heKK1YCQJSYqo8Tmy/VxvTRfXXDm/9Dj+dYg=;
	b=Iz+NtxtNtlbWN9MJDxFG2nK4mjdX6y3zU6Cu7LdRgqcZ6QB3ls0Xi6gHHf/pkPb/n3zcpA
	JuqSTZHguZ0B8IruGty3eOnibctdYM5sgCLeQiTYYcsb/llZJxNxscWGl7nJPkdiNbCdKh
	nq7GVo6pHK1MYMTT1hOHjqO7l1SHmRI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-KTXD4yXMP1WOZDdXH4FCeA-1; Sat, 01 Jul 2023 09:17:07 -0400
X-MC-Unique: KTXD4yXMP1WOZDdXH4FCeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F1DC3C01C38;
	Sat,  1 Jul 2023 13:17:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2CA14067A01;
	Sat,  1 Jul 2023 13:17:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E7461946A48;
	Sat,  1 Jul 2023 13:17:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C94F71946595 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  1 Jul 2023 13:16:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B83340C2070; Sat,  1 Jul 2023 13:16:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23AFC40C2063
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 13:16:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08C7B1044589
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 13:16:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-XPaWM9c8Mz686B1rtdhpIw-1; Sat, 01 Jul 2023 09:16:52 -0400
X-MC-Unique: XPaWM9c8Mz686B1rtdhpIw-1
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3fa94ea1caaso24947065e9.1; 
 Sat, 01 Jul 2023 06:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688217411; x=1690809411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U6hdMojFpTugy3dUd9JSBh6ZcDdqFBKf/4RDp5ymPwQ=;
 b=fceXueNlTH6YbQRGHv2vry6O3F/Q4f6HEqxKiobi70/S6xByeP0J1rnmJVjc2GiPIp
 FjDPMFWtDYgsixITESTy/J8KS+UH5CSII0Eawl/xXiYUbdjqL2JbUgt16m9xKVV6i8CF
 osM2rLZIJCBY4K7uj13ewVmQhi9r87sdhA6G7tTppSx4GET9NjbrCdOsMtqPnyvvtPZi
 8HbiQE5rcsYPEgIYrSV0NPpNgkLSd3IsQw9Va58AXPGWMvqknkPSP/M+7kW7Gm5ETA+b
 aiACOy014npf8tOj8/0+nUuwIQM/YiqiKsJWX3dbNhmXog0WPZ1DStcE+wvNoM4iJN6o
 GGgQ==
X-Gm-Message-State: AC+VfDx/mpHYmPVtp5T1olJMsUWy025/3cQ4XYrAtx5lt7+j9wcQdbOf
 iYNKx6x1GKXNMfjsvMDmyjRd+tk2kq8=
X-Google-Smtp-Source: ACHHUZ5pNq3JMe5rmis9M7o5vU1rFwHnTXefGhidMDlhyDd3scNNOTaMqhaOZ2dIgT6bM5u3YbXjYQ==
X-Received: by 2002:a05:600c:8606:b0:3fa:125c:8d65 with SMTP id
 ha6-20020a05600c860600b003fa125c8d65mr9897885wmb.3.1688217410430; 
 Sat, 01 Jul 2023 06:16:50 -0700 (PDT)
Received: from suse.localnet (host-212-171-6-230.pool212171.interbusiness.it.
 [212.171.6.230]) by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c224a00b003faef96ee78sm15587581wmm.33.2023.07.01.06.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 06:16:49 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Deepak R Varma <drv@mailo.com>
Date: Sat, 01 Jul 2023 15:16:48 +0200
Message-ID: <5948996.alqRGMn8q6@suse>
In-Reply-To: <4817527acb9e015b3c6929517993ea50ba3427ad.1688073459.git.drv@mailo.com>
References: <cover.1688073459.git.drv@mailo.com>
 <4817527acb9e015b3c6929517993ea50ba3427ad.1688073459.git.drv@mailo.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v3 4/6] gfs2: Replace kmap_atomic() by
 kmap_local_page() in lops.c
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On gioved=EC 29 giugno 2023 23:51:17 CEST Deepak R Varma wrote:
> kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().

Deepak,

Can you please add a reference to the highmem documentation and to the patc=
h=20
from Ira that added a deprecation check for kmap() and kmap_atomic() in his=
=20
commit regarding checkpatch.pl?

There may be maintainers / reviewers who are still unaware of this=20
information. It would surely help them with reviewing. Furthermore it might=
=20
suggest maintainers to convert their subsystem / driver to the new API or=
=20
remove and use plain page_address() (if it is possible to prove that pages=
=20
can't come from ZONE_HIGHMEM).

>=20
> Therefore, replace kmap_atomic() with kmap_local_page() in following
> functions of lops.c:
>    - gfs2_jhead_pg_srch()
>    - gfs2_check_magic()
>    - gfs2_before_commit()
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
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Changes in v3:
>    - Patch included in patch series
>=20
> Changes in v2:
>    - None
>=20
>=20
>  fs/gfs2/lops.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 1902413d5d12..a7c2296cb3c6 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -427,7 +427,7 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
>  {
>  =09struct gfs2_sbd *sdp =3D GFS2_SB(jd->jd_inode);
>  =09struct gfs2_log_header_host lh;
> -=09void *kaddr =3D kmap_atomic(page);
> +=09void *kaddr =3D kmap_local_page(page);
>  =09unsigned int offset;
>  =09bool ret =3D false;
>
Deepak,

Are we mixing declarations with functions calls? Is it good practice? If no=
t,=20
I'd suggest to move the mapping to a better suited place.
>=20
> @@ -441,7 +441,7 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
>  =09=09=09}
>  =09=09}
>  =09}
> -=09kunmap_atomic(kaddr);
> +=09kunmap_local(kaddr);
>  =09return ret;
>  }
>=20
> @@ -626,11 +626,11 @@ static void gfs2_check_magic(struct buffer_head *bh=
)
>  =09__be32 *ptr;
>=20
>  =09clear_buffer_escaped(bh);
> -=09kaddr =3D kmap_atomic(bh->b_page);
> +=09kaddr =3D kmap_local_page(bh->b_page);
>  =09ptr =3D kaddr + bh_offset(bh);
>  =09if (*ptr =3D=3D cpu_to_be32(GFS2_MAGIC))
>  =09=09set_buffer_escaped(bh);
> -=09kunmap_atomic(kaddr);
> +=09kunmap_local(kaddr);
>  }
>=20
>  static int blocknr_cmp(void *priv, const struct list_head *a,
> @@ -699,10 +699,10 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp=
,
> unsigned int limit, void *kaddr;
>  =09=09=09=09page =3D mempool_alloc(gfs2_page_pool,=20
GFP_NOIO);
>  =09=09=09=09ptr =3D page_address(page);
> -=09=09=09=09kaddr =3D kmap_atomic(bd2->bd_bh-
>b_page);
> +=09=09=09=09kaddr =3D kmap_local_page(bd2->bd_bh-
>b_page);
>  =09=09=09=09memcpy(ptr, kaddr + bh_offset(bd2-
>bd_bh),
>  =09=09=09=09       bd2->bd_bh->b_size);
>
Deepak,

How about memcpy_from_page()?

Thanks,

Fabio
>
> -=09=09=09=09kunmap_atomic(kaddr);
> +=09=09=09=09kunmap_local(kaddr);
>  =09=09=09=09*(__be32 *)ptr =3D 0;
>  =09=09=09=09clear_buffer_escaped(bd2->bd_bh);
>  =09=09=09=09unlock_buffer(bd2->bd_bh);
> --
> 2.34.1




