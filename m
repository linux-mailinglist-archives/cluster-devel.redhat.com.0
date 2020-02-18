Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6401625C7
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 12:50:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582026639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/NCLtELPRxTaqNsGiLPkE3qn1Yaq84oCLm4khYTOmj4=;
	b=d0CL80rz0szGejKYpI3kXmopOQh2yZLPumhzcZUAaiI3DIOKqBQabZ3CpegR/vslzuQtBe
	+ugJWIwaYFFCqFK5zNoAbdOhju7hHcC/u3HQ0xlcFkR1Q3hbRGHIM1XHSMf0dAuz3O3RF5
	Yxe300gE6dcwQJc2W6gwkTtSUlFbPWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-PxiGIrw4NJiCtQ2BnuZ15w-1; Tue, 18 Feb 2020 06:50:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55C66800D55;
	Tue, 18 Feb 2020 11:50:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F17026571;
	Tue, 18 Feb 2020 11:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3EAC35B09;
	Tue, 18 Feb 2020 11:50:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I1pX6M014385 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 20:51:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A42D202A941; Tue, 18 Feb 2020 01:51:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F3C2026D69
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 01:51:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7A77185B0D3
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 01:51:30 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04452;
	MF=joseph.qi@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
	TI=SMTPD_---0TqCOW.3_1581990682;
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-294--qaQGrCOMD28B146-HHkAw-1;
	Mon, 17 Feb 2020 20:51:28 -0500
Received: from JosephdeMacBook-Pro.local(mailfrom:joseph.qi@linux.alibaba.com
	fp:SMTPD_---0TqCOW.3_1581990682) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 18 Feb 2020 09:51:23 +0800
