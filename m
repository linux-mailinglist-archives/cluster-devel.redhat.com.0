Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB2729EEAF
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Oct 2020 15:47:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603982846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qvqb2ZLKe7PVESlHXZHh++5fHl7IW+Q7ISY9EQ0Rivs=;
	b=S+EAlPhWtirzRdGu5yh92lr9JYCfFIpESZM6aQnSsXpWBGp361y72O7gbyvG6Aysvruqfl
	EX/ti3uNx8imtbVLUFbyITQCZVfWxm4sOwaTkVFDCVfEylScapN2aQuPCTlVfYiEA4Gtrz
	CwWyQakWQLoNdaGKV+QyNH19ZiJq/lY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-cH1CS723OyqaVHccsPgr_A-1; Thu, 29 Oct 2020 10:47:24 -0400
X-MC-Unique: cH1CS723OyqaVHccsPgr_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A13191018F7B;
	Thu, 29 Oct 2020 14:47:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C28918E3E;
	Thu, 29 Oct 2020 14:47:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C04DC181A869;
	Thu, 29 Oct 2020 14:47:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TElHlA021006 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 10:47:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D27A55C22D; Thu, 29 Oct 2020 14:47:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCEA95C1C4
	for <cluster-devel@redhat.com>; Thu, 29 Oct 2020 14:47:14 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDEA1181A869
	for <cluster-devel@redhat.com>; Thu, 29 Oct 2020 14:47:14 +0000 (UTC)
Date: Thu, 29 Oct 2020 10:47:12 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1250425864.23757159.1603982832433.JavaMail.zimbra@redhat.com>
In-Reply-To: <2005941010.23755873.1603982646505.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.104, 10.4.195.15]
Thread-Topic: gfs2: Split up gfs2_meta_sync into inode and rgrp versions
Thread-Index: 4DP36yuMGSa70RVvDKeMWJuQrfZksw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Split up gfs2_meta_sync into
 inode and rgrp versions
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, function gfs2_meta_sync called filemap_fdatawrite to write
the address space for the metadata being synced. That's great for inodes, but
resource groups all point to the same superblock-address space, sdp->sd_aspace.
Each rgrp has its own range of blocks on which it should operate. That meant
every time an rgrp's metadata was synced, it would write all of them instead
of just the range.

This patch eliminates function gfs2_meta_sync and tailors specific metasync
functions for inodes and rgrps.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c    | 56 +++++++++++++++++++++++++++++++++++++++++++-----------
 fs/gfs2/glops.h    |  1 +
 fs/gfs2/lops.c     | 31 +++++-------------------------
 fs/gfs2/lops.h     |  2 --
 fs/gfs2/recovery.c |  2 +-
 5 files changed, 52 insertions(+), 40 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index aa3f5236befb..6c1432d78dce 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -164,6 +164,31 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
 		       GFS2_LFC_AIL_FLUSH);
 }
 
+/**
+ * gfs2_rgrp_metasync - sync out the metadata of a resource group
+ * @gl: the glock protecting the resource group
+ *
+ */
+
+static int gfs2_rgrp_metasync(struct gfs2_glock *gl)
+{
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+	struct address_space *metamapping = &sdp->sd_aspace;
+	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
+	const unsigned bsize = sdp->sd_sb.sb_bsize;
+	loff_t start = (rgd->rd_addr * bsize) & PAGE_MASK;
+	loff_t end = PAGE_ALIGN((rgd->rd_addr + rgd->rd_length) * bsize) - 1;
+	int error;
+
+	filemap_fdatawrite_range(metamapping, start, end);
+	error = filemap_fdatawait_range(metamapping, start, end);
+	WARN_ON_ONCE(error && !gfs2_withdrawn(sdp));
+	mapping_set_error(metamapping, error);
+	if (error)
+		gfs2_io_error(sdp);
+	return error;
+}
+
 /**
  * rgrp_go_sync - sync out the metadata for this glock
  * @gl: the glock
@@ -176,11 +201,7 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
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
@@ -189,10 +210,7 @@ static int rgrp_go_sync(struct gfs2_glock *gl)
 
 	gfs2_log_flush(sdp, gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
 		       GFS2_LFC_RGRP_GO_SYNC);
-	filemap_fdatawrite_range(mapping, start, end);
-	error = filemap_fdatawait_range(mapping, start, end);
-	WARN_ON_ONCE(error && !gfs2_withdrawn(sdp));
-	mapping_set_error(mapping, error);
+	error = gfs2_rgrp_metasync(gl);
 	if (!error)
 		error = gfs2_ail_empty_gl(gl);
 	gfs2_free_clones(rgd);
@@ -266,7 +284,24 @@ static void gfs2_clear_glop_pending(struct gfs2_inode *ip)
 }
 
 /**
- * inode_go_sync - Sync the dirty data and/or metadata for an inode glock
+ * gfs2_inode_metasync - sync out the metadata of an inode
+ * @gl: the glock protecting the inode
+ *
+ */
+int gfs2_inode_metasync(struct gfs2_glock *gl)
+{
+	struct address_space *metamapping = gfs2_glock2aspace(gl);
+	int error;
+
+	filemap_fdatawrite(metamapping);
+	error = filemap_fdatawait(metamapping);
+	if (error)
+		gfs2_io_error(gl->gl_name.ln_sbd);
+	return error;
+}
+
+/**
+ * inode_go_sync - Sync the dirty metadata of an inode
  * @gl: the glock protecting the inode
  *
  */
