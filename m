Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F11FB23
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7116D85542;
	Wed, 15 May 2019 19:40:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A66960166;
	Wed, 15 May 2019 19:40:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C0DE5B426;
	Wed, 15 May 2019 19:40:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcNQX028995 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5148A60E39; Wed, 15 May 2019 19:38:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0E260BF7
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:00 -0500
Message-Id: <20190515193818.7642-8-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 07/25] gfs2: dump fsid when dumping
	glock problems
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 15 May 2019 19:40:26 +0000 (UTC)

Before this patch, if a glock error was encountered, the glock with
the problem was dumped. But sometimes you may have lots of file systems
mounted, and that doesn't tell you which file system it was for.

This patch adds a new boolean parameter fsid to the dump_glock family
of functions. For non-error cases, such as dumping the glocks debugfs
file, the fsid is not dumped in order to keep lock dumps and glocktop
as clean as possible. For all error cases, such as GLOCK_BUG_ON, the
file system id is now printed. This will make it easier to debug.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 34 +++++++++++++++++++++-------------
 fs/gfs2/glock.h  | 11 +++++++----
 fs/gfs2/glops.c  |  7 +++++--
 fs/gfs2/incore.h |  3 ++-
 fs/gfs2/lops.c   |  2 +-
 fs/gfs2/rgrp.c   | 21 ++++++++++++++-------
 fs/gfs2/rgrp.h   |  3 ++-
 fs/gfs2/util.c   |  4 +++-
 8 files changed, 55 insertions(+), 30 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 5e074fbf3796..3663643dc80d 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1078,7 +1078,7 @@ __acquires(&gl->gl_lockref.lock)
 	fs_err(sdp, "pid: %d\n", pid_nr(gh->gh_owner_pid));
 	fs_err(sdp, "lock type: %d req lock state : %d\n",
 	       gh->gh_gl->gl_name.ln_type, gh->gh_state);
-	gfs2_dump_glock(NULL, gl);
+	gfs2_dump_glock(NULL, gl, true);
 	BUG();
 }
 
@@ -1613,16 +1613,16 @@ void gfs2_glock_thaw(struct gfs2_sbd *sdp)
 	glock_hash_walk(thaw_glock, sdp);
 }
 
