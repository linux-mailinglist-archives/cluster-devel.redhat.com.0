Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3BBFC47A
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 11:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573728177;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gl1UCbSYXxYwdjYc+6JejP9zIXM6EYblhvPqPTnhQ1U=;
	b=ZGVWNb34KZaznsknYyyehDMyUFA+xn80T5e2syk1FND+589r07yzXnr4TJQNcwlIQVWt7a
	wxnM2vFyM3WehH9l7heX9RoZLl68Q1rSCAhSjofIg9XPf8wDnpk2Eh1lt7AoNdjWcimeUG
	SqvX8tw24Gv+K2WSNUcHKT+Mls6t7Ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-pqzGpH6NPkWdWuaFQ8gO7g-1; Thu, 14 Nov 2019 05:42:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC9D6DB3C;
	Thu, 14 Nov 2019 10:42:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7CFB10375E1;
	Thu, 14 Nov 2019 10:42:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8C7618089CF;
	Thu, 14 Nov 2019 10:42:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEAgIes005369 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 05:42:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8EB38691B9; Thu, 14 Nov 2019 10:42:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94CA66084E;
	Thu, 14 Nov 2019 10:42:14 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
	<20191113213030.237431-29-rpeterso@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <62e12358-40c7-85cb-ec0a-c8b103843ed0@redhat.com>
Date: Thu, 14 Nov 2019 10:42:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191113213030.237431-29-rpeterso@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 28/32] gfs2: Eliminate GFS2_RDF_UPTODATE
 flag in favor of buffer existence
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: pqzGpH6NPkWdWuaFQ8gO7g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 13/11/2019 21:30, Bob Peterson wrote:
> Before this patch, the rgrp code used two different methods to check
> if the rgrp information was up-to-date: (1) The GFS2_RDF_UPTODATE flag
> in the rgrp and (2) the existence (or not) of valid buffer_head
> pointers in the first bitmap. When the buffer_heads are read in from
> media, the rgrp is, by definition, up to date. When the rgrp glock is
> invalidated, the buffer_heads are released, thereby indicating the
> rgrp is no longer up to date (another node may have changed it).
> So we don't need both of these flags. This patch eliminates the flag
> in favor of simply checking if the buffer_head pointers exist.
> This simplifies the code. It also makes it more bullet-proof:
> if there are two methods, they can possibly get out of sync. With
> one method, there's no way to get out of sync, and debugging is
> easier.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>

These are two different things... the buffer_head flags signal whether=20
the buffer head is up to date with respect to what is on disk. The=20
GFS2_RDF_UPTODATE flag is there to indicate whether the internal copy of=20
the various fields in the resource group is up to date.

These might match depending on how the rgrp's internal copy of the=20
fields is maintained, but not sure that this is guaranteed. Has this=20
been tested with the rgrplvb option? We should make sure that is all=20
still working correctly,

Steve.


> ---
>   fs/gfs2/glops.c  |  3 ---
>   fs/gfs2/incore.h |  1 -
>   fs/gfs2/rgrp.c   | 22 +++++++++++-----------
>   3 files changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 4072f37e4278..183fd7cbdbc1 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -213,9 +213,6 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int =
flags)
>  =20
>   =09WARN_ON_ONCE(!(flags & DIO_METADATA));
>   =09truncate_inode_pages_range(mapping, gl->gl_vm.start, gl->gl_vm.end);
> -
> -=09if (rgd)
> -=09=09rgd->rd_flags &=3D ~GFS2_RDF_UPTODATE;
>   }
>  =20
>   static struct gfs2_inode *gfs2_glock2inode(struct gfs2_glock *gl)
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index a15ddd2f9bf4..61be366a2fa7 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -113,7 +113,6 @@ struct gfs2_rgrpd {
>   =09u32 rd_flags;
>   =09u32 rd_extfail_pt;=09=09/* extent failure point */
>   #define GFS2_RDF_CHECK=09=090x10000000 /* check for unlinked inodes */
> -#define GFS2_RDF_UPTODATE=090x20000000 /* rg is up to date */
>   #define GFS2_RDF_ERROR=09=090x40000000 /* error in rg */
>   #define GFS2_RDF_PREFERRED=090x80000000 /* This rgrp is preferred */
>   #define GFS2_RDF_MASK=09=090xf0000000 /* mask for internal flags */
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 10d3397ed3cd..e5eba83a1a42 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -939,7 +939,7 @@ static int read_rindex_entry(struct gfs2_inode *ip)
>   =09=09goto fail;
>  =20
>   =09rgd->rd_rgl =3D (struct gfs2_rgrp_lvb *)rgd->rd_gl->gl_lksb.sb_lvbpt=
r;
> -=09rgd->rd_flags &=3D ~(GFS2_RDF_UPTODATE | GFS2_RDF_PREFERRED);
> +=09rgd->rd_flags &=3D ~GFS2_RDF_PREFERRED;
>   =09if (rgd->rd_data > sdp->sd_max_rg_data)
>   =09=09sdp->sd_max_rg_data =3D rgd->rd_data;
>   =09spin_lock(&sdp->sd_rindex_spin);
> @@ -1214,15 +1214,15 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rg=
d)
>   =09=09}
>   =09}
>  =20
> -=09if (!(rgd->rd_flags & GFS2_RDF_UPTODATE)) {
> -=09=09for (x =3D 0; x < length; x++)
> -=09=09=09clear_bit(GBF_FULL, &rgd->rd_bits[x].bi_flags);
> -=09=09gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
> -=09=09rgd->rd_flags |=3D (GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
> -=09=09rgd->rd_free_clone =3D rgd->rd_free;
> -=09=09/* max out the rgrp allocation failure point */
> -=09=09rgd->rd_extfail_pt =3D rgd->rd_free;
> -=09}
> +=09for (x =3D 0; x < length; x++)
> +=09=09clear_bit(GBF_FULL, &rgd->rd_bits[x].bi_flags);
> +
> +=09gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
> +=09rgd->rd_flags |=3D GFS2_RDF_CHECK;
> +=09rgd->rd_free_clone =3D rgd->rd_free;
> +=09/* max out the rgrp allocation failure point */
> +=09rgd->rd_extfail_pt =3D rgd->rd_free;
> +
>   =09if (cpu_to_be32(GFS2_MAGIC) !=3D rgd->rd_rgl->rl_magic) {
>   =09=09rgd->rd_rgl->rl_unlinked =3D cpu_to_be32(count_unlinked(rgd));
>   =09=09gfs2_rgrp_ondisk2lvb(rgd->rd_rgl,
> @@ -1254,7 +1254,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
>   {
>   =09u32 rl_flags;
>  =20
> -=09if (rgd->rd_flags & GFS2_RDF_UPTODATE)
> +=09if (rgd->rd_bits[0].bi_bh)
>   =09=09return 0;
>  =20
>   =09if (cpu_to_be32(GFS2_MAGIC) !=3D rgd->rd_rgl->rl_magic)

