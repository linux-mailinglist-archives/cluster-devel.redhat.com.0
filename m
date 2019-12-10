Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5EC11851A
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Dec 2019 11:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575973771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jMWFdNn7fGRj5bb8TeBaOUbpmWFLdAqVHKxYwniQW98=;
	b=VoTdPL9QE0avTXmyUwbdW30ltxwOdMpf6FtxLWs3kofW2ZJ2i+CLwCtSS1nC+5pZg/EkDQ
	tNwfYF+AB1JVE0XTT1j3SwMjymN8EMBTkseEj8AtXWzzDFLIzlGS4QpX2Lzy/aQjDxeETV
	ntSKAycz3f+ixr2fuArsO/pyVcWTtQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-oaSRhpn2NWGvUVMv8z1Byw-1; Tue, 10 Dec 2019 05:29:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A602800C78;
	Tue, 10 Dec 2019 10:29:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E62F660571;
	Tue, 10 Dec 2019 10:29:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 175C365D2B;
	Tue, 10 Dec 2019 10:29:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBAATLa3010889 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 05:29:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A9378D1CF; Tue, 10 Dec 2019 10:29:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-205-78.brq.redhat.com [10.40.205.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E385160568;
	Tue, 10 Dec 2019 10:29:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Tue, 10 Dec 2019 11:29:16 +0100
Message-Id: <20191210102916.842-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] iomap: Export iomap_page_create and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: oaSRhpn2NWGvUVMv8z1Byw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

These two functions are needed by filesystems for converting inline
("stuffed") inodes into non-inline inodes.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 6 ++++--
 include/linux/iomap.h  | 5 +++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 828444e14d09..e8f6d7ba4e3c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -41,7 +41,7 @@ static inline struct iomap_page *to_iomap_page(struct pag=
e *page)
=20
 static struct bio_set iomap_ioend_bioset;
=20
-static struct iomap_page *
+struct iomap_page *
 iomap_page_create(struct inode *inode, struct page *page)
 {
 =09struct iomap_page *iop =3D to_iomap_page(page);
@@ -64,6 +64,7 @@ iomap_page_create(struct inode *inode, struct page *page)
 =09SetPagePrivate(page);
 =09return iop;
 }
+EXPORT_SYMBOL(iomap_page_create);
=20
 static void
 iomap_page_release(struct page *page)
@@ -164,7 +165,7 @@ iomap_iop_set_range_uptodate(struct page *page, unsigne=
d off, unsigned len)
 =09spin_unlock_irqrestore(&iop->uptodate_lock, flags);
 }
=20
-static void
+void
 iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
 {
 =09if (PageError(page))
@@ -175,6 +176,7 @@ iomap_set_range_uptodate(struct page *page, unsigned of=
f, unsigned len)
 =09else
 =09=09SetPageUptodate(page);
 }
+EXPORT_SYMBOL(iomap_set_range_uptodate);
=20
 static void
 iomap_read_finish(struct iomap_page *iop, struct page *page)
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 8b09463dae0d..b00f9bc396b1 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -13,6 +13,7 @@
 struct address_space;
 struct fiemap_extent_info;
 struct inode;
+struct iomap_page;
 struct iomap_writepage_ctx;
 struct iov_iter;
 struct kiocb;
@@ -152,6 +153,10 @@ loff_t iomap_apply(struct inode *inode, loff_t pos, lo=
ff_t length,
 =09=09unsigned flags, const struct iomap_ops *ops, void *data,
 =09=09iomap_actor_t actor);
=20
+struct iomap_page *iomap_page_create(struct inode *inode, struct page *pag=
e);
+void iomap_set_range_uptodate(struct page *page, unsigned off, unsigned le=
n);
+
+
 ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro=
m,
 =09=09const struct iomap_ops *ops);
 int iomap_readpage(struct page *page, const struct iomap_ops *ops);
--=20
2.20.1

