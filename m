Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8F1A355A11
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Apr 2021 19:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617729114;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BouHmAwE0awbAExXDI6V819kgOhxefSxuyY/v3x6MkA=;
	b=hY8v6mkzAPz+zxP7nNkD1QsAVrduBUAu+2PgVs3juPdR58yuYa/ou/7Dysc7E21NbiewOw
	bttvkgSnNgfEqcMYP0NEsDCJAvXB43qqqkT2r4ZtQ9X/9xW/KZjGwG+4kz3iA5ZrMoQjHU
	5HEKDiPIYNInxvMIvQVuWBCfKAwY06s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-Js_fkxEzOVelhs3vdT6V6Q-1; Tue, 06 Apr 2021 13:11:53 -0400
X-MC-Unique: Js_fkxEzOVelhs3vdT6V6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F3AD8030A1;
	Tue,  6 Apr 2021 17:11:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECDFF60854;
	Tue,  6 Apr 2021 17:11:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65FD34A7CD;
	Tue,  6 Apr 2021 17:11:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136H9uZ9032559 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 13:09:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2ED09226FD; Tue,  6 Apr 2021 17:09:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B3C560854;
	Tue,  6 Apr 2021 17:09:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  6 Apr 2021 19:09:49 +0200
Message-Id: <20210406170949.106524-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Allocate bufdata object before taking
	log lock
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, functions gfs2_trans_add_{meta,data} would take the
log lock, then if they needed to allocate a new bufdata object, they
would drop the lock and reacquire it.  This patch changes it so that if
there's apparently no bufdata object, it allocates a new one before
taking the log lock.  After taking the log lock, it checks for conflicts
and takes measures to resolve the conflict.  This is for performance.

I haven't verified if the page locking in gfs2_trans_add_meta,
originally introduced in commit 18ec7d5c3f434 ("Make journaled data
files identical to normal files on disk"), is actually still needed.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/trans.c | 46 +++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 63fec11ef2ce..c50de22d7cbf 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -171,7 +171,6 @@ static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
 	INIT_LIST_HEAD(&bd->bd_list);
 	INIT_LIST_HEAD(&bd->bd_ail_st_list);
 	INIT_LIST_HEAD(&bd->bd_ail_gl_list);
-	bh->b_private = bd;
 	return bd;
 }
 
@@ -193,24 +192,24 @@ void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh)
 {
 	struct gfs2_trans *tr = current->journal_info;
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	struct gfs2_bufdata *bd;
+	struct gfs2_bufdata *bd = NULL;
 
 	lock_buffer(bh);
 	if (buffer_pinned(bh)) {
 		set_bit(TR_TOUCHED, &tr->tr_flags);
 		goto out;
 	}
-	gfs2_log_lock(sdp);
-	bd = bh->b_private;
-	if (bd == NULL) {
-		gfs2_log_unlock(sdp);
+	if (!bh->b_private) {
 		unlock_buffer(bh);
-		if (bh->b_private == NULL)
-			bd = gfs2_alloc_bufdata(gl, bh);
-		else
-			bd = bh->b_private;
+		bd = gfs2_alloc_bufdata(gl, bh);
 		lock_buffer(bh);
-		gfs2_log_lock(sdp);
+	}
+	gfs2_log_lock(sdp);
+	if (bh->b_private) {
+		kfree(bd);
+		bd = bh->b_private;
+	} else {
+		bh->b_private = bd;
 	}
 	gfs2_assert(sdp, bd->bd_gl == gl);
 	set_bit(TR_TOUCHED, &tr->tr_flags);
@@ -230,7 +229,7 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 {
 
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	struct gfs2_bufdata *bd;
+	struct gfs2_bufdata *bd = NULL;
 	struct gfs2_meta_header *mh;
 	struct gfs2_trans *tr = current->journal_info;
 	enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
@@ -240,19 +239,24 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 		set_bit(TR_TOUCHED, &tr->tr_flags);
 		goto out;
 	}
-	gfs2_log_lock(sdp);
-	bd = bh->b_private;
-	if (bd == NULL) {
-		gfs2_log_unlock(sdp);
+	if (!bh->b_private) {
 		unlock_buffer(bh);
+		bd = gfs2_alloc_bufdata(gl, bh);
+		lock_buffer(bh);
+	}
+	gfs2_log_lock(sdp);
+	if (bh->b_private) {
+		kfree(bd);
+		bd = bh->b_private;
+	} else {
 		lock_page(bh->b_page);
-		if (bh->b_private == NULL)
-			bd = gfs2_alloc_bufdata(gl, bh);
-		else
+		if (bh->b_private) {
+			kfree(bd);
 			bd = bh->b_private;
+		} else {
+			bh->b_private = bd;
+		}
 		unlock_page(bh->b_page);
-		lock_buffer(bh);
-		gfs2_log_lock(sdp);
 	}
 	gfs2_assert(sdp, bd->bd_gl == gl);
 	set_bit(TR_TOUCHED, &tr->tr_flags);
-- 
2.26.3

