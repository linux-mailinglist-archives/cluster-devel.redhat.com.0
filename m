Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D1BC21A80D2
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j1xel2r+tkWOq7c/yXsWVDF+CN/KNuhxeXplvfvORos=;
	b=IyEUaQv7Q+3m1RetGDeEoS0PYuMIH4t99g9CWYNtQyWJZIPS8HJdB2YFiup6SsVjE0IyJf
	bEuuNLdamfdp8aLn9u97sEtXsOG6HRLoSG/bFB0G3nddVFI4yIwWMGDwbp5Rn8ZSyD2H8a
	UiA0vQyvln3xubtYNyWoDAijyMBz49M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-fYkBlcvmOr-MeauQ13GEQQ-1; Tue, 14 Apr 2020 11:03:02 -0400
X-MC-Unique: fYkBlcvmOr-MeauQ13GEQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B69C149D8;
	Tue, 14 Apr 2020 15:02:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72CC118A85;
	Tue, 14 Apr 2020 15:02:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5048C18089CF;
	Tue, 14 Apr 2020 15:02:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2ogJ014773 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5D4410CD779; Tue, 14 Apr 2020 15:02:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B20AD10CD776
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99461868CB2
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-318-sXNY13lpMY2PTM3ap6EuHg-1; Tue, 14 Apr 2020 11:02:47 -0400
X-MC-Unique: sXNY13lpMY2PTM3ap6EuHg-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006Pf-JL; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:32 -0700
Message-Id: <20200414150233.24495-25-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2ogJ014773
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 24/25] fuse: Convert from readpages to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Implement the new readahead operation in fuse by using __readahead_batch()
to fill the array of pages in fuse_args_pages directly.  This lets us
inline fuse_readpages_fill() into fuse_readahead().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 fs/fuse/file.c | 99 ++++++++++++++------------------------------------
 1 file changed, 27 insertions(+), 72 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 9d67b830fb7a..db82fb29dd39 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -915,84 +915,39 @@ static void fuse_send_readpages(struct fuse_io_args *=
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
-static int fuse_readpages_fill(void *_data, struct page *page)
+static void fuse_readahead(struct readahead_control *rac)
 {
-=09struct fuse_fill_data *data =3D _data;
-=09struct fuse_io_args *ia =3D data->ia;
-=09struct fuse_args_pages *ap =3D &ia->ap;
-=09struct inode *inode =3D data->inode;
+=09struct inode *inode =3D rac->mapping->host;
 =09struct fuse_conn *fc =3D get_fuse_conn(inode);
+=09unsigned int i, max_pages, nr_pages =3D 0;
=20
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
-=09=09if (!ia) {
-=09=09=09unlock_page(page);
-=09=09=09return -ENOMEM;
-=09=09}
-=09=09ap =3D &ia->ap;
-=09}
-
-=09if (WARN_ON(ap->num_pages >=3D data->max_pages)) {
-=09=09unlock_page(page);
-=09=09fuse_io_free(ia);
-=09=09return -EIO;
-=09}
-
-=09get_page(page);
-=09ap->pages[ap->num_pages] =3D page;
-=09ap->descs[ap->num_pages].length =3D PAGE_SIZE;
-=09ap->num_pages++;
-=09data->nr_pages--;
-=09return 0;
-}
-
-static int fuse_readpages(struct file *file, struct address_space *mapping=
,
-=09=09=09  struct list_head *pages, unsigned nr_pages)
-{
-=09struct inode *inode =3D mapping->host;
-=09struct fuse_conn *fc =3D get_fuse_conn(inode);
-=09struct fuse_fill_data data;
-=09int err;
-
-=09err =3D -EIO;
 =09if (is_bad_inode(inode))
-=09=09goto out;
+=09=09return;
=20
-=09data.file =3D file;
-=09data.inode =3D inode;
-=09data.nr_pages =3D nr_pages;
-=09data.max_pages =3D min_t(unsigned int, nr_pages, fc->max_pages);
-;
-=09data.ia =3D fuse_io_alloc(NULL, data.max_pages);
-=09err =3D -ENOMEM;
-=09if (!data.ia)
-=09=09goto out;
+=09max_pages =3D min(fc->max_pages, fc->max_read / PAGE_SIZE);
=20
-=09err =3D read_cache_pages(mapping, pages, fuse_readpages_fill, &data);
-=09if (!err) {
-=09=09if (data.ia->ap.num_pages)
-=09=09=09fuse_send_readpages(data.ia, file);
-=09=09else
-=09=09=09fuse_io_free(data.ia);
+=09for (;;) {
+=09=09struct fuse_io_args *ia;
+=09=09struct fuse_args_pages *ap;
+
+=09=09nr_pages =3D readahead_count(rac) - nr_pages;
+=09=09if (nr_pages > max_pages)
+=09=09=09nr_pages =3D max_pages;
+=09=09if (nr_pages =3D=3D 0)
+=09=09=09break;
+=09=09ia =3D fuse_io_alloc(NULL, nr_pages);
+=09=09if (!ia)
+=09=09=09return;
+=09=09ap =3D &ia->ap;
+=09=09nr_pages =3D __readahead_batch(rac, ap->pages, nr_pages);
+=09=09for (i =3D 0; i < nr_pages; i++) {
+=09=09=09fuse_wait_on_page_writeback(inode,
+=09=09=09=09=09=09    readahead_index(rac) + i);
+=09=09=09ap->descs[i].length =3D PAGE_SIZE;
+=09=09}
+=09=09ap->num_pages =3D nr_pages;
+=09=09fuse_send_readpages(ia, rac->file);
 =09}
-out:
-=09return err;
 }
=20
 static ssize_t fuse_cache_read_iter(struct kiocb *iocb, struct iov_iter *t=
o)
@@ -3373,10 +3328,10 @@ static const struct file_operations fuse_file_opera=
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
2.25.1


