Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF678C09C
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CdGEQETDwE+Uoi7ezMKKcl/TFxh2iy7JvcCWfpqxv/Y=;
	b=NxUfmUHVCedAjjC1g7Z3Qchu4YGbh4ECHKksKhL2WxJ9B4gLFtxWSiC2JpEuZZyOPUxeZ3
	2YXkiJA2a8awQabt8na9/qKvf3/jAhRWyhS25mrGbGt2qtELcARt6OAuKejN/FV1YNzVCx
	1LE0M/VN7MFryJZr3o5yS51+zKtWp3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-696-s4QsWgstM6W6PxQOFiIEig-1; Tue, 29 Aug 2023 04:41:16 -0400
X-MC-Unique: s4QsWgstM6W6PxQOFiIEig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 882AF102B55E;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AD9D40C206F;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 57D1619465BD;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6360019465A8 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 27 Aug 2023 13:30:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4405B40C2070; Sun, 27 Aug 2023 13:30:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CC6D40C2063
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:30:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CFBE1C0514D
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:30:59 +0000 (UTC)
Received: from out-253.mta1.migadu.com (out-253.mta1.migadu.com
 [95.215.58.253]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-2Ym2YxnUORO3nBL8R23sng-1; Sun, 27 Aug 2023 09:30:56 -0400
X-MC-Unique: 2Ym2YxnUORO3nBL8R23sng-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:26 +0800
Message-Id: <20230827132835.1373581-3-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 02/11] xfs: add NOWAIT semantics for readdir
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Implement NOWAIT semantics for readdir. Return EAGAIN error to the
caller if it would block, like failing to get locks, or going to
do IO.

Co-developed-by: Dave Chinner <dchinner@redhat.com>
Signed-off-by: Dave Chinner <dchinner@redhat.com>
Signed-off-by: Hao Xu <howeyxu@tencent.com>
[fixes deadlock issue, tweak code style]
---
 fs/xfs/libxfs/xfs_da_btree.c   | 16 +++++++++++
 fs/xfs/libxfs/xfs_da_btree.h   |  1 +
 fs/xfs/libxfs/xfs_dir2_block.c |  7 ++---
 fs/xfs/libxfs/xfs_dir2_priv.h  |  2 +-
 fs/xfs/scrub/dir.c             |  2 +-
 fs/xfs/scrub/readdir.c         |  2 +-
 fs/xfs/xfs_dir2_readdir.c      | 49 ++++++++++++++++++++++++++--------
 fs/xfs/xfs_inode.c             | 27 +++++++++++++++++++
 fs/xfs/xfs_inode.h             | 17 +++++++-----
 9 files changed, 99 insertions(+), 24 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_da_btree.c b/fs/xfs/libxfs/xfs_da_btree.c
