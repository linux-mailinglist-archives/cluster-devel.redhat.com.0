Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D4ECA1E22A4
	for <lists+cluster-devel@lfdr.de>; Tue, 26 May 2020 15:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590498356;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O/mO3oW+ycGKUHNqGemY5bDFc8lpLi1oPs8i7zA/cvA=;
	b=D9BuMoM/I+wifQ+xjZhXKzyCQr5FJSI2UlSWP1wy73HZwFvTQ3/D9Vf+Ku062qDTpi9EDX
	yC/ufJYvq6uD2Jw8jz1UOOkclUnl6GHBQrjFBWl5jr1ULBbSPQvthzR2k8HSujSUhPwfar
	49QdzSG7SgVq1gfcEh21hOEhfSB8kfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-MKd3JjCLP7qRRjtp6ft4aw-1; Tue, 26 May 2020 09:05:53 -0400
X-MC-Unique: MKd3JjCLP7qRRjtp6ft4aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35C53800688;
	Tue, 26 May 2020 13:05:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B1A5C1C8;
	Tue, 26 May 2020 13:05:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1278D5FBD8;
	Tue, 26 May 2020 13:05:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04QD5ghr010714 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 09:05:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A1E35D9E7; Tue, 26 May 2020 13:05:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34F475D9E5
	for <cluster-devel@redhat.com>; Tue, 26 May 2020 13:05:42 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 26 May 2020 08:05:35 -0500
Message-Id: <20200526130536.295081-8-rpeterso@redhat.com>
In-Reply-To: <20200526130536.295081-1-rpeterso@redhat.com>
References: <20200526130536.295081-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 7/8] gfs2: Add new trace point for glock ail
	management
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c        | 13 +++++++---
 fs/gfs2/log.h        |  2 +-
 fs/gfs2/lops.c       |  6 ++---
 fs/gfs2/trace_gfs2.h | 61 ++++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/trans.c      |  4 ++-
 5 files changed, 77 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 636c82dda68b..28699a1e5fbd 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -75,6 +75,7 @@ static void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
 	list_del_init(&bd->bd_ail_st_list);
 	list_del_init(&bd->bd_ail_gl_list);
 	atomic_dec(&bd->bd_gl->gl_ail_count);
+	trace_gfs2_glock_ail(bd, 3);
 	brelse(bd->bd_bh);
 }
 
@@ -675,21 +676,25 @@ void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 	bd->bd_blkno = bh->b_blocknr;
 	gfs2_remove_from_ail(bd); /* drops ref on bh */
 	bd->bd_bh = NULL;
+	trace_gfs2_glock_ail(bd, 5);
 	set_bit(GLF_LFLUSH, &gl->gl_flags);
+	trace_gfs2_glock_ail(bd, 6);
 	list_add(&bd->bd_list, &sdp->sd_log_revokes);
 }
 
-void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
+void gfs2_glock_remove_revoke(struct gfs2_bufdata *bd)
 {
 	int revokes;
 
 	smp_mb__before_atomic();
-	revokes = atomic_dec_return(&gl->gl_revokes);
+	revokes = atomic_dec_return(&bd->bd_gl->gl_revokes);
 	smp_mb__after_atomic();
 	if (revokes == 0) {
-		clear_bit(GLF_LFLUSH, &gl->gl_flags);
-		gfs2_glock_queue_put(gl);
+		clear_bit(GLF_LFLUSH, &bd->bd_gl->gl_flags);
+		trace_gfs2_glock_ail(bd, 7);
+		gfs2_glock_queue_put(bd->bd_gl);
 	}
+	trace_gfs2_glock_ail(bd, 8);
 }
 
 /**
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index c1cd6ae17659..5fbfc0dc4b7a 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -77,7 +77,7 @@ extern void log_flush_wait(struct gfs2_sbd *sdp);
 
 extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
-extern void gfs2_glock_remove_revoke(struct gfs2_glock *gl);
+extern void gfs2_glock_remove_revoke(struct gfs2_bufdata *bd);
 extern void gfs2_write_revokes(struct gfs2_sbd *sdp);
 
 #endif /* __LOG_DOT_H__ */
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 48b54ec1c793..c9b430295506 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -118,12 +118,14 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, struct buffer_head *bh,
 		struct gfs2_glock *gl = bd->bd_gl;
 		list_add(&bd->bd_ail_gl_list, &gl->gl_ail_list);
 		atomic_inc(&gl->gl_ail_count);
+		trace_gfs2_glock_ail(bd, 4);
 	}
 	bd->bd_tr = tr;
 	list_add(&bd->bd_ail_st_list, &tr->tr_ail1_list);
 	spin_unlock(&sdp->sd_ail_lock);
 
 	clear_bit(GLF_LFLUSH, &bd->bd_gl->gl_flags);
+	trace_gfs2_glock_ail(bd, 2);
 	trace_gfs2_pin(bd, 0);
 	unlock_buffer(bh);
 	atomic_dec(&sdp->sd_log_pinned);
@@ -906,13 +908,11 @@ static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	struct list_head *head = &sdp->sd_log_revokes;
 	struct gfs2_bufdata *bd;
