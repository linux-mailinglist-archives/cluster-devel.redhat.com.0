Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A0D7C168B2C
	for <lists+cluster-devel@lfdr.de>; Sat, 22 Feb 2020 01:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582332329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/nJa91f29j9d2T9rMUXilz1m+Pa5ZyPGjC/4kIEWDxg=;
	b=h1XDVEwOdmigWGOx5VKMEA+j65c56KkALxzLf7GV/M8o2yYEaPI+LgvhOaQWjXNpV+6p9o
	4mhd4bUg8IYwH4xT4l2iepe3Dvl1b7ZAoC6Z9EnOiXJbFe/8xKhTJy1n8gdn0mdIIKG4N4
	ZyODlOOgKiEorjI6R7y+LDjFaEkRdpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-LyFJKX53Mp2m_Av3qZ2CXw-1; Fri, 21 Feb 2020 19:45:28 -0500
X-MC-Unique: LyFJKX53Mp2m_Av3qZ2CXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2B5F189F760;
	Sat, 22 Feb 2020 00:45:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97ECF1001B07;
	Sat, 22 Feb 2020 00:45:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1EBF860C8;
	Sat, 22 Feb 2020 00:45:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M0jACL003631 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:45:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AECA6103E1F6; Sat, 22 Feb 2020 00:45:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A994E103E1F2
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 00:45:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7957A185A78F
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 00:45:08 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-128-j-L56IjXOzOSvCtBG-p-ag-1; Fri, 21 Feb 2020 19:45:06 -0500
X-MC-Unique: j-L56IjXOzOSvCtBG-p-ag-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01M0iXKo069490; Sat, 22 Feb 2020 00:44:33 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 2y8udkuk25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Feb 2020 00:44:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01M0h54Z146709; Sat, 22 Feb 2020 00:44:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 2y8udg8m3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sat, 22 Feb 2020 00:44:33 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01M0iWwv149129;
	Sat, 22 Feb 2020 00:44:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 2y8udg8m32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Feb 2020 00:44:32 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01M0iRp8021588;
	Sat, 22 Feb 2020 00:44:27 GMT
Received: from localhost (/10.145.179.117)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 21 Feb 2020 16:44:27 -0800
Date: Fri, 21 Feb 2020 16:44:25 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200222004425.GG9506@magnolia>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-22-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-22-willy@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9538
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 suspectscore=0
	spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0 clxscore=1011
	malwarescore=0 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002220001
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M0jACL003631
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 21/24] iomap: Restructure
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
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
>  fs/iomap/buffered-io.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index cb3511eb152a..31899e6cb0f8 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t po=
s, loff_t length,
>  =09=09void *data, struct iomap *iomap, struct iomap *srcmap)
>  {
>  =09struct iomap_readpage_ctx *ctx =3D data;
> -=09loff_t done, ret;
> -
> -=09for (done =3D 0; done < length; done +=3D ret) {
> -=09=09if (ctx->cur_page && offset_in_page(pos + done) =3D=3D 0) {
> -=09=09=09if (!ctx->cur_page_in_bio)
> -=09=09=09=09unlock_page(ctx->cur_page);
> -=09=09=09put_page(ctx->cur_page);
> -=09=09=09ctx->cur_page =3D NULL;
> -=09=09}
> +=09loff_t ret, done =3D 0;
> +
> +=09while (done < length) {
>  =09=09if (!ctx->cur_page) {
>  =09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
>  =09=09=09=09=09pos, length, &done);
> @@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t po=
s, loff_t length,
>  =09=09}
>  =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
>  =09=09=09=09ctx, iomap, srcmap);
> +=09=09done +=3D ret;
> +
> +=09=09/* Keep working on a partial page */
> +=09=09if (ret && offset_in_page(pos + done))
> +=09=09=09continue;
> +
> +=09=09if (!ctx->cur_page_in_bio)
> +=09=09=09unlock_page(ctx->cur_page);
> +=09=09put_page(ctx->cur_page);
> +=09=09ctx->cur_page =3D NULL;
> +
> +=09=09/* Don't loop forever if we made no progress */
> +=09=09if (WARN_ON(!ret))
> +=09=09=09break;
>  =09}
> =20
>  =09return done;
> @@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, struc=
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

Whoah, is the system totally unrecoverably hosed at this point?

I get that this /shouldn't/ happen, but should we somehow end up with a
page here, are we unable either to release it or even just leak it?  I'd
have thought a WARN_ON would be just fine here.

--D

> =20
>  =09/*
>  =09 * Check that we didn't lose a page due to the arcance calling
> --=20
> 2.25.0
>=20


