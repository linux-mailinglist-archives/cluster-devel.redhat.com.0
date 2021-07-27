Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B6C343D7C44
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LaJoSU20bW38JT3k7Dtm/n+wk7g/GJBSq+KtIkX427s=;
	b=IUz2o/5KUUt7PSRNEbR5kCnjZmJjtA/qN/tuaHaXqZq5K3mzSK58NmJAbknV7QemvwFxv9
	lcWW8+81qfyZRVZSaBHuqjGQJkGaKGoGKn/fyxMLYcBByrOdgDOQbWkmTvQVBKQFtvJShw
	twmY1FDIyaNPeIFUZnSXM+FbvyXRA8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-ft-gTLR4MKybsX6f9TQt1A-1; Tue, 27 Jul 2021 13:37:22 -0400
X-MC-Unique: ft-gTLR4MKybsX6f9TQt1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87E81A0C16;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 761621042A50;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61B7E180BAB2;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbF9f022798 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8BC9B1980E; Tue, 27 Jul 2021 17:37:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E3A919630
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:15 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:36:57 -0500
Message-Id: <20210727173709.210711-4-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 03/15] gfs2: Eliminate go_xmote_bh in
	favor of go_lock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, the freeze glock was the only glock to use the
go_xmote_bh glock op (glop). The go_xmote_bh glop is done when
a glock is locked. But so is go_lock. This patch eliminates the
glop altogether in favor of just using go_lock for the freeze
glock. This is for better consistency, readability, etc.
I also fixed a misleading comment in do_promote.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 12 +-----------
 fs/gfs2/glops.c  |  7 ++++---
 fs/gfs2/incore.h |  1 -
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1f3902ecdded..9f94d6b13363 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -384,7 +384,7 @@ static void do_error(struct gfs2_glock *gl, const int ret)
  * do_promote - promote as many requests as possible on the current queue
  * @gl: The glock
  * 
- * Returns: 1 if there is a blocked holder at the head of the list, or 2
+ * Returns: 1 if there is a blocked waiter at the head of the list, or 2
  *          if a type specific operation is underway.
  */
 
@@ -504,7 +504,6 @@ static void gfs2_demote_wake(struct gfs2_glock *gl)
 
 static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 {
-	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	struct gfs2_holder *gh;
 	unsigned state = ret & LM_OUT_ST_MASK;
 	int rv;
@@ -562,15 +561,6 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 	if (test_and_clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags))
 		gfs2_demote_wake(gl);
 	if (state != LM_ST_UNLOCKED) {
-		if (glops->go_xmote_bh) {
-			spin_unlock(&gl->gl_lockref.lock);
-			rv = glops->go_xmote_bh(gl);
-			spin_lock(&gl->gl_lockref.lock);
-			if (rv) {
-				do_error(gl, rv);
-				goto out;
-			}
-		}
 		rv = do_promote(gl);
 		if (rv == 2)
 			goto out_locked;
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4939308d54f3..9f3b68806376 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -595,11 +595,12 @@ static int freeze_go_sync(struct gfs2_glock *gl)
 }
 
 /**
- * freeze_go_xmote_bh - After promoting/demoting the freeze glock
+ * freeze_go_lock - After promoting/demoting the freeze glock
  * @gl: the glock
  */
-static int freeze_go_xmote_bh(struct gfs2_glock *gl)
+static int freeze_go_lock(struct gfs2_holder *gh)
 {
+	struct gfs2_glock *gl = gh->gh_gl;
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
 	struct gfs2_glock *j_gl = ip->i_gl;
@@ -759,7 +760,7 @@ const struct gfs2_glock_operations gfs2_rgrp_glops = {
 
 const struct gfs2_glock_operations gfs2_freeze_glops = {
 	.go_sync = freeze_go_sync,
-	.go_xmote_bh = freeze_go_xmote_bh,
+	.go_lock = freeze_go_lock,
 	.go_demote_ok = freeze_go_demote_ok,
 	.go_type = LM_TYPE_NONDISK,
 	.go_flags = GLOF_NONDISK,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index e6f820f146cb..d5ea955d6a87 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -217,7 +217,6 @@ struct lm_lockname {
 
 struct gfs2_glock_operations {
 	int (*go_sync) (struct gfs2_glock *gl);
-	int (*go_xmote_bh)(struct gfs2_glock *gl);
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
 	int (*go_lock) (struct gfs2_holder *gh);
-- 
2.31.1

