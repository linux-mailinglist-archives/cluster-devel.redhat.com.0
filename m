Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 564681927A9
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Mar 2020 13:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585137803;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f7nCIHmFrIceQyCn4R40Bsq3FSglbjZAdpxfeJ9qhnc=;
	b=X0lgF1CNOiBp28j8PhwqBxTqfDmGS8EDkcPu6Evuj2yH+gW9DI7eQngu9pf26QAg8FSeI8
	EEX2l+srr9B6PkD9JwWLlpUs8HuaktqNEG4O5eytFIeofBe5QYr03F0URJt3pwWOSihRU9
	qKotMeU96w9gwHKVga/ReQNprrWeFe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-fCUzttb7OTCh3pPDCU5ZpQ-1; Wed, 25 Mar 2020 08:03:21 -0400
X-MC-Unique: fCUzttb7OTCh3pPDCU5ZpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B8508014CE;
	Wed, 25 Mar 2020 12:03:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A7DA1036B54;
	Wed, 25 Mar 2020 12:03:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2951886386;
	Wed, 25 Mar 2020 12:03:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PC3Bv0004645 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 08:03:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BAC2210A58CE; Wed, 25 Mar 2020 12:03:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E8910A58D5
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 12:03:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46AA4185A79B
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 12:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-441-OlcHslF0MV6U4rq5ORfCQA-1; Wed, 25 Mar 2020 08:03:04 -0400
X-MC-Unique: OlcHslF0MV6U4rq5ORfCQA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jH4kI-0002HH-Er; Wed, 25 Mar 2020 12:02:54 +0000
Date: Wed, 25 Mar 2020 05:02:54 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <20200325120254.GA22483@bombadil.infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
	<20200323202259.13363-25-willy@infradead.org>
	<CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PC3Bv0004645
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v10 24/25] fuse: Convert from readpages
	to readahead
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Mar 25, 2020 at 10:42:56AM +0100, Miklos Szeredi wrote:
> > +       while ((page =3D readahead_page(rac))) {
> > +               if (fuse_readpages_fill(&data, page) !=3D 0)
>=20
> Shouldn't this unlock + put page on error?

We're certainly inconsistent between the two error exits from
fuse_readpages_fill().  But I think we can simplify the whole thing
... how does this look to you?

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 5749505bcff6..57ea9a364e62 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -915,76 +915,32 @@ static void fuse_send_readpages(struct fuse_io_args *=
ia, struct file *file)
 =09fuse_readpages_end(fc, &ap->args, err);
 }
=20
-struct fuse_fill_data {
-=09struct fuse_io_args *ia;
-=09struct file *file;
-=09struct inode *inode;
-=09unsigned int nr_pages;
-=09unsigned int max_pages;
-};
-
-static int fuse_readpages_fill(struct fuse_fill_data *data, struct page *p=
age)
-{
-=09struct fuse_io_args *ia =3D data->ia;
-=09struct fuse_args_pages *ap =3D &ia->ap;
-=09struct inode *inode =3D data->inode;
-=09struct fuse_conn *fc =3D get_fuse_conn(inode);
-
-=09fuse_wait_on_page_writeback(inode, page->index);
-
-=09if (ap->num_pages &&
-=09    (ap->num_pages =3D=3D fc->max_pages ||
-=09     (ap->num_pages + 1) * PAGE_SIZE > fc->max_read ||
-=09     ap->pages[ap->num_pages - 1]->index + 1 !=3D page->index)) {
-=09=09data->max_pages =3D min_t(unsigned int, data->nr_pages,
-=09=09=09=09=09fc->max_pages);
-=09=09fuse_send_readpages(ia, data->file);
-=09=09data->ia =3D ia =3D fuse_io_alloc(NULL, data->max_pages);
-=09=09if (!ia)
-=09=09=09return -ENOMEM;
-=09=09ap =3D &ia->ap;
-=09}
-
-=09if (WARN_ON(ap->num_pages >=3D data->max_pages)) {
-=09=09unlock_page(page);
-=09=09fuse_io_free(ia);
-=09=09return -EIO;
-=09}
-
-=09ap->pages[ap->num_pages] =3D page;
-=09ap->descs[ap->num_pages].length =3D PAGE_SIZE;
-=09ap->num_pages++;
-=09data->nr_pages--;
-=09return 0;
-}
-
 static void fuse_readahead(struct readahead_control *rac)
 {
 =09struct inode *inode =3D rac->mapping->host;
 =09struct fuse_conn *fc =3D get_fuse_conn(inode);
-=09struct fuse_fill_data data;
-=09struct page *page;
=20
 =09if (is_bad_inode(inode))
 =09=09return;
=20
-=09data.file =3D rac->file;
-=09data.inode =3D inode;
-=09data.nr_pages =3D readahead_count(rac);
-=09data.max_pages =3D min_t(unsigned int, data.nr_pages, fc->max_pages);
-=09data.ia =3D fuse_io_alloc(NULL, data.max_pages);
-=09if (!data.ia)
-=09=09return;
+=09while (readahead_count(rac)) {
+=09=09struct fuse_io_args *ia;
+=09=09struct fuse_args_pages *ap;
+=09=09unsigned int i, nr_pages;
=20
-=09while ((page =3D readahead_page(rac))) {
-=09=09if (fuse_readpages_fill(&data, page) !=3D 0)
+=09=09nr_pages =3D min(readahead_count(rac), fc->max_pages);
+=09=09ia =3D fuse_io_alloc(NULL, nr_pages);
+=09=09if (!ia)
 =09=09=09return;
+=09=09ap =3D &ia->ap;
+=09=09__readahead_batch(rac, ap->pages, nr_pages);
+=09=09for (i =3D 0; i < nr_pages; i++) {
+=09=09=09fuse_wait_on_page_writeback(inode, ap->pages[i]->index);
+=09=09=09ap->descs[i].length =3D PAGE_SIZE;
+=09=09}
+=09=09ap->num_pages =3D nr_pages;
+=09=09fuse_send_readpages(ia, rac->file);
 =09}
-
-=09if (data.ia->ap.num_pages)
-=09=09fuse_send_readpages(data.ia, rac->file);
-=09else
-=09=09fuse_io_free(data.ia);
 }
=20
 static ssize_t fuse_cache_read_iter(struct kiocb *iocb, struct iov_iter *t=
o)