-static void dump_glock(struct seq_file *seq, struct gfs2_glock *gl)
+static void dump_glock(struct seq_file *seq, struct gfs2_glock *gl, bool fsid)
 {
 	spin_lock(&gl->gl_lockref.lock);
-	gfs2_dump_glock(seq, gl);
+	gfs2_dump_glock(seq, gl, fsid);
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
 static void dump_glock_func(struct gfs2_glock *gl)
 {
-	dump_glock(NULL, gl);
+	dump_glock(NULL, gl, true);
 }
 
 /**
@@ -1707,10 +1707,12 @@ static const char *hflags2str(char *buf, u16 flags, unsigned long iflags)
  * dump_holder - print information about a glock holder
  * @seq: the seq_file struct
  * @gh: the glock holder
+ * @fs_id_buf: pointer to file system id (if requested)
  *
  */
 
-static void dump_holder(struct seq_file *seq, const struct gfs2_holder *gh)
+static void dump_holder(struct gfs2_sbd *sdp, struct seq_file *seq,
+			const struct gfs2_holder *gh, const char *fs_id_buf)
 {
 	struct task_struct *gh_owner = NULL;
 	char flags_buf[32];
@@ -1718,8 +1720,8 @@ static void dump_holder(struct seq_file *seq, const struct gfs2_holder *gh)
 	rcu_read_lock();
 	if (gh->gh_owner_pid)
 		gh_owner = pid_task(gh->gh_owner_pid, PIDTYPE_PID);
-	gfs2_print_dbg(seq, " H: s:%s f:%s e:%d p:%ld [%s] %pS\n",
-		       state2str(gh->gh_state),
+	gfs2_print_dbg(seq, "%s H: s:%s f:%s e:%d p:%ld [%s] %pS\n",
+		       fs_id_buf, state2str(gh->gh_state),
 		       hflags2str(flags_buf, gh->gh_flags, gh->gh_iflags),
 		       gh->gh_error,
 		       gh->gh_owner_pid ? (long)pid_nr(gh->gh_owner_pid) : -1,
@@ -1769,6 +1771,7 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
  * gfs2_dump_glock - print information about a glock
  * @seq: The seq_file struct
  * @gl: the glock
+ * @fsid: If true, also dump the file system id
  *
  * The file format is as follows:
  * One line per object, capital letters are used to indicate objects
@@ -1782,19 +1785,24 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
  *
  */
 
-void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl)
+void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl, bool fsid)
 {
 	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	unsigned long long dtime;
 	const struct gfs2_holder *gh;
 	char gflags_buf[32];
+	char fs_id_buf[GFS2_FSNAME_LEN + 3 * sizeof(int) + 2];
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 
+	memset(fs_id_buf, 0, sizeof(fs_id_buf));
+	if (fsid && sdp) /* safety precaution */
+		sprintf(fs_id_buf, "fsid=%s: ", sdp->sd_fsname);
 	dtime = jiffies - gl->gl_demote_time;
 	dtime *= 1000000/HZ; /* demote time in uSec */
 	if (!test_bit(GLF_DEMOTE, &gl->gl_flags))
 		dtime = 0;
-	gfs2_print_dbg(seq, "G:  s:%s n:%u/%llx f:%s t:%s d:%s/%llu a:%d v:%d r:%d m:%ld\n",
-		  state2str(gl->gl_state),
+	gfs2_print_dbg(seq, "%sG:  s:%s n:%u/%llx f:%s t:%s d:%s/%llu a:%d "
+		       "v:%d r:%d m:%ld\n", fs_id_buf, state2str(gl->gl_state),
 		  gl->gl_name.ln_type,
 		  (unsigned long long)gl->gl_name.ln_number,
 		  gflags2str(gflags_buf, gl),
@@ -1805,10 +1813,10 @@ void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl)
 		  (int)gl->gl_lockref.count, gl->gl_hold_time);
 
 	list_for_each_entry(gh, &gl->gl_holders, gh_list)
-		dump_holder(seq, gh);
+		dump_holder(sdp, seq, gh, fs_id_buf);
 
 	if (gl->gl_state != LM_ST_UNLOCKED && glops->go_dump)
-		glops->go_dump(seq, gl);
+		glops->go_dump(seq, gl, fs_id_buf);
 }
 
 static int gfs2_glstats_seq_show(struct seq_file *seq, void *iter_ptr)
@@ -2009,7 +2017,7 @@ static void gfs2_glock_seq_stop(struct seq_file *seq, void *iter_ptr)
 
 static int gfs2_glock_seq_show(struct seq_file *seq, void *iter_ptr)
 {
-	dump_glock(seq, iter_ptr);
+	dump_glock(seq, iter_ptr, false);
 	return 0;
 }
 
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 936b3295839c..ea1568db0452 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -202,8 +202,11 @@ extern int gfs2_glock_nq_num(struct gfs2_sbd *sdp, u64 number,
 			     struct gfs2_holder *gh);
 extern int gfs2_glock_nq_m(unsigned int num_gh, struct gfs2_holder *ghs);
 extern void gfs2_glock_dq_m(unsigned int num_gh, struct gfs2_holder *ghs);
-extern void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl);
-#define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) { gfs2_dump_glock(NULL, gl); BUG(); } } while(0)
+extern void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl,
+			    bool fsid);
+#define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {		\
+			gfs2_dump_glock(NULL, gl, true);	\
+			BUG(); } } while(0)
 extern __printf(2, 3)
 void gfs2_print_dbg(struct seq_file *seq, const char *fmt, ...);
 
@@ -269,7 +272,7 @@ static inline void glock_set_object(struct gfs2_glock *gl, void *object)
 {
 	spin_lock(&gl->gl_lockref.lock);
 	if (gfs2_assert_warn(gl->gl_name.ln_sbd, gl->gl_object == NULL))
-		gfs2_dump_glock(NULL, gl);
+		gfs2_dump_glock(NULL, gl, true);
 	gl->gl_object = object;
 	spin_unlock(&gl->gl_lockref.lock);
 }
