Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD94154836
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Feb 2020 16:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581003462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+LEnj7jNi0rmK4bj6BX5HAw/+AAdANVEyrBwpsI6TTA=;
	b=gBWtgUJO0/TZHYPDChm2zQ//RrhYrTmaENYq+aSIWJp5w2BhdqNot/AVQBxvaNdmq/+nrM
	pVQjDNxiKWCYakv5ZCwNop9f5aC18iqesTo71t0zNZiPREhkY9oRsgeS1phHq9qerREs5c
	z1Bw/pS7C77aZVmvQyKXd3T90vcjGao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-OnRfCUY8MsKCTPQDh7scUg-1; Thu, 06 Feb 2020 10:37:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEA7C8010F0;
	Thu,  6 Feb 2020 15:37:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27AFB863A5;
	Thu,  6 Feb 2020 15:37:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2531D866AB;
	Thu,  6 Feb 2020 15:37:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016FbQZT030180 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 10:37:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 64C1A60C05; Thu,  6 Feb 2020 15:37:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-44.brq.redhat.com [10.40.204.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC5E160BEC;
	Thu,  6 Feb 2020 15:37:22 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Thu,  6 Feb 2020 16:37:20 +0100
Message-Id: <20200206153720.31584-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Clean up gfs2_file_write_iter and fix
	O_SYNC write handling
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
X-MC-Unique: OnRfCUY8MsKCTPQDh7scUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Clean up gfs2_file_write_iter.  When falling back to a buffered write in th=
e
O_DIRECT case, use generic_write_sync + IOCB_DSYNC to sync the buffered wri=
te
to disk instead of hand-rolling the sync.  Currently, the error checking in=
 the
buffered write fallback case is incomplete.

Based on a proposed fix by Christoph Hellwig <hch@lst.de>.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 51 +++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 21d032c4b077..d68530b12706 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -847,7 +847,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
 =09struct file *file =3D iocb->ki_filp;
 =09struct inode *inode =3D file_inode(file);
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
-=09ssize_t written =3D 0, ret;
+=09ssize_t ret;
=20
 =09ret =3D gfs2_rsqa_alloc(ip);
 =09if (ret)
@@ -879,55 +879,46 @@ static ssize_t gfs2_file_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
=20
 =09if (iocb->ki_flags & IOCB_DIRECT) {
 =09=09struct address_space *mapping =3D file->f_mapping;
-=09=09loff_t pos, endbyte;
-=09=09ssize_t buffered;
+=09=09ssize_t buffered, ret2;
=20
-=09=09written =3D gfs2_file_direct_write(iocb, from);
-=09=09if (written < 0 || !iov_iter_count(from))
+=09=09ret =3D gfs2_file_direct_write(iocb, from);
+=09=09if (ret < 0 || !iov_iter_count(from))
 =09=09=09goto out_unlock;
=20
 =09=09current->backing_dev_info =3D inode_to_bdi(inode);
-=09=09ret =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
+=09=09buffered =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
 =09=09current->backing_dev_info =3D NULL;
-=09=09if (unlikely(ret < 0))
+=09=09if (unlikely(buffered <=3D 0))
 =09=09=09goto out_unlock;
-=09=09buffered =3D ret;
=20
 =09=09/*
 =09=09 * We need to ensure that the page cache pages are written to
 =09=09 * disk and invalidated to preserve the expected O_DIRECT
-=09=09 * semantics.
+=09=09 * semantics.  If the writeback or invalidate fails, only report
+=09=09 * the direct I/O range as we don't know if the buffered pages
+=09=09 * made it to disk.
 =09=09 */
-=09=09pos =3D iocb->ki_pos;
-=09=09endbyte =3D pos + buffered - 1;
-=09=09ret =3D filemap_write_and_wait_range(mapping, pos, endbyte);
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
+=09=09iocb->ki_pos +=3D buffered;
+=09=09iocb->ki_flags |=3D IOCB_DSYNC;
+=09=09ret2 =3D generic_write_sync(iocb, buffered);
+=09=09invalidate_mapping_pages(mapping,
+=09=09=09=09=09 (iocb->ki_pos - buffered) >> PAGE_SHIFT,
+=09=09=09=09=09 (iocb->ki_pos - 1) >> PAGE_SHIFT);
+=09=09if (!ret || ret2 > 0)
+=09=09=09ret +=3D ret2;
 =09} else {
 =09=09current->backing_dev_info =3D inode_to_bdi(inode);
 =09=09ret =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
 =09=09current->backing_dev_info =3D NULL;
-=09=09if (likely(ret > 0))
+=09=09if (likely(ret > 0)) {
 =09=09=09iocb->ki_pos +=3D ret;
+=09=09=09ret =3D generic_write_sync(iocb, ret);
+=09=09}
 =09}
=20
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