index e576560b46e9..7a1a0af24197 100644
--- a/fs/xfs/libxfs/xfs_da_btree.c
+++ b/fs/xfs/libxfs/xfs_da_btree.c
@@ -2643,16 +2643,32 @@ xfs_da_read_buf(
 =09struct xfs_buf_map=09map, *mapp =3D &map;
 =09int=09=09=09nmap =3D 1;
 =09int=09=09=09error;
+=09int=09=09=09buf_flags =3D 0;
=20
 =09*bpp =3D NULL;
 =09error =3D xfs_dabuf_map(dp, bno, flags, whichfork, &mapp, &nmap);
 =09if (error || !nmap)
 =09=09goto out_free;
=20
+=09/*
+=09 * NOWAIT semantics mean we don't wait on the buffer lock nor do we
+=09 * issue IO for this buffer if it is not already in memory. Caller will
+=09 * retry. This will return -EAGAIN if the buffer is in memory and canno=
t
+=09 * be locked, and no buffer and no error if it isn't in memory.  We
+=09 * translate both of those into a return state of -EAGAIN and *bpp =3D
+=09 * NULL.
+=09 */
+=09if (flags & XFS_DABUF_NOWAIT)
+=09=09buf_flags |=3D XBF_TRYLOCK | XBF_INCORE;
 =09error =3D xfs_trans_read_buf_map(mp, tp, mp->m_ddev_targp, mapp, nmap, =
0,
 =09=09=09&bp, ops);
 =09if (error)
 =09=09goto out_free;
+=09if (!bp) {
+=09=09ASSERT(flags & XFS_DABUF_NOWAIT);
+=09=09error =3D -EAGAIN;
+=09=09goto out_free;
+=09}
=20
 =09if (whichfork =3D=3D XFS_ATTR_FORK)
 =09=09xfs_buf_set_ref(bp, XFS_ATTR_BTREE_REF);
diff --git a/fs/xfs/libxfs/xfs_da_btree.h b/fs/xfs/libxfs/xfs_da_btree.h
index ffa3df5b2893..32e7b1cca402 100644
--- a/fs/xfs/libxfs/xfs_da_btree.h
+++ b/fs/xfs/libxfs/xfs_da_btree.h
@@ -205,6 +205,7 @@ int=09xfs_da3_node_read_mapped(struct xfs_trans *tp, st=
ruct xfs_inode *dp,
  */
=20
 #define XFS_DABUF_MAP_HOLE_OK=09(1u << 0)
+#define XFS_DABUF_NOWAIT=09(1u << 1)
=20
 int=09xfs_da_grow_inode(xfs_da_args_t *args, xfs_dablk_t *new_blkno);
 int=09xfs_da_grow_inode_int(struct xfs_da_args *args, xfs_fileoff_t *bno,
diff --git a/fs/xfs/libxfs/xfs_dir2_block.c b/fs/xfs/libxfs/xfs_dir2_block.=
c
index 00f960a703b2..59b24a594add 100644
--- a/fs/xfs/libxfs/xfs_dir2_block.c
+++ b/fs/xfs/libxfs/xfs_dir2_block.c
@@ -135,13 +135,14 @@ int
 xfs_dir3_block_read(
 =09struct xfs_trans=09*tp,
 =09struct xfs_inode=09*dp,
+=09unsigned int=09=09flags,
 =09struct xfs_buf=09=09**bpp)
 {
 =09struct xfs_mount=09*mp =3D dp->i_mount;
 =09xfs_failaddr_t=09=09fa;
 =09int=09=09=09err;
=20
-=09err =3D xfs_da_read_buf(tp, dp, mp->m_dir_geo->datablk, 0, bpp,
+=09err =3D xfs_da_read_buf(tp, dp, mp->m_dir_geo->datablk, flags, bpp,
 =09=09=09=09XFS_DATA_FORK, &xfs_dir3_block_buf_ops);
 =09if (err || !*bpp)
 =09=09return err;
@@ -380,7 +381,7 @@ xfs_dir2_block_addname(
 =09tp =3D args->trans;
=20
 =09/* Read the (one and only) directory block into bp. */
-=09error =3D xfs_dir3_block_read(tp, dp, &bp);
+=09error =3D xfs_dir3_block_read(tp, dp, 0, &bp);
 =09if (error)
 =09=09return error;
=20
@@ -695,7 +696,7 @@ xfs_dir2_block_lookup_int(
 =09dp =3D args->dp;
 =09tp =3D args->trans;
=20
-=09error =3D xfs_dir3_block_read(tp, dp, &bp);
+=09error =3D xfs_dir3_block_read(tp, dp, 0, &bp);
 =09if (error)
 =09=09return error;
=20
diff --git a/fs/xfs/libxfs/xfs_dir2_priv.h b/fs/xfs/libxfs/xfs_dir2_priv.h
index 7404a9ff1a92..7d4cf8a0f15b 100644
--- a/fs/xfs/libxfs/xfs_dir2_priv.h
+++ b/fs/xfs/libxfs/xfs_dir2_priv.h
@@ -51,7 +51,7 @@ extern int xfs_dir_cilookup_result(struct xfs_da_args *ar=
gs,
=20
 /* xfs_dir2_block.c */
 extern int xfs_dir3_block_read(struct xfs_trans *tp, struct xfs_inode *dp,
-=09=09=09       struct xfs_buf **bpp);
+=09=09=09       unsigned int flags, struct xfs_buf **bpp);
 extern int xfs_dir2_block_addname(struct xfs_da_args *args);
 extern int xfs_dir2_block_lookup(struct xfs_da_args *args);
 extern int xfs_dir2_block_removename(struct xfs_da_args *args);
diff --git a/fs/xfs/scrub/dir.c b/fs/xfs/scrub/dir.c
index 0b491784b759..5cc51f201bd7 100644
--- a/fs/xfs/scrub/dir.c
+++ b/fs/xfs/scrub/dir.c
@@ -313,7 +313,7 @@ xchk_directory_data_bestfree(
 =09=09/* dir block format */
 =09=09if (lblk !=3D XFS_B_TO_FSBT(mp, XFS_DIR2_DATA_OFFSET))
 =09=09=09xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, lblk);
-=09=09error =3D xfs_dir3_block_read(sc->tp, sc->ip, &bp);
+=09=09error =3D xfs_dir3_block_read(sc->tp, sc->ip, 0, &bp);
 =09} else {
 =09=09/* dir data format */
 =09=09error =3D xfs_dir3_data_read(sc->tp, sc->ip, lblk, 0, &bp);
diff --git a/fs/xfs/scrub/readdir.c b/fs/xfs/scrub/readdir.c
index e51c1544be63..f0a727311632 100644
--- a/fs/xfs/scrub/readdir.c
+++ b/fs/xfs/scrub/readdir.c
@@ -101,7 +101,7 @@ xchk_dir_walk_block(
 =09unsigned int=09=09off, next_off, end;
 =09int=09=09=09error;
=20
-=09error =3D xfs_dir3_block_read(sc->tp, dp, &bp);
+=09error =3D xfs_dir3_block_read(sc->tp, dp, 0, &bp);
 =09if (error)
 =09=09return error;
=20
diff --git a/fs/xfs/xfs_dir2_readdir.c b/fs/xfs/xfs_dir2_readdir.c
index 9f3ceb461515..dcdbd26e0402 100644
--- a/fs/xfs/xfs_dir2_readdir.c
+++ b/fs/xfs/xfs_dir2_readdir.c
@@ -149,6 +149,7 @@ xfs_dir2_block_getdents(
 =09struct xfs_da_geometry=09*geo =3D args->geo;
 =09unsigned int=09=09offset, next_offset;
 =09unsigned int=09=09end;
+=09unsigned int=09=09flags =3D 0;
=20
 =09/*
 =09 * If the block number in the offset is out of range, we're done.
@@ -156,7 +157,9 @@ xfs_dir2_block_getdents(
 =09if (xfs_dir2_dataptr_to_db(geo, ctx->pos) > geo->datablk)
 =09=09return 0;
=20
-=09error =3D xfs_dir3_block_read(args->trans, dp, &bp);
+=09if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
+=09=09flags |=3D XFS_DABUF_NOWAIT;
+=09error =3D xfs_dir3_block_read(args->trans, dp, flags, &bp);
 =09if (error)
 =09=09return error;
=20
@@ -240,6 +243,7 @@ xfs_dir2_block_getdents(
 STATIC int
 xfs_dir2_leaf_readbuf(
 =09struct xfs_da_args=09*args,
+=09struct dir_context=09*ctx,
 =09size_t=09=09=09bufsize,
 =09xfs_dir2_off_t=09=09*cur_off,
 =09xfs_dablk_t=09=09*ra_blk,
@@ -258,10 +262,15 @@ xfs_dir2_leaf_readbuf(
 =09struct xfs_iext_cursor=09icur;
 =09int=09=09=09ra_want;
 =09int=09=09=09error =3D 0;
-
-=09error =3D xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
-=09if (error)
-=09=09goto out;
+=09unsigned int=09=09flags =3D 0;
+
+=09if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
+=09=09flags |=3D XFS_DABUF_NOWAIT;
+=09} else {
+=09=09error =3D xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
+=09=09if (error)
+=09=09=09goto out;
+=09}
=20
 =09/*
 =09 * Look for mapped directory blocks at or above the current offset.
@@ -280,7 +289,7 @@ xfs_dir2_leaf_readbuf(
 =09new_off =3D xfs_dir2_da_to_byte(geo, map.br_startoff);
 =09if (new_off > *cur_off)
 =09=09*cur_off =3D new_off;
-=09error =3D xfs_dir3_data_read(args->trans, dp, map.br_startoff, 0, &bp);
+=09error =3D xfs_dir3_data_read(args->trans, dp, map.br_startoff, flags, &=
bp);
 =09if (error)
 =09=09goto out;
=20
@@ -360,6 +369,7 @@ xfs_dir2_leaf_getdents(
 =09int=09=09=09byteoff;=09/* offset in current block */
 =09unsigned int=09=09offset =3D 0;
 =09int=09=09=09error =3D 0;=09/* error return value */
+=09int=09=09=09written =3D 0;
=20
 =09/*
 =09 * If the offset is at or past the largest allowed value,
@@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
 =09=09=09=09bp =3D NULL;
 =09=09=09}
=20
-=09=09=09if (*lock_mode =3D=3D 0)
-=09=09=09=09*lock_mode =3D xfs_ilock_data_map_shared(dp);
-=09=09=09error =3D xfs_dir2_leaf_readbuf(args, bufsize, &curoff,
-=09=09=09=09=09&rablk, &bp);
+=09=09=09if (*lock_mode =3D=3D 0) {
+=09=09=09=09*lock_mode =3D
+=09=09=09=09=09xfs_ilock_data_map_shared_generic(dp,
+=09=09=09=09=09ctx->flags & DIR_CONTEXT_F_NOWAIT);
+=09=09=09=09if (!*lock_mode) {
+=09=09=09=09=09error =3D -EAGAIN;
+=09=09=09=09=09break;
+=09=09=09=09}
+=09=09=09}
+=09=09=09error =3D xfs_dir2_leaf_readbuf(args, ctx, bufsize,
+=09=09=09=09=09&curoff, &rablk, &bp);
 =09=09=09if (error || !bp)
 =09=09=09=09break;
=20
@@ -479,6 +496,7 @@ xfs_dir2_leaf_getdents(
 =09=09 */
 =09=09offset +=3D length;
 =09=09curoff +=3D length;
+=09=09written +=3D length;
 =09=09/* bufsize may have just been a guess; don't go negative */
 =09=09bufsize =3D bufsize > length ? bufsize - length : 0;
 =09}
@@ -492,6 +510,8 @@ xfs_dir2_leaf_getdents(
 =09=09ctx->pos =3D xfs_dir2_byte_to_dataptr(curoff) & 0x7fffffff;
 =09if (bp)
 =09=09xfs_trans_brelse(args->trans, bp);
+=09if (error =3D=3D -EAGAIN && written > 0)
+=09=09error =3D 0;
 =09return error;
 }
=20
@@ -514,6 +534,7 @@ xfs_readdir(
 =09unsigned int=09=09lock_mode;
 =09bool=09=09=09isblock;
 =09int=09=09=09error;
+=09bool=09=09=09nowait;
=20
 =09trace_xfs_readdir(dp);
=20
@@ -531,7 +552,11 @@ xfs_readdir(
 =09if (dp->i_df.if_format =3D=3D XFS_DINODE_FMT_LOCAL)
 =09=09return xfs_dir2_sf_getdents(&args, ctx);
=20
-=09lock_mode =3D xfs_ilock_data_map_shared(dp);
+=09nowait =3D ctx->flags & DIR_CONTEXT_F_NOWAIT;
+=09lock_mode =3D xfs_ilock_data_map_shared_generic(dp, nowait);
+=09if (!lock_mode)
+=09=09return -EAGAIN;
+
 =09error =3D xfs_dir2_isblock(&args, &isblock);
 =09if (error)
 =09=09goto out_unlock;
@@ -546,5 +571,7 @@ xfs_readdir(
 out_unlock:
 =09if (lock_mode)
 =09=09xfs_iunlock(dp, lock_mode);
+=09if (error =3D=3D -EAGAIN)
+=09=09ASSERT(nowait);
 =09return error;
 }
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index 9e62cc500140..d088f7d0c23a 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -120,6 +120,33 @@ xfs_ilock_data_map_shared(
 =09return lock_mode;
 }
=20
+/*
+ * Similar to xfs_ilock_data_map_shared(), except that it will only try to=
 lock
+ * the inode in shared mode if the extents are already in memory. If it fa=
ils to
+ * get the lock or has to do IO to read the extent list, fail the operatio=
n by
+ * returning 0 as the lock mode.
+ */
+uint
+xfs_ilock_data_map_shared_nowait(
+=09struct xfs_inode=09*ip)
+{
+=09if (xfs_need_iread_extents(&ip->i_df))
+=09=09return 0;
+=09if (!xfs_ilock_nowait(ip, XFS_ILOCK_SHARED))
+=09=09return 0;
+=09return XFS_ILOCK_SHARED;
+}
+
+int
+xfs_ilock_data_map_shared_generic(
+=09struct xfs_inode=09*dp,
+=09bool=09=09=09nowait)
+{
+=09if (nowait)
+=09=09return xfs_ilock_data_map_shared_nowait(dp);
+=09return xfs_ilock_data_map_shared(dp);
+}
+
 uint
 xfs_ilock_attr_map_shared(
 =09struct xfs_inode=09*ip)
diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
index 7547caf2f2ab..ea206a5a27df 100644
--- a/fs/xfs/xfs_inode.h
+++ b/fs/xfs/xfs_inode.h
@@ -490,13 +490,16 @@ int=09=09xfs_rename(struct mnt_idmap *idmap,
 =09=09=09   struct xfs_name *target_name,
 =09=09=09   struct xfs_inode *target_ip, unsigned int flags);
=20
-void=09=09xfs_ilock(xfs_inode_t *, uint);
-int=09=09xfs_ilock_nowait(xfs_inode_t *, uint);
-void=09=09xfs_iunlock(xfs_inode_t *, uint);
-void=09=09xfs_ilock_demote(xfs_inode_t *, uint);
-bool=09=09xfs_isilocked(struct xfs_inode *, uint);
-uint=09=09xfs_ilock_data_map_shared(struct xfs_inode *);
-uint=09=09xfs_ilock_attr_map_shared(struct xfs_inode *);
+void=09=09xfs_ilock(struct xfs_inode *ip, uint lockmode);
+int=09=09xfs_ilock_nowait(struct xfs_inode *ip, uint lockmode);
+void=09=09xfs_iunlock(struct xfs_inode *ip, uint lockmode);
+void=09=09xfs_ilock_demote(struct xfs_inode *ip, uint lockmode);
+bool=09=09xfs_isilocked(struct xfs_inode *ip, uint lockmode);
+uint=09=09xfs_ilock_data_map_shared(struct xfs_inode *ip);
+uint=09=09xfs_ilock_data_map_shared_nowait(struct xfs_inode *ip);
+int=09=09xfs_ilock_data_map_shared_generic(struct xfs_inode *ip,
+=09=09=09=09=09=09  bool nowait);
+uint=09=09xfs_ilock_attr_map_shared(struct xfs_inode *ip);
=20
 uint=09=09xfs_ip2xflags(struct xfs_inode *);
 int=09=09xfs_ifree(struct xfs_trans *, struct xfs_inode *);
--=20
2.25.1

