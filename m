Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8556F23DAD5
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721110;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kCCCguT0ch3licX2qfwXA6D90OPjDS2OZwnftRJaDoY=;
	b=E4XSiLLkUCUWv6qguYsgte/mWyI8b9XEFMcR9KxN+f2F1t8yKBj0LkakyVSu8V95KDPwd1
	Y2K/Ri/ld7EuRzMqMxhbHxQ3GpHeDVUpHdiqKAPVnJuW4kNlIkJ3p5s11CiIgWuGCdX/bs
	5fSIpugKhu1oDKJLgIQuhuV48Em2xuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-pvggoQoSNJGWIY4xH4W8tA-1; Thu, 06 Aug 2020 09:38:27 -0400
X-MC-Unique: pvggoQoSNJGWIY4xH4W8tA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25FCA10932E1;
	Thu,  6 Aug 2020 13:38:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 158C56842F;
	Thu,  6 Aug 2020 13:38:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 028531809554;
	Thu,  6 Aug 2020 13:38:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcLGR030694 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67A7E60BF1; Thu,  6 Aug 2020 13:38:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD5E6842F
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:20 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:42 +0100
Message-Id: <20200806133807.111280-8-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 07/32] libgfs2: Remove gfs2_buffer_head from
	lgfs2_gfs_inode_get()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Give lgfs2_gfs_inode_read() its own reading code for now. Removing bh's
from that will involve removing the i_bh field from gfs2_inode, which
has a lot of users.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  2 +-
 gfs2/edit/savemeta.c        |  4 ++--
 gfs2/fsck/metawalk.c        |  2 +-
 gfs2/libgfs2/gfs1.c         | 33 ++++++++++++++++++---------------
 gfs2/libgfs2/libgfs2.h      |  6 ++----
 5 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 7de0f924..54a6ec1b 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -867,7 +867,7 @@ static int adjust_inode(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh)
 	struct inode_block *fixdir;
 	int inode_was_gfs1;
 
-	inode = lgfs2_gfs_inode_get(sbp, bh);
+	inode = lgfs2_gfs_inode_get(sbp, bh->b_data);
 	if (inode == NULL) {
 		log_crit(_("Error reading inode: %s\n"), strerror(errno));
 		return -1;
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 10e3bcce..cbecf281 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -303,7 +303,7 @@ static size_t di_save_len(struct gfs2_buffer_head *bh, uint64_t owner)
 	size_t len;
 
 	if (sbd.gfs1)
-		inode = lgfs2_gfs_inode_get(&sbd, bh);
+		inode = lgfs2_gfs_inode_get(&sbd, bh->b_data);
 	else
 		inode = lgfs2_inode_get(&sbd, bh);
 
@@ -724,7 +724,7 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 		osi_list_init(&metalist[i]);
 	metabh = bread(&sbd, iblk);
 	if (sbd.gfs1) {
-		inode = lgfs2_gfs_inode_get(&sbd, metabh);
+		inode = lgfs2_gfs_inode_get(&sbd, metabh->b_data);
 	} else {
 		inode = lgfs2_inode_get(&sbd, metabh);
 	}
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 265fa760..a425e884 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -292,7 +292,7 @@ struct gfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 		return sysip;
 
 	if (sdp->gfs1)
-		ip = lgfs2_gfs_inode_get(sdp, bh);
+		ip = lgfs2_gfs_inode_get(sdp, bh->b_data);
 	else
 		ip = lgfs2_inode_get(sdp, bh);
 	if (ip)
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 7da23168..29e4f12d 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -277,9 +277,7 @@ static void gfs_dinode_in(struct gfs_dinode *di, char *buf)
 	di->di_eattr = be64_to_cpu(str->di_eattr);
 }
 
-static struct gfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp,
-					  struct gfs2_buffer_head *bh,
-					  uint64_t di_addr)
+static struct gfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp, char *buf, uint64_t di_addr)
 {
 	struct gfs_dinode gfs1_dinode;
 	struct gfs2_inode *ip;
@@ -288,13 +286,7 @@ static struct gfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp,
 	if (ip == NULL) {
 		return NULL;
 	}
-
-	ip->bh_owned = 0;
-	if (!bh) {
-		bh = bread(sdp, di_addr);
-		ip->bh_owned = 1;
-	}
-	gfs_dinode_in(&gfs1_dinode, bh->b_data);
+	gfs_dinode_in(&gfs1_dinode, buf);
 	memcpy(&ip->i_di.di_header, &gfs1_dinode.di_header,
 	       sizeof(struct gfs2_meta_header));
 	memcpy(&ip->i_di.di_num, &gfs1_dinode.di_num,
@@ -319,20 +311,31 @@ static struct gfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp,
 	ip->i_di.di_depth = gfs1_dinode.di_depth;
 	ip->i_di.di_entries = gfs1_dinode.di_entries;
 	ip->i_di.di_eattr = gfs1_dinode.di_eattr;
-	ip->i_bh = bh;
 	ip->i_sbd = sdp;
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp,
-				 struct gfs2_buffer_head *bh)
+struct gfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
 {
-	return __gfs_inode_get(sdp, bh, 0);
+	return __gfs_inode_get(sdp, buf, 0);
 }
 
 struct gfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 {
-	return __gfs_inode_get(sdp, NULL, di_addr);
+	struct gfs2_buffer_head *bh;
+	struct gfs2_inode *ip;
+
+	bh = bget(sdp, di_addr);
+	if (bh == NULL)
+		return NULL;
+	if (pread(sdp->device_fd, bh->b_data, sdp->bsize, di_addr * sdp->bsize) != sdp->bsize) {
+		brelse(bh);
+		return NULL;
+	}
+	ip = __gfs_inode_get(sdp, bh->b_data, di_addr);
+	ip->i_bh = bh;
+	ip->bh_owned = 1;
+	return ip;
 }
 
 /* ------------------------------------------------------------------------ */
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 59fb18e8..a34e77a7 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -639,10 +639,8 @@ extern void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 extern int gfs1_writei(struct gfs2_inode *ip, char *buf, uint64_t offset,
 		       unsigned int size);
 extern int gfs1_ri_update(struct gfs2_sbd *sdp, int fd, int *rgcount, int quiet);
-extern struct gfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp,
-					struct gfs2_buffer_head *bh);
-extern struct gfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp,
-					 uint64_t di_addr);
+extern struct gfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf);
+extern struct gfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
 extern void gfs_jindex_in(struct gfs_jindex *jindex, char *buf);
 extern void gfs_rgrp_in(struct gfs_rgrp *rg, const char *buf);
 extern void gfs_rgrp_out(const struct gfs_rgrp *rg, char *buf);
-- 
2.26.2

