Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCE5163A95
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 03:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582081027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1w2ss87O+h85eA3EM0KsGeK5t2tp/LATX3lRqlPh1V0=;
	b=JRTVK3Kbqeh9vMQruSB5U7AiIyVE1P2RO7RWnslEa11BxqR3L1gk6xIWrmEWWqkff0pil0
	7XjRM4fLbo6jAIfMEuGrat7dwZzvxgIJDsoZvxqtnSk7xySzmaTlr92MQbNl4v+C2imOoK
	4yK5IrLicoH7bbPBN7ZvvC2GQ5cg5II=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-F3espoOoMCGdxXzPM3KVOQ-1; Tue, 18 Feb 2020 21:57:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2CDA100550E;
	Wed, 19 Feb 2020 02:57:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DAE610027AF;
	Wed, 19 Feb 2020 02:57:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B3AB35AE2;
	Wed, 19 Feb 2020 02:57:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J2uv5v004753 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 21:56:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2100E10D16CE; Wed, 19 Feb 2020 02:56:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C15510E51C0
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 02:56:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C21F18AE967
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 02:56:55 +0000 (UTC)
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-52-YvfkdbdVOimDRQxIdSpldQ-1; Tue, 18 Feb 2020 21:56:52 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
	by Forcepoint Email with ESMTP id 83358F8D75B7100BDEA5;
	Wed, 19 Feb 2020 10:35:42 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
	DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 19 Feb 2020 10:35:42 +0800
Received: from architecture4 (10.160.196.180) by
	dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1713.5; Wed, 19 Feb 2020 10:35:41 +0800
Date: Wed, 19 Feb 2020 10:34:22 +0800
From: Gao Xiang <gaoxiang25@huawei.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219023422.GA83440@architecture4>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-20-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-20-willy@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.160.196.180]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
	dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-MC-Unique: YvfkdbdVOimDRQxIdSpldQ-1
X-MC-Unique: F3espoOoMCGdxXzPM3KVOQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J2uv5v004753
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 11/16] erofs: Convert compressed
 files from readpages to readahead
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

On Mon, Feb 17, 2020 at 10:46:00AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Use the new readahead operation in erofs.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

It looks good to me, although some further optimization exists
but we could make a straight-forward transform first, and
I haven't tested the whole series for now...
Will test it later.

Acked-by: Gao Xiang <gaoxiang25@huawei.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/zdata.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
>=20
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 17f45fcb8c5c..7c02015d501d 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -1303,28 +1303,23 @@ static bool should_decompress_synchronously(struc=
t erofs_sb_info *sbi,
>  =09return nr <=3D sbi->max_sync_decompress_pages;
>  }
> =20
> -static int z_erofs_readpages(struct file *filp, struct address_space *ma=
pping,
> -=09=09=09     struct list_head *pages, unsigned int nr_pages)
> +static void z_erofs_readahead(struct readahead_control *rac)
>  {
> -=09struct inode *const inode =3D mapping->host;
> +=09struct inode *const inode =3D rac->mapping->host;
>  =09struct erofs_sb_info *const sbi =3D EROFS_I_SB(inode);
> =20
> -=09bool sync =3D should_decompress_synchronously(sbi, nr_pages);
> +=09bool sync =3D should_decompress_synchronously(sbi, readahead_count(ra=
c));
>  =09struct z_erofs_decompress_frontend f =3D DECOMPRESS_FRONTEND_INIT(ino=
de);
> -=09gfp_t gfp =3D mapping_gfp_constraint(mapping, GFP_KERNEL);
> -=09struct page *head =3D NULL;
> +=09struct page *page, *head =3D NULL;
>  =09LIST_HEAD(pagepool);
> =20
> -=09trace_erofs_readpages(mapping->host, lru_to_page(pages)->index,
> -=09=09=09      nr_pages, false);
> +=09trace_erofs_readpages(inode, readahead_index(rac),
> +=09=09=09readahead_count(rac), false);
> =20
> -=09f.headoffset =3D (erofs_off_t)lru_to_page(pages)->index << PAGE_SHIFT=
;
> -
> -=09for (; nr_pages; --nr_pages) {
> -=09=09struct page *page =3D lru_to_page(pages);
> +=09f.headoffset =3D readahead_offset(rac);
> =20
> +=09readahead_for_each(rac, page) {
>  =09=09prefetchw(&page->flags);
> -=09=09list_del(&page->lru);
> =20
>  =09=09/*
>  =09=09 * A pure asynchronous readahead is indicated if
> @@ -1333,11 +1328,6 @@ static int z_erofs_readpages(struct file *filp, st=
ruct address_space *mapping,
>  =09=09 */
>  =09=09sync &=3D !(PageReadahead(page) && !head);
> =20
> -=09=09if (add_to_page_cache_lru(page, mapping, page->index, gfp)) {
> -=09=09=09list_add(&page->lru, &pagepool);
> -=09=09=09continue;
> -=09=09}
> -
>  =09=09set_page_private(page, (unsigned long)head);
>  =09=09head =3D page;
>  =09}
> @@ -1366,11 +1356,10 @@ static int z_erofs_readpages(struct file *filp, s=
truct address_space *mapping,
> =20
>  =09/* clean up the remaining free pages */
>  =09put_pages_list(&pagepool);
> -=09return 0;
>  }
> =20
>  const struct address_space_operations z_erofs_aops =3D {
>  =09.readpage =3D z_erofs_readpage,
> -=09.readpages =3D z_erofs_readpages,
> +=09.readahead =3D z_erofs_readahead,
>  };
> =20
> --=20
> 2.25.0
>=20
>=20


