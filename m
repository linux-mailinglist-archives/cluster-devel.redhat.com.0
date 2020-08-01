Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5E423A134
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Aug 2020 10:42:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-tj0r61ZiNxKDzLEEvkalUQ-1; Mon, 03 Aug 2020 04:42:47 -0400
X-MC-Unique: tj0r61ZiNxKDzLEEvkalUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 497B4107BEF7;
	Mon,  3 Aug 2020 08:42:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 085945DA33;
	Mon,  3 Aug 2020 08:42:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B91119A10B;
	Mon,  3 Aug 2020 08:42:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0718m0Lh011062 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 1 Aug 2020 04:48:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 796B710CD2D2; Sat,  1 Aug 2020 08:48:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67F3F10CD2CE
	for <cluster-devel@redhat.com>; Sat,  1 Aug 2020 08:47:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 653798007D1
	for <cluster-devel@redhat.com>; Sat,  1 Aug 2020 08:47:57 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-83-7C2c2yilOF-a5mvkagRKlA-1; Sat, 01 Aug 2020 04:47:52 -0400
X-MC-Unique: 7C2c2yilOF-a5mvkagRKlA-1
Received: by mail-lj1-f194.google.com with SMTP id q7so34748431ljm.1;
	Sat, 01 Aug 2020 01:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:in-reply-to:references:mime-version
	:content-transfer-encoding:subject:to:cc:from:message-id;
	bh=XNV/I+6OeZW49i9rUWh52C/jesyUpk6+jwMnqfmaNlk=;
	b=UFTaN7en4BgxGKNmt86PJ0sL3SIkJ4n5u0nKBFBpW5iX9Nmu87TD3uyz7EO5/K4ppp
	rlf5VWFSoGRwJlvHcMzWTuWssXlDacrzALvo2i1UPP3E+nN+3mnDumNlsK1DXIs0HLE9
	yOLFZe00CHJZm0GunCn5eK5jX75x7mC0scfzrYnqTQHdgibzpPQGbPMdqoruH9WU7eKh
	P1i5iWQPSI5H1y4SWFu/lWWVJMR90oL45nqaLYHDMRp5VcUgwBPxUZMQTcziW9uOcAbl
	K5VUmz9o+dK85G5MGv+vxQE2VFqVCWelPz44bfRV4k2uJqBUaYI+mzS+EWwfVtQYIXOL
	S/Dw==
X-Gm-Message-State: AOAM533HcbcOxqmGrij3ARtTlfndemgU1pOmTVtLjOtlqZrRahh7nild
	qrOkSs0jY4x5LDj3lGXm2LTCfOP5
X-Google-Smtp-Source: ABdhPJxO5pv+14TumWgO/B7TnOHLVXFYhXLae2KWRZfg7Rdajpvfl/intelhwl9ukSqSMlbcPgtBOg==
X-Received: by 2002:a2e:8542:: with SMTP id u2mr3447388ljj.154.1596271670841; 
	Sat, 01 Aug 2020 01:47:50 -0700 (PDT)
Received: from localhost ([176.59.46.212])
	by smtp.gmail.com with ESMTPSA id w2sm2211646lji.41.2020.08.01.01.47.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 01 Aug 2020 01:47:50 -0700 (PDT)
Date: Sat, 01 Aug 2020 11:47:15 +0300
In-Reply-To: <20200731212818.10782-1-efremov@linux.com>
References: <20200731212818.10782-1-efremov@linux.com>
MIME-Version: 1.0
To: Denis Efremov <efremov@linux.com>, Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
From: Denis Efremov <yefremov.denis@gmail.com>
Message-ID: <F5FA2486-C2CE-4D01-82EA-5D9B6AB7F4C8@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 03 Aug 2020 04:38:59 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: Use kvmalloc instead of opencoded
	kmalloc/vmalloc
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
	boundary="----SNVMQR1TZW8WGDRXLOPCM84BQR7MM1"

------SNVMQR1TZW8WGDRXLOPCM84BQR7MM1
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Please, skip this patch. I missed that kvmalloc accepts (flags & GFP_KERNEL=
) =3D=3D GFP_KERNEL for calling vmalloc.

Thanks,
Denis

