Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC516C3C
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 22:32:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AD1E30970CF;
	Tue,  7 May 2019 20:32:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB72B60C4D;
	Tue,  7 May 2019 20:32:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEEBD41F3D;
	Tue,  7 May 2019 20:32:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47KWFH3018831 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 16:32:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DF9717CC3; Tue,  7 May 2019 20:32:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22538608CA;
	Tue,  7 May 2019 20:32:13 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 22:31:57 +0200
Message-Id: <20190507203204.26008-5-agruenba@redhat.com>
In-Reply-To: <20190507203204.26008-1-agruenba@redhat.com>
References: <20190507203204.26008-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 05/12] gfs2: Replace gl_revokes with a
	GLF flag
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 07 May 2019 20:32:17 +0000 (UTC)

From: Bob Peterson <rpeterso@redhat.com>

The gl_revokes value determines how many outstanding revokes a glock has
on the superblock revokes list; this is used to avoid unnecessary log
flushes.  However, gl_revokes is only ever tested for being zero, and it's
only decremented in revoke_lo_after_commit, which removes all revokes
from the list, so we know that the gl_revoke values of all the glocks on
the list will reach zero.  Therefore, we can replace gl_revokes with a
bit flag. This saves an atomic counter in struct gfs2_glock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  |  4 ++--
 fs/gfs2/incore.h |  2 +-
 fs/gfs2/log.c    |  4 +++-
 fs/gfs2/lops.c   | 33 ++++++++++++++++++++++++---------
 fs/gfs2/main.c   |  1 -
 fs/gfs2/super.c  |  2 +-
 6 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 71c28ff98b56..15c605cfcfc8 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -140,7 +140,7 @@ void gfs2_glock_free(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 
-	BUG_ON(atomic_read(&gl->gl_revokes));
+	BUG_ON(test_bit(GLF_REVOKES, &gl->gl_flags));
 	rhashtable_remove_fast(&gl_hash_table, &gl->gl_node, ht_parms);
 	smp_mb();
 	wake_up_glock(gl);
@@ -1801,7 +1801,7 @@ void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl)
 		  state2str(gl->gl_target),
 		  state2str(gl->gl_demote_state), dtime,
 		  atomic_read(&gl->gl_ail_count),
-		  atomic_read(&gl->gl_revokes),
+		  test_bit(GLF_REVOKES, &gl->gl_flags) ? 1 : 0,
 		  (int)gl->gl_lockref.count, gl->gl_hold_time);
 
 	list_for_each_entry(gh, &gl->gl_holders, gh_list)
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 86840a70ee1a..6a94b094a904 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -345,6 +345,7 @@ enum {
 	GLF_OBJECT			= 14, /* Used only for tracing */
 	GLF_BLOCKING			= 15,
 	GLF_INODE_CREATING		= 16, /* Inode creation occurring */
+	GLF_REVOKES			= 17, /* Glock has revokes in queue */
 };
 
 struct gfs2_glock {
@@ -374,7 +375,6 @@ struct gfs2_glock {
 	struct list_head gl_lru;
 	struct list_head gl_ail_list;
 	atomic_t gl_ail_count;
-	atomic_t gl_revokes;
 	struct delayed_work gl_work;
 	union {
 		/* For inode and iopen glocks only */
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 7ba94b66c91b..d55315a46ece 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -606,8 +606,10 @@ void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 	gfs2_remove_from_ail(bd); /* drops ref on bh */
 	bd->bd_bh = NULL;
 	sdp->sd_log_num_revoke++;
-	if (atomic_inc_return(&gl->gl_revokes) == 1)
+	if (!test_bit(GLF_REVOKES, &gl->gl_flags)) {
+		set_bit(GLF_REVOKES, &gl->gl_flags);
 		gfs2_glock_hold(gl);
+	}
 	set_bit(GLF_LFLUSH, &gl->gl_flags);
 	list_add(&bd->bd_list, &sdp->sd_log_le_revoke);
 }
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index b4f0a6a3ba59..2fd61853ba63 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -662,19 +662,34 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	struct list_head *head = &sdp->sd_log_le_revoke;
-	struct gfs2_bufdata *bd;
-	struct gfs2_glock *gl;
+	struct gfs2_bufdata *bd, *tmp;
 
-	while (!list_empty(head)) {
-		bd = list_entry(head->next, struct gfs2_bufdata, bd_list);
-		list_del_init(&bd->bd_list);
-		gl = bd->bd_gl;
-		if (atomic_dec_return(&gl->gl_revokes) == 0) {
-			clear_bit(GLF_LFLUSH, &gl->gl_flags);
-			gfs2_glock_queue_put(gl);
+	/*
+	 * Glocks can be referenced repeatedly on the revoke list, but the list
+	 * only holds one reference.  All glocks on the list will have the
+	 * GLF_REVOKES flag set initially.
+	 */
+
+	list_for_each_entry_safe(bd, tmp, head, bd_list) {
+		struct gfs2_glock *gl = bd->bd_gl;
+
+		if (test_bit(GLF_REVOKES, &gl->gl_flags)) {
+			/* Keep each glock on the list exactly once. */
+			clear_bit(GLF_REVOKES, &gl->gl_flags);
+			continue;
 		}
+		list_del(&bd->bd_list);
+		kmem_cache_free(gfs2_bufdata_cachep, bd);
+	}
+	list_for_each_entry_safe(bd, tmp, head, bd_list) {
+		struct gfs2_glock *gl = bd->bd_gl;
+
+		list_del(&bd->bd_list);
 		kmem_cache_free(gfs2_bufdata_cachep, bd);
+		clear_bit(GLF_LFLUSH, &gl->gl_flags);
+		gfs2_glock_queue_put(gl);
 	}
+	/* the list is empty now */
 }
 
 static void revoke_lo_before_scan(struct gfs2_jdesc *jd,
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index 136484ef35d3..c700738de1f7 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -59,7 +59,6 @@ static void gfs2_init_glock_once(void *foo)
 	INIT_LIST_HEAD(&gl->gl_lru);
 	INIT_LIST_HEAD(&gl->gl_ail_list);
 	atomic_set(&gl->gl_ail_count, 0);
-	atomic_set(&gl->gl_revokes, 0);
 }
 
 static void gfs2_init_gl_aspace_once(void *foo)
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index ca71163ff7cf..e20fa55715e2 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1474,7 +1474,7 @@ static void gfs2_final_release_pages(struct gfs2_inode *ip)
 	truncate_inode_pages(gfs2_glock2aspace(ip->i_gl), 0);
 	truncate_inode_pages(&inode->i_data, 0);
 
-	if (atomic_read(&gl->gl_revokes) == 0) {
+	if (!test_bit(GLF_REVOKES, &gl->gl_flags)) {
 		clear_bit(GLF_LFLUSH, &gl->gl_flags);
 		clear_bit(GLF_DIRTY, &gl->gl_flags);
 	}
-- 
2.20.1

