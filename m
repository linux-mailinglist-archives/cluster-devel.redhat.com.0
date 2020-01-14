Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 149DE13AFA9
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MPlsh7yaJP9CTlvM3LOEEyDEjZ9h5XEd/7BF632Hdik=;
	b=JrBDwKX6pg+/CQTs42zZb7h5tvUwkAkdNrkACCH6ldBD3ZLC1W+OWEVbb2gHrYflnb3IHf
	HMh1hZ7VgN4S+POXosGnJUf8po0I8vWIKhob228jGcl5QsEEKOjHGnn7Yw5Rh2SFARgE3k
	lyAzRf9L1vueb5fxyG9pkZXeTDkhr08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-Xh9ZUHsxN7Op2Dm3sCSeyA-1; Tue, 14 Jan 2020 11:40:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31038108B2EF;
	Tue, 14 Jan 2020 16:40:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E874984330;
	Tue, 14 Jan 2020 16:40:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AE4C18089CD;
	Tue, 14 Jan 2020 16:40:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGeCgo021453 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2ACF610AF41C; Tue, 14 Jan 2020 16:40:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2647610AF419
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 061AB10192A7
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-233-NO6ZkvrpPC279-mbLQgfDg-1; Tue, 14 Jan 2020 11:40:07 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOoI-0000Er-Ej; Tue, 14 Jan 2020 16:12:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:23 +0100
Message-Id: <20200114161225.309792-11-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: NO6ZkvrpPC279-mbLQgfDg-1
X-MC-Unique: Xh9ZUHsxN7Op2Dm3sCSeyA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGeCgo021453
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 10/12] xfs: hold i_rwsem until AIO completes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Switch ext4 from the magic i_dio_count scheme to just hold i_rwsem
until the actual I/O has completed to reduce the locking complexity
and avoid nasty bugs due to missing inode_dio_wait calls.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/scrub/bmap.c    |  1 -
 fs/xfs/xfs_bmap_util.c |  3 ---
 fs/xfs/xfs_file.c      | 47 +++++++++++++-----------------------------
 fs/xfs/xfs_icache.c    |  3 +--
 fs/xfs/xfs_ioctl.c     |  1 -
 fs/xfs/xfs_iops.c      |  5 -----
 fs/xfs/xfs_reflink.c   |  2 --
 7 files changed, 15 insertions(+), 47 deletions(-)

diff --git a/fs/xfs/scrub/bmap.c b/fs/xfs/scrub/bmap.c
index fa6ea6407992..d3e4068d3189 100644
--- a/fs/xfs/scrub/bmap.c
+++ b/fs/xfs/scrub/bmap.c
@@ -45,7 +45,6 @@ xchk_setup_inode_bmap(
 =09 */
 =09if (S_ISREG(VFS_I(sc->ip)->i_mode) &&
 =09    sc->sm->sm_type =3D=3D XFS_SCRUB_TYPE_BMBTD) {
-=09=09inode_dio_wait(VFS_I(sc->ip));
 =09=09error =3D filemap_write_and_wait(VFS_I(sc->ip)->i_mapping);
 =09=09if (error)
 =09=09=09goto out;
diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
index e62fb5216341..a454f481107e 100644
--- a/fs/xfs/xfs_bmap_util.c
+++ b/fs/xfs/xfs_bmap_util.c
@@ -674,9 +674,6 @@ xfs_free_eofblocks(
 =09=09if (error)
 =09=09=09return error;
=20
-=09=09/* wait on dio to ensure i_size has settled */
-=09=09inode_dio_wait(VFS_I(ip));
-
 =09=09error =3D xfs_trans_alloc(mp, &M_RES(mp)->tr_itruncate, 0, 0, 0,
 =09=09=09=09&tp);
 =09=09if (error) {
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 0cc843a4a163..d0ee7d2932e4 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -193,9 +193,11 @@ xfs_file_dio_aio_read(
 =09} else {
 =09=09xfs_ilock(ip, XFS_IOLOCK_SHARED);
 =09}
-=09ret =3D iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL, 0);
-=09xfs_iunlock(ip, XFS_IOLOCK_SHARED);
=20
+=09ret =3D iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL,
+=09=09=09   IOMAP_DIO_RWSEM_SHARED);
+=09if (ret !=3D -EIOCBQUEUED)
+=09=09xfs_iunlock(ip, XFS_IOLOCK_SHARED);
 =09return ret;
 }
=20
@@ -341,15 +343,6 @@ xfs_file_aio_write_checks(
 =09=09=09=09xfs_ilock(ip, *iolock);
 =09=09=09=09iov_iter_reexpand(from, count);
 =09=09=09}
-=09=09=09/*
-=09=09=09 * We now have an IO submission barrier in place, but
-=09=09=09 * AIO can do EOF updates during IO completion and hence
-=09=09=09 * we now need to wait for all of them to drain. Non-AIO
-=09=09=09 * DIO will have drained before we are given the
-=09=09=09 * XFS_IOLOCK_EXCL, and so for most cases this wait is a
-=09=09=09 * no-op.
-=09=09=09 */
-=09=09=09inode_dio_wait(inode);
 =09=09=09drained_dio =3D true;
 =09=09=09goto restart;
 =09=09}