On 1 August 2020 00:28:18 GMT+03:00, Denis Efremov <efremov@linux.com> wrot=
e:
>Use kvmalloc instead of opencoded kmalloc/vmalloc condition.
>
>Signed-off-by: Denis Efremov <efremov@linux.com>
>---
> fs/gfs2/dir.c   | 23 ++++-------------------
> fs/gfs2/quota.c |  5 +----
> 2 files changed, 5 insertions(+), 23 deletions(-)
>
>diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
>index c0f2875c946c..5d2a708fae9c 100644
>--- a/fs/gfs2/dir.c
>+++ b/fs/gfs2/dir.c
>@@ -352,9 +352,7 @@ static __be64 *gfs2_dir_get_hash_table(struct
>gfs2_inode *ip)
> =09=09return ERR_PTR(-EIO);
> =09}
>=20
>-=09hc =3D kmalloc(hsize, GFP_NOFS | __GFP_NOWARN);
>-=09if (hc =3D=3D NULL)
>-=09=09hc =3D __vmalloc(hsize, GFP_NOFS);
>+=09hc =3D kvmalloc(hsize, GFP_NOFS);
>=20
> =09if (hc =3D=3D NULL)
> =09=09return ERR_PTR(-ENOMEM);
>@@ -1320,18 +1318,6 @@ static int do_filldir_main(struct gfs2_inode
>*dip, struct dir_context *ctx,
> =09return 0;
> }
>=20
>-static void *gfs2_alloc_sort_buffer(unsigned size)
>-{
>-=09void *ptr =3D NULL;
>-
>-=09if (size < KMALLOC_MAX_SIZE)
>-=09=09ptr =3D kmalloc(size, GFP_NOFS | __GFP_NOWARN);
>-=09if (!ptr)
>-=09=09ptr =3D __vmalloc(size, GFP_NOFS);
>-=09return ptr;
>-}
>-
>-
>static int gfs2_set_cookies(struct gfs2_sbd *sdp, struct buffer_head
>*bh,
> =09=09=09    unsigned leaf_nr, struct gfs2_dirent **darr,
> =09=09=09    unsigned entries)
>@@ -1409,7 +1395,8 @@ static int gfs2_dir_read_leaf(struct inode
>*inode, struct dir_context *ctx,
> =09 * 99 is the maximum number of entries that can fit in a single
> =09 * leaf block.
> =09 */
>-=09larr =3D gfs2_alloc_sort_buffer((leaves + entries + 99) * sizeof(void
>*));
>+=09larr =3D kvmalloc_array(leaves + entries + 99,
>+=09=09=09      sizeof(void *), GFP_NOFS);
> =09if (!larr)
> =09=09goto out;
> =09darr =3D (struct gfs2_dirent **)(larr + leaves);
>@@ -1985,9 +1972,7 @@ static int leaf_dealloc(struct gfs2_inode *dip,
>u32 index, u32 len,
>=20
> =09memset(&rlist, 0, sizeof(struct gfs2_rgrp_list));
>=20
>-=09ht =3D kzalloc(size, GFP_NOFS | __GFP_NOWARN);
>-=09if (ht =3D=3D NULL)
>-=09=09ht =3D __vmalloc(size, GFP_NOFS | __GFP_NOWARN | __GFP_ZERO);
>+=09ht =3D kvzalloc(size, GFP_NOFS);
> =09if (!ht)
> =09=09return -ENOMEM;
>=20
>diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
>index 4b67d47a7e00..204b34f38e5c 100644
>--- a/fs/gfs2/quota.c
>+++ b/fs/gfs2/quota.c
>@@ -1362,10 +1362,7 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
>=09bm_size =3D DIV_ROUND_UP(sdp->sd_quota_slots, 8 * sizeof(unsigned
>long));
> =09bm_size *=3D sizeof(unsigned long);
> =09error =3D -ENOMEM;
>-=09sdp->sd_quota_bitmap =3D kzalloc(bm_size, GFP_NOFS | __GFP_NOWARN);
>-=09if (sdp->sd_quota_bitmap =3D=3D NULL)
>-=09=09sdp->sd_quota_bitmap =3D __vmalloc(bm_size, GFP_NOFS |
>-=09=09=09=09=09=09 __GFP_ZERO);
>+=09sdp->sd_quota_bitmap =3D kvzalloc(bm_size, GFP_NOFS);
> =09if (!sdp->sd_quota_bitmap)
> =09=09return error;
>=20
>--=20
>2.26.2

------SNVMQR1TZW8WGDRXLOPCM84BQR7MM1
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Please, skip this patch. I missed that kvmalloc ac=
cepts (flags &amp; GFP_KERNEL) =3D=3D GFP_KERNEL for calling vmalloc.<br><b=
r>Thanks,<br>Denis<br><br><div class=3D"gmail_quote">On 1 August 2020 00:28=
:18 GMT+03:00, Denis Efremov &lt;efremov@linux.com&gt; wrote:<blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px so=
lid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">Use kvmalloc instead of opencoded kmalloc/vmalloc con=
dition.<br><br>Signed-off-by: Denis Efremov &lt;efremov@linux.com&gt;<hr> f=
s/gfs2/dir.c   | 23 ++++-------------------<br> fs/gfs2/quota.c |  5 +----<=
br> 2 files changed, 5 insertions(+), 23 deletions(-)<br><br>diff --git a/f=
s/gfs2/dir.c b/fs/gfs2/dir.c<br>index c0f2875c946c..5d2a708fae9c 100644<br>=
--- a/fs/gfs2/dir.c<br>+++ b/fs/gfs2/dir.c<br>@@ -352,9 +352,7 @@ static __=
be64 *gfs2_dir_get_hash_table(struct gfs2_inode *ip)<br> =09=09return ERR_P=
TR(-EIO);<br> =09}<br> <br>-=09hc =3D kmalloc(hsize, GFP_NOFS | __GFP_NOWAR=
N);<br>-=09if (hc =3D=3D NULL)<br>-=09=09hc =3D __vmalloc(hsize, GFP_NOFS);=
<br>+=09hc =3D kvmalloc(hsize, GFP_NOFS);<br> <br> =09if (hc =3D=3D NULL)<b=
r> =09=09return ERR_PTR(-ENOMEM);<br>@@ -1320,18 +1318,6 @@ static int do_f=
illdir_main(struct gfs2_inode *dip, struct dir_context *ctx,<br> =09return =
0;<br> }<br> <br>-static void *gfs2_alloc_sort_buffer(unsigned size)<br>-{<=
br>-=09void *ptr =3D NULL;<br>-<br>-=09if (size &lt; KMALLOC_MAX_SIZE)<br>-=
=09=09ptr =3D kmalloc(size, GFP_NOFS | __GFP_NOWARN);<br>-=09if (!ptr)<br>-=
=09=09ptr =3D __vmalloc(size, GFP_NOFS);<br>-=09return ptr;<br>-}<br>-<br>-=
<br> static int gfs2_set_cookies(struct gfs2_sbd *sdp, struct buffer_head *=
bh,<br> =09=09=09    unsigned leaf_nr, struct gfs2_dirent **darr,<br> =09=
=09=09    unsigned entries)<br>@@ -1409,7 +1395,8 @@ static int gfs2_dir_re=
ad_leaf(struct inode *inode, struct dir_context *ctx,<br> =09 * 99 is the m=
aximum number of entries that can fit in a single<br> =09 * leaf block.<br>=
 =09 */<br>-=09larr =3D gfs2_alloc_sort_buffer((leaves + entries + 99) * si=
zeof(void *));<br>+=09larr =3D kvmalloc_array(leaves + entries + 99,<br>+=
=09=09=09      sizeof(void *), GFP_NOFS);<br> =09if (!larr)<br> =09=09goto =
out;<br> =09darr =3D (struct gfs2_dirent **)(larr + leaves);<br>@@ -1985,9 =
+1972,7 @@ static int leaf_dealloc(struct gfs2_inode *dip, u32 index, u32 l=
en,<br> <br> =09memset(&amp;rlist, 0, sizeof(struct gfs2_rgrp_list));<br> <=
br>-=09ht =3D kzalloc(size, GFP_NOFS | __GFP_NOWARN);<br>-=09if (ht =3D=3D =
NULL)<br>-=09=09ht =3D __vmalloc(size, GFP_NOFS | __GFP_NOWARN | __GFP_ZERO=
);<br>+=09ht =3D kvzalloc(size, GFP_NOFS);<br> =09if (!ht)<br> =09=09return=
 -ENOMEM;<br> <br>diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c<br>index 4=
b67d47a7e00..204b34f38e5c 100644<br>--- a/fs/gfs2/quota.c<br>+++ b/fs/gfs2/=
quota.c<br>@@ -1362,10 +1362,7 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)=
<br> =09bm_size =3D DIV_ROUND_UP(sdp-&gt;sd_quota_slots, 8 * sizeof(unsigne=
d long));<br> =09bm_size *=3D sizeof(unsigned long);<br> =09error =3D -ENOM=
EM;<br>-=09sdp-&gt;sd_quota_bitmap =3D kzalloc(bm_size, GFP_NOFS | __GFP_NO=
WARN);<br>-=09if (sdp-&gt;sd_quota_bitmap =3D=3D NULL)<br>-=09=09sdp-&gt;sd=
_quota_bitmap =3D __vmalloc(bm_size, GFP_NOFS |<br>-=09=09=09=09=09=09 __GF=
P_ZERO);<br>+=09sdp-&gt;sd_quota_bitmap =3D kvzalloc(bm_size, GFP_NOFS);<br=
> =09if (!sdp-&gt;sd_quota_bitmap)<br> =09=09return error;<br> </pre></bloc=
kquote></div></body></html>
------SNVMQR1TZW8WGDRXLOPCM84BQR7MM1--

