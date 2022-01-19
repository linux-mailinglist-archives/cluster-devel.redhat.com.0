Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8770F4938C3
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NNvIn1JXtrksaq7jbVAaydnFk8rPOZt2jYHhZxr001k=;
	b=CdY7X1moFanfjuAv8bMZ2JsrdJ4QQ4liIv8NPBU+CZ7v7sL5rZwt71LiaAUJ6WOqbp8Gm3
	PtuZ8p5p4aJoBnXxAZVcIMj2OOrk+l85N7l/iOpghsLK9C8hhuMGyVbdmst/hEbxwPnH1W
	of/lQKPF2OfVZgLVauPeaZfBIpbps50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-M5qctK4PM_akk0QRzSVzSg-1; Wed, 19 Jan 2022 05:44:29 -0500
X-MC-Unique: M5qctK4PM_akk0QRzSVzSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5E7101F7AE;
	Wed, 19 Jan 2022 10:44:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEAF66F116;
	Wed, 19 Jan 2022 10:44:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65DE31806D1C;
	Wed, 19 Jan 2022 10:44:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiO3o024498 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C09F278B18; Wed, 19 Jan 2022 10:44:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2065278B10
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:23 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:06 +0000
Message-Id: <20220119104316.2489995-12-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/21] libgfs2: Namespace improvements -
	recovery.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/fs_recovery.c | 22 +++++++++++-----------
 gfs2/libgfs2/libgfs2.h  |  4 ++--
 gfs2/libgfs2/recovery.c |  8 ++++----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 5bd46301..4a2d1259 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -135,9 +135,9 @@ static int buf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 	if (pass != 1 || be32_to_cpu(ld->ld_type) != GFS2_LOG_DESC_METADATA)
 		return 0;
 
-	gfs2_replay_incr_blk(ip, &start);
+	lgfs2_replay_incr_blk(ip, &start);
 
-	for (; blks; gfs2_replay_incr_blk(ip, &start), blks--) {
+	for (; blks; lgfs2_replay_incr_blk(ip, &start), blks--) {
 		struct gfs2_meta_header *mhp;
 
 		sd_found_metablocks++;
@@ -147,7 +147,7 @@ static int buf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 		if (revoke_check(sdp, blkno, start))
 			continue;
 
-		error = gfs2_replay_read_block(ip, start, &bh_log);
+		error = lgfs2_replay_read_block(ip, start, &bh_log);
 		if (error)
 			return error;
 
@@ -200,8 +200,8 @@ static int revoke_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 
 	offset = sizeof(struct gfs2_log_descriptor);
 
-	for (; blks; gfs2_replay_incr_blk(ip, &start), blks--) {
-		error = gfs2_replay_read_block(ip, start, &bh);
+	for (; blks; lgfs2_replay_incr_blk(ip, &start), blks--) {
+		error = lgfs2_replay_read_block(ip, start, &bh);
 		if (error)
 			return error;
 
@@ -246,8 +246,8 @@ static int databuf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 	if (pass != 1 || be32_to_cpu(ld->ld_type) != GFS2_LOG_DESC_JDATA)
 		return 0;
 
-	gfs2_replay_incr_blk(ip, &start);
-	for (; blks; gfs2_replay_incr_blk(ip, &start), blks--) {
+	lgfs2_replay_incr_blk(ip, &start);
+	for (; blks; lgfs2_replay_incr_blk(ip, &start), blks--) {
 		blkno = be64_to_cpu(*ptr);
 		ptr++;
 		esc = be64_to_cpu(*ptr);
@@ -258,7 +258,7 @@ static int databuf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 		if (revoke_check(sdp, blkno, start))
 			continue;
 
-		error = gfs2_replay_read_block(ip, start, &bh_log);
+		error = lgfs2_replay_read_block(ip, start, &bh_log);
 		if (error)
 			return error;
 
@@ -313,7 +313,7 @@ static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
 	while (start != end) {
 		struct gfs2_meta_header *mhp;
 
-		error = gfs2_replay_read_block(ip, start, &bh);
+		error = lgfs2_replay_read_block(ip, start, &bh);
 		if (error)
 			return error;
 		mhp = (struct gfs2_meta_header *)bh->b_data;
@@ -330,7 +330,7 @@ static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
 
 			error = lgfs2_get_log_header(ip, start, &lh);
 			if (!error) {
-				gfs2_replay_incr_blk(ip, &start);
+				lgfs2_replay_incr_blk(ip, &start);
 				lgfs2_bmodified(bh);
 				lgfs2_brelse(bh);
 				continue;
@@ -369,7 +369,7 @@ static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
 		}
 
 		while (length--)
-			gfs2_replay_incr_blk(ip, &start);
+			lgfs2_replay_incr_blk(ip, &start);
 
 		lgfs2_bmodified(bh);
 		lgfs2_brelse(bh);
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index e9e0c184..d091e180 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -730,8 +730,8 @@ extern int lgfs2_open_mnt_dev(const char *path, int flags, struct mntent **mnt);
 extern int lgfs2_open_mnt_dir(const char *path, int flags, struct mntent **mnt);
 
 /* recovery.c */
-extern void gfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk);
-extern int gfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
+extern void lgfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk);
+extern int lgfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
 				  struct gfs2_buffer_head **bh);
 extern int lgfs2_get_log_header(struct gfs2_inode *ip, unsigned int blk,
                                 struct lgfs2_log_header *head);
diff --git a/gfs2/libgfs2/recovery.c b/gfs2/libgfs2/recovery.c
index 3984e1e3..483661e4 100644
--- a/gfs2/libgfs2/recovery.c
+++ b/gfs2/libgfs2/recovery.c
@@ -14,7 +14,7 @@
 #include <string.h>
 #include "libgfs2.h"
 
-void gfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk)
+void lgfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk)
 {
 	uint32_t jd_blocks = ip->i_size / ip->i_sbd->sd_bsize;
 
@@ -22,7 +22,7 @@ void gfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk)
                 *blk = 0;
 }
 
-int gfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
+int lgfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
 			   struct gfs2_buffer_head **bh)
 {
 	int new = 0;
@@ -77,7 +77,7 @@ int lgfs2_get_log_header(struct gfs2_inode *ip, unsigned int blk,
 	uint32_t crc;
 	int error;
 
-	error = gfs2_replay_read_block(ip, blk, &bh);
+	error = lgfs2_replay_read_block(ip, blk, &bh);
 	if (error)
 		return error;
 
@@ -240,7 +240,7 @@ int lgfs2_clean_journal(struct gfs2_inode *ip, struct lgfs2_log_header *head)
 	uint64_t dblock;
 
 	lblock = head->lh_blkno;
-	gfs2_replay_incr_blk(ip, &lblock);
+	lgfs2_replay_incr_blk(ip, &lblock);
 	lgfs2_block_map(ip, lblock, &new, &dblock, NULL, 0);
 	if (!dblock)
 		return -EIO;
-- 
2.34.1

