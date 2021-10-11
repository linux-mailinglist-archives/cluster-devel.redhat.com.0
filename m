Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C75AF4297B1
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eBjqRTujOZfa191WpfRl/+jmthk3xvCEbCX/In0Tmpk=;
	b=Mvpu5bOPZta3Px6hWSH4zykYc4F3wA78K6CjW9I/ZmGDk9QJ1mZ5YqJ21I8DYSAjtJ9ArI
	LCBnxZzAoV0r7rFDAAlaAawiBpSnPocIIUvj7LhjQZpcqgHHVN4Bx2VFEL9MEgWYZL7LLX
	udy6XmUq8a621LLrJ89Kx84FvT0uIQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-fBMZnPF1O7-wa99bYnt5Kg-1; Mon, 11 Oct 2021 15:40:38 -0400
X-MC-Unique: fBMZnPF1O7-wa99bYnt5Kg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 627CB84A5E7;
	Mon, 11 Oct 2021 19:40:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 507052657E;
	Mon, 11 Oct 2021 19:40:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC23C180598A;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeUNT028781 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5173726DE2; Mon, 11 Oct 2021 19:40:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC9026E40
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:00 -0500
Message-Id: <20211011194008.50097-6-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 05/13] gfs2: change go_lock to
	go_instantiate
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, the go_lock glock operations (glops) did not do
any actual locking. They were used to instantiate objects, like reading
in dinodes and rgrps from the media.

This patch renames the functions to go_instantiate for clarity.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 4 ++--
 fs/gfs2/glops.c  | 8 ++++----
 fs/gfs2/incore.h | 2 +-
 fs/gfs2/rgrp.c   | 2 +-
 fs/gfs2/rgrp.h   | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 983bfe50bb90..09eb7d4bdf80 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -402,11 +402,11 @@ __acquires(&gl->gl_lockref.lock)
 			continue;
 		if (may_grant(gl, gh)) {
 			if (gh->gh_list.prev == &gl->gl_holders &&
-			    glops->go_lock) {
+			    glops->go_instantiate) {
 				if (!(gh->gh_flags & GL_SKIP)) {
 					spin_unlock(&gl->gl_lockref.lock);
 					/* FIXME: eliminate this eventually */
-					ret = glops->go_lock(gh);
+					ret = glops->go_instantiate(gh);
 					spin_lock(&gl->gl_lockref.lock);
 					if (ret) {
 						if (ret == 1)
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4b19f513570f..8452a83bd55a 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -482,13 +482,13 @@ int gfs2_inode_refresh(struct gfs2_inode *ip)
 }
 
 /**
- * inode_go_lock - operation done after an inode lock is locked by a process
+ * inode_go_instantiate - read in an inode if necessary
  * @gh: The glock holder
  *
  * Returns: errno
  */
 
-static int inode_go_lock(struct gfs2_holder *gh)
+static int inode_go_instantiate(struct gfs2_holder *gh)
 {
 	struct gfs2_glock *gl = gh->gh_gl;
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
@@ -740,7 +740,7 @@ const struct gfs2_glock_operations gfs2_inode_glops = {
 	.go_sync = inode_go_sync,
 	.go_inval = inode_go_inval,
 	.go_demote_ok = inode_go_demote_ok,
-	.go_lock = inode_go_lock,
+	.go_instantiate = inode_go_instantiate,
 	.go_dump = inode_go_dump,
 	.go_type = LM_TYPE_INODE,
 	.go_flags = GLOF_ASPACE | GLOF_LRU | GLOF_LVB,
@@ -750,7 +750,7 @@ const struct gfs2_glock_operations gfs2_inode_glops = {
 const struct gfs2_glock_operations gfs2_rgrp_glops = {
 	.go_sync = rgrp_go_sync,
 	.go_inval = rgrp_go_inval,
-	.go_lock = gfs2_rgrp_go_lock,
+	.go_instantiate = gfs2_rgrp_go_instantiate,
 	.go_dump = gfs2_rgrp_go_dump,
 	.go_type = LM_TYPE_RGRP,
 	.go_flags = GLOF_LVB,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 0fe49770166e..ae669ee7b1d8 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -220,7 +220,7 @@ struct gfs2_glock_operations {
 	int (*go_xmote_bh)(struct gfs2_glock *gl);
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
-	int (*go_lock) (struct gfs2_holder *gh);
+	int (*go_instantiate) (struct gfs2_holder *gh);
 	void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl,
 			const char *fs_id_buf);
 	void (*go_callback)(struct gfs2_glock *gl, bool remote);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 96b2fbed6bf1..cdcbc822064d 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1288,7 +1288,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	return 0;
 }
 
-int gfs2_rgrp_go_lock(struct gfs2_holder *gh)
+int gfs2_rgrp_go_instantiate(struct gfs2_holder *gh)
 {
 	struct gfs2_rgrpd *rgd = gh->gh_gl->gl_object;
 
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index a6855fd796e0..3e2ca1fb4305 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -31,7 +31,7 @@ extern struct gfs2_rgrpd *gfs2_rgrpd_get_next(struct gfs2_rgrpd *rgd);
 extern void gfs2_clear_rgrpd(struct gfs2_sbd *sdp);
 extern int gfs2_rindex_update(struct gfs2_sbd *sdp);
 extern void gfs2_free_clones(struct gfs2_rgrpd *rgd);
-extern int gfs2_rgrp_go_lock(struct gfs2_holder *gh);
+extern int gfs2_rgrp_go_instantiate(struct gfs2_holder *gh);
 extern void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd);
 
 extern struct gfs2_alloc *gfs2_alloc_get(struct gfs2_inode *ip);
-- 
2.31.1

