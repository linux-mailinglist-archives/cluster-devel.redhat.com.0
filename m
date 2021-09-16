Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3B19A40EAB2
	for <lists+cluster-devel@lfdr.de>; Thu, 16 Sep 2021 21:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631819462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dEOwUksKQLzywPBe4hcXjaULbsy+2RLJEHy7VQ8Sue0=;
	b=TugbPWkrVhZTsZ7YOIKXR6OWjzssabvd9LrKcEO9zFBm1OHM3578rK9rbZCHvFWYUdJu4I
	qlY7GUbybAIFIJnMnL3aignQZbAguggG+0TY2jPGiUrjtdYWwoKuP8Rw/rHICzXaij0vnt
	e3H0W6NT9xK1reXtpIZRELvOoAdRAg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-ch74ApnEPO-YeikeKlnO0A-1; Thu, 16 Sep 2021 15:11:01 -0400
X-MC-Unique: ch74ApnEPO-YeikeKlnO0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0706D84A5E3;
	Thu, 16 Sep 2021 19:10:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC57D10027C4;
	Thu, 16 Sep 2021 19:10:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D13F84EA30;
	Thu, 16 Sep 2021 19:10:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GJAuCa021666 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 15:10:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C58065C25A; Thu, 16 Sep 2021 19:10:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-63.phx2.redhat.com [10.3.114.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94EA05C261
	for <cluster-devel@redhat.com>; Thu, 16 Sep 2021 19:10:37 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 16 Sep 2021 14:10:03 -0500
Message-Id: <20210916191003.105866-7-rpeterso@redhat.com>
In-Reply-To: <20210916191003.105866-1-rpeterso@redhat.com>
References: <20210916191003.105866-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2 6/6] gfs2: introduce and use new
	glops go_lock_needed
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

Before this patch, when a glock was locked, the very first holder on the
queue would unlock the lockref and call the go_lock glops function (if
one exists), unless GL_SKIP was specified. When we introduced the new
node-scope concept, we allowed multiple holders to lock glocks in EX mode
and share the lock, but node-scope introduced a new problem: if the
first holder has GL_SKIP and the next one does NOT, since it is not the
first holder on the queue, the go_lock op was not called. Eventually the
GL_SKIP holder may call the go_lock sub-function (e.g. gfs2_rgrp_bh_get)
but there's still a race in which another non-GL_SKIP holder assumes the
go_lock function was called by the first holder. In the case of rgrp
glocks, this leads to a NULL pointer dereference on the buffer_heads.

This patch tries to fix the problem by introducing a new go_lock_needed
glops function: Now ALL callers who do not specify GL_SKIP should call
the go_lock_needed glops function to see if it should still be called.
This allows any holder (secondary, teriary, etc) to call the go_lock
function when needed.

However, this introduces a new race: Several node-scope EX holders could
all decide the lock needs go_lock, and call the go_lock function to read
in the buffers and operate on them. This can lead to situations in which
one process can call go_lock then create a reservation (rd_reserved+=)
but another process can do the same, then hit the gfs2_rgrp_bh_get
BUG_ON(rgd->rd_reserved) for the first holder's reservation.

To prevent this race, we hold the rgrp_lock_local during the rgrp_go_lock
function. The first caller will get the local lock, submit the IO
request and wait for it to complete. The second caller will wait for the
rgrp_local_lock, then gfs2_rgrp_bh_get will decide it no longer needs
to do the read, and continue on without penalty.