@@ -297,8 +332,7 @@ static int inode_go_sync(struct gfs2_glock *gl)
 		error = filemap_fdatawait(mapping);
 		mapping_set_error(mapping, error);
 	}
-	ret = filemap_fdatawait(metamapping);
-	mapping_set_error(metamapping, ret);
+	ret = gfs2_inode_metasync(gl);
 	if (!error)
 		error = ret;
 	gfs2_ail_empty_gl(gl);
diff --git a/fs/gfs2/glops.h b/fs/gfs2/glops.h
index 2dd192e85618..695898afcaf1 100644
--- a/fs/gfs2/glops.h
+++ b/fs/gfs2/glops.h
@@ -22,6 +22,7 @@ extern const struct gfs2_glock_operations gfs2_quota_glops;
 extern const struct gfs2_glock_operations gfs2_journal_glops;
 extern const struct gfs2_glock_operations *gfs2_glops_list[];
 
+extern int gfs2_inode_metasync(struct gfs2_glock *gl);
 extern void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync);
 
 #endif /* __GLOPS_DOT_H__ */
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index ed69298dd824..3922b26264f5 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -22,6 +22,7 @@
 #include "incore.h"
 #include "inode.h"
 #include "glock.h"
+#include "glops.h"
 #include "log.h"
 #include "lops.h"
 #include "meta_io.h"
@@ -817,41 +818,19 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
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
 	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
 
 	if (error) {
-		gfs2_meta_sync(ip->i_gl);
+		gfs2_inode_metasync(ip->i_gl);
 		return;
 	}
 	if (pass != 1)
 		return;
 
-	gfs2_meta_sync(ip->i_gl);
+	gfs2_inode_metasync(ip->i_gl);
 
 	fs_info(sdp, "jid=%u: Replayed %u of %u blocks\n",
 	        jd->jd_jid, jd->jd_replayed_blocks, jd->jd_found_blocks);
@@ -1060,14 +1039,14 @@ static void databuf_lo_after_scan(struct gfs2_jdesc *jd, int error, int pass)
 	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
 
 	if (error) {
-		gfs2_meta_sync(ip->i_gl);
+		gfs2_inode_metasync(ip->i_gl);
 		return;
 	}
 	if (pass != 1)
 		return;
 
 	/* data sync? */
-	gfs2_meta_sync(ip->i_gl);
+	gfs2_inode_metasync(ip->i_gl);
 
 	fs_info(sdp, "jid=%u: Replayed %u of %u data blocks\n",
 		jd->jd_jid, jd->jd_replayed_blocks, jd->jd_found_blocks);
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 4a3d8aecdf82..fbdbb08dcec6 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -27,8 +27,6 @@ extern void gfs2_log_submit_bio(struct bio **biop, int opf);
 extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
 extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
 			   struct gfs2_log_header_host *head, bool keep_cache);
-extern void gfs2_meta_sync(struct gfs2_glock *gl);
-
 static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
 {
 	unsigned int limit;
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index b5cbe21efdfb..c26c68ebd29d 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -349,7 +349,7 @@ static int update_statfs_inode(struct gfs2_jdesc *jd,
 
 	mark_buffer_dirty(bh);
 	brelse(bh);
-	gfs2_meta_sync(ip->i_gl);
+	gfs2_inode_metasync(ip->i_gl);
 
 out:
 	return error;

