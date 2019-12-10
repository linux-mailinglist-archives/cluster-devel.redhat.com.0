Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 921F3119212
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Dec 2019 21:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576009992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mFZj4oSpUyVH3BCDG2oz5LBNPUa3VNC5wsOCumLRuy4=;
	b=eiGSlzPAe345m/ygGVI91x/ZYdtQmRUVei5DNbY0ugelmVb8h/p+yF3/iKTNfxxIZ7APxQ
	KaGqYSe9uCop1I7BlMxIxE2+SKrQV1/hYMJhp7Wz41QSBISslTuddt4Av+nuMvBz1b0A1p
	RfwshFMhhw56y18/GY1wMUQoz9NsyrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-NeNamSq7NPGge62HoSeIHA-1; Tue, 10 Dec 2019 15:33:10 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 844C13F0E;
	Tue, 10 Dec 2019 20:33:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF7C15D9C5;
	Tue, 10 Dec 2019 20:33:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46DF183701;
	Tue, 10 Dec 2019 20:33:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBAKX1WE010938 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 15:33:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4BC7AF8A0D; Tue, 10 Dec 2019 20:33:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 464CDF8A11
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 20:32:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01120901C64
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 20:32:59 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-297-ScvnS3IHOFSnwG1zuflV3w-1; Tue, 10 Dec 2019 15:32:57 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	xBAKTqDD041259; Tue, 10 Dec 2019 20:32:56 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 2wr41q8nan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2019 20:32:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	xBAKSeLs169161; Tue, 10 Dec 2019 20:32:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 2wsv8ccqkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2019 20:32:55 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBAKWsXY002222;
	Tue, 10 Dec 2019 20:32:54 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 Dec 2019 12:32:53 -0800
Date: Tue, 10 Dec 2019 12:32:52 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20191210203252.GA99875@magnolia>
References: <20191210102916.842-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210102916.842-1-agruenba@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9467
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1911140001 definitions=main-1912100169
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9467
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
	definitions=main-1912100169
X-MC-Unique: ScvnS3IHOFSnwG1zuflV3w-1
X-MC-Unique: NeNamSq7NPGge62HoSeIHA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBAKX1WE010938
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] iomap: Export iomap_page_create and
 iomap_set_range_uptodate
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Dec 10, 2019 at 11:29:16AM +0100, Andreas Gruenbacher wrote:
> These two functions are needed by filesystems for converting inline
> ("stuffed") inodes into non-inline inodes.
>=20
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Looks fine to me... this is a 5.6 change, correct?

Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/iomap/buffered-io.c | 6 ++++--
>  include/linux/iomap.h  | 5 +++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 828444e14d09..e8f6d7ba4e3c 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -41,7 +41,7 @@ static inline struct iomap_page *to_iomap_page(struct p=
age *page)
> =20
>  static struct bio_set iomap_ioend_bioset;
> =20
> -static struct iomap_page *
> +struct iomap_page *
>  iomap_page_create(struct inode *inode, struct page *page)
>  {
>  =09struct iomap_page *iop =3D to_iomap_page(page);
> @@ -64,6 +64,7 @@ iomap_page_create(struct inode *inode, struct page *pag=
e)
>  =09SetPagePrivate(page);
>  =09return iop;
>  }
> +EXPORT_SYMBOL(iomap_page_create);
> =20
>  static void
>  iomap_page_release(struct page *page)
> @@ -164,7 +165,7 @@ iomap_iop_set_range_uptodate(struct page *page, unsig=
ned off, unsigned len)
>  =09spin_unlock_irqrestore(&iop->uptodate_lock, flags);
>  }
> =20
> -static void
> +void
>  iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
>  {
>  =09if (PageError(page))
> @@ -175,6 +176,7 @@ iomap_set_range_uptodate(struct page *page, unsigned =
off, unsigned len)
>  =09else
>  =09=09SetPageUptodate(page);
>  }
> +EXPORT_SYMBOL(iomap_set_range_uptodate);
> =20
>  static void
>  iomap_read_finish(struct iomap_page *iop, struct page *page)
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 8b09463dae0d..b00f9bc396b1 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -13,6 +13,7 @@
>  struct address_space;
>  struct fiemap_extent_info;
>  struct inode;
> +struct iomap_page;
>  struct iomap_writepage_ctx;
>  struct iov_iter;
>  struct kiocb;
> @@ -152,6 +153,10 @@ loff_t iomap_apply(struct inode *inode, loff_t pos, =
loff_t length,
>  =09=09unsigned flags, const struct iomap_ops *ops, void *data,
>  =09=09iomap_actor_t actor);
> =20
> +struct iomap_page *iomap_page_create(struct inode *inode, struct page *p=
age);
> +void iomap_set_range_uptodate(struct page *page, unsigned off, unsigned =
len);
> +
> +
>  ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *f=
rom,
>  =09=09const struct iomap_ops *ops);
>  int iomap_readpage(struct page *page, const struct iomap_ops *ops);
> --=20
> 2.20.1
>=20