-	struct gfs2_glock *gl;
 
 	while (!list_empty(head)) {
 		bd = list_first_entry(head, struct gfs2_bufdata, bd_list);
 		list_del_init(&bd->bd_list);
-		gl = bd->bd_gl;
-		gfs2_glock_remove_revoke(gl);
+		gfs2_glock_remove_revoke(bd);
 		kmem_cache_free(gfs2_bufdata_cachep, bd);
 	}
 }
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index e0025258107a..7cc090eb4fad 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -34,6 +34,16 @@
 			    { GFS2_BLKST_DINODE, "dinode" },	\
 			    { GFS2_BLKST_UNLINKED, "unlinked" })
 
+#define ail_caller(x) __print_symbolic(x,				\
+				  {1, "gfs2_trans_add_meta  lflush++"},  \
+				  {2, "gfs2_unpin           lflush--"},	\
+				  {3, "gfs2_remove_from_ail gl_ail_count--"}, \
+				  {4, "gfs2_unpin           gl_ail_count++"}, \
+			          {5, "gfs2_add_revoke      gl_revokes++"}, \
+				  {6, "gfs2_add_revoke      lflush++"},	\
+				  {7, "glock_remove_revoke  lflush--"}, \
+				  {8, "glock_remove_revoke  gl_revokes--"})
+
 #define TRACE_RS_DELETE  0
 #define TRACE_RS_TREEDEL 1
 #define TRACE_RS_INSERT  2
@@ -158,6 +168,57 @@ TRACE_EVENT(gfs2_glock_put,
 
 );
 
+/* ail list management for a glock */
+TRACE_EVENT(gfs2_glock_ail,
+
+	TP_PROTO(const struct gfs2_bufdata *bd, int caller),
+
+	TP_ARGS(bd, caller),
+
+	TP_STRUCT__entry(
+		__field(        dev_t,  dev                     )
+		__field(	u64,	glnum			)
+		__field(	u32,	gltype			)
+		__field(	u64,	blk			)
+		__field(	int,	caller			)
+		__field(	int,	lflush			)
+		__field(	int,	ail_count		)
+		__field(	int,	revokes			)
+		__field(	int,	bd_list_q		)
+		__field(	int,	bd_ail_st_list_q	)
+		__field(	int,	bd_ail_gl_list_q	)
+		__field(	int,	gl_refs			)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= bd->bd_gl->gl_name.ln_sbd->sd_vfs->s_dev;
+		__entry->gltype		= bd->bd_gl->gl_name.ln_type;
+		__entry->glnum		= bd->bd_gl->gl_name.ln_number;
+		__entry->blk		= bd->bd_bh ? bd->bd_bh->b_blocknr :
+					  bd->bd_blkno;
+		__entry->caller		= caller;
+		__entry->lflush		= test_bit(GLF_LFLUSH,
+						   &bd->bd_gl->gl_flags);
+		__entry->ail_count	= atomic_read(&bd->bd_gl->gl_ail_count);
+		__entry->revokes	= atomic_read(&bd->bd_gl->gl_revokes);
+		__entry->bd_list_q	= !list_empty(&bd->bd_list);
+		__entry->bd_ail_st_list_q = !list_empty(&bd->bd_ail_st_list);
+		__entry->bd_ail_gl_list_q = !list_empty(&bd->bd_ail_gl_list);
+		__entry->gl_refs	= bd->bd_gl->gl_lockref.count;
+	),
+
+	TP_printk("%u,%u glock %d:%lld blk %lld c:%d lflush:%d ail:%d "
+		  "revokes:%d q:%d/%d/%d ref:%d %s",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+                  __entry->gltype, (unsigned long long)__entry->glnum,
+		  (unsigned long long)__entry->blk, __entry->caller,
+		  __entry->lflush, __entry->ail_count, __entry->revokes,
+		  __entry->bd_list_q, __entry->bd_ail_st_list_q,
+		  __entry->bd_ail_gl_list_q, __entry->gl_refs,
+		  ail_caller(__entry->caller))
+
+);
+
 /* Callback (local or remote) requesting lock demotion */
 TRACE_EVENT(gfs2_demote_rq,
 
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index ffe840505082..9aed58f7368d 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -173,6 +173,7 @@ void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh)
 	set_bit(TR_TOUCHED, &tr->tr_flags);
 	if (list_empty(&bd->bd_list)) {
 		set_bit(GLF_LFLUSH, &bd->bd_gl->gl_flags);
+		trace_gfs2_glock_ail(bd, 1);
 		set_bit(GLF_DIRTY, &bd->bd_gl->gl_flags);
 		gfs2_pin(sdp, bd->bd_bh);
 		tr->tr_num_databuf_new++;
@@ -216,6 +217,7 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 	if (!list_empty(&bd->bd_list))
 		goto out_unlock;
 	set_bit(GLF_LFLUSH, &bd->bd_gl->gl_flags);
+	trace_gfs2_glock_ail(bd, 1);
 	set_bit(GLF_DIRTY, &bd->bd_gl->gl_flags);
 	mh = (struct gfs2_meta_header *)bd->bd_bh->b_data;
 	if (unlikely(mh->mh_magic != cpu_to_be32(GFS2_MAGIC))) {
@@ -266,7 +268,7 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 			gfs2_assert_withdraw(sdp, sdp->sd_log_num_revoke);
 			sdp->sd_log_num_revoke--;
 			if (bd->bd_gl)
-				gfs2_glock_remove_revoke(bd->bd_gl);
+				gfs2_glock_remove_revoke(bd);
 			kmem_cache_free(gfs2_bufdata_cachep, bd);
 			tr->tr_num_revoke_rm++;
 			if (--n == 0)
-- 
2.26.2

