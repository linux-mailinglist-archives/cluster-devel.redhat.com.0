Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC11E30E1F2
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375698;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J7I1Mw1FxvxvHmQUALsDlSe9CHblNx/LXSP3FNjaT/I=;
	b=Yj0fQKMVHRf67S+61olhApQqZ6J8cdtGRpVVDT6rMUTU8uNzdDtW0w26pECKzJvFreO4rf
	4464tnJSkNSTx9bqrTjLdr8wEk5VurPSh6r7iZC74x2JEURfJB+mqzMxjdj+m1Abj/t47V
	sKkTO44aeIVLZj/g4hquEDdHBOKevtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-tiLx9M5SNcmwyk1QV6HBKw-1; Wed, 03 Feb 2021 13:08:16 -0500
X-MC-Unique: tiLx9M5SNcmwyk1QV6HBKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92737801963;
	Wed,  3 Feb 2021 18:08:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8039450DE3;
	Wed,  3 Feb 2021 18:08:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65AFA57DFD;
	Wed,  3 Feb 2021 18:08:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I8AIw028588 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22B84709B7; Wed,  3 Feb 2021 18:08:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BC5260D07;
	Wed,  3 Feb 2021 18:08:09 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:44 +0100
Message-Id: <20210203180755.246596-10-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-1-agruenba@redhat.com>
References: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 09/20] gfs2: Clean up on-stack
	transactions
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Replace the TR_ALLOCED flag by its inverse, TR_ONSTACK: that way, the flag only
needs to be set in the exceptional case of on-stack transactions.  Split off
__gfs2_trans_begin from gfs2_trans_begin and use it to replace the open-coded
version in gfs2_ail_empty_gl.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c  | 33 ++++++++++-----------------------
 fs/gfs2/incore.h |  2 +-
 fs/gfs2/log.c    |  2 +-
 fs/gfs2/trans.c  | 40 +++++++++++++++++++++++-----------------
 fs/gfs2/trans.h  |  3 +++
 5 files changed, 38 insertions(+), 42 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index fd1f52fff170..a067924341e3 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -86,16 +86,12 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_trans tr;
+	unsigned int revokes;
 	int ret;
 
-	memset(&tr, 0, sizeof(tr));
-	INIT_LIST_HEAD(&tr.tr_buf);
-	INIT_LIST_HEAD(&tr.tr_databuf);
-	INIT_LIST_HEAD(&tr.tr_ail1_list);
-	INIT_LIST_HEAD(&tr.tr_ail2_list);
-	tr.tr_revokes = atomic_read(&gl->gl_ail_count);
+	revokes = atomic_read(&gl->gl_ail_count);
 
-	if (!tr.tr_revokes) {
+	if (!revokes) {
 		bool have_revokes;
 		bool log_in_flight;
 
@@ -122,23 +118,14 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 		return 0;
 	}
 
-	/* A shortened, inline version of gfs2_trans_begin()
-         * tr->alloced is not set since the transaction structure is
-         * on the stack */
-	tr.tr_reserved = 1 + gfs2_struct2blk(sdp, tr.tr_revokes);
-	tr.tr_ip = _RET_IP_;
-	sb_start_intwrite(sdp->sd_vfs);
-	ret = gfs2_log_reserve(sdp, tr.tr_reserved);
-	if (ret < 0) {
-		sb_end_intwrite(sdp->sd_vfs);
-		return ret;
-	}
-	WARN_ON_ONCE(current->journal_info);
-	current->journal_info = &tr;
-
-	__gfs2_ail_flush(gl, 0, tr.tr_revokes);
-
+	memset(&tr, 0, sizeof(tr));
+	set_bit(TR_ONSTACK, &tr.tr_flags);
+	ret = __gfs2_trans_begin(&tr, sdp, 0, revokes, _RET_IP_);
+	if (ret)
+		goto flush;
+	__gfs2_ail_flush(gl, 0, revokes);
 	gfs2_trans_end(sdp);
+
 flush:
 	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 		       GFS2_LFC_AIL_EMPTY_GL);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 8e1ab8ed4abc..c3f6dd378b10 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -490,7 +490,7 @@ struct gfs2_quota_data {
 enum {
 	TR_TOUCHED = 1,
 	TR_ATTACHED = 2,
-	TR_ALLOCED = 3,
+	TR_ONSTACK = 3,
 };
 
 struct gfs2_trans {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index e4dc23a24569..0fceb60907a2 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1114,7 +1114,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	if (sdp->sd_log_tr) {
 		gfs2_merge_trans(sdp, tr);
 	} else if (tr->tr_num_buf_new || tr->tr_num_databuf_new) {
-		gfs2_assert_withdraw(sdp, test_bit(TR_ALLOCED, &tr->tr_flags));
+		gfs2_assert_withdraw(sdp, !test_bit(TR_ONSTACK, &tr->tr_flags));
 		sdp->sd_log_tr = tr;
 		set_bit(TR_ATTACHED, &tr->tr_flags);
 	}
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index ae040b570868..db29ca253853 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -37,10 +37,10 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
 		tr->tr_num_revoke, tr->tr_num_revoke_rm);
 }
 
