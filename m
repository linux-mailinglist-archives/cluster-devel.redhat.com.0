Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id EE40C18D794
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 19:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584729944;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OnVcZoTjsrYmW3Kn1S/VXQSSMjiiKdu2UKQmluIUPD8=;
	b=hiDU8nmbl3RneITONyxsIZvi7pDgzB03hx9aJYF6bcl/zQXm9qEVGshZVi3tK30LXSSFpd
	fBz+HLgZqpzUQrbDXdBkKyIejK+soyUSfzPaXVPO5T1ob7/KjtViYgUWRIAY3xWWrpUHJT
	Jrw0CGwxHFJHHiB2DvaiyZKEkFkwEAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-7XOXKttpNEKJuIcQ7YzHXg-1; Fri, 20 Mar 2020 14:45:43 -0400
X-MC-Unique: 7XOXKttpNEKJuIcQ7YzHXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2F32800D50;
	Fri, 20 Mar 2020 18:45:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B54F19B901;
	Fri, 20 Mar 2020 18:45:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45DE04EA66;
	Fri, 20 Mar 2020 18:45:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KIiQEe031740 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 14:44:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42DA52166AE4; Fri, 20 Mar 2020 18:44:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F08A2166AE6
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:44:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5941C8CC921
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:44:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-411-MAwqpDkcMeeP6gBk3lxqvQ-1;
	Fri, 20 Mar 2020 14:44:20 -0400
X-MC-Unique: MAwqpDkcMeeP6gBk3lxqvQ-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9895A2051A;
	Fri, 20 Mar 2020 18:44:19 +0000 (UTC)
Date: Fri, 20 Mar 2020 11:44:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320184418.GH851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-22-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200320142231.2402-22-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KIiQEe031740
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v9 21/25] ext4: Pass the inode to
	ext4_mpage_readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 07:22:27AM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> This function now only uses the mapping argument to look up the inode,
> and both callers already have the inode, so just pass the inode instead
> of the mapping.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  fs/ext4/ext4.h     | 2 +-
>  fs/ext4/inode.c    | 4 ++--
>  fs/ext4/readpage.c | 3 +--
>  3 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 1570a0b51b73..bc1b34ba6eab 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -3278,7 +3278,7 @@ static inline void ext4_set_de_type(struct super_bl=
ock *sb,
>  }
> =20
>  /* readpages.c */
> -extern int ext4_mpage_readpages(struct address_space *mapping,
> +extern int ext4_mpage_readpages(struct inode *inode,
>  =09=09struct readahead_control *rac, struct page *page);
>  extern int __init ext4_init_post_read_processing(void);
>  extern void ext4_exit_post_read_processing(void);
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index d674c5f9066c..4f3703c1408d 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3226,7 +3226,7 @@ static int ext4_readpage(struct file *file, struct =
page *page)
>  =09=09ret =3D ext4_readpage_inline(inode, page);
> =20
>  =09if (ret =3D=3D -EAGAIN)
> -=09=09return ext4_mpage_readpages(page->mapping, NULL, page);
> +=09=09return ext4_mpage_readpages(inode, NULL, page);
> =20
>  =09return ret;
>  }
> @@ -3239,7 +3239,7 @@ static void ext4_readahead(struct readahead_control=
 *rac)
>  =09if (ext4_has_inline_data(inode))
>  =09=09return;
> =20
> -=09ext4_mpage_readpages(rac->mapping, rac, NULL);
> +=09ext4_mpage_readpages(inode, rac, NULL);
>  }
> =20
>  static void ext4_invalidatepage(struct page *page, unsigned int offset,
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index 66275f25235d..5761e9961682 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -221,13 +221,12 @@ static inline loff_t ext4_readpage_limit(struct ino=
de *inode)
>  =09return i_size_read(inode);
>  }
> =20
> -int ext4_mpage_readpages(struct address_space *mapping,
> +int ext4_mpage_readpages(struct inode *inode,
>  =09=09struct readahead_control *rac, struct page *page)
>  {
>  =09struct bio *bio =3D NULL;
>  =09sector_t last_block_in_bio =3D 0;
> =20
> -=09struct inode *inode =3D mapping->host;
>  =09const unsigned blkbits =3D inode->i_blkbits;
>  =09const unsigned blocks_per_page =3D PAGE_SIZE >> blkbits;
>  =09const unsigned blocksize =3D 1 << blkbits;
> --=20

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


