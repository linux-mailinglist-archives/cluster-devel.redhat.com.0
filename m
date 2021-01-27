Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 163C33065B4
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W5lVpvPuPoNDEITsPTXkR95ZOBTjLQRv3ydcuztEYAo=;
	b=Fslv5VL6AxpBQTf7eR50VfHrvSmg/6r9UiuP2G9cz91BP1lvMX8cYE2bbi2AU3CI6KNFsN
	DFx5n066PMioSFCY32dKZRrgcihgX9oxXE0oHS9OFEdfVYq9NjO/iogVyNY1YM9A7uwl04
	rtGrJJ587/iJ9/1o7JuCoIt06LkywVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-36n9vmubPM6TkBJNMZJ4Uw-1; Wed, 27 Jan 2021 16:11:55 -0500
X-MC-Unique: 36n9vmubPM6TkBJNMZJ4Uw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 772D1180A097;
	Wed, 27 Jan 2021 21:11:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A2B5D9CA;
	Wed, 27 Jan 2021 21:11:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D1D21809CAD;
	Wed, 27 Jan 2021 21:11:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL81GW013817 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:08:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C77175B4A4; Wed, 27 Jan 2021 21:08:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B55C1F0;
	Wed, 27 Jan 2021 21:08:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:35 +0100
Message-Id: <20210127210746.16958-10-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 09/20] gfs2: Get rid of sd_reserving_log
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This counter and the associated wait queue are only used so that
gfs2_make_fs_ro can efficiently wait for all pending log space
allocations to fail after setting the filesystem to read-only.  This
comes at the cost of waking up that wait queue very frequently.

Instead, when gfs2_log_reserve fails because the filesystem has become
read-only, Wake up sd_log_waitq.  In gfs2_make_fs_ro, set the file
system read-only and then wait until all the log space has been
released.  Give up and report the problem after a while.  With that,
sd_reserving_log and sd_reserving_log_wait can be removed.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h     |  3 ---
 fs/gfs2/log.c        | 17 ++++++++++-------
 fs/gfs2/log.h        |  1 +
 fs/gfs2/ops_fstype.c |  2 --
 fs/gfs2/super.c      | 12 ++++++------
 fs/gfs2/trans.c      |  5 ++++-
 6 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 958810e533ad..c155fd39bc98 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -848,9 +848,6 @@ struct gfs2_sbd {
 	int sd_log_error; /* First log error */
 	wait_queue_head_t sd_withdraw_wait;
 
-	atomic_t sd_reserving_log;
-	wait_queue_head_t sd_reserving_log_wait;
-
 	unsigned int sd_log_flush_head;
 
 	spinlock_t sd_ail_lock;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 721d2d7f0efd..2e84ba153cdf 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -397,6 +397,15 @@ static void ail2_empty(struct gfs2_sbd *sdp, unsigned int new_tail)
 	spin_unlock(&sdp->sd_ail_lock);
 }
 
+/**
+ * gfs2_log_is_empty - Check if the log is empty
+ * @sdp: The GFS2 superblock
+ */
+
+bool gfs2_log_is_empty(struct gfs2_sbd *sdp) {
+	return atomic_read(&sdp->sd_log_blks_free) == sdp->sd_jdesc->jd_blocks;
+}
+
 /**
  * gfs2_log_release - Release a given number of log blocks
  * @sdp: The GFS2 superblock
@@ -461,13 +470,9 @@ int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
 		} while(free_blocks <= wanted);
 		finish_wait(&sdp->sd_log_waitq, &wait);
 	}
-	atomic_inc(&sdp->sd_reserving_log);
 	if (atomic_cmpxchg(&sdp->sd_log_blks_free, free_blocks,
-				free_blocks - blks) != free_blocks) {
-		if (atomic_dec_and_test(&sdp->sd_reserving_log))
-			wake_up(&sdp->sd_reserving_log_wait);
+				free_blocks - blks) != free_blocks)
 		goto retry;
-	}
 	atomic_sub(blks, &sdp->sd_log_blks_needed);
 	trace_gfs2_log_blocks(sdp, -blks);
 
@@ -483,8 +488,6 @@ int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
 		gfs2_log_release(sdp, blks);
 		ret = -EROFS;
 	}
-	if (atomic_dec_and_test(&sdp->sd_reserving_log))
-		wake_up(&sdp->sd_reserving_log_wait);
 	return ret;
 }
 
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index a9cdbc990edf..16efbe614279 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -64,6 +64,7 @@ static inline void gfs2_ordered_add_inode(struct gfs2_inode *ip)
 extern void gfs2_ordered_del_inode(struct gfs2_inode *ip);
 extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct);
 extern void gfs2_remove_from_ail(struct gfs2_bufdata *bd);
+extern bool gfs2_log_is_empty(struct gfs2_sbd *sdp);
 extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks);
 extern int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
 extern void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 61fce59cb4d3..986dc2ebebf0 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -136,8 +136,6 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 
 	init_rwsem(&sdp->sd_log_flush_lock);
 	atomic_set(&sdp->sd_log_in_flight, 0);
-	atomic_set(&sdp->sd_reserving_log, 0);
-	init_waitqueue_head(&sdp->sd_reserving_log_wait);
 	init_waitqueue_head(&sdp->sd_log_flush_wait);
 	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
 	mutex_init(&sdp->sd_freeze_mutex);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index ed7a829e9ffe..f188277f7d48 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -645,13 +645,13 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 
 		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
 			       GFS2_LFC_MAKE_FS_RO);
-		wait_event(sdp->sd_reserving_log_wait,
-			   atomic_read(&sdp->sd_reserving_log) == 0);
-		gfs2_assert_warn(sdp, atomic_read(&sdp->sd_log_blks_free) ==
-				 sdp->sd_jdesc->jd_blocks);
+		wait_event_timeout(sdp->sd_log_waitq,
+				   gfs2_log_is_empty(sdp),
+				   HZ * 5);
+		gfs2_assert_warn(sdp, gfs2_log_is_empty(sdp));
 	} else {
-		wait_event_timeout(sdp->sd_reserving_log_wait,
-				   atomic_read(&sdp->sd_reserving_log) == 0,
+		wait_event_timeout(sdp->sd_log_waitq,
+				   gfs2_log_is_empty(sdp),
 				   HZ * 5);
 	}
 	if (gfs2_holder_initialized(&freeze_gh))
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 4f461ab37ced..e33cb8da056a 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -73,8 +73,11 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	sb_start_intwrite(sdp->sd_vfs);
 
 	error = gfs2_log_reserve(sdp, tr->tr_reserved);
-	if (error)
+	if (error) {
+		if (error == -EROFS)
+			wake_up(&sdp->sd_log_waitq);
 		goto fail;
+	}
 
 	current->journal_info = tr;
 
-- 
2.26.2

