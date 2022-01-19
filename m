Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE604938B9
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2yo/2gfyQxTn/sDLf46/xxcCz9UfPDmh8OsQjKYSR8A=;
	b=Xw26x3TzZNwgMTKB4Hy4mIqhFvqGxXaWWSEOA/E3rL21JM1C9wksnPl325tl3K+i7RA7PG
	gRLjqEokTf7vFK8Qug77//zli58dvaptxqXR2OsxuQOWDbPSKttILL7dtCqJSsHOiEoSPl
	kEFIydSzff1TsaZScMVD6QeiXE5VBRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-EMhZcD8LMb2JAiztTD4d7w-1; Wed, 19 Jan 2022 05:43:43 -0500
X-MC-Unique: EMhZcD8LMb2JAiztTD4d7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD08883DD22;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C0CF72FA5;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85FDA4BB7C;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhabV024203 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6F4A7795B7; Wed, 19 Jan 2022 10:43:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B0B7A226
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:35 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:00 +0000
Message-Id: <20220119104316.2489995-6-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 05/21] libgfs2: Namespace improvements -
	gfs1.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/pass1.c      |  2 +-
 gfs2/fsck/pass2.c      |  2 +-
 gfs2/fsck/util.h       |  2 +-
 gfs2/libgfs2/fs_ops.c  | 12 ++++++------
 gfs2/libgfs2/gfs1.c    | 16 ++++++++--------
 gfs2/libgfs2/libgfs2.h |  8 ++++----
 6 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index c2d6cae4..2b3379a7 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -152,7 +152,7 @@ static int pass1_repair_leaf(struct gfs2_inode *ip, uint64_t *leaf_no,
 	          " (0x%"PRIx64") at index: 0x%x for 0x%x pointers.\n"),
 	        ip->i_num.in_addr, ip->i_num.in_addr, lindex, ref_count);
 	if (ip->i_sbd->gfs1)
-		gfs1_writei(ip, padbuf, lindex * sizeof(uint64_t), pad_size);
+		lgfs2_gfs1_writei(ip, padbuf, lindex * sizeof(uint64_t), pad_size);
 	else
 		lgfs2_writei(ip, padbuf, lindex * sizeof(uint64_t), pad_size);
 	free(padbuf);
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 71e10e96..3d732772 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -1000,7 +1000,7 @@ static int write_new_leaf(struct gfs2_inode *dip, int start_lindex,
 	        dip->i_num.in_addr, dip->i_num.in_addr,
 		start_lindex, (unsigned long)pad_size / sizeof(uint64_t));
 	if (dip->i_sbd->gfs1)
