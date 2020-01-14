Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8776613AF9F
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=69JkNPWdInY3+bTnDdxyDIpNQLA1JKqN0aDmB5n0aY8=;
	b=AOgcayt8C9zUp4THmmNWQUZSIUpGx/1TZSLggoObpayN5eDkj1Xe490IAdjs52f8uWzFq+
	3xAWGe9ke3sDKEAabGchAEfrO3hIRUP3oQGvgwP0VPjIGPNb3zwShTqxLugswxWsJEIny8
	z7FG1ujrbt4lnLfyupaoZTntPqo5sOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-2T07UhQUPmKpGEc-vgldtA-1; Tue, 14 Jan 2020 11:40:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C011133DA2;
	Tue, 14 Jan 2020 16:40:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1286E60BF1;
	Tue, 14 Jan 2020 16:40:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E66A1845C0;
	Tue, 14 Jan 2020 16:40:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGebvP021518 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6B472166B2C; Tue, 14 Jan 2020 16:40:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0D532166B2D
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 778638F7A3F
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-386-vEdPT2m2McO-7IPuD22oNw-1; Tue, 14 Jan 2020 11:40:33 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOo7-0000BN-MA; Tue, 14 Jan 2020 16:12:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:19 +0100
Message-Id: <20200114161225.309792-7-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: vEdPT2m2McO-7IPuD22oNw-1
X-MC-Unique: 2T07UhQUPmKpGEc-vgldtA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGebvP021518
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 06/12] iomap: pass a flags value to
	iomap_dio_rw
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

Replace the wait_for_completion flag in struct iomap_dio with a new
IOMAP_DIO_SYNCHRONOUS flag for dio->flags, and allow passing the
initial flags to iomap_dio_rw.  Also take the check for synchronous
iocbs into iomap_dio_rw instead of duplicating it in all the callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/file.c        |  8 +++++---
 fs/gfs2/file.c        |  6 ++----
 fs/iomap/direct-io.c  |  7 ++++---
 fs/xfs/xfs_file.c     | 21 +++++++++------------
 include/linux/iomap.h |  5 +++--
 5 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 6a7293a5cda2..08b603d0c638 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -74,8 +74,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, str=
uct iov_iter *to)
 =09=09return generic_file_read_iter(iocb, to);
 =09}
=20
-=09ret =3D iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL,
-=09=09=09   is_sync_kiocb(iocb));
+=09ret =3D iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL, 0);
 =09inode_unlock_shared(inode);
=20
 =09file_accessed(iocb->ki_filp);
@@ -371,6 +370,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, =
struct iov_iter *from)
 =09handle_t *handle;
 =09struct inode *inode =3D file_inode(iocb->ki_filp);
 =09bool extend =3D false, overwrite =3D false, unaligned_aio =3D false;
+=09unsigned int dio_flags =3D 0;
=20
 =09if (iocb->ki_flags & IOCB_NOWAIT) {
 =09=09if (!inode_trylock(inode))
@@ -404,6 +404,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, =
struct iov_iter *from)
 =09if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS) &&
 =09    !is_sync_kiocb(iocb) && ext4_unaligned_aio(inode, from, offset)) {
 =09=09unaligned_aio =3D true;
+=09=09dio_flags |=3D IOMAP_DIO_SYNCHRONOUS;
 =09=09inode_dio_wait(inode);
 =09}
=20
@@ -432,11 +433,12 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb=
, struct iov_iter *from)
 =09=09}
=20
 =09=09extend =3D true;
+=09=09dio_flags |=3D IOMAP_DIO_SYNCHRONOUS;
 =09=09ext4_journal_stop(handle);
 =09}
=20
 =09ret =3D iomap_dio_rw(iocb, from, &ext4_iomap_ops, &ext4_dio_write_ops,
-=09=09=09   is_sync_kiocb(iocb) || unaligned_aio || extend);
+=09=09=09   dio_flags);
=20
 =09if (extend)
 =09=09ret =3D ext4_handle_inode_extension(inode, offset, ret, count);
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 86c0e61407b6..2260cb5d31af 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -771,8 +771,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb=
, struct iov_iter *to)
 =09if (ret)
 =09=09goto out_uninit;
=20
-=09ret =3D iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
-=09=09=09   is_sync_kiocb(iocb));
+=09ret =3D iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL, 0);
=20
 =09gfs2_glock_dq(&gh);
 out_uninit:
@@ -807,8 +806,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *ioc=
b, struct iov_iter *from)
 =09if (offset + len > i_size_read(&ip->i_inode))
 =09=09goto out;
