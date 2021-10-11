Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC41F4297B3
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981243;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w9oGgsNf+aRm5fQ9LUIc78TxyEGAlooPapROWwbXwWc=;
	b=PIGTCIM+E3nJ74INDUkku06Ic3lhtJbl0FNkStW+qlQ8TqIMoVopOQsM9zIyize7flQlrY
	KGMIHTMb/kl5KgSiAHz389MNVakMTLpKLVdqCPJsAMimassuQFxD5175kFY08FPC8GqstT
	k9eMNuwYzz8ZAn9Ar/Pa6XJzd+ohhZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-kjHwWK_YN4ayyJfWpgHQ1A-1; Mon, 11 Oct 2021 15:40:40 -0400
X-MC-Unique: kjHwWK_YN4ayyJfWpgHQ1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21E4684A5E4;
	Mon, 11 Oct 2021 19:40:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1610060938;
	Mon, 11 Oct 2021 19:40:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 786804EA39;
	Mon, 11 Oct 2021 19:40:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeW5A028851 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A69FF2657E; Mon, 11 Oct 2021 19:40:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 716412657D
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:32 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:07 -0500
Message-Id: <20211011194008.50097-13-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 12/13] gfs2: remove RDF_UPTODATE flag
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

The new GLF_INSTANTIATE_NEEDED flag obsoletes the old rgrp flag
GFS2_RDF_UPTODATE, so this patch replaces it like we did with inodes.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c  |  2 +-
 fs/gfs2/incore.h |  1 -
 fs/gfs2/rgrp.c   | 36 ++++++++++++++----------------------
 3 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 0b6a59f71eef..650ad77c4d0b 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -228,7 +228,7 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 	gfs2_rgrp_brelse(rgd);
 	WARN_ON_ONCE(!(flags & DIO_METADATA));
 	truncate_inode_pages_range(mapping, start, end);
-	rgd->rd_flags &= ~GFS2_RDF_UPTODATE;
+	set_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
 }
 
 static void gfs2_rgrp_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 183badadac85..22a753be3a63 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -119,7 +119,6 @@ struct gfs2_rgrpd {
 	u32 rd_flags;
 	u32 rd_extfail_pt;		/* extent failure point */
 #define GFS2_RDF_CHECK		0x10000000 /* check for unlinked inodes */
-#define GFS2_RDF_UPTODATE	0x20000000 /* rg is up to date */
 #define GFS2_RDF_ERROR		0x40000000 /* error in rg */
 #define GFS2_RDF_PREFERRED	0x80000000 /* This rgrp is preferred */
 #define GFS2_RDF_MASK		0xf0000000 /* mask for internal flags */
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 5ee7da3a450e..0fb3c01bc557 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -932,7 +932,7 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 		goto fail;
 
 	rgd->rd_rgl = (struct gfs2_rgrp_lvb *)rgd->rd_gl->gl_lksb.sb_lvbptr;
-	rgd->rd_flags &= ~(GFS2_RDF_UPTODATE | GFS2_RDF_PREFERRED);
+	rgd->rd_flags &= ~GFS2_RDF_PREFERRED;
 	if (rgd->rd_data > sdp->sd_max_rg_data)
 		sdp->sd_max_rg_data = rgd->rd_data;
 	spin_lock(&sdp->sd_rindex_spin);
@@ -1185,8 +1185,8 @@ static void rgrp_set_bitmap_flags(struct gfs2_rgrpd *rgd)
 }
 
 /**
- * gfs2_rgrp_bh_get - Read in a RG's header and bitmaps
- * @rgd: the struct gfs2_rgrpd describing the RG to read in
+ * gfs2_rgrp_go_instantiate - Read in a RG's header and bitmaps
+ * @gh: the glock holder representing the rgrpd to read in
  *
  * Read in all of a Resource Group's header and bitmap blocks.
  * Caller must eventually call gfs2_rgrp_brelse() to free the bitmaps.
@@ -1194,10 +1194,11 @@ static void rgrp_set_bitmap_flags(struct gfs2_rgrpd *rgd)
  * Returns: errno
  */
 
-static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
+int gfs2_rgrp_go_instantiate(struct gfs2_holder *gh)
 {
+	struct gfs2_glock *gl = gh->gh_gl;
+	struct gfs2_rgrpd *rgd = gl->gl_object;
 	struct gfs2_sbd *sdp = rgd->rd_sbd;
-	struct gfs2_glock *gl = rgd->rd_gl;
 	unsigned int length = rgd->rd_length;
 	struct gfs2_bitmap *bi;
 	unsigned int x, y;
@@ -1225,15 +1226,13 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 		}
 	}
 
-	if (!(rgd->rd_flags & GFS2_RDF_UPTODATE)) {
-		gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
-		rgrp_set_bitmap_flags(rgd);
-		rgd->rd_flags |= (GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
-		rgd->rd_free_clone = rgd->rd_free;
-		GLOCK_BUG_ON(rgd->rd_gl, rgd->rd_reserved);
-		/* max out the rgrp allocation failure point */
-		rgd->rd_extfail_pt = rgd->rd_free;
-	}
+	gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
+	rgrp_set_bitmap_flags(rgd);
+	rgd->rd_flags |= GFS2_RDF_CHECK;
+	rgd->rd_free_clone = rgd->rd_free;
+	GLOCK_BUG_ON(rgd->rd_gl, rgd->rd_reserved);
+	/* max out the rgrp allocation failure point */
+	rgd->rd_extfail_pt = rgd->rd_free;
 	if (cpu_to_be32(GFS2_MAGIC) != rgd->rd_rgl->rl_magic) {
 		rgd->rd_rgl->rl_unlinked = cpu_to_be32(count_unlinked(rgd));
 		gfs2_rgrp_ondisk2lvb(rgd->rd_rgl,
@@ -1263,7 +1262,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd, struct gfs2_holder *gh)
 {
 	u32 rl_flags;
 
-	if (rgd->rd_flags & GFS2_RDF_UPTODATE)
+	if (!test_bit(GLF_INSTANTIATE_NEEDED, &gh->gh_gl->gl_flags))
 		return 0;
 
 	if (cpu_to_be32(GFS2_MAGIC) != rgd->rd_rgl->rl_magic)
@@ -1286,13 +1285,6 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd, struct gfs2_holder *gh)
 	return 0;
 }
 
-int gfs2_rgrp_go_instantiate(struct gfs2_holder *gh)
-{
-	struct gfs2_rgrpd *rgd = gh->gh_gl->gl_object;
-
-	return gfs2_rgrp_bh_get(rgd);
-}
-
 /**
  * gfs2_rgrp_brelse - Release RG bitmaps read in with gfs2_rgrp_bh_get()
  * @rgd: The resource group
-- 
2.31.1

