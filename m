Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 28FE335DFB2
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Apr 2021 15:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618319182;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EJnU/ZPaW2xXTFcaWwRAh6Z6P34zJQUEZMwnnhDqkGg=;
	b=BWq8YWRYagv3RWfOAj5RDkKiFyQgeeucShr9tXVmrqOcmEuTcDqHpwIdl+N7LbKfMPa8Wc
	SEIJ8r+kq76LuGiMzzjxFjeMdYYZgwIMPtP2HVaek9anIOFFtiZ+cqN406CnfaooQdxnrh
	vRVs8sDTDJ9CHCjtg5XvmSh++FBUgmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-vgo024I1N_uImf-2oWz55g-1; Tue, 13 Apr 2021 09:06:18 -0400
X-MC-Unique: vgo024I1N_uImf-2oWz55g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0C2A1926DB6;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D144260C04;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C8351806D17;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13DD69SL031049 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 09:06:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1E601045D30; Tue, 13 Apr 2021 13:06:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDEA91042A9C
	for <cluster-devel@redhat.com>; Tue, 13 Apr 2021 13:06:08 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 13 Apr 2021 14:05:29 +0100
Message-Id: <20210413130532.1277163-3-anprice@redhat.com>
In-Reply-To: <20210413130532.1277163-1-anprice@redhat.com>
References: <20210413130532.1277163-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/5] fsck.gfs2: Call rindex_read() outside
	of ri_update()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This will allow us to make better decisions about which checks failed
down the line.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/fsck.h       |  2 +-
 gfs2/fsck/initialize.c | 26 +++++++++++++-------------
 gfs2/fsck/rgrepair.c   |  3 +--
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index a5159d4b..d23326ec 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -130,7 +130,7 @@ extern int pass2(struct gfs2_sbd *sdp);
 extern int pass3(struct gfs2_sbd *sdp);
 extern int pass4(struct gfs2_sbd *sdp);
 extern int pass5(struct gfs2_sbd *sdp, struct gfs2_bmap *bl);
-extern int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *rg_count, int *ok);
+extern int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok);
 extern int fsck_query(const char *format, ...)
 	__attribute__((format(printf,1,2)));
 extern struct dir_info *dirtree_find(uint64_t block);
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 0cafeb95..5be561f8 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -677,18 +677,18 @@ static unsigned gfs2_rgrp_reada(struct gfs2_sbd *sdp, unsigned cur_window,
 /**
  * ri_update - attach rgrps to the super block
  * @sdp: incore superblock data
- * @rgcount: returned count of rgs
+ * @expected: number of resource groups expected (rindex entries)
  *
  * Given the rgrp index inode, link in all rgrps into the super block
  * and be sure that they can be read.
  *
  * Returns: 0 on success, -1 on failure.
  */
-static int ri_update(struct gfs2_sbd *sdp, int *rgcount, int *ok)
+static int ri_update(struct gfs2_sbd *sdp, uint64_t expected)
 {
 	struct rgrp_tree *rgd;
 	struct gfs2_rindex *ri;
-	uint64_t count1 = 0, count2 = 0;
+	uint64_t count = 0;
 	uint64_t errblock = 0;
 	uint64_t rmax = 0;
 	struct osi_node *n, *next = NULL;
@@ -697,8 +697,6 @@ static int ri_update(struct gfs2_sbd *sdp, int *rgcount, int *ok)
 	/* Turn off generic readhead */
 	posix_fadvise(sdp->device_fd, 0, 0, POSIX_FADV_RANDOM);
 
-	if (rindex_read(sdp, &count1, ok))
-		goto fail;
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
 		rgd = (struct rgrp_tree *)n;
@@ -710,15 +708,14 @@ static int ri_update(struct gfs2_sbd *sdp, int *rgcount, int *ok)
 		if (errblock)
 			return errblock;
 		ra_window--;
-		count2++;
+		count++;
 		ri = &rgd->ri;
 		if (ri->ri_data0 + ri->ri_data - 1 > rmax)
 			rmax = ri->ri_data0 + ri->ri_data - 1;
 	}
 
 	sdp->fssize = rmax;
-	*rgcount = count1;
-	if (count1 != count2)
+	if (count != expected)
 		goto fail;
 
 	posix_fadvise(sdp->device_fd, 0, 0, POSIX_FADV_NORMAL);
@@ -730,7 +727,7 @@ static int ri_update(struct gfs2_sbd *sdp, int *rgcount, int *ok)
 	return -1;
 }
 
-static int fetch_rgrps_level(struct gfs2_sbd *sdp, enum rgindex_trust_level lvl, int *count, int *ok)
+static int fetch_rgrps_level(struct gfs2_sbd *sdp, enum rgindex_trust_level lvl, uint64_t *count, int *ok)
 {
 	int ret = 1;
 
@@ -751,10 +748,13 @@ static int fetch_rgrps_level(struct gfs2_sbd *sdp, enum rgindex_trust_level lvl,
 
 	log_notice(_("Level %d resource group check: %s.\n"), lvl + 1, level_desc[lvl]);
 
-	if (rg_repair(sdp, lvl, count, ok) != 0)
+	if (rg_repair(sdp, lvl, ok) != 0)
+		goto fail;
+
+	if (rindex_read(sdp, count, ok) != 0)
 		goto fail;
 
-	ret = ri_update(sdp, count, ok);
+	ret = ri_update(sdp, *count);
 	if (ret != 0)
 		goto fail;
 
@@ -775,7 +775,7 @@ fail:
 static int fetch_rgrps(struct gfs2_sbd *sdp)
 {
 	enum rgindex_trust_level trust_lvl;
-	int rgcount;
+	uint64_t rgcount;
 	int ok = 1;
 
 	log_notice(_("Validating resource group index.\n"));
@@ -793,7 +793,7 @@ static int fetch_rgrps(struct gfs2_sbd *sdp)
 			   "this file system.\n"));
 		return -1;
 	}
-	log_info( _("%u resource groups found.\n"), rgcount);
+	log_info( _("%"PRIu64" resource groups found.\n"), rgcount);
 
 	check_rgrps_integrity(sdp);
 	return 0;
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 7f0854ca..2bddd91f 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -1015,7 +1015,7 @@ static int expect_rindex_sanity(struct gfs2_sbd *sdp, int *num_rgs)
  *             was converted from GFS via gfs2_convert, and its rgrps are
  *             not on nice boundaries thanks to previous gfs_grow ops. Lovely.
  */
-int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *rg_count, int *ok)
+int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 {
 	struct osi_node *n, *next = NULL, *e, *enext;
 	int error, discrepancies, percent;
@@ -1283,7 +1283,6 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *rg_count, int *ok)
 			i++;
 		} while (i < rgd->ri.ri_length);
 	}
-	*rg_count = rg;
 	gfs2_rgrp_free(sdp, &sdp->rgcalc);
 	gfs2_rgrp_free(sdp, &sdp->rgtree);
 	/* We shouldn't need to worry about getting the user's permission to
-- 
2.30.2