-int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
-		     unsigned int revokes)
+int __gfs2_trans_begin(struct gfs2_trans *tr, struct gfs2_sbd *sdp,
+		       unsigned int blocks, unsigned int revokes,
+		       unsigned long ip)
 {
-	struct gfs2_trans *tr;
 	int error;
 
 	if (current->journal_info) {
@@ -52,15 +52,10 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
 		return -EROFS;
 
-	tr = kmem_cache_zalloc(gfs2_trans_cachep, GFP_NOFS);
-	if (!tr)
-		return -ENOMEM;
-
-	tr->tr_ip = _RET_IP_;
+	tr->tr_ip = ip;
 	tr->tr_blocks = blocks;
 	tr->tr_revokes = revokes;
 	tr->tr_reserved = 1;
-	set_bit(TR_ALLOCED, &tr->tr_flags);
 	if (blocks)
 		tr->tr_reserved += 6 + blocks;
 	if (revokes)
@@ -74,17 +69,28 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	sb_start_intwrite(sdp->sd_vfs);
 
 	error = gfs2_log_reserve(sdp, tr->tr_reserved);
-	if (error)
-		goto fail;
+	if (error) {
+		sb_end_intwrite(sdp->sd_vfs);
+		return error;
+	}
 
 	current->journal_info = tr;
 
 	return 0;
+}
 
-fail:
-	sb_end_intwrite(sdp->sd_vfs);
-	kmem_cache_free(gfs2_trans_cachep, tr);
+int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
+		     unsigned int revokes)
+{
+	struct gfs2_trans *tr;
+	int error;
 
+	tr = kmem_cache_zalloc(gfs2_trans_cachep, GFP_NOFS);
+	if (!tr)
+		return -ENOMEM;
+	error = __gfs2_trans_begin(tr, sdp, blocks, revokes, _RET_IP_);
+	if (error)
+		kmem_cache_free(gfs2_trans_cachep, tr);
 	return error;
 }
 
@@ -92,13 +98,12 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 {
 	struct gfs2_trans *tr = current->journal_info;
 	s64 nbuf;
-	int alloced = test_bit(TR_ALLOCED, &tr->tr_flags);
 
 	current->journal_info = NULL;
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
 		gfs2_log_release(sdp, tr->tr_reserved);
-		if (alloced)
+		if (!test_bit(TR_ONSTACK, &tr->tr_flags))
 			gfs2_trans_free(sdp, tr);
 		sb_end_intwrite(sdp->sd_vfs);
 		return;
@@ -113,7 +118,8 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 		gfs2_print_trans(sdp, tr);
 
 	gfs2_log_commit(sdp, tr);
-	if (alloced && !test_bit(TR_ATTACHED, &tr->tr_flags))
+	if (!test_bit(TR_ONSTACK, &tr->tr_flags) &&
+	    !test_bit(TR_ATTACHED, &tr->tr_flags))
 		gfs2_trans_free(sdp, tr);
 	up_read(&sdp->sd_log_flush_lock);
 
diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
index 83199ce5a5c5..55f253015cf8 100644
--- a/fs/gfs2/trans.h
+++ b/fs/gfs2/trans.h
@@ -34,6 +34,9 @@ static inline unsigned int gfs2_rg_blocks(const struct gfs2_inode *ip, unsigned
 	return rgd->rd_length;
 }
 
+extern int __gfs2_trans_begin(struct gfs2_trans *tr, struct gfs2_sbd *sdp,
+			      unsigned int blocks, unsigned int revokes,
+			      unsigned long ip);
 extern int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 			    unsigned int revokes);
 
-- 
2.26.2