=20
-=09ret =3D iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
-=09=09=09   is_sync_kiocb(iocb));
+=09ret =3D iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL, 0);
=20
 out:
 =09gfs2_glock_dq(&gh);
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 23837926c0c5..e706329d71a0 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -400,7 +400,7 @@ iomap_dio_actor(struct inode *inode, loff_t pos, loff_t=
 length,
 ssize_t
 iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 =09=09const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
-=09=09bool wait_for_completion)
+=09=09unsigned int dio_flags)
 {
 =09struct address_space *mapping =3D iocb->ki_filp->f_mapping;
 =09struct inode *inode =3D file_inode(iocb->ki_filp);
@@ -410,14 +410,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *ite=
r,
 =09unsigned int flags =3D IOMAP_DIRECT;
 =09struct blk_plug plug;
 =09struct iomap_dio *dio;
+=09bool wait_for_completion =3D false;
=20
 =09lockdep_assert_held(&inode->i_rwsem);
=20
 =09if (!count)
 =09=09return 0;
=20
-=09if (WARN_ON(is_sync_kiocb(iocb) && !wait_for_completion))
-=09=09return -EIO;
+=09if (is_sync_kiocb(iocb) || (dio_flags & IOMAP_DIO_SYNCHRONOUS))
+=09=09wait_for_completion =3D true;
=20
 =09dio =3D kmalloc(sizeof(*dio), GFP_KERNEL);
 =09if (!dio)
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index b8a4a3f29b36..0cc843a4a163 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -193,8 +193,7 @@ xfs_file_dio_aio_read(
 =09} else {
 =09=09xfs_ilock(ip, XFS_IOLOCK_SHARED);
 =09}
-=09ret =3D iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL,
-=09=09=09is_sync_kiocb(iocb));
+=09ret =3D iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL, 0);
 =09xfs_iunlock(ip, XFS_IOLOCK_SHARED);
=20
 =09return ret;
@@ -493,6 +492,7 @@ xfs_file_dio_aio_write(
 =09int=09=09=09iolock;
 =09size_t=09=09=09count =3D iov_iter_count(from);
 =09struct xfs_buftarg      *target =3D xfs_inode_buftarg(ip);
+=09unsigned int=09=09dio_flags =3D 0;
=20
 =09/* DIO must be aligned to device logical sector size */
 =09if ((iocb->ki_pos | count) & target->bt_logical_sectormask)
@@ -538,27 +538,24 @@ xfs_file_dio_aio_write(
 =09count =3D iov_iter_count(from);
=20
 =09/*
-=09 * If we are doing unaligned IO, we can't allow any other overlapping I=
O
-=09 * in-flight at the same time or we risk data corruption. Wait for all
-=09 * other IO to drain before we submit. If the IO is aligned, demote the
-=09 * iolock if we had to take the exclusive lock in
+=09 * If we are doing unaligned I/O, we can't allow any other overlapping
+=09 * I/O in-flight at the same time or we risk data corruption.  Wait for
+=09 * all other I/O to drain before we submit and execute the I/O
+=09 * synchronously to prevent subsequent overlapping I/O.  If the I/O is
+=09 * aligned, demote the iolock if we had to take the exclusive lock in
 =09 * xfs_file_aio_write_checks() for other reasons.
 =09 */
 =09if (unaligned_io) {
 =09=09inode_dio_wait(inode);
+=09=09dio_flags =3D IOMAP_DIO_SYNCHRONOUS;
 =09} else if (iolock =3D=3D XFS_IOLOCK_EXCL) {
 =09=09xfs_ilock_demote(ip, XFS_IOLOCK_EXCL);
 =09=09iolock =3D XFS_IOLOCK_SHARED;
 =09}
=20
 =09trace_xfs_file_direct_write(ip, count, iocb->ki_pos);
-=09/*
-=09 * If unaligned, this is the only IO in-flight. Wait on it before we
-=09 * release the iolock to prevent subsequent overlapping IO.
-=09 */
 =09ret =3D iomap_dio_rw(iocb, from, &xfs_direct_write_iomap_ops,
-=09=09=09   &xfs_dio_write_ops,
-=09=09=09   is_sync_kiocb(iocb) || unaligned_io);
+=09=09=09   &xfs_dio_write_ops, dio_flags);
 out:
 =09xfs_iunlock(ip, iolock);
=20
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 8b09463dae0d..3faeb8fd0961 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -244,10 +244,11 @@ int iomap_writepages(struct address_space *mapping,
 =09=09const struct iomap_writeback_ops *ops);
=20
 /*
- * Flags for direct I/O ->end_io:
+ * Flags for iomap_dio_complete and ->end_io:
  */
 #define IOMAP_DIO_UNWRITTEN=09(1 << 0)=09/* covers unwritten extent(s) */
 #define IOMAP_DIO_COW=09=09(1 << 1)=09/* covers COW extent(s) */
+#define IOMAP_DIO_SYNCHRONOUS=09(1 << 2)=09/* no async completion */
=20
 struct iomap_dio_ops {
 =09int (*end_io)(struct kiocb *iocb, ssize_t size, int error,
@@ -256,7 +257,7 @@ struct iomap_dio_ops {
=20
 ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 =09=09const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
-=09=09bool wait_for_completion);
+=09=09unsigned int dio_flags);
 int iomap_dio_iopoll(struct kiocb *kiocb, bool spin);
=20
 #ifdef CONFIG_SWAP
--=20
2.24.1


