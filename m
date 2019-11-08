Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 70001F4BF6
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Nov 2019 13:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573216707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+qGZKTynsT8+tlXJru7A+ZjufiUpA02K1rrJMH/k/+Y=;
	b=DjRPtxyIYW8zqAWxs1/4NFIVRojBIu6xJT177Jcg0z/+Cuiq1+NtTxRrwrFDydYdO6qc0U
	fmr6VE3TSsCFcaIWlekW4celskEOUtC+tD1yAyHsFaTEnPs2L+U//STdHemc22f9gbwUD6
	yYlTqrZXrv7NpJLD+AFcwiE3dvfypfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-MR6wRQ0uMqO-NlhAgauuSw-1; Fri, 08 Nov 2019 07:38:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E15F107ACC5;
	Fri,  8 Nov 2019 12:38:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B1711001DC0;
	Fri,  8 Nov 2019 12:38:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17B1E4BB65;
	Fri,  8 Nov 2019 12:38:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8CcJZU002151 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 07:38:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CABD9608B4; Fri,  8 Nov 2019 12:38:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.206.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3F3A6084E;
	Fri,  8 Nov 2019 12:38:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  8 Nov 2019 13:38:13 +0100
Message-Id: <20191108123814.5138-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH 1/2] gfs2: Multi-block allocations in
	gfs2_page_mkwrite
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
X-MC-Unique: MR6wRQ0uMqO-NlhAgauuSw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

In gfs2_page_mkwrite's gfs2_allocate_page_backing helper, try to
allocate as many blocks at once as we need.  Pass in the size of the
requested allocation.

Fixes: 35af80aef99b ("gfs2: don't use buffer_heads in gfs2_allocate_page_ba=
cking")
Cc: stable@vger.kernel.org # v5.3+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 33ace1832294..30b857017fd3 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -381,27 +381,28 @@ static void gfs2_size_hint(struct file *filep, loff_t=
 offset, size_t size)
 /**
  * gfs2_allocate_page_backing - Allocate blocks for a write fault
  * @page: The (locked) page to allocate backing for
+ * @length: Size of the allocation
  *
  * We try to allocate all the blocks required for the page in one go.  Thi=
s
  * might fail for various reasons, so we keep trying until all the blocks =
to
  * back this page are allocated.  If some of the blocks are already alloca=
ted,
  * that is ok too.
  */
-static int gfs2_allocate_page_backing(struct page *page)
+static int gfs2_allocate_page_backing(struct page *page, unsigned int leng=
th)
 {
 =09u64 pos =3D page_offset(page);
-=09u64 size =3D PAGE_SIZE;
=20
 =09do {
 =09=09struct iomap iomap =3D { };
=20
-=09=09if (gfs2_iomap_get_alloc(page->mapping->host, pos, 1, &iomap))
+=09=09if (gfs2_iomap_get_alloc(page->mapping->host, pos, length, &iomap))
 =09=09=09return -EIO;
=20
-=09=09iomap.length =3D min(iomap.length, size);
-=09=09size -=3D iomap.length;
+=09=09if (length < iomap.length)
+=09=09=09iomap.length =3D length;
+=09=09length -=3D iomap.length;
 =09=09pos +=3D iomap.length;
-=09} while (size > 0);
+=09} while (length > 0);
=20
 =09return 0;
 }
@@ -501,7 +502,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vm=
f)
 =09if (gfs2_is_stuffed(ip))
 =09=09ret =3D gfs2_unstuff_dinode(ip, page);
 =09if (ret =3D=3D 0)
-=09=09ret =3D gfs2_allocate_page_backing(page);
+=09=09ret =3D gfs2_allocate_page_backing(page, PAGE_SIZE);
=20
 out_trans_end:
 =09if (ret)
--=20
2.20.1