@@ -281,7 +284,7 @@ static inline void glock_set_object(struct gfs2_glock *gl, void *object)
  *
  * I'd love to similarly add this:
  *	else if (gfs2_assert_warn(gl->gl_sbd, gl->gl_object == object))
- *		gfs2_dump_glock(NULL, gl);
+ *		gfs2_dump_glock(NULL, gl, true);
  * Unfortunately, that's not possible because as soon as gfs2_delete_inode
  * frees the block in the rgrp, another process can reassign it for an I_NEW
  * inode in gfs2_create_inode because that calls new_inode, not gfs2_iget.
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 5cecde79c63f..84a403ed6e77 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -464,10 +464,12 @@ static int inode_go_lock(struct gfs2_holder *gh)
  * inode_go_dump - print information about an inode
  * @seq: The iterator
  * @ip: the inode
+ * @fs_id_buf: file system id (may be empty)
  *
  */
 
-static void inode_go_dump(struct seq_file *seq, struct gfs2_glock *gl)
+static void inode_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
+			  const char *fs_id_buf)
 {
 	struct gfs2_inode *ip = gl->gl_object;
 	struct inode *inode = &ip->i_inode;
@@ -480,7 +482,8 @@ static void inode_go_dump(struct seq_file *seq, struct gfs2_glock *gl)
 	nrpages = inode->i_data.nrpages;
 	xa_unlock_irq(&inode->i_data.i_pages);
 
-	gfs2_print_dbg(seq, " I: n:%llu/%llu t:%u f:0x%02lx d:0x%08x s:%llu p:%lu\n",
+	gfs2_print_dbg(seq, "%s I: n:%llu/%llu t:%u f:0x%02lx d:0x%08x s:%llu "
+		       "p:%lu\n", fs_id_buf,
 		  (unsigned long long)ip->i_no_formal_ino,
 		  (unsigned long long)ip->i_no_addr,
 		  IF2DT(ip->i_inode.i_mode), ip->i_flags,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index a4a2c7e07ba7..52c5777289f5 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -243,7 +243,8 @@ struct gfs2_glock_operations {
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
 	int (*go_lock) (struct gfs2_holder *gh);
 	void (*go_unlock) (struct gfs2_holder *gh);
-	void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl);
+	void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl,
+			const char *fs_id_buf);
 	void (*go_callback)(struct gfs2_glock *gl, bool remote);
 	const int go_type;
 	const unsigned long go_flags;
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 41e06582772c..c704292a16e2 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -780,7 +780,7 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
 					fs_info(sdp, "busy:%d, pinned:%d\n",
 						buffer_busy(rgd->rd_bits->bi_bh) ? 1 : 0,
 						buffer_pinned(rgd->rd_bits->bi_bh));
-					gfs2_dump_glock(NULL, rgd->rd_gl);
+					gfs2_dump_glock(NULL, rgd->rd_gl, true);
 				}
 			}
 			mark_buffer_dirty(bh_ip);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 15d6e32de55f..ed3a6d3973a9 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -613,11 +613,12 @@ int gfs2_rsqa_alloc(struct gfs2_inode *ip)
 	return gfs2_qa_alloc(ip);
 }
 
