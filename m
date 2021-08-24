Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5663F5FCB
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 16:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629813778;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wLfRbjTHpsa0/zxdskJcC47bFs9Wc9+y2iKbPKA/8I4=;
	b=XCDI2x+X5pTQ5LQad4TwIyvd6wVSCXDOqiNI1UVTFhd/m/s7gC1TvqWbSHcbfWKI0EuVBT
	dCnDpuazjgVs8Ob6qzTGWjy0kQAhBe+jx8dSzf14r2UXC6pl1VjLxsPOBC31n1TOfJZAPr
	u906A2dBQyCUE05irZ9ObHQJvbJG+Zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-c_WZoL7bMHmJA7n3R_Q79Q-1; Tue, 24 Aug 2021 10:02:55 -0400
X-MC-Unique: c_WZoL7bMHmJA7n3R_Q79Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E87C801AC5;
	Tue, 24 Aug 2021 14:02:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5194A60854;
	Tue, 24 Aug 2021 14:02:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EECD181A2A6;
	Tue, 24 Aug 2021 14:02:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OE2ko3000468 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 10:02:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D3DA60C82; Tue, 24 Aug 2021 14:02:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-176.phx2.redhat.com [10.3.114.176])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CBDD60C0F
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 14:02:46 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 24 Aug 2021 09:02:41 -0500
Message-Id: <20210824140241.149386-4-rpeterso@redhat.com>
In-Reply-To: <20210824140241.149386-1-rpeterso@redhat.com>
References: <20210824140241.149386-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/3] gfs2: Eliminate go_xmote_bh in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Using go_lock was previously not possible because of the bug
fixed by the previous patch.

I also fixed a misleading comment in do_promote.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 12 +-----------
 fs/gfs2/glops.c  |  6 +++---
 fs/gfs2/incore.h |  1 -
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d43eed1696ab..1d421998535e 100644
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
-		if (gh && glops->go_xmote_bh) {
-			spin_unlock(&gl->gl_lockref.lock);
-			rv = glops->go_xmote_bh(gh);
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
index 8ae2f33e014e..5067e89c32e6 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -597,10 +597,10 @@ static int freeze_go_sync(struct gfs2_glock *gl)
 }
 
 /**
- * freeze_go_xmote_bh - After promoting/demoting the freeze glock
+ * freeze_go_lock - After promoting/demoting the freeze glock
  * @gh: the holder of the glock
  */
-static int freeze_go_xmote_bh(struct gfs2_holder *gh)
+static int freeze_go_lock(struct gfs2_holder *gh)
 {
 	struct gfs2_glock *gl = gh->gh_gl;
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
@@ -768,7 +768,7 @@ const struct gfs2_glock_operations gfs2_rgrp_glops = {
 
 const struct gfs2_glock_operations gfs2_freeze_glops = {
 	.go_sync = freeze_go_sync,
-	.go_xmote_bh = freeze_go_xmote_bh,
+	.go_lock = freeze_go_lock,
 	.go_demote_ok = freeze_go_demote_ok,
 	.go_type = LM_TYPE_NONDISK,
 	.go_flags = GLOF_NONDISK,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 354d6230d0f7..04ac1537fee7 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -217,7 +217,6 @@ struct lm_lockname {
 
 struct gfs2_glock_operations {
 	int (*go_sync) (struct gfs2_glock *gl);
-	int (*go_xmote_bh)(struct gfs2_holder *gh);
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
 	int (*go_lock) (struct gfs2_holder *gh);
-- 
2.31.1

