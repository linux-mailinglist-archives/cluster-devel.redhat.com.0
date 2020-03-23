Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id B0FF718F201
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Mar 2020 10:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584956495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HHQbpqnbJiQrOX1i0Sgtu1AJ7TYdpanJb/mOPD7WqDQ=;
	b=QtADyG5sLQ1QGxECwztd1KGAx0RJ3qFPTD7ZuIJ+RWuMylECR/FTd6jU/2Fdxfa32j2Yh+
	NwByAuMwGd5IbTRPjtxI46jMKgbQdUW5xLTkHZo2sRQgoFhyuTwesDnsO07Bg+fsGkaW0S
	0alvajwElCtUZ2/OyS1iVAg1KPjlyak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-Xr6S5robNC6T5zr3zk5y1w-1; Mon, 23 Mar 2020 05:41:34 -0400
X-MC-Unique: Xr6S5robNC6T5zr3zk5y1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D228800D4E;
	Mon, 23 Mar 2020 09:41:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D543C5DA85;
	Mon, 23 Mar 2020 09:41:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5A3E18089CD;
	Mon, 23 Mar 2020 09:41:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02N3rr1e003405 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 23:53:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57D022166B32; Mon, 23 Mar 2020 03:53:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 541332166B2F
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 03:53:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD5088007AC
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 03:53:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-61-6Bolu4OiMF6WUATVVIyWxQ-1; 
	Sun, 22 Mar 2020 23:53:48 -0400
X-MC-Unique: 6Bolu4OiMF6WUATVVIyWxQ-1
Received: from localhost (unknown [104.132.1.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8C9F32070A;
	Mon, 23 Mar 2020 03:53:46 +0000 (UTC)
Date: Sun, 22 Mar 2020 20:53:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200323035346.GA147648@google.com>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-24-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200320142231.2402-24-willy@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02N3rr1e003405
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Mar 2020 05:41:02 -0400
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH v9 23/25] f2fs: Pass the
 inode to f2fs_mpage_readpages
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 03/20, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> This function now only uses the mapping argument to look up the inode,
> and both callers already have the inode, so just pass the inode instead
> of the mapping.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/data.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 237dff36fe73..c8b042979fc4 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2159,12 +2159,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc=
, struct bio **bio_ret,
>   * use ->readpage() or do the necessary surgery to decouple ->readpages(=
)
>   * from read-ahead.
>   */
> -static int f2fs_mpage_readpages(struct address_space *mapping,
> +static int f2fs_mpage_readpages(struct inode *inode,
>  =09=09struct readahead_control *rac, struct page *page)
>  {
>  =09struct bio *bio =3D NULL;
>  =09sector_t last_block_in_bio =3D 0;
> -=09struct inode *inode =3D mapping->host;
>  =09struct f2fs_map_blocks map;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  =09struct compress_ctx cc =3D {
> @@ -2276,7 +2275,7 @@ static int f2fs_read_data_page(struct file *file, s=
truct page *page)
>  =09if (f2fs_has_inline_data(inode))
>  =09=09ret =3D f2fs_read_inline_data(inode, page);
>  =09if (ret =3D=3D -EAGAIN)
> -=09=09ret =3D f2fs_mpage_readpages(page_file_mapping(page), NULL, page);
> +=09=09ret =3D f2fs_mpage_readpages(inode, NULL, page);
>  =09return ret;
>  }
> =20
> @@ -2293,7 +2292,7 @@ static void f2fs_readahead(struct readahead_control=
 *rac)
>  =09if (f2fs_has_inline_data(inode))
>  =09=09return;
> =20
> -=09f2fs_mpage_readpages(rac->mapping, rac, NULL);
> +=09f2fs_mpage_readpages(inode, rac, NULL);
>  }
> =20
>  int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
> --=20
> 2.25.1
>=20
>=20
>=20
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


