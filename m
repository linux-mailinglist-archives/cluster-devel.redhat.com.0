Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EB778C09E
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s9eRiV0bjsPlVBP2JZ1HbVUVRu447v3LqMas7/nWxx8=;
	b=DnfGxTdoeKFqrMVIDU83PgGZtT3vlZSBu0oj1shkok6ucK/pbvtsQBMt8xMMt/aBSUK4DA
	TSyE+InNZg4PemabM4fF5RzisHJJDwJTVVyo4lersQbg++KcMJw9K5vdXL5WH3o653xv4M
	3SX6JvwL8/A7AMKNvcrN3REASAm+vKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-xokDDC99M8K980LHyq4S-w-1; Tue, 29 Aug 2023 04:41:12 -0400
X-MC-Unique: xokDDC99M8K980LHyq4S-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 523BA80557A;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43F9B2166B27;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E622B19465B9;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6F96A19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:03:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 618AA40D283A; Fri, 25 Aug 2023 14:03:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5960E40D2839
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:03:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 241171C0725A
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:03:36 +0000 (UTC)
Received: from out-246.mta1.migadu.com (out-246.mta1.migadu.com
 [95.215.58.246]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-POTFKMJ7PuOLXlF9CHHmBA-1; Fri, 25 Aug 2023 10:03:32 -0400
X-MC-Unique: POTFKMJ7PuOLXlF9CHHmBA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:04 +0800
Message-Id: <20230825135431.1317785-3-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 02/29] xfs: rename XBF_TRYLOCK to XBF_NOWAIT
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

XBF_TRYLOCK means we need lock but don't block on it, we can use it to
stand for not waiting for memory allcation. Rename XBF_TRYLOCK to
XBF_NOWAIT, which is more generic.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_alloc.c       | 2 +-
 fs/xfs/libxfs/xfs_attr_remote.c | 2 +-
 fs/xfs/libxfs/xfs_btree.c       | 2 +-
 fs/xfs/scrub/repair.c           | 2 +-
 fs/xfs/xfs_buf.c                | 6 +++---
 fs/xfs/xfs_buf.h                | 4 ++--
 fs/xfs/xfs_dquot.c              | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_alloc.c b/fs/xfs/libxfs/xfs_alloc.c
