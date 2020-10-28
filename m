Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 75D0629CFEB
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Oct 2020 13:31:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603888299;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zF22pgZPTG8EC/DvGq1oZSll7rL4Pv/BaQ8W+4WQ2kA=;
	b=MQ29k+iLsO/1uBEArkaSQuHLgO8hjkoaLRGnWdwHIW3Kd775DLiaVabDjgFRPBUct2pMVc
	x5uMlbS0VPirP4bHX1Tsjm4kWCT8HobK5Jlhy2I5jLFYJGYI6kLQVI4LBpJPhXQYSUc7Iv
	J33vKR2U8j4UsJ75jsa63TS3McEBQTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-5N5r7vg8NrGhaZFowd2RTw-1; Wed, 28 Oct 2020 08:31:35 -0400
X-MC-Unique: 5N5r7vg8NrGhaZFowd2RTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1715C101962B;
	Wed, 28 Oct 2020 12:31:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31AD61001901;
	Wed, 28 Oct 2020 12:31:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4491044A67;
	Wed, 28 Oct 2020 12:31:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09SCUkI7015373 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 08:30:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0C6F1974D; Wed, 28 Oct 2020 12:30:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAA4D19646;
	Wed, 28 Oct 2020 12:30:43 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADEE818095FF;
	Wed, 28 Oct 2020 12:30:43 +0000 (UTC)
Date: Wed, 28 Oct 2020 08:30:43 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1654197063.23600036.1603888243591.JavaMail.zimbra@redhat.com>
In-Reply-To: <867523631.23600003.1603888188205.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.104, 10.4.195.25]
Thread-Topic: gfs2: add new glops for go_meta_sync
Thread-Index: KwVOpknzTjHSUif4p9dno/1D2lFIuA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: add new glops for go_meta_sync
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

This patch replaces 3/3 from the patchset I posted yesterday. This is
based on an idea from Andreas.

Before this patch, function gfs2_meta_sync called filemap_fdatawrite to write
the address space for the metadata being synced. That's great for inodes, but
resource groups all point to the same superblock-address space, sdp->sd_aspace.
Each rgrp has its own range of blocks on which it should operate. That meant
every time an rgrp's metadata was synced, it would write all of them instead
of just the range.

This patch changes function gfs2_meta_sync so that instead it calls a new
glops function, go_metasync for the appropriate type. The rgrp version is now
tailored to sync the appropriate range of addresses. The inode version is
pretty much unchanged. This also simplifies the existing glops go_sync functions
because they can simply call the metasync glops to do a subset of their work.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c  | 57 ++++++++++++++++++++++++++++++++++++++++++++++----------
 fs/gfs2/incore.h |  1 +
 fs/gfs2/lops.c   | 22 ----------------------
 fs/gfs2/lops.h   |  5 ++++-
 4 files changed, 52 insertions(+), 33 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index aa3f5236befb..14d6ab1ddb66 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -164,6 +164,32 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
 		       GFS2_LFC_AIL_FLUSH);
 }
 
