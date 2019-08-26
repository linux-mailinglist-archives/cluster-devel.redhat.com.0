Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D959D3D1
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Aug 2019 18:18:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3C777FDCA;
	Mon, 26 Aug 2019 16:18:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7BA71001DD7;
	Mon, 26 Aug 2019 16:18:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29E811802218;
	Mon, 26 Aug 2019 16:18:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7QGIU4s011479 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Aug 2019 12:18:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87C00196AE; Mon, 26 Aug 2019 16:18:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-227.brq.redhat.com [10.40.204.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAF6219D7A;
	Mon, 26 Aug 2019 16:18:27 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 26 Aug 2019 18:18:25 +0200
Message-Id: <20190826161825.11100-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Get rid of gfs2_io_error_bh_wd
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 26 Aug 2019 16:18:34 +0000 (UTC)

[This is a follow-up to patch "gfs2: Introduce concept of a pending withdraw"
in Bob's recovery patch queue, which introduces the SDF_WITHDRAWING flag.]

Get rid of gfs2_io_error_bh_wd and make gfs2_io_error_bh withdraw implicitly
again.  If the SDF_WITHDRAWING flag is set, skip the withdraw.  This reverts
the rest of commit 9e1a9ecd13b9.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c     | 4 ++--
 fs/gfs2/lops.c    | 2 +-
 fs/gfs2/meta_io.c | 4 ++--
 fs/gfs2/util.c    | 8 +++-----
 fs/gfs2/util.h    | 8 ++------
 5 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 08079eb82127..eccaaf817e95 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -107,8 +107,8 @@ __acquires(&sdp->sd_ail_lock)
 			if (!buffer_uptodate(bh) &&
 			    !test_and_set_bit(SDF_AIL1_IO_ERROR,
 					      &sdp->sd_flags)) {
-				gfs2_io_error_bh(sdp, bh);
 				set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
+				gfs2_io_error_bh(sdp, bh);
 			}
 			list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 			continue;
@@ -204,8 +204,8 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 			continue;
 		if (!buffer_uptodate(bh) &&
 		    !test_and_set_bit(SDF_AIL1_IO_ERROR, &sdp->sd_flags)) {
-			gfs2_io_error_bh(sdp, bh);
 			set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
+			gfs2_io_error_bh(sdp, bh);
 		}
 		list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 	}
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 5b17979af539..df2e165239e5 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -48,7 +48,7 @@ void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh)
 	if (test_set_buffer_pinned(bh))
 		gfs2_assert_withdraw(sdp, 0);
 	if (!buffer_uptodate(bh))
-		gfs2_io_error_bh_wd(sdp, bh);
+		gfs2_io_error_bh(sdp, bh);
 	bd = bh->b_private;
 	/* If this buffer is in the AIL and it has already been written
 	 * to in-place disk block, remove it from the AIL.
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 0c3772974030..f37cc4e829d5 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -290,7 +290,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 	if (unlikely(!buffer_uptodate(bh))) {
 		struct gfs2_trans *tr = current->journal_info;
 		if (tr && test_bit(TR_TOUCHED, &tr->tr_flags))
-			gfs2_io_error_bh_wd(sdp, bh);
+			gfs2_io_error_bh(sdp, bh);
 		brelse(bh);
 		*bhp = NULL;
 		return -EIO;
@@ -317,7 +317,7 @@ int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 	if (!buffer_uptodate(bh)) {
 		struct gfs2_trans *tr = current->journal_info;
 		if (tr && test_bit(TR_TOUCHED, &tr->tr_flags))
-			gfs2_io_error_bh_wd(sdp, bh);
+			gfs2_io_error_bh(sdp, bh);
 		return -EIO;
 	}
 	if (unlikely(gfs2_withdrawn(sdp)))
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index d0deea1f6b95..976f55a18f7e 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -251,21 +251,19 @@ int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function, char *file,
 
 /**
  * gfs2_io_error_bh_i - Flag a buffer I/O error
- * @withdraw: withdraw the filesystem
  */
 
 void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct buffer_head *bh,
-			const char *function, char *file, unsigned int line,
-			bool withdraw)
+			const char *function, char *file, unsigned int line)
 {
-	if (gfs2_withdrawn(sdp))
+	if (test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
 		return;
 
 	fs_err(sdp, "fatal: I/O error\n"
 	       "  block = %llu\n"
 	       "  function = %s, file = %s, line = %u\n",
 	       (unsigned long long)bh->b_blocknr, function, file, line);
-	if (withdraw)
+	if (!test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
 		gfs2_lm_withdraw(sdp, NULL);
 }
 
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 858ab5b15a6c..bab7bc6973cc 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -134,14 +134,10 @@ gfs2_io_error_i((sdp), __func__, __FILE__, __LINE__);
 
 
 void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct buffer_head *bh,
-			const char *function, char *file, unsigned int line,
-			bool withdraw);
-
-#define gfs2_io_error_bh_wd(sdp, bh) \
-gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__, true);
+			const char *function, char *file, unsigned int line);
 
 #define gfs2_io_error_bh(sdp, bh) \
-gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__, false);
+gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__);
 
 
 extern struct kmem_cache *gfs2_glock_cachep;
-- 
2.20.1