To: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-18-willy@infradead.org>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
Message-ID: <f742e606-104e-478b-c84c-a5f5207f9fac@linux.alibaba.com>
Date: Tue, 18 Feb 2020 09:51:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-18-willy@infradead.org>
Content-Language: en-US
X-MC-Unique: -qaQGrCOMD28B146-HHkAw-1
X-MC-Unique: PxiGIrw4NJiCtQ2BnuZ15w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I1pX6M014385
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Feb 2020 06:50:26 -0500
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [Ocfs2-devel] [PATCH v6 10/19] fs: Convert
 mpage_readpages to mpage_readahead
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 20/2/18 02:45, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Implement the new readahead aop and convert all callers (block_dev,
> exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Junxiao Bi <junxiao.bi@oracle.com> # ocfs2
> ---
>  drivers/staging/exfat/exfat_super.c |  7 +++---
>  fs/block_dev.c                      |  7 +++---
>  fs/ext2/inode.c                     | 10 +++-----
>  fs/fat/inode.c                      |  7 +++---
>  fs/gfs2/aops.c                      | 23 ++++++-----------
>  fs/hpfs/file.c                      |  7 +++---
>  fs/iomap/buffered-io.c              |  2 +-
>  fs/isofs/inode.c                    |  7 +++---
>  fs/jfs/inode.c                      |  7 +++---
>  fs/mpage.c                          | 38 +++++++++--------------------
>  fs/nilfs2/inode.c                   | 15 +++---------
>  fs/ocfs2/aops.c                     | 34 ++++++++++----------------
>  fs/omfs/file.c                      |  7 +++---
>  fs/qnx6/inode.c                     |  7 +++---
>  fs/reiserfs/inode.c                 |  8 +++---
>  fs/udf/inode.c                      |  7 +++---
>  include/linux/mpage.h               |  4 +--
>  mm/migrate.c                        |  2 +-
>  18 files changed, 73 insertions(+), 126 deletions(-)
>=20
> diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/=
exfat_super.c
> index b81d2a87b82e..96aad9b16d31 100644
> --- a/drivers/staging/exfat/exfat_super.c
> +++ b/drivers/staging/exfat/exfat_super.c
> @@ -3002,10 +3002,9 @@ static int exfat_readpage(struct file *file, struc=
t page *page)
>  =09return  mpage_readpage(page, exfat_get_block);
>  }
> =20
> -static int exfat_readpages(struct file *file, struct address_space *mapp=
ing,
> -=09=09=09   struct list_head *pages, unsigned int nr_pages)
> +static void exfat_readahead(struct readahead_control *rac)
>  {
> -=09return  mpage_readpages(mapping, pages, nr_pages, exfat_get_block);
> +=09mpage_readahead(rac, exfat_get_block);
>  }
> =20
>  static int exfat_writepage(struct page *page, struct writeback_control *=
wbc)
> @@ -3104,7 +3103,7 @@ static sector_t _exfat_bmap(struct address_space *m=
apping, sector_t block)
> =20
>  static const struct address_space_operations exfat_aops =3D {
>  =09.readpage    =3D exfat_readpage,
> -=09.readpages   =3D exfat_readpages,
> +=09.readahead   =3D exfat_readahead,
>  =09.writepage   =3D exfat_writepage,
>  =09.writepages  =3D exfat_writepages,
>  =09.write_begin =3D exfat_write_begin,
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 69bf2fb6f7cd..2fd9c7bd61f6 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -614,10 +614,9 @@ static int blkdev_readpage(struct file * file, struc=
t page * page)
>  =09return block_read_full_page(page, blkdev_get_block);
>  }
> =20
> -static int blkdev_readpages(struct file *file, struct address_space *map=
ping,
> -=09=09=09struct list_head *pages, unsigned nr_pages)
> +static void blkdev_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, blkdev_get_block);
> +=09mpage_readahead(rac, blkdev_get_block);
>  }
> =20
>  static int blkdev_write_begin(struct file *file, struct address_space *m=
apping,
> @@ -2062,7 +2061,7 @@ static int blkdev_writepages(struct address_space *=
mapping,
> =20
>  static const struct address_space_operations def_blk_aops =3D {
>  =09.readpage=09=3D blkdev_readpage,
> -=09.readpages=09=3D blkdev_readpages,
> +=09.readahead=09=3D blkdev_readahead,
>  =09.writepage=09=3D blkdev_writepage,
>  =09.write_begin=09=3D blkdev_write_begin,
>  =09.write_end=09=3D blkdev_write_end,
> diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
> index c885cf7d724b..2875c0a705b5 100644
> --- a/fs/ext2/inode.c
> +++ b/fs/ext2/inode.c
> @@ -877,11 +877,9 @@ static int ext2_readpage(struct file *file, struct p=
age *page)
>  =09return mpage_readpage(page, ext2_get_block);
>  }
> =20
> -static int
> -ext2_readpages(struct file *file, struct address_space *mapping,
> -=09=09struct list_head *pages, unsigned nr_pages)
> +static void ext2_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, ext2_get_block);
> +=09mpage_readahead(rac, ext2_get_block);
>  }
> =20
>  static int
> @@ -967,7 +965,7 @@ ext2_dax_writepages(struct address_space *mapping, st=
ruct writeback_control *wbc
> =20
>  const struct address_space_operations ext2_aops =3D {
>  =09.readpage=09=09=3D ext2_readpage,
> -=09.readpages=09=09=3D ext2_readpages,
> +=09.readahead=09=09=3D ext2_readahead,
>  =09.writepage=09=09=3D ext2_writepage,
>  =09.write_begin=09=09=3D ext2_write_begin,
>  =09.write_end=09=09=3D ext2_write_end,
> @@ -981,7 +979,7 @@ const struct address_space_operations ext2_aops =3D {
> =20
>  const struct address_space_operations ext2_nobh_aops =3D {
>  =09.readpage=09=09=3D ext2_readpage,
> -=09.readpages=09=09=3D ext2_readpages,
> +=09.readahead=09=09=3D ext2_readahead,
>  =09.writepage=09=09=3D ext2_nobh_writepage,
>  =09.write_begin=09=09=3D ext2_nobh_write_begin,
>  =09.write_end=09=09=3D nobh_write_end,
> diff --git a/fs/fat/inode.c b/fs/fat/inode.c
> index 594b05ae16c9..3496f5fc3e6d 100644
> --- a/fs/fat/inode.c
> +++ b/fs/fat/inode.c
> @@ -210,10 +210,9 @@ static int fat_readpage(struct file *file, struct pa=
ge *page)
>  =09return mpage_readpage(page, fat_get_block);
>  }
> =20
> -static int fat_readpages(struct file *file, struct address_space *mappin=
g,
> -=09=09=09 struct list_head *pages, unsigned nr_pages)
> +static void fat_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, fat_get_block);
> +=09mpage_readahead(rac, fat_get_block);
>  }
> =20
>  static void fat_write_failed(struct address_space *mapping, loff_t to)
> @@ -344,7 +343,7 @@ int fat_block_truncate_page(struct inode *inode, loff=
_t from)
> =20
>  static const struct address_space_operations fat_aops =3D {
>  =09.readpage=09=3D fat_readpage,
> -=09.readpages=09=3D fat_readpages,
> +=09.readahead=09=3D fat_readahead,
>  =09.writepage=09=3D fat_writepage,
>  =09.writepages=09=3D fat_writepages,
>  =09.write_begin=09=3D fat_write_begin,
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index ba83b49ce18c..5e63c13c12c1 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -577,7 +577,7 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *b=
uf, loff_t *pos,
>  }
> =20
>  /**
> - * gfs2_readpages - Read a bunch of pages at once
> + * gfs2_readahead - Read a bunch of pages at once
>   * @file: The file to read from
>   * @mapping: Address space info
>   * @pages: List of pages to read
> @@ -590,31 +590,24 @@ int gfs2_internal_read(struct gfs2_inode *ip, char =
*buf, loff_t *pos,
>   *    obviously not something we'd want to do on too regular a basis.
>   *    Any I/O we ignore at this time will be done via readpage later.
>   * 2. We don't handle stuffed files here we let readpage do the honours.
> - * 3. mpage_readpages() does most of the heavy lifting in the common cas=
e.
> + * 3. mpage_readahead() does most of the heavy lifting in the common cas=
e.
>   * 4. gfs2_block_map() is relied upon to set BH_Boundary in the right pl=
aces.
>   */
> =20
> -static int gfs2_readpages(struct file *file, struct address_space *mappi=
ng,
> -=09=09=09  struct list_head *pages, unsigned nr_pages)
> +static void gfs2_readahead(struct readahead_control *rac)
>  {
> -=09struct inode *inode =3D mapping->host;
> +=09struct inode *inode =3D rac->mapping->host;
>  =09struct gfs2_inode *ip =3D GFS2_I(inode);
> -=09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
>  =09struct gfs2_holder gh;
> -=09int ret;
> =20
>  =09gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
> -=09ret =3D gfs2_glock_nq(&gh);
> -=09if (unlikely(ret))
> +=09if (gfs2_glock_nq(&gh))
>  =09=09goto out_uninit;
>  =09if (!gfs2_is_stuffed(ip))
> -=09=09ret =3D mpage_readpages(mapping, pages, nr_pages, gfs2_block_map);
> +=09=09mpage_readahead(rac, gfs2_block_map);
>  =09gfs2_glock_dq(&gh);
>  out_uninit:
>  =09gfs2_holder_uninit(&gh);
> -=09if (unlikely(gfs2_withdrawn(sdp)))
> -=09=09ret =3D -EIO;
> -=09return ret;
>  }
> =20
>  /**
> @@ -828,7 +821,7 @@ static const struct address_space_operations gfs2_aop=
s =3D {
>  =09.writepage =3D gfs2_writepage,
>  =09.writepages =3D gfs2_writepages,
>  =09.readpage =3D gfs2_readpage,
> -=09.readpages =3D gfs2_readpages,
> +=09.readahead =3D gfs2_readahead,
>  =09.bmap =3D gfs2_bmap,
>  =09.invalidatepage =3D gfs2_invalidatepage,
>  =09.releasepage =3D gfs2_releasepage,
> @@ -842,7 +835,7 @@ static const struct address_space_operations gfs2_jda=
ta_aops =3D {
>  =09.writepage =3D gfs2_jdata_writepage,
>  =09.writepages =3D gfs2_jdata_writepages,
>  =09.readpage =3D gfs2_readpage,
> -=09.readpages =3D gfs2_readpages,
> +=09.readahead =3D gfs2_readahead,
>  =09.set_page_dirty =3D jdata_set_page_dirty,
>  =09.bmap =3D gfs2_bmap,
>  =09.invalidatepage =3D gfs2_invalidatepage,
> diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
> index b36abf9cb345..2de0d3492d15 100644
> --- a/fs/hpfs/file.c
> +++ b/fs/hpfs/file.c
> @@ -125,10 +125,9 @@ static int hpfs_writepage(struct page *page, struct =
writeback_control *wbc)
>  =09return block_write_full_page(page, hpfs_get_block, wbc);
>  }
> =20
> -static int hpfs_readpages(struct file *file, struct address_space *mappi=
ng,
> -=09=09=09  struct list_head *pages, unsigned nr_pages)
> +static void hpfs_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, hpfs_get_block);
> +=09mpage_readahead(rac, hpfs_get_block);
>  }
> =20
>  static int hpfs_writepages(struct address_space *mapping,
> @@ -198,7 +197,7 @@ static int hpfs_fiemap(struct inode *inode, struct fi=
emap_extent_info *fieinfo,
>  const struct address_space_operations hpfs_aops =3D {
>  =09.readpage =3D hpfs_readpage,
>  =09.writepage =3D hpfs_writepage,
> -=09.readpages =3D hpfs_readpages,
> +=09.readahead =3D hpfs_readahead,
>  =09.writepages =3D hpfs_writepages,
>  =09.write_begin =3D hpfs_write_begin,
>  =09.write_end =3D hpfs_write_end,
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 7c84c4c027c4..cb3511eb152a 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -359,7 +359,7 @@ iomap_readpage(struct page *page, const struct iomap_=
ops *ops)
>  =09}
> =20
>  =09/*
> -=09 * Just like mpage_readpages and block_read_full_page we always
> +=09 * Just like mpage_readahead and block_read_full_page we always
>  =09 * return 0 and just mark the page as PageError on errors.  This
>  =09 * should be cleaned up all through the stack eventually.
>  =09 */
> diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
> index 62c0462dc89f..95b1f377ad09 100644
> --- a/fs/isofs/inode.c
> +++ b/fs/isofs/inode.c
> @@ -1185,10 +1185,9 @@ static int isofs_readpage(struct file *file, struc=
t page *page)
>  =09return mpage_readpage(page, isofs_get_block);
>  }
> =20
> -static int isofs_readpages(struct file *file, struct address_space *mapp=
ing,
> -=09=09=09struct list_head *pages, unsigned nr_pages)
> +static void isofs_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, isofs_get_block);
> +=09mpage_readahead(rac, isofs_get_block);
>  }
> =20
>  static sector_t _isofs_bmap(struct address_space *mapping, sector_t bloc=
k)
> @@ -1198,7 +1197,7 @@ static sector_t _isofs_bmap(struct address_space *m=
apping, sector_t block)
> =20
>  static const struct address_space_operations isofs_aops =3D {
>  =09.readpage =3D isofs_readpage,
> -=09.readpages =3D isofs_readpages,
> +=09.readahead =3D isofs_readahead,
>  =09.bmap =3D _isofs_bmap
>  };
> =20
> diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
> index 9486afcdac76..6f65bfa9f18d 100644
> --- a/fs/jfs/inode.c
> +++ b/fs/jfs/inode.c
> @@ -296,10 +296,9 @@ static int jfs_readpage(struct file *file, struct pa=
ge *page)
>  =09return mpage_readpage(page, jfs_get_block);
>  }
> =20
> -static int jfs_readpages(struct file *file, struct address_space *mappin=
g,
> -=09=09struct list_head *pages, unsigned nr_pages)
> +static void jfs_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, jfs_get_block);
> +=09mpage_readahead(rac, jfs_get_block);
>  }
> =20
>  static void jfs_write_failed(struct address_space *mapping, loff_t to)
> @@ -358,7 +357,7 @@ static ssize_t jfs_direct_IO(struct kiocb *iocb, stru=
ct iov_iter *iter)
> =20
>  const struct address_space_operations jfs_aops =3D {
>  =09.readpage=09=3D jfs_readpage,
> -=09.readpages=09=3D jfs_readpages,
> +=09.readahead=09=3D jfs_readahead,
>  =09.writepage=09=3D jfs_writepage,
>  =09.writepages=09=3D jfs_writepages,
>  =09.write_begin=09=3D jfs_write_begin,
> diff --git a/fs/mpage.c b/fs/mpage.c
> index ccba3c4c4479..8a09e6002dc2 100644
> --- a/fs/mpage.c
> +++ b/fs/mpage.c
> @@ -91,7 +91,7 @@ mpage_alloc(struct block_device *bdev,
>  }
> =20
>  /*
> - * support function for mpage_readpages.  The fs supplied get_block migh=
t
> + * support function for mpage_readahead.  The fs supplied get_block migh=
t
>   * return an up to date buffer.  This is used to map that buffer into
>   * the page, which allows readpage to avoid triggering a duplicate call
>   * to get_block.
> @@ -338,13 +338,8 @@ static struct bio *do_mpage_readpage(struct mpage_re=
adpage_args *args)
>  }
> =20
>  /**
> - * mpage_readpages - populate an address space with some pages & start r=
eads against them
> - * @mapping: the address_space
> - * @pages: The address of a list_head which contains the target pages.  =
These
> - *   pages have their ->index populated and are otherwise uninitialised.
> - *   The page at @pages->prev has the lowest file offset, and reads shou=
ld be
> - *   issued in @pages->prev to @pages->next order.
> - * @nr_pages: The number of pages at *@pages
> + * mpage_readahead - start reads against pages
> + * @rac: Describes which pages to read.
>   * @get_block: The filesystem's block mapper function.
>   *
>   * This function walks the pages and the blocks within each page, buildi=
ng and
> @@ -381,36 +376,25 @@ static struct bio *do_mpage_readpage(struct mpage_r=
eadpage_args *args)
>   *
>   * This all causes the disk requests to be issued in the correct order.
>   */
> -int
> -mpage_readpages(struct address_space *mapping, struct list_head *pages,
> -=09=09=09=09unsigned nr_pages, get_block_t get_block)
> +void mpage_readahead(struct readahead_control *rac, get_block_t get_bloc=
k)
>  {
> +=09struct page *page;
>  =09struct mpage_readpage_args args =3D {
>  =09=09.get_block =3D get_block,
>  =09=09.is_readahead =3D true,
>  =09};
> -=09unsigned page_idx;
> -
> -=09for (page_idx =3D 0; page_idx < nr_pages; page_idx++) {
> -=09=09struct page *page =3D lru_to_page(pages);
> =20
> +=09readahead_for_each(rac, page) {
>  =09=09prefetchw(&page->flags);
> -=09=09list_del(&page->lru);
> -=09=09if (!add_to_page_cache_lru(page, mapping,
> -=09=09=09=09=09page->index,
> -=09=09=09=09=09readahead_gfp_mask(mapping))) {
> -=09=09=09args.page =3D page;
> -=09=09=09args.nr_pages =3D nr_pages - page_idx;
> -=09=09=09args.bio =3D do_mpage_readpage(&args);
> -=09=09}
> +=09=09args.page =3D page;
> +=09=09args.nr_pages =3D readahead_count(rac);
> +=09=09args.bio =3D do_mpage_readpage(&args);
>  =09=09put_page(page);
>  =09}
> -=09BUG_ON(!list_empty(pages));
>  =09if (args.bio)
>  =09=09mpage_bio_submit(REQ_OP_READ, REQ_RAHEAD, args.bio);
> -=09return 0;
>  }
> -EXPORT_SYMBOL(mpage_readpages);
> +EXPORT_SYMBOL(mpage_readahead);
> =20
>  /*
>   * This isn't called much at all
> @@ -563,7 +547,7 @@ static int __mpage_writepage(struct page *page, struc=
t writeback_control *wbc,
>  =09=09 * Page has buffers, but they are all unmapped. The page was
>  =09=09 * created by pagein or read over a hole which was handled by
>  =09=09 * block_read_full_page().  If this address_space is also
> -=09=09 * using mpage_readpages then this can rarely happen.
> +=09=09 * using mpage_readahead then this can rarely happen.
>  =09=09 */
>  =09=09goto confused;
>  =09}
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index 671085512e0f..ceeb3b441844 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -145,18 +145,9 @@ static int nilfs_readpage(struct file *file, struct =
page *page)
>  =09return mpage_readpage(page, nilfs_get_block);
>  }
> =20
> -/**
> - * nilfs_readpages() - implement readpages() method of nilfs_aops {}
> - * address_space_operations.
> - * @file - file struct of the file to be read
> - * @mapping - address_space struct used for reading multiple pages
> - * @pages - the pages to be read
> - * @nr_pages - number of pages to be read
> - */
> -static int nilfs_readpages(struct file *file, struct address_space *mapp=
ing,
> -=09=09=09   struct list_head *pages, unsigned int nr_pages)
> +static void nilfs_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, nilfs_get_block);
> +=09mpage_readahead(rac, nilfs_get_block);
>  }
> =20
>  static int nilfs_writepages(struct address_space *mapping,
> @@ -308,7 +299,7 @@ const struct address_space_operations nilfs_aops =3D =
{
>  =09.readpage=09=09=3D nilfs_readpage,
>  =09.writepages=09=09=3D nilfs_writepages,
>  =09.set_page_dirty=09=09=3D nilfs_set_page_dirty,
> -=09.readpages=09=09=3D nilfs_readpages,
> +=09.readahead=09=09=3D nilfs_readahead,
>  =09.write_begin=09=09=3D nilfs_write_begin,
>  =09.write_end=09=09=3D nilfs_write_end,
>  =09/* .releasepage=09=09=3D nilfs_releasepage, */
> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
> index 3a67a6518ddf..e8137efaafec 100644
> --- a/fs/ocfs2/aops.c
> +++ b/fs/ocfs2/aops.c
> @@ -350,14 +350,11 @@ static int ocfs2_readpage(struct file *file, struct=
 page *page)
>   * grow out to a tree. If need be, detecting boundary extents could
>   * trivially be added in a future version of ocfs2_get_block().
>   */
> -static int ocfs2_readpages(struct file *filp, struct address_space *mapp=
ing,
> -=09=09=09   struct list_head *pages, unsigned nr_pages)
> +static void ocfs2_readahead(struct readahead_control *rac)
>  {
> -=09int ret, err =3D -EIO;
> -=09struct inode *inode =3D mapping->host;
> +=09int ret;
> +=09struct inode *inode =3D rac->mapping->host;
>  =09struct ocfs2_inode_info *oi =3D OCFS2_I(inode);
> -=09loff_t start;
> -=09struct page *last;
> =20
>  =09/*
>  =09 * Use the nonblocking flag for the dlm code to avoid page
> @@ -365,36 +362,31 @@ static int ocfs2_readpages(struct file *filp, struc=
t address_space *mapping,
>  =09 */
>  =09ret =3D ocfs2_inode_lock_full(inode, NULL, 0, OCFS2_LOCK_NONBLOCK);
>  =09if (ret)
> -=09=09return err;
> +=09=09return;
> =20
> -=09if (down_read_trylock(&oi->ip_alloc_sem) =3D=3D 0) {
> -=09=09ocfs2_inode_unlock(inode, 0);
> -=09=09return err;
> -=09}
> +=09if (down_read_trylock(&oi->ip_alloc_sem) =3D=3D 0)
> +=09=09goto out_unlock;
> =20
>  =09/*
>  =09 * Don't bother with inline-data. There isn't anything
>  =09 * to read-ahead in that case anyway...
>  =09 */
>  =09if (oi->ip_dyn_features & OCFS2_INLINE_DATA_FL)
> -=09=09goto out_unlock;
> +=09=09goto out_up;
> =20
>  =09/*
>  =09 * Check whether a remote node truncated this file - we just
>  =09 * drop out in that case as it's not worth handling here.
>  =09 */
> -=09last =3D lru_to_page(pages);
> -=09start =3D (loff_t)last->index << PAGE_SHIFT;
> -=09if (start >=3D i_size_read(inode))
> -=09=09goto out_unlock;
> +=09if (readahead_offset(rac) >=3D i_size_read(inode))
> +=09=09goto out_up;
> =20
> -=09err =3D mpage_readpages(mapping, pages, nr_pages, ocfs2_get_block);
> +=09mpage_readahead(rac, ocfs2_get_block);
> =20
> -out_unlock:
> +out_up:
>  =09up_read(&oi->ip_alloc_sem);
> +out_unlock:
>  =09ocfs2_inode_unlock(inode, 0);
> -
> -=09return err;
>  }
> =20
>  /* Note: Because we don't support holes, our allocation has
> @@ -2474,7 +2466,7 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, =
struct iov_iter *iter)
> =20
>  const struct address_space_operations ocfs2_aops =3D {
>  =09.readpage=09=09=3D ocfs2_readpage,
> -=09.readpages=09=09=3D ocfs2_readpages,
> +=09.readahead=09=09=3D ocfs2_readahead,
>  =09.writepage=09=09=3D ocfs2_writepage,
>  =09.write_begin=09=09=3D ocfs2_write_begin,
>  =09.write_end=09=09=3D ocfs2_write_end,
For ocfs2 part, looks good.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>

> diff --git a/fs/omfs/file.c b/fs/omfs/file.c
> index d640b9388238..d7b5f09d298c 100644
> --- a/fs/omfs/file.c
> +++ b/fs/omfs/file.c
> @@ -289,10 +289,9 @@ static int omfs_readpage(struct file *file, struct p=
age *page)
>  =09return block_read_full_page(page, omfs_get_block);
>  }
> =20
> -static int omfs_readpages(struct file *file, struct address_space *mappi=
ng,
> -=09=09struct list_head *pages, unsigned nr_pages)
> +static void omfs_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, omfs_get_block);
> +=09mpage_readahead(rac, omfs_get_block);
>  }
> =20
>  static int omfs_writepage(struct page *page, struct writeback_control *w=
bc)
> @@ -373,7 +372,7 @@ const struct inode_operations omfs_file_inops =3D {
> =20
>  const struct address_space_operations omfs_aops =3D {
>  =09.readpage =3D omfs_readpage,
> -=09.readpages =3D omfs_readpages,
> +=09.readahead =3D omfs_readahead,
>  =09.writepage =3D omfs_writepage,
>  =09.writepages =3D omfs_writepages,
>  =09.write_begin =3D omfs_write_begin,
> diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
> index 345db56c98fd..755293c8c71a 100644
> --- a/fs/qnx6/inode.c
> +++ b/fs/qnx6/inode.c
> @@ -99,10 +99,9 @@ static int qnx6_readpage(struct file *file, struct pag=
e *page)
>  =09return mpage_readpage(page, qnx6_get_block);
>  }
> =20
> -static int qnx6_readpages(struct file *file, struct address_space *mappi=
ng,
> -=09=09   struct list_head *pages, unsigned nr_pages)
> +static void qnx6_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, qnx6_get_block);
> +=09mpage_readahead(rac, qnx6_get_block);
>  }
> =20
>  /*
> @@ -499,7 +498,7 @@ static sector_t qnx6_bmap(struct address_space *mappi=
ng, sector_t block)
>  }
>  static const struct address_space_operations qnx6_aops =3D {
>  =09.readpage=09=3D qnx6_readpage,
> -=09.readpages=09=3D qnx6_readpages,
> +=09.readahead=09=3D qnx6_readahead,
>  =09.bmap=09=09=3D qnx6_bmap
>  };
> =20
> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
> index 6419e6dacc39..0031070b3692 100644
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -1160,11 +1160,9 @@ int reiserfs_get_block(struct inode *inode, sector=
_t block,
>  =09return retval;
>  }
> =20
> -static int
> -reiserfs_readpages(struct file *file, struct address_space *mapping,
> -=09=09   struct list_head *pages, unsigned nr_pages)
> +static void reiserfs_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, reiserfs_get_block);
> +=09mpage_readahead(rac, reiserfs_get_block);
>  }
> =20
>  /*
> @@ -3434,7 +3432,7 @@ int reiserfs_setattr(struct dentry *dentry, struct =
iattr *attr)
>  const struct address_space_operations reiserfs_address_space_operations =
=3D {
>  =09.writepage =3D reiserfs_writepage,
>  =09.readpage =3D reiserfs_readpage,
> -=09.readpages =3D reiserfs_readpages,
> +=09.readahead =3D reiserfs_readahead,
>  =09.releasepage =3D reiserfs_releasepage,
>  =09.invalidatepage =3D reiserfs_invalidatepage,
>  =09.write_begin =3D reiserfs_write_begin,
> diff --git a/fs/udf/inode.c b/fs/udf/inode.c
> index e875bc5668ee..adaba8e8b326 100644
> --- a/fs/udf/inode.c
> +++ b/fs/udf/inode.c
> @@ -195,10 +195,9 @@ static int udf_readpage(struct file *file, struct pa=
ge *page)
>  =09return mpage_readpage(page, udf_get_block);
>  }
> =20
> -static int udf_readpages(struct file *file, struct address_space *mappin=
g,
> -=09=09=09struct list_head *pages, unsigned nr_pages)
> +static void udf_readahead(struct readahead_control *rac)
>  {
> -=09return mpage_readpages(mapping, pages, nr_pages, udf_get_block);
> +=09mpage_readahead(rac, udf_get_block);
>  }
> =20
>  static int udf_write_begin(struct file *file, struct address_space *mapp=
ing,
> @@ -234,7 +233,7 @@ static sector_t udf_bmap(struct address_space *mappin=
g, sector_t block)
> =20
>  const struct address_space_operations udf_aops =3D {
>  =09.readpage=09=3D udf_readpage,
> -=09.readpages=09=3D udf_readpages,
> +=09.readahead=09=3D udf_readahead,
>  =09.writepage=09=3D udf_writepage,
>  =09.writepages=09=3D udf_writepages,
>  =09.write_begin=09=3D udf_write_begin,
> diff --git a/include/linux/mpage.h b/include/linux/mpage.h
> index 001f1fcf9836..f4f5e90a6844 100644
> --- a/include/linux/mpage.h
> +++ b/include/linux/mpage.h
> @@ -13,9 +13,9 @@
>  #ifdef CONFIG_BLOCK
> =20
>  struct writeback_control;
> +struct readahead_control;
> =20
> -int mpage_readpages(struct address_space *mapping, struct list_head *pag=
es,
> -=09=09=09=09unsigned nr_pages, get_block_t get_block);
> +void mpage_readahead(struct readahead_control *, get_block_t get_block);
>  int mpage_readpage(struct page *page, get_block_t get_block);
>  int mpage_writepages(struct address_space *mapping,
>  =09=09struct writeback_control *wbc, get_block_t get_block);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index b1092876e537..a32122095702 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1020,7 +1020,7 @@ static int __unmap_and_move(struct page *page, stru=
ct page *newpage,
>  =09=09 * to the LRU. Later, when the IO completes the pages are
>  =09=09 * marked uptodate and unlocked. However, the queueing
>  =09=09 * could be merging multiple pages for one bio (e.g.
> -=09=09 * mpage_readpages). If an allocation happens for the
> +=09=09 * mpage_readahead). If an allocation happens for the
>  =09=09 * second or third page, the process can end up locking
>  =09=09 * the same page twice and deadlocking. Rather than
>  =09=09 * trying to be clever about what pages can be locked,
>=20


