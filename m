Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 172BD15874E
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581383057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r6eITetPsLZvjEq2cwJ4PSP9+54C5m+DTt/SZFi9VYI=;
	b=V+kPiY2Oxc8Q/mp6EILVPTtdUSdG0VEI8VPyXw8lFrlsQlOGg6Au2iwS3ipo6NLyIDLen8
	cizbcfgRhhA8ZsFrs1UxDHnr/ZpkqgxQqwGRIQNVYPsikfrBYXOSJsxv1zr3KjWl5ReNSH
	yUQbWtEcLFJ7W0U4Va6DppJoVtPnHbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-NcfWUF24MxKgLYeOicW8Yg-1; Mon, 10 Feb 2020 20:04:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A621F10753F8;
	Tue, 11 Feb 2020 01:04:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 945355DA82;
	Tue, 11 Feb 2020 01:04:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78BCF866DA;
	Tue, 11 Feb 2020 01:04:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B146Ol019391 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 20:04:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 48622206320B; Tue, 11 Feb 2020 01:04:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 435092063209
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2899690085D
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-KpHNG2a6Oq-HssDgVq8Xfw-1; Mon, 10 Feb 2020 20:04:02 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j1Jxu-0001oP-Mi; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:47 -0800
Message-Id: <20200211010348.6872-13-willy@infradead.org>
In-Reply-To: <20200211010348.6872-1-willy@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: KpHNG2a6Oq-HssDgVq8Xfw-1
X-MC-Unique: NcfWUF24MxKgLYeOicW8Yg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B146Ol019391
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v5 12/13] fuse: Convert from readpages to
	readahead
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in fuse.  Switching away from the
read_cache_pages() helper gets rid of an implicit call to put_page(),
so we can get rid of the get_page() call in fuse_readpages_fill().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/fuse/file.c | 46 +++++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 9d67b830fb7a..f64f98708b5e 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -923,9 +923,8 @@ struct fuse_fill_data {
 =09unsigned int max_pages;
 };
=20
-static int fuse_readpages_fill(void *_data, struct page *page)
+static int fuse_readpages_fill(struct fuse_fill_data *data, struct page *p=
age)
 {
-=09struct fuse_fill_data *data =3D _data;
 =09struct fuse_io_args *ia =3D data->ia;
 =09struct fuse_args_pages *ap =3D &ia->ap;
 =09struct inode *inode =3D data->inode;
@@ -941,10 +940,8 @@ static int fuse_readpages_fill(void *_data, struct pag=
e *page)
 =09=09=09=09=09fc->max_pages);
 =09=09fuse_send_readpages(ia, data->file);
 =09=09data->ia =3D ia =3D fuse_io_alloc(NULL, data->max_pages);
-=09=09if (!ia) {
-=09=09=09unlock_page(page);
+=09=09if (!ia)
 =09=09=09return -ENOMEM;
-=09=09}
 =09=09ap =3D &ia->ap;
 =09}
=20
@@ -954,7 +951,6 @@ static int fuse_readpages_fill(void *_data, struct page=
 *page)
 =09=09return -EIO;
 =09}
=20
-=09get_page(page);
 =09ap->pages[ap->num_pages] =3D page;
 =09ap->descs[ap->num_pages].length =3D PAGE_SIZE;
 =09ap->num_pages++;
@@ -962,37 +958,33 @@ static int fuse_readpages_fill(void *_data, struct pa=
ge *page)
 =09return 0;
 }
=20
-static int fuse_readpages(struct file *file, struct address_space *mapping=
,
-=09=09=09  struct list_head *pages, unsigned nr_pages)
+static void fuse_readahead(struct readahead_control *rac)
 {
-=09struct inode *inode =3D mapping->host;
+=09struct inode *inode =3D rac->mapping->host;
 =09struct fuse_conn *fc =3D get_fuse_conn(inode);
 =09struct fuse_fill_data data;
-=09int err;
+=09struct page *page;
=20
-=09err =3D -EIO;
 =09if (is_bad_inode(inode))
-=09=09goto out;
+=09=09return;
=20
-=09data.file =3D file;
+=09data.file =3D rac->file;
 =09data.inode =3D inode;
-=09data.nr_pages =3D nr_pages;
-=09data.max_pages =3D min_t(unsigned int, nr_pages, fc->max_pages);
-;
+=09data.nr_pages =3D readahead_count(rac);
+=09data.max_pages =3D min_t(unsigned int, data.nr_pages, fc->max_pages);
 =09data.ia =3D fuse_io_alloc(NULL, data.max_pages);
-=09err =3D -ENOMEM;
 =09if (!data.ia)
-=09=09goto out;
+=09=09return;
=20
-=09err =3D read_cache_pages(mapping, pages, fuse_readpages_fill, &data);
-=09if (!err) {
-=09=09if (data.ia->ap.num_pages)
-=09=09=09fuse_send_readpages(data.ia, file);
-=09=09else
-=09=09=09fuse_io_free(data.ia);
+=09readahead_for_each(rac, page) {
+=09=09if (fuse_readpages_fill(&data, page) !=3D 0)
+=09=09=09return;
 =09}
-out:
-=09return err;
+
+=09if (data.ia->ap.num_pages)
+=09=09fuse_send_readpages(data.ia, rac->file);
+=09else
+=09=09fuse_io_free(data.ia);
 }
=20
 static ssize_t fuse_cache_read_iter(struct kiocb *iocb, struct iov_iter *t=
o)
@@ -3373,10 +3365,10 @@ static const struct file_operations fuse_file_opera=
tions =3D {
=20
 static const struct address_space_operations fuse_file_aops  =3D {
 =09.readpage=09=3D fuse_readpage,
+=09.readahead=09=3D fuse_readahead,
 =09.writepage=09=3D fuse_writepage,
 =09.writepages=09=3D fuse_writepages,
 =09.launder_page=09=3D fuse_launder_page,
-=09.readpages=09=3D fuse_readpages,
 =09.set_page_dirty=09=3D __set_page_dirty_nobuffers,
 =09.bmap=09=09=3D fuse_bmap,
 =09.direct_IO=09=3D fuse_direct_IO,
--=20
2.25.0