fixes: 06e908cd9ead ("gfs2: Allow node-wide exclusive glock sharing")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 30 +++++++++++++++---------------
 fs/gfs2/glops.c  | 16 +++++++++++++---
 fs/gfs2/incore.h |  1 +
 fs/gfs2/rgrp.c   | 22 +++++++++++++++++++++-
 fs/gfs2/rgrp.h   |  1 +
 5 files changed, 51 insertions(+), 19 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 4fcf340603e7..6dfd33dc206b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -403,21 +403,21 @@ __acquires(&gl->gl_lockref.lock)
 			continue;
 		if (may_grant(gl, gh)) {
 			first = gfs2_first_holder(gh);
-			if (first && glops->go_lock) {
-				if (!(gh->gh_flags & GL_SKIP)) {
-					spin_unlock(&gl->gl_lockref.lock);
-					/* FIXME: eliminate this eventually */
-					ret = glops->go_lock(gh);
-					spin_lock(&gl->gl_lockref.lock);
-					if (ret) {
-						if (ret == 1)
-							return 2;
-						gh->gh_error = ret;
-						list_del_init(&gh->gh_list);
-						trace_gfs2_glock_queue(gh, 0);
-						gfs2_holder_wake(gh);
-						goto restart;
-					}
+			if (!(gh->gh_flags & GL_SKIP) &&
+			    glops->go_lock_needed &&
+			    glops->go_lock_needed(gh)) {
+				spin_unlock(&gl->gl_lockref.lock);
+				/* FIXME: eliminate this eventually */
+				ret = glops->go_lock(gh);
+				spin_lock(&gl->gl_lockref.lock);
+				if (ret) {
+					if (ret == 1)
+						return 2;
+					gh->gh_error = ret;
+					list_del_init(&gh->gh_list);
+					trace_gfs2_glock_queue(gh, 0);
+					gfs2_holder_wake(gh);
+					goto restart;
 				}
 			}
 			set_bit(HIF_HOLDER, &gh->gh_iflags);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4b19f513570f..e0fa8d7f96d3 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -481,6 +481,17 @@ int gfs2_inode_refresh(struct gfs2_inode *ip)
 	return error;
 }
 
+static bool inode_go_lock_needed(struct gfs2_holder *gh)
+{
+	struct gfs2_glock *gl = gh->gh_gl;
+
+	if (!gl->gl_object)
+		return false;
+	if (!gfs2_first_holder(gh))
+		return false;
+	return !(gh->gh_flags & GL_SKIP);
+}
+
 /**
  * inode_go_lock - operation done after an inode lock is locked by a process
  * @gh: The glock holder
@@ -495,9 +506,6 @@ static int inode_go_lock(struct gfs2_holder *gh)
 	struct gfs2_inode *ip = gl->gl_object;
 	int error = 0;
 
-	if (!ip)
-		return 0;
-
 	if (test_bit(GIF_INVALID, &ip->i_flags)) {
 		error = gfs2_inode_refresh(ip);
 		if (error)
@@ -740,6 +748,7 @@ const struct gfs2_glock_operations gfs2_inode_glops = {
 	.go_sync = inode_go_sync,
 	.go_inval = inode_go_inval,
 	.go_demote_ok = inode_go_demote_ok,
+	.go_lock_needed = inode_go_lock_needed,
 	.go_lock = inode_go_lock,
 	.go_dump = inode_go_dump,
 	.go_type = LM_TYPE_INODE,
@@ -750,6 +759,7 @@ const struct gfs2_glock_operations gfs2_inode_glops = {
 const struct gfs2_glock_operations gfs2_rgrp_glops = {
 	.go_sync = rgrp_go_sync,
 	.go_inval = rgrp_go_inval,
+	.go_lock_needed = gfs2_rgrp_go_lock_needed,
 	.go_lock = gfs2_rgrp_go_lock,
 	.go_dump = gfs2_rgrp_go_dump,
 	.go_type = LM_TYPE_RGRP,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 0fe49770166e..dc5c9dccb060 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -225,6 +225,7 @@ struct gfs2_glock_operations {
 			const char *fs_id_buf);
 	void (*go_callback)(struct gfs2_glock *gl, bool remote);
 	void (*go_free)(struct gfs2_glock *gl);
+	bool (*go_lock_needed)(struct gfs2_holder *gh);
 	const int go_subclass;
 	const int go_type;
 	const unsigned long go_flags;
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 96b2fbed6bf1..9848c5f4fbc4 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1288,11 +1288,31 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	return 0;
 }
 
+bool gfs2_rgrp_go_lock_needed(struct gfs2_holder *gh)
+{
+	struct gfs2_rgrpd *rgd = gh->gh_gl->gl_object;
+
+	if (gh->gh_flags & GL_SKIP)
+		return false;
+
+	if (rgd->rd_bits[0].bi_bh)
+		return false;
+	return true;
+}
+
 int gfs2_rgrp_go_lock(struct gfs2_holder *gh)
 {
+	int ret;
+
 	struct gfs2_rgrpd *rgd = gh->gh_gl->gl_object;
 
-	return gfs2_rgrp_bh_get(rgd);
+	if (gfs2_glock_is_held_excl(rgd->rd_gl))
+		rgrp_lock_local(rgd);
+	ret = gfs2_rgrp_bh_get(rgd);
+	if (gfs2_glock_is_held_excl(rgd->rd_gl))
+		rgrp_unlock_local(rgd);
+
+	return ret;
 }
 
 /**
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index a6855fd796e0..4b62ba5d8e20 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -31,6 +31,7 @@ extern struct gfs2_rgrpd *gfs2_rgrpd_get_next(struct gfs2_rgrpd *rgd);
 extern void gfs2_clear_rgrpd(struct gfs2_sbd *sdp);
 extern int gfs2_rindex_update(struct gfs2_sbd *sdp);
 extern void gfs2_free_clones(struct gfs2_rgrpd *rgd);
+extern bool gfs2_rgrp_go_lock_needed(struct gfs2_holder *gh);
 extern int gfs2_rgrp_go_lock(struct gfs2_holder *gh);
 extern void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd);
 
-- 
2.31.1

