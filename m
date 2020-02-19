Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5838F163B42
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 04:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582082960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GzepQY8SgVM/+qRGnplEKn1FVlGhNukZPbXgZA0K1yE=;
	b=etfCzGt6kBrVjun7WRpLcHORfaywq7VPTFhgKF6Oxxgk+SYK0ceJQJEL2AiLdOlSyZF6jU
	QD/AROyEV0sW1pyEIFPG6fp/LymOAk8gFGdQDwRX7FHxwbSy8YGL8k3LZ0OvwU6n6Wjb+Q
	p/sVvUyUcm7aTBGMripdMsovL6Wjj90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-evwnjobEPIif9BLOZxHReQ-1; Tue, 18 Feb 2020 22:29:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 114E48017CC;
	Wed, 19 Feb 2020 03:29:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8586019756;
	Wed, 19 Feb 2020 03:29:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46C7435AFA;
	Wed, 19 Feb 2020 03:29:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J3TAhL006686 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 22:29:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F0D372026D69; Wed, 19 Feb 2020 03:29:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBC152026D67
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:29:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C45AB802A48
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:29:07 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-329-z-YAjeSTOgSkaqf58egLpg-1; Tue, 18 Feb 2020 22:29:05 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id C4ADA7EB4FD;
	Wed, 19 Feb 2020 14:29:02 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4G2m-0005Wz-JP; Wed, 19 Feb 2020 14:29:00 +1100
Date: Wed, 19 Feb 2020 14:29:00 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219032900.GE10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-31-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-31-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=D_ITGRzz0ucxF3CW0B0A:9
	a=m4Eakf-3O-CBJR1D:21 a=uIsSIQHDIO17Gszz:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: z-YAjeSTOgSkaqf58egLpg-1
X-MC-Unique: evwnjobEPIif9BLOZxHReQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J3TAhL006686
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 17/19] iomap: Restructure
	iomap_readpages_actor
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 10:46:11AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> By putting the 'have we reached the end of the page' condition at the end
> of the loop instead of the beginning, we can remove the 'submit the last
> page' code from iomap_readpages().  Also check that iomap_readpage_actor(=
)
> didn't return 0, which would lead to an endless loop.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/iomap/buffered-io.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>=20
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index cb3511eb152a..44303f370b2d 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t po=
s, loff_t length,
>  =09=09void *data, struct iomap *iomap, struct iomap *srcmap)
>  {
>  =09struct iomap_readpage_ctx *ctx =3D data;
> -=09loff_t done, ret;
> +=09loff_t ret, done =3D 0;
> =20
> -=09for (done =3D 0; done < length; done +=3D ret) {
> -=09=09if (ctx->cur_page && offset_in_page(pos + done) =3D=3D 0) {
> -=09=09=09if (!ctx->cur_page_in_bio)
> -=09=09=09=09unlock_page(ctx->cur_page);
> -=09=09=09put_page(ctx->cur_page);
> -=09=09=09ctx->cur_page =3D NULL;
> -=09=09}
> +=09while (done < length) {
>  =09=09if (!ctx->cur_page) {
>  =09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
>  =09=09=09=09=09pos, length, &done);
> @@ -418,6 +412,15 @@ iomap_readpages_actor(struct inode *inode, loff_t po=
s, loff_t length,
>  =09=09}
>  =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
>  =09=09=09=09ctx, iomap, srcmap);
> +=09=09if (WARN_ON(ret =3D=3D 0))
> +=09=09=09break;

This error case now leaks ctx->cur_page....

> +=09=09done +=3D ret;
> +=09=09if (offset_in_page(pos + done) =3D=3D 0) {
> +=09=09=09if (!ctx->cur_page_in_bio)
> +=09=09=09=09unlock_page(ctx->cur_page);
> +=09=09=09put_page(ctx->cur_page);
> +=09=09=09ctx->cur_page =3D NULL;
> +=09=09}
>  =09}
> =20
>  =09return done;
> @@ -451,11 +454,7 @@ iomap_readpages(struct address_space *mapping, struc=
t list_head *pages,
>  done:
>  =09if (ctx.bio)
>  =09=09submit_bio(ctx.bio);
> -=09if (ctx.cur_page) {
> -=09=09if (!ctx.cur_page_in_bio)
> -=09=09=09unlock_page(ctx.cur_page);
> -=09=09put_page(ctx.cur_page);
> -=09}
> +=09BUG_ON(ctx.cur_page);

And so will now trigger both a warn and a bug....

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