index 3069194527dd..a75b9298faa8 100644
--- a/fs/xfs/libxfs/xfs_alloc.c
+++ b/fs/xfs/libxfs/xfs_alloc.c
@@ -3183,7 +3183,7 @@ xfs_alloc_read_agf(
 =09ASSERT((flags & (XFS_ALLOC_FLAG_FREEING | XFS_ALLOC_FLAG_TRYLOCK)) !=3D
 =09=09=09(XFS_ALLOC_FLAG_FREEING | XFS_ALLOC_FLAG_TRYLOCK));
 =09error =3D xfs_read_agf(pag, tp,
-=09=09=09(flags & XFS_ALLOC_FLAG_TRYLOCK) ? XBF_TRYLOCK : 0,
+=09=09=09(flags & XFS_ALLOC_FLAG_TRYLOCK) ? XBF_NOWAIT : 0,
 =09=09=09&agfbp);
 =09if (error)
 =09=09return error;
diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remot=
e.c
index d440393b40eb..2ccb0867824c 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -661,7 +661,7 @@ xfs_attr_rmtval_invalidate(
 =09=09=09return error;
 =09=09if (XFS_IS_CORRUPT(args->dp->i_mount, nmap !=3D 1))
 =09=09=09return -EFSCORRUPTED;
-=09=09error =3D xfs_attr_rmtval_stale(args->dp, &map, XBF_TRYLOCK);
+=09=09error =3D xfs_attr_rmtval_stale(args->dp, &map, XBF_NOWAIT);
 =09=09if (error)
 =09=09=09return error;
=20
diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
index 6a6503ab0cd7..77c4f1d83475 100644
--- a/fs/xfs/libxfs/xfs_btree.c
+++ b/fs/xfs/libxfs/xfs_btree.c
@@ -1343,7 +1343,7 @@ xfs_btree_read_buf_block(
 =09int=09=09=09error;
=20
 =09/* need to sort out how callers deal with failures first */
-=09ASSERT(!(flags & XBF_TRYLOCK));
+=09ASSERT(!(flags & XBF_NOWAIT));
=20
 =09error =3D xfs_btree_ptr_to_daddr(cur, ptr, &d);
 =09if (error)
diff --git a/fs/xfs/scrub/repair.c b/fs/xfs/scrub/repair.c
index ac6d8803e660..9312cf3b20e2 100644
--- a/fs/xfs/scrub/repair.c
+++ b/fs/xfs/scrub/repair.c
@@ -460,7 +460,7 @@ xrep_invalidate_block(
=20
 =09error =3D xfs_buf_incore(sc->mp->m_ddev_targp,
 =09=09=09XFS_FSB_TO_DADDR(sc->mp, fsbno),
-=09=09=09XFS_FSB_TO_BB(sc->mp, 1), XBF_TRYLOCK, &bp);
+=09=09=09XFS_FSB_TO_BB(sc->mp, 1), XBF_NOWAIT, &bp);
 =09if (error)
 =09=09return 0;
=20
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 15d1e5a7c2d3..9f84bc3b802c 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -228,7 +228,7 @@ _xfs_buf_alloc(
 =09 * We don't want certain flags to appear in b_flags unless they are
 =09 * specifically set by later operations on the buffer.
 =09 */
-=09flags &=3D ~(XBF_UNMAPPED | XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD);
+=09flags &=3D ~(XBF_UNMAPPED | XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD);
=20
 =09atomic_set(&bp->b_hold, 1);
 =09atomic_set(&bp->b_lru_ref, 1);
@@ -543,7 +543,7 @@ xfs_buf_find_lock(
 =09struct xfs_buf          *bp,
 =09xfs_buf_flags_t=09=09flags)
 {
-=09if (flags & XBF_TRYLOCK) {
+=09if (flags & XBF_NOWAIT) {
 =09=09if (!xfs_buf_trylock(bp)) {
 =09=09=09XFS_STATS_INC(bp->b_mount, xb_busy_locked);
 =09=09=09return -EAGAIN;
@@ -886,7 +886,7 @@ xfs_buf_readahead_map(
 =09struct xfs_buf=09=09*bp;
=20
 =09xfs_buf_read_map(target, map, nmaps,
-=09=09     XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
+=09=09     XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
 =09=09     __this_address);
 }
=20
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 549c60942208..8cd307626939 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -45,7 +45,7 @@ struct xfs_buf;
=20
 /* flags used only as arguments to access routines */
 #define XBF_INCORE=09 (1u << 29)/* lookup only, return if found in cache *=
/
-#define XBF_TRYLOCK=09 (1u << 30)/* lock requested, but do not wait */
+#define XBF_NOWAIT=09 (1u << 30)/* mem/lock requested, but do not wait */
 #define XBF_UNMAPPED=09 (1u << 31)/* do not map the buffer */
=20
=20
@@ -68,7 +68,7 @@ typedef unsigned int xfs_buf_flags_t;
 =09{ _XBF_DELWRI_Q,=09"DELWRI_Q" }, \
 =09/* The following interface flags should never be set */ \
 =09{ XBF_INCORE,=09=09"INCORE" }, \
-=09{ XBF_TRYLOCK,=09=09"TRYLOCK" }, \
+=09{ XBF_NOWAIT,=09=09"NOWAIT" }, \
 =09{ XBF_UNMAPPED,=09=09"UNMAPPED" }
=20
 /*
diff --git a/fs/xfs/xfs_dquot.c b/fs/xfs/xfs_dquot.c
index 7f071757f278..5bc01ed4b2d7 100644
--- a/fs/xfs/xfs_dquot.c
+++ b/fs/xfs/xfs_dquot.c
@@ -1233,7 +1233,7 @@ xfs_qm_dqflush(
 =09 * Get the buffer containing the on-disk dquot
 =09 */
 =09error =3D xfs_trans_read_buf(mp, NULL, mp->m_ddev_targp, dqp->q_blkno,
-=09=09=09=09   mp->m_quotainfo->qi_dqchunklen, XBF_TRYLOCK,
+=09=09=09=09   mp->m_quotainfo->qi_dqchunklen, XBF_NOWAIT,
 =09=09=09=09   &bp, &xfs_dquot_buf_ops);
 =09if (error =3D=3D -EAGAIN)
 =09=09goto out_unlock;
--=20
2.25.1

