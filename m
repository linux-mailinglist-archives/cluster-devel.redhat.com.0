Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF1213AFA6
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f7JpdYR1Ps+6gKVY7twbQN4umhslyBDrkta42nQDr5I=;
	b=Y7nAy8I9Zqzc1+52ThNSvx5G3s8QHxwSDLleCCWjARBW+d8K3Gh67mzrJBkAmDqjE3cEOt
	khrjQAHvLT5/K+bSFhLXBL7KMERSsLtaau6rpH6PRjqrGaB44UVQr9/hFs9whRgdVBQhzs
	RyvOtQTZxAVH7pzenBV0+io+4k1Rdjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-Hyp6FHj4PKqX_xqgZ45Ltw-1; Tue, 14 Jan 2020 11:40:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D95218C43E0;
	Tue, 14 Jan 2020 16:40:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48CE060FC2;
	Tue, 14 Jan 2020 16:40:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C64D845C4;
	Tue, 14 Jan 2020 16:40:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGehlJ021535 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6CB1C215AB06; Tue, 14 Jan 2020 16:40:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67F90215AB04
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AC2F10192A9
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-346-LiRu_3EiNsaLjT-cQ6ubqA-1; Tue, 14 Jan 2020 11:40:38 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOo4-0000AR-W5; Tue, 14 Jan 2020 16:12:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:18 +0100
Message-Id: <20200114161225.309792-6-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: LiRu_3EiNsaLjT-cQ6ubqA-1
X-MC-Unique: Hyp6FHj4PKqX_xqgZ45Ltw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGehlJ021535
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 05/12] gfs2: fix O_SYNC write handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Don't ignore the return value from generic_write_sync for the direct to
buffered I/O callback case when written is non-zero.  Also don't bother
to call generic_write_sync for the pure direct I/O case, as iomap_dio_rw
already takes care of that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/file.c | 51 +++++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 21d032c4b077..86c0e61407b6 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -847,7 +847,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
 =09struct file *file =3D iocb->ki_filp;
 =09struct inode *inode =3D file_inode(file);
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
-=09ssize_t written =3D 0, ret;
+=09ssize_t ret =3D 0;
=20
 =09ret =3D gfs2_rsqa_alloc(ip);
 =09if (ret)
@@ -882,52 +882,51 @@ static ssize_t gfs2_file_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
 =09=09loff_t pos, endbyte;
 =09=09ssize_t buffered;
=20
-=09=09written =3D gfs2_file_direct_write(iocb, from);
-=09=09if (written < 0 || !iov_iter_count(from))
+=09=09ret =3D gfs2_file_direct_write(iocb, from);
+=09=09if (ret < 0 || !iov_iter_count(from))
 =09=09=09goto out_unlock;
=20
 =09=09current->backing_dev_info =3D inode_to_bdi(inode);
-=09=09ret =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
+=09=09buffered =3D iomap_file_buffered_write(iocb, from,
+=09=09=09=09=09=09     &gfs2_iomap_ops);
 =09=09current->backing_dev_info =3D NULL;
-=09=09if (unlikely(ret < 0))
+=09=09if (unlikely(buffered <=3D 0)) {
+=09=09=09if (buffered < 0)
+=09=09=09=09ret =3D buffered;
 =09=09=09goto out_unlock;
-=09=09buffered =3D ret;
+=09=09}
=20
 =09=09/*
 =09=09 * We need to ensure that the page cache pages are written to
 =09=09 * disk and invalidated to preserve the expected O_DIRECT
-=09=09 * semantics.
+=09=09 * semantics.  If the writeback or invalidate fails only report
+=09=09 * the direct I/O range as we don't know if the buffered pages
+=09=09 * made it to disk.
 =09=09 */
 =09=09pos =3D iocb->ki_pos;
 =09=09endbyte =3D pos + buffered - 1;
 =09=09ret =3D filemap_write_and_wait_range(mapping, pos, endbyte);
-=09=09if (!ret) {
-=09=09=09iocb->ki_pos +=3D buffered;
-=09=09=09written +=3D buffered;
-=09=09=09invalidate_mapping_pages(mapping,
-=09=09=09=09=09=09 pos >> PAGE_SHIFT,
-=09=09=09=09=09=09 endbyte >> PAGE_SHIFT);
-=09=09} else {
-=09=09=09/*
-=09=09=09 * We don't know how much we wrote, so just return
-=09=09=09 * the number of bytes which were direct-written
-=09=09=09 */
-=09=09}
+=09=09if (ret)
+=09=09=09goto out_unlock;
+
+=09=09invalidate_mapping_pages(mapping, pos >> PAGE_SHIFT,
+=09=09=09=09=09 endbyte >> PAGE_SHIFT);
+=09=09ret +=3D buffered;
 =09} else {
 =09=09current->backing_dev_info =3D inode_to_bdi(inode);
 =09=09ret =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
 =09=09current->backing_dev_info =3D NULL;
-=09=09if (likely(ret > 0))
-=09=09=09iocb->ki_pos +=3D ret;
+=09=09if (unlikely(ret <=3D 0))
+=09=09=09goto out_unlock;
 =09}
=20
+=09iocb->ki_pos +=3D ret;
+=09inode_unlock(inode);
+=09return generic_write_sync(iocb, ret);
+
 out_unlock:
 =09inode_unlock(inode);
-=09if (likely(ret > 0)) {
-=09=09/* Handle various SYNC-type writes */
-=09=09ret =3D generic_write_sync(iocb, ret);
-=09}
-=09return written ? written : ret;
+=09return ret;
 }
=20
 static int fallocate_chunk(struct inode *inode, loff_t offset, loff_t len,
--=20
2.24.1


