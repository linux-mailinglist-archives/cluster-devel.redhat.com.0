Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 1367518D7F4
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 19:52:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584730373;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d3x7xodcKSszF4csCNyWTB2dvwYtNKO8kgavHwPStwM=;
	b=MDbwAseZNfu+6J1QiHoq0M73ycFvgF4HQ5leYlQ7m1h6fW2mBOYRcZWm/g6aTZ568ZEJxF
	C+tnOL3J2RMKkeB8+SZNvVppBjbZqxDRtiFqcyZLXPsp3bSpbtTH8853VGBeqyDyLx90la
	QSJYzDMyHCzv00y04Ja/dt2Z1HJzyBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-UZdz-aI9PLKkIsRCPl_xNg-1; Fri, 20 Mar 2020 14:52:51 -0400
X-MC-Unique: UZdz-aI9PLKkIsRCPl_xNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E94800D4E;
	Fri, 20 Mar 2020 18:52:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF39C19756;
	Fri, 20 Mar 2020 18:52:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50D51942AD;
	Fri, 20 Mar 2020 18:52:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KIqjSP031966 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 14:52:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9F9B1040257; Fri, 20 Mar 2020 18:52:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4E1F1006B06
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:52:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F3F680029A
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:52:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-411-qvYPWXVAP5CFBCv2MF04lg-1;
	Fri, 20 Mar 2020 14:52:40 -0400
X-MC-Unique: qvYPWXVAP5CFBCv2MF04lg-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8A87620775;
	Fri, 20 Mar 2020 18:52:39 +0000 (UTC)
Date: Fri, 20 Mar 2020 11:52:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320185238.GJ851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-24-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200320142231.2402-24-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KIqjSP031966
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v9 23/25] f2fs: Pass the inode to
	f2fs_mpage_readpages
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

On Fri, Mar 20, 2020 at 07:22:29AM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> This function now only uses the mapping argument to look up the inode,
> and both callers already have the inode, so just pass the inode instead
> of the mapping.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
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

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