@@ -469,13 +462,7 @@ static const struct iomap_dio_ops xfs_dio_write_ops =
=3D {
  * needs to do sub-block zeroing and that requires serialisation against o=
ther
  * direct IOs to the same block. In this case we need to serialise the
  * submission of the unaligned IOs so that we don't get racing block zeroi=
ng in
- * the dio layer.  To avoid the problem with aio, we also need to wait for
- * outstanding IOs to complete so that unwritten extent conversion is comp=
leted
- * before we try to map the overlapping block. This is currently implement=
ed by
- * hitting it with a big hammer (i.e. inode_dio_wait()).
- *
- * Returns with locks held indicated by @iolock and errors indicated by
- * negative return values.
+ * the dio layer.
  */
 STATIC ssize_t
 xfs_file_dio_aio_write(
@@ -546,18 +533,21 @@ xfs_file_dio_aio_write(
 =09 * xfs_file_aio_write_checks() for other reasons.
 =09 */
 =09if (unaligned_io) {
-=09=09inode_dio_wait(inode);
-=09=09dio_flags =3D IOMAP_DIO_SYNCHRONOUS;
-=09} else if (iolock =3D=3D XFS_IOLOCK_EXCL) {
-=09=09xfs_ilock_demote(ip, XFS_IOLOCK_EXCL);
-=09=09iolock =3D XFS_IOLOCK_SHARED;
+=09=09dio_flags =3D IOMAP_DIO_RWSEM_EXCL | IOMAP_DIO_SYNCHRONOUS;
+=09} else {
+=09=09if (iolock =3D=3D XFS_IOLOCK_EXCL) {
+=09=09=09xfs_ilock_demote(ip, XFS_IOLOCK_EXCL);
+=09=09=09iolock =3D XFS_IOLOCK_SHARED;
+=09=09}
+=09=09dio_flags =3D IOMAP_DIO_RWSEM_SHARED;
 =09}
=20
 =09trace_xfs_file_direct_write(ip, count, iocb->ki_pos);
 =09ret =3D iomap_dio_rw(iocb, from, &xfs_direct_write_iomap_ops,
 =09=09=09   &xfs_dio_write_ops, dio_flags);
 out:
-=09xfs_iunlock(ip, iolock);
+=09if (ret !=3D -EIOCBQUEUED)
+=09=09xfs_iunlock(ip, iolock);
=20
 =09/*
 =09 * No fallback to buffered IO on errors for XFS, direct IO will either
@@ -819,15 +809,6 @@ xfs_file_fallocate(
 =09if (error)
 =09=09goto out_unlock;
=20
-=09/*
-=09 * Must wait for all AIO to complete before we continue as AIO can
-=09 * change the file size on completion without holding any locks we
-=09 * currently hold. We must do this first because AIO can update both
-=09 * the on disk and in memory inode sizes, and the operations that follo=
w
-=09 * require the in-memory size to be fully up-to-date.
-=09 */
-=09inode_dio_wait(inode);
-
 =09/*
 =09 * Now AIO and DIO has drained we flush and (if necessary) invalidate
 =09 * the cached range over the first operation we are about to run.
diff --git a/fs/xfs/xfs_icache.c b/fs/xfs/xfs_icache.c
index 8dc2e5414276..9e6f32fd32f5 100644
--- a/fs/xfs/xfs_icache.c
+++ b/fs/xfs/xfs_icache.c
@@ -1720,8 +1720,7 @@ xfs_prep_free_cowblocks(
 =09 */
 =09if ((VFS_I(ip)->i_state & I_DIRTY_PAGES) ||
 =09    mapping_tagged(VFS_I(ip)->i_mapping, PAGECACHE_TAG_DIRTY) ||
-=09    mapping_tagged(VFS_I(ip)->i_mapping, PAGECACHE_TAG_WRITEBACK) ||
-=09    atomic_read(&VFS_I(ip)->i_dio_count))
+=09    mapping_tagged(VFS_I(ip)->i_mapping, PAGECACHE_TAG_WRITEBACK))
 =09=09return false;
=20
 =09return true;
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 7b35d62ede9f..331453f2c4be 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -548,7 +548,6 @@ xfs_ioc_space(
 =09error =3D xfs_break_layouts(inode, &iolock, BREAK_UNMAP);
 =09if (error)
 =09=09goto out_unlock;
-=09inode_dio_wait(inode);
=20
 =09switch (bf->l_whence) {
 =09case 0: /*SEEK_SET*/
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 8afe69ca188b..700edeccc6bf 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -893,11 +893,6 @@ xfs_setattr_size(
 =09if (error)
 =09=09return error;
=20
-=09/*
-=09 * Wait for all direct I/O to complete.
-=09 */
-=09inode_dio_wait(inode);
-
 =09/*
 =09 * File data changes must be complete before we start the transaction t=
o
 =09 * modify the inode.  This needs to be done before joining the inode to
diff --git a/fs/xfs/xfs_reflink.c b/fs/xfs/xfs_reflink.c
index de451235c4ee..f775e60ca6f7 100644
--- a/fs/xfs/xfs_reflink.c
+++ b/fs/xfs/xfs_reflink.c
@@ -1525,8 +1525,6 @@ xfs_reflink_unshare(
=20
 =09trace_xfs_reflink_unshare(ip, offset, len);
=20
-=09inode_dio_wait(inode);
-
 =09error =3D iomap_file_unshare(inode, offset, len,
 =09=09=09&xfs_buffered_write_iomap_ops);
 =09if (error)
--=20
2.24.1