-		count = gfs1_writei(dip, padbuf, start_lindex *
+		count = lgfs2_gfs1_writei(dip, padbuf, start_lindex *
 				    sizeof(uint64_t), pad_size);
 	else
 		count = lgfs2_writei(dip, padbuf, start_lindex *
diff --git a/gfs2/fsck/util.h b/gfs2/fsck/util.h
index 5f9c488b..ae654bf4 100644
--- a/gfs2/fsck/util.h
+++ b/gfs2/fsck/util.h
@@ -82,7 +82,7 @@ static const inline char *block_type_string(int q)
 
 static inline int is_dir(struct gfs2_inode *ip, int gfs1)
 {
-	if (gfs1 && is_gfs_dir(ip))
+	if (gfs1 && lgfs2_is_gfs_dir(ip))
 		return 1;
 	if (S_ISDIR(ip->i_mode))
 		return 1;
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 077677a4..1d5ef8e6 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -235,7 +235,7 @@ void lgfs2_unstuff_dinode(struct gfs2_inode *ip)
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct gfs2_buffer_head *bh;
 	uint64_t block = 0;
-	int isdir = S_ISDIR(ip->i_mode) || is_gfs_dir(ip);
+	int isdir = S_ISDIR(ip->i_mode) || lgfs2_is_gfs_dir(ip);
 
 	if (ip->i_size) {
 		if (lgfs2_meta_alloc(ip, &block))
@@ -612,7 +612,7 @@ int lgfs2_readi(struct gfs2_inode *ip, void *buf, uint64_t offset, unsigned int
 
 		if (!extlen) {
 			if (sdp->gfs1)
-				gfs1_block_map(ip, lblock, &not_new, &dblock,
+				lgfs2_gfs1_block_map(ip, lblock, &not_new, &dblock,
 					       &extlen, 0);
 			else
 				lgfs2_block_map(ip, lblock, &not_new, &dblock,
@@ -935,7 +935,7 @@ void lgfs2_dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_
 		lp[x] = cpu_to_be64(bn);
 
 	if (dip->i_sbd->gfs1)
-		count = gfs1_writei(dip, (char *)lp, start * sizeof(uint64_t),
+		count = lgfs2_gfs1_writei(dip, (char *)lp, start * sizeof(uint64_t),
 				    half_len * sizeof(uint64_t));
 	else
 		count = lgfs2_writei(dip, (char *)lp, start * sizeof(uint64_t),
@@ -1043,7 +1043,7 @@ static void dir_double_exhash(struct gfs2_inode *dip)
 		}
 
 		if (sdp->gfs1)
-			count = gfs1_writei(dip, (char *)buf +
+			count = lgfs2_gfs1_writei(dip, (char *)buf +
 					    sdp->sd_hash_bsize,
 					    block * sdp->sd_bsize, sdp->sd_bsize);
 		else
@@ -1763,7 +1763,7 @@ int lgfs2_dir_search(struct gfs2_inode *dip, const char *filename, int len,
 {
 	int error;
 
-	if(!S_ISDIR(dip->i_mode) && !is_gfs_dir(dip))
+	if(!S_ISDIR(dip->i_mode) && !lgfs2_is_gfs_dir(dip))
 		return -1;
 
 	if (dip->i_flags & GFS2_DIF_EXHASH)
@@ -1851,7 +1851,7 @@ int lgfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int len)
 {
 	int error;
 
-	if(!S_ISDIR(dip->i_mode) && !is_gfs_dir(dip))
+	if(!S_ISDIR(dip->i_mode) && !lgfs2_is_gfs_dir(dip))
 		return -1;
 
 	if (dip->i_flags & GFS2_DIF_EXHASH)
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 5cee3df8..2b864137 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -31,14 +31,14 @@ gfs1_metapointer(char *buf, unsigned int height, struct metapath *mp)
 	return ((__be64 *)(buf + head_size)) + mp->mp_list[height];
 }
 
-int is_gfs_dir(struct gfs2_inode *ip)
+int lgfs2_is_gfs_dir(struct gfs2_inode *ip)
 {
 	if (ip->i_di_type == GFS_FILE_DIR)
 		return 1;
 	return 0;
 }
 
-void gfs1_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+void lgfs2_gfs1_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 		  unsigned int height, struct metapath *mp,
 		  int create, int *new, uint64_t *block)
 {
@@ -67,7 +67,7 @@ void gfs1_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 	*new = 1;
 }
 
-void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
+void lgfs2_gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 		    uint64_t *dblock, uint32_t *extlen, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -109,7 +109,7 @@ void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 	bh = ip->i_bh;
 
 	for (x = 0; x < end_of_metadata; x++) {
-		gfs1_lookup_block(ip, bh, x, &mp, create, new, dblock);
+		lgfs2_gfs1_lookup_block(ip, bh, x, &mp, create, new, dblock);
 		if (bh != ip->i_bh)
 			lgfs2_brelse(bh);
 		if (!*dblock)
@@ -133,7 +133,7 @@ void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 	}
 
 	if (!prealloc)
-		gfs1_lookup_block(ip, bh, end_of_metadata, &mp, create, new,
+		lgfs2_gfs1_lookup_block(ip, bh, end_of_metadata, &mp, create, new,
 				  dblock);
 
 	if (extlen && *dblock) {
@@ -147,7 +147,7 @@ void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 			nptrs = (end_of_metadata) ? sdp->sd_inptrs : sdp->sd_diptrs;
 
 			while (++mp.mp_list[end_of_metadata] < nptrs) {
-				gfs1_lookup_block(ip, bh, end_of_metadata, &mp,
+				lgfs2_gfs1_lookup_block(ip, bh, end_of_metadata, &mp,
 						  0, &tmp_new,
 						  &tmp_dblock);
 
@@ -163,7 +163,7 @@ void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 		lgfs2_brelse(bh);
 }
 
-int gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
+int lgfs2_gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 		unsigned int size)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -203,7 +203,7 @@ int gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 
 		if (!extlen){
 			new = 1;
-			gfs1_block_map(ip, lblock, &new, &dblock, &extlen, 0);
+			lgfs2_gfs1_block_map(ip, lblock, &new, &dblock, &extlen, 0);
 			if (!dblock)
 				return -1;
 		}
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index c6f0fb9e..e74918ab 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -710,14 +710,14 @@ struct gfs_log_descriptor {
 	uint8_t ld_reserved[64];
 };
 
-extern int is_gfs_dir(struct gfs2_inode *ip);
-extern void gfs1_lookup_block(struct gfs2_inode *ip,
+extern int lgfs2_is_gfs_dir(struct gfs2_inode *ip);
+extern void lgfs2_gfs1_lookup_block(struct gfs2_inode *ip,
 			      struct gfs2_buffer_head *bh,
 			      unsigned int height, struct metapath *mp,
 			      int create, int *new, uint64_t *block);
-extern void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
+extern void lgfs2_gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 			   uint64_t *dblock, uint32_t *extlen, int prealloc);
-extern int gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
+extern int lgfs2_gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 		       unsigned int size);
 extern struct gfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf);
 extern struct gfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
-- 
2.34.1

