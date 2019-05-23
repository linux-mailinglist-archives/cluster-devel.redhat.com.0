Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F027D92
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85DABC066462;
	Thu, 23 May 2019 13:04:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE96219695;
	Thu, 23 May 2019 13:04:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7701E5B423;
	Thu, 23 May 2019 13:04:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4RUi009890 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5FCB469188; Thu, 23 May 2019 13:04:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B52369189
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:03:57 -0500
Message-Id: <20190523130421.21003-3-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 02/26] gfs2: eliminate
	tr_num_revoke_rm
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 23 May 2019 13:05:08 +0000 (UTC)

For its journal processing, gfs2 kept track of the number of buffers
added and removed on a per-transaction basis. These values are used
to calculate space needed in the journal. But while these calculations
make sense for the number of buffers, they make no sense for revokes.
Revokes are managed in their own list, linked from the superblock.
So it's entirely unnecessary to keep separate per-transaction counts
for revokes added and removed. A single count will do the same job.
Therefore, this patch combines the transaction revokes into a single
count.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h | 1 -
 fs/gfs2/log.c    | 3 +--
 fs/gfs2/trans.c  | 6 +++---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index b15755068593..e22756214570 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -507,7 +507,6 @@ struct gfs2_trans {
 	unsigned int tr_num_buf_rm;
 	unsigned int tr_num_databuf_rm;
 	unsigned int tr_num_revoke;
-	unsigned int tr_num_revoke_rm;
 
 	struct list_head tr_list;
 	struct list_head tr_databuf;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index a2e1df488df0..ed64a3e48a66 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -887,7 +887,6 @@ static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
 	old->tr_num_buf_rm	+= new->tr_num_buf_rm;
 	old->tr_num_databuf_rm	+= new->tr_num_databuf_rm;
 	old->tr_num_revoke	+= new->tr_num_revoke;
-	old->tr_num_revoke_rm	+= new->tr_num_revoke_rm;
 
 	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
@@ -909,7 +908,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		set_bit(TR_ATTACHED, &tr->tr_flags);
 	}
 
-	sdp->sd_log_commited_revoke += tr->tr_num_revoke - tr->tr_num_revoke_rm;
+	sdp->sd_log_commited_revoke += tr->tr_num_revoke;
 	reserved = calc_reserved(sdp);
 	maxres = sdp->sd_log_blks_reserved + tr->tr_reserved;
 	gfs2_assert_withdraw(sdp, maxres >= reserved);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index d328da7cde36..7ebc0f99deb1 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -80,10 +80,10 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
 	fs_warn(sdp, "blocks=%u revokes=%u reserved=%u touched=%u\n",
 		tr->tr_blocks, tr->tr_revokes, tr->tr_reserved,
 		test_bit(TR_TOUCHED, &tr->tr_flags));
-	fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u/%u\n",
+	fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u\n",
 		tr->tr_num_buf_new, tr->tr_num_buf_rm,
 		tr->tr_num_databuf_new, tr->tr_num_databuf_rm,
-		tr->tr_num_revoke, tr->tr_num_revoke_rm);
+		tr->tr_num_revoke);
 }
 
 void gfs2_trans_end(struct gfs2_sbd *sdp)
@@ -266,7 +266,7 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 			gfs2_assert_withdraw(sdp, sdp->sd_log_num_revoke);
 			sdp->sd_log_num_revoke--;
 			kmem_cache_free(gfs2_bufdata_cachep, bd);
-			tr->tr_num_revoke_rm++;
+			tr->tr_num_revoke--;
 			if (--n == 0)
 				break;
 		}
-- 
2.21.0