-static void dump_rs(struct seq_file *seq, const struct gfs2_blkreserv *rs)
+static void dump_rs(struct seq_file *seq, const struct gfs2_blkreserv *rs,
+		    const char *fs_id_buf)
 {
 	struct gfs2_inode *ip = container_of(rs, struct gfs2_inode, i_res);
 
-	gfs2_print_dbg(seq, "  B: n:%llu s:%llu b:%u f:%u\n",
+	gfs2_print_dbg(seq, "%s  B: n:%llu s:%llu b:%u f:%u\n", fs_id_buf,
 		       (unsigned long long)ip->i_no_addr,
 		       (unsigned long long)gfs2_rbm_to_block(&rs->rs_rbm),
 		       rs->rs_rbm.offset, rs->rs_free);
@@ -2249,10 +2250,12 @@ static void rgblk_free(struct gfs2_sbd *sdp, struct gfs2_rgrpd *rgd,
  * gfs2_rgrp_dump - print out an rgrp
  * @seq: The iterator
  * @gl: The glock in question
+ * @fs_id_buf: pointer to file system id (if requested)
  *
  */
 
-void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl)
+void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl,
+		    const char *fs_id_buf)
 {
 	struct gfs2_rgrpd *rgd = gl->gl_object;
 	struct gfs2_blkreserv *trs;
@@ -2260,14 +2263,15 @@ void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl)
 
 	if (rgd == NULL)
 		return;
-	gfs2_print_dbg(seq, " R: n:%llu f:%02x b:%u/%u i:%u r:%u e:%u\n",
+	gfs2_print_dbg(seq, "%s R: n:%llu f:%02x b:%u/%u i:%u r:%u e:%u\n",
+		       fs_id_buf,
 		       (unsigned long long)rgd->rd_addr, rgd->rd_flags,
 		       rgd->rd_free, rgd->rd_free_clone, rgd->rd_dinodes,
 		       rgd->rd_reserved, rgd->rd_extfail_pt);
 	if (rgd->rd_sbd->sd_args.ar_rgrplvb) {
 		struct gfs2_rgrp_lvb *rgl = rgd->rd_rgl;
 
-		gfs2_print_dbg(seq, "  L: f:%02x b:%u i:%u\n",
+		gfs2_print_dbg(seq, "%s  L: f:%02x b:%u i:%u\n", fs_id_buf,
 			       be32_to_cpu(rgl->rl_flags),
 			       be32_to_cpu(rgl->rl_free),
 			       be32_to_cpu(rgl->rl_dinodes));
@@ -2275,7 +2279,7 @@ void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl)
 	spin_lock(&rgd->rd_rsspin);
 	for (n = rb_first(&rgd->rd_rstree); n; n = rb_next(&trs->rs_node)) {
 		trs = rb_entry(n, struct gfs2_blkreserv, rs_node);
-		dump_rs(seq, trs);
+		dump_rs(seq, trs, fs_id_buf);
 	}
 	spin_unlock(&rgd->rd_rsspin);
 }
@@ -2283,10 +2287,13 @@ void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl)
 static void gfs2_rgrp_error(struct gfs2_rgrpd *rgd)
 {
 	struct gfs2_sbd *sdp = rgd->rd_sbd;
+	char fs_id_buf[GFS2_FSNAME_LEN + 3 * sizeof(int) + 2];
+
 	fs_warn(sdp, "rgrp %llu has an error, marking it readonly until umount\n",
 		(unsigned long long)rgd->rd_addr);
 	fs_warn(sdp, "umount on all nodes and run fsck.gfs2 to fix the error\n");
-	gfs2_rgrp_dump(NULL, rgd->rd_gl);
+	sprintf(fs_id_buf, "fsid=%s: ", sdp->sd_fsname);
+	gfs2_rgrp_dump(NULL, rgd->rd_gl, fs_id_buf);
 	rgd->rd_flags |= GFS2_RDF_ERROR;
 }
 
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index 499079a9dbbe..c809f4654718 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -72,7 +72,8 @@ extern void gfs2_rlist_add(struct gfs2_inode *ip, struct gfs2_rgrp_list *rlist,
 extern void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist);
 extern void gfs2_rlist_free(struct gfs2_rgrp_list *rlist);
 extern u64 gfs2_ri_total(struct gfs2_sbd *sdp);
-extern void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl);
+extern void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl,
+			   const char *fs_id_buf);
 extern int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
 				   struct buffer_head *bh,
 				   const struct gfs2_bitmap *bi, unsigned minlen, u64 *ptrimmed);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 3b729f49fbb1..084a76ffaf65 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -181,9 +181,11 @@ int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd, int cluster_wide,
 			 const char *function, char *file, unsigned int line)
 {
 	struct gfs2_sbd *sdp = rgd->rd_sbd;
+	char fs_id_buf[GFS2_FSNAME_LEN + 3 * sizeof(int) + 2];
 	int rv;
 
-	gfs2_rgrp_dump(NULL, rgd->rd_gl);
+	sprintf(fs_id_buf, "fsid=%s: ", sdp->sd_fsname);
+	gfs2_rgrp_dump(NULL, rgd->rd_gl, fs_id_buf);
 	rv = gfs2_lm_withdraw(sdp,
 			      "fatal: filesystem consistency error\n"
 			      "  RG = %llu\n"
-- 
2.20.1