+/**
+ * rgrp_go_metasync - sync out the metadata for this glock
+ * @gl: the glock
+ *
+ * Called by the go_sync function and the after_scan function.
+ */
+
+static int rgrp_go_metasync(struct gfs2_glock *gl)
+{
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+	struct address_space *mapping = &sdp->sd_aspace;
+	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
+	const unsigned bsize = sdp->sd_sb.sb_bsize;
+	loff_t start = (rgd->rd_addr * bsize) & PAGE_MASK;
+	loff_t end = PAGE_ALIGN((rgd->rd_addr + rgd->rd_length) * bsize) - 1;
+	int error;
+
+	filemap_fdatawrite_range(mapping, start, end);
+	error = filemap_fdatawait_range(mapping, start, end);
+	WARN_ON_ONCE(error && !gfs2_withdrawn(sdp));
+	mapping_set_error(mapping, error);
+	if (error)
+		gfs2_io_error(sdp);
+	return error;
+}
+
 /**
  * rgrp_go_sync - sync out the metadata for this glock
  * @gl: the glock
@@ -176,11 +202,7 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
 static int rgrp_go_sync(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	struct address_space *mapping = &sdp->sd_aspace;
 	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
-	const unsigned bsize = sdp->sd_sb.sb_bsize;
-	loff_t start = (rgd->rd_addr * bsize) & PAGE_MASK;
-	loff_t end = PAGE_ALIGN((rgd->rd_addr + rgd->rd_length) * bsize) - 1;
 	int error;
 
 	if (!test_and_clear_bit(GLF_DIRTY, &gl->gl_flags))
@@ -189,10 +211,7 @@ static int rgrp_go_sync(struct gfs2_glock *gl)
 
 	gfs2_log_flush(sdp, gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
 		       GFS2_LFC_RGRP_GO_SYNC);
-	filemap_fdatawrite_range(mapping, start, end);
-	error = filemap_fdatawait_range(mapping, start, end);
-	WARN_ON_ONCE(error && !gfs2_withdrawn(sdp));
-	mapping_set_error(mapping, error);
+	error = gl->gl_ops->go_metasync(gl);
 	if (!error)
 		error = gfs2_ail_empty_gl(gl);
 	gfs2_free_clones(rgd);
@@ -265,6 +284,23 @@ static void gfs2_clear_glop_pending(struct gfs2_inode *ip)
 	wake_up_bit(&ip->i_flags, GIF_GLOP_PENDING);
 }
 
+/**
+ * inode_go_metasync - Sync the dirty data and/or metadata for an inode glock
+ * @gl: the glock protecting the inode
+ *
+ */
+static int inode_go_metasync(struct gfs2_glock *gl)
+{
+	struct address_space *mapping = gfs2_glock2aspace(gl);
+	int error;
+
+	filemap_fdatawrite(mapping);
+	error = filemap_fdatawait(mapping);
+	if (error)
+		gfs2_io_error(gl->gl_name.ln_sbd);
+	return error;
+}
+
 /**
  * inode_go_sync - Sync the dirty data and/or metadata for an inode glock
  * @gl: the glock protecting the inode
@@ -297,8 +333,7 @@ static int inode_go_sync(struct gfs2_glock *gl)
 		error = filemap_fdatawait(mapping);
 		mapping_set_error(mapping, error);
 	}
-	ret = filemap_fdatawait(metamapping);
-	mapping_set_error(metamapping, ret);
+	ret = gl->gl_ops->go_metasync(gl);
 	if (!error)
 		error = ret;
 	gfs2_ail_empty_gl(gl);
@@ -704,6 +739,7 @@ const struct gfs2_glock_operations gfs2_meta_glops = {
 };
 
 const struct gfs2_glock_operations gfs2_inode_glops = {
+	.go_metasync = inode_go_metasync,
 	.go_sync = inode_go_sync,
 	.go_inval = inode_go_inval,
 	.go_demote_ok = inode_go_demote_ok,
@@ -715,6 +751,7 @@ const struct gfs2_glock_operations gfs2_inode_glops = {
 };
 
 const struct gfs2_glock_operations gfs2_rgrp_glops = {
+	.go_metasync = rgrp_go_metasync,
 	.go_sync = rgrp_go_sync,
 	.go_inval = rgrp_go_inval,
 	.go_lock = gfs2_rgrp_go_lock,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index d7707307f4b1..b84e9c0eb212 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -238,6 +238,7 @@ struct lm_lockname {
 
 
 struct gfs2_glock_operations {
+	int (*go_metasync) (struct gfs2_glock *gl);
 	int (*go_sync) (struct gfs2_glock *gl);
 	int (*go_xmote_bh) (struct gfs2_glock *gl, struct gfs2_holder *gh);
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index ed69298dd824..180101312da0 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -817,28 +817,6 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
 	return error;
 }
 
-/**
- * gfs2_meta_sync - Sync all buffers associated with a glock
- * @gl: The glock
- *
- */
-
-void gfs2_meta_sync(struct gfs2_glock *gl)
-{
-	struct address_space *mapping = gfs2_glock2aspace(gl);
-	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	int error;
-
-	if (mapping == NULL)
-		mapping = &sdp->sd_aspace;
-
-	filemap_fdatawrite(mapping);
-	error = filemap_fdatawait(mapping);
-
-	if (error)
-		gfs2_io_error(gl->gl_name.ln_sbd);
-}
-
 static void buf_lo_after_scan(struct gfs2_jdesc *jd, int error, int pass)
 {
 	struct gfs2_inode *ip = GFS2_I(jd->jd_inode);
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 4a3d8aecdf82..dae1e48464f4 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -27,7 +27,10 @@ extern void gfs2_log_submit_bio(struct bio **biop, int opf);
 extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
 extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
 			   struct gfs2_log_header_host *head, bool keep_cache);
-extern void gfs2_meta_sync(struct gfs2_glock *gl);
+static inline void gfs2_meta_sync(struct gfs2_glock *gl)
+{
+	gl->gl_ops->go_metasync(gl);
+}
 
 static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
 {

