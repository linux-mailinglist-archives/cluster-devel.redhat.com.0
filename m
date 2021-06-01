Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5408D397601
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Jun 2021 17:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622559732;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=z5OutLY1Xxpgof9T7q/OeyGjh1XPCSOwxonrirgfof0=;
	b=HUi8pstsH9CCrkedrCjXL6OiTNYiUlYB/qaTQUDxhj0SFduARbqgRol1m9eP7KUWEFHWAq
	XkUEMRYKOtHPGQ8szfZYWGvv1edZq3TgidYmdS0o5lr9PTtD980pLy/QJIGif5HR4b6o2g
	+WSmxw/R2a02jZAkmU5b1+9clFFXdlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-JddccNqxPKy91luP9uPyDA-1; Tue, 01 Jun 2021 11:02:08 -0400
X-MC-Unique: JddccNqxPKy91luP9uPyDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA194EC1A2;
	Tue,  1 Jun 2021 15:02:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FFA36087C;
	Tue,  1 Jun 2021 15:02:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 433E11800BB8;
	Tue,  1 Jun 2021 15:02:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 151F24Cx003073 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Jun 2021 11:02:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00CE86087C; Tue,  1 Jun 2021 15:02:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEC6F60C5B
	for <cluster-devel@redhat.com>; Tue,  1 Jun 2021 15:02:00 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E07E1800BB4
	for <cluster-devel@redhat.com>; Tue,  1 Jun 2021 15:02:00 +0000 (UTC)
Date: Tue, 1 Jun 2021 11:02:00 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <84089438.34917857.1622559720532.JavaMail.zimbra@redhat.com>
In-Reply-To: <727604443.34917802.1622559718942.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.53, 10.4.195.4]
Thread-Topic: gfs2: Eliminate go_xmote_bh in favor of go_lock
Thread-Index: tvw6QaZHjJq2l2RzSo+jpvqmV+tVsg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [gfs2 PATCH] gfs2: Eliminate go_xmote_bh in favor
	of go_lock
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

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
index f6cae2ee1c83..ffd0dea0f44e 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -385,7 +385,7 @@ static void do_error(struct gfs2_glock *gl, const int ret)
  * do_promote - promote as many requests as possible on the current queue
  * @gl: The glock
  * 
- * Returns: 1 if there is a blocked holder at the head of the list, or 2
+ * Returns: 1 if there is a blocked waiter at the head of the list, or 2
  *          if a type specific operation is underway.
  */
 
@@ -505,7 +505,6 @@ static void gfs2_demote_wake(struct gfs2_glock *gl)
 
 static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 {
-	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	struct gfs2_holder *gh;
 	unsigned state = ret & LM_OUT_ST_MASK;
 	int rv;
@@ -563,15 +562,6 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
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
index e32433df119c..ff7ae651b9d8 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -217,7 +217,6 @@ struct lm_lockname {
 
 struct gfs2_glock_operations {
 	int (*go_sync) (struct gfs2_glock *gl);
-	int (*go_xmote_bh)(struct gfs2_glock *gl);
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
 	int (*go_lock) (struct gfs2_holder *gh);

