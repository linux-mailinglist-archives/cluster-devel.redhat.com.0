Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403B63770
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B87B2EED00;
	Tue,  9 Jul 2019 14:08:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8F15DD92;
	Tue,  9 Jul 2019 14:08:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A63D206D5;
	Tue,  9 Jul 2019 14:08:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7CC5016012 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E8DB831C5; Tue,  9 Jul 2019 14:07:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1680C831B7;
	Tue,  9 Jul 2019 14:07:09 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:43 +0200
Message-Id: <20190709140657.19064-5-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 04/18] gfs2: eliminate tr_num_revoke_rm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 09 Jul 2019 14:08:29 +0000 (UTC)

From: Bob Peterson <rpeterso@redhat.com>

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
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h | 1 -
 fs/gfs2/log.c    | 3 +--
 fs/gfs2/trans.c  | 6 +++---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index c9af93ac6c73..6b7cfc278ce2 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -504,7 +504,6 @@ struct gfs2_trans {
 	unsigned int tr_num_buf_rm;
 	unsigned int tr_num_databuf_rm;
 	unsigned int tr_num_revoke;
-	unsigned int tr_num_revoke_rm;
 
 	struct list_head tr_list;
 	struct list_head tr_databuf;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index c4c9700c366e..58e237fba565 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -882,7 +882,6 @@ static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
 	old->tr_num_buf_rm	+= new->tr_num_buf_rm;
 	old->tr_num_databuf_rm	+= new->tr_num_databuf_rm;
 	old->tr_num_revoke	+= new->tr_num_revoke;
-	old->tr_num_revoke_rm	+= new->tr_num_revoke_rm;
 
 	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
@@ -904,7 +903,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		set_bit(TR_ATTACHED, &tr->tr_flags);
 	}
 
-	sdp->sd_log_commited_revoke += tr->tr_num_revoke - tr->tr_num_revoke_rm;
+	sdp->sd_log_commited_revoke += tr->tr_num_revoke;
 	reserved = calc_reserved(sdp);
 	maxres = sdp->sd_log_blks_reserved + tr->tr_reserved;
 	gfs2_assert_withdraw(sdp, maxres >= reserved);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 6f67ef7aa412..35e3059255fe 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -77,10 +77,10 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
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
@@ -263,7 +263,7 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 			gfs2_assert_withdraw(sdp, sdp->sd_log_num_revoke);
 			sdp->sd_log_num_revoke--;
 			kmem_cache_free(gfs2_bufdata_cachep, bd);
-			tr->tr_num_revoke_rm++;
+			tr->tr_num_revoke--;
 			if (--n == 0)
 				break;
 		}
-- 
2.20.1

