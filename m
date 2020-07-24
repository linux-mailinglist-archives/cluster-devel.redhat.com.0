Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9B522CDCE
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BFfSlKTvnYqglxVKqWUmbC6kWS6ohPPCMPx0pIVbQeI=;
	b=Wo0El/CubKepvX2N04oUbyLi1Z4LYc3SYfVx4olYmZTroK0OQvMdEWIM8GvOvjHLOG/pva
	SCGDFBQuLuqHX49NDLCO9GLMDHN9qlbt/66RpFXzt5JJbtKDb18VzMWh5wtMVJ1B3QwxJT
	0tFFSi4p6QZQd2lPzbukgyWX9V1kXw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-N03-jlzyMr60SE4ZjeKlTw-1; Fri, 24 Jul 2020 14:33:21 -0400
X-MC-Unique: N03-jlzyMr60SE4ZjeKlTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81FB41DF8;
	Fri, 24 Jul 2020 18:33:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7150169325;
	Fri, 24 Jul 2020 18:33:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A6151809563;
	Fri, 24 Jul 2020 18:33:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXEUP016337 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 307A070599; Fri, 24 Jul 2020 18:33:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2A7A6FEFE
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:13 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:33:04 -0500
Message-Id: <20200724183304.366913-12-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 11/11] gfs2: Never call
	gfs2_block_zero_range with an open transaction
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Before this patch, some functions started transactions then they called
gfs2_block_zero_range. However, gfs2_block_zero_range, like writes, can
start transactions, which results in a recursive transaction error.
For example:

do_shrink
   trunc_start
      gfs2_trans_begin <------------------------------------------------
         gfs2_block_zero_range
            iomap_zero_range(inode, from, length, NULL, &gfs2_iomap_ops);
               iomap_apply ... iomap_zero_range_actor
                  iomap_begin
                     gfs2_iomap_begin
                        gfs2_iomap_begin_write
                  actor (iomap_zero_range_actor)
		     iomap_zero
			iomap_write_begin
			   gfs2_iomap_page_prepare
			      gfs2_trans_begin <------------------------

This patch reorders the callers of gfs2_block_zero_range so that they
only start their transactions after the call. It also adds a BUG_ON to
ensure this doesn't happen again.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 69 ++++++++++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 30 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 85cf903011d7..251aa3bcf4e3 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1352,9 +1352,15 @@ int gfs2_extent_map(struct inode *inode, u64 lblock, int *new, u64 *dblock, unsi
 	return ret;
 }
 
+/*
+ * NOTE: Never call gfs2_block_zero_range with an open transaction because it
+ * uses iomap write to perform its actions, which begin their own transactions
+ * (iomap_begin, page_prepare, etc.)
+ */
 static int gfs2_block_zero_range(struct inode *inode, loff_t from,
 				 unsigned int length)
 {
+	BUG_ON(current->journal_info);
 	return iomap_zero_range(inode, from, length, NULL, &gfs2_iomap_ops);
 }
 
@@ -1415,6 +1421,16 @@ static int trunc_start(struct inode *inode, u64 newsize)
 	u64 oldsize = inode->i_size;
 	int error;
 
+	if (!gfs2_is_stuffed(ip)) {
+		unsigned int blocksize = i_blocksize(inode);
+		unsigned int offs = newsize & (blocksize - 1);
+		if (offs) {
+			error = gfs2_block_zero_range(inode, newsize,
+						      blocksize - offs);
+			if (error)
+				return error;
+		}
+	}
 	if (journaled)
 		error = gfs2_trans_begin(sdp, RES_DINODE + RES_JDATA, GFS2_JTRUNC_REVOKES);
 	else
@@ -1428,19 +1444,10 @@ static int trunc_start(struct inode *inode, u64 newsize)
 
 	gfs2_trans_add_meta(ip->i_gl, dibh);
 
-	if (gfs2_is_stuffed(ip)) {
+	if (gfs2_is_stuffed(ip))
 		gfs2_buffer_clear_tail(dibh, sizeof(struct gfs2_dinode) + newsize);
-	} else {
-		unsigned int blocksize = i_blocksize(inode);
-		unsigned int offs = newsize & (blocksize - 1);
-		if (offs) {
-			error = gfs2_block_zero_range(inode, newsize,
-						      blocksize - offs);
-			if (error)
-				goto out;
-		}
+	else
 		ip->i_diskflags |= GFS2_DIF_TRUNC_IN_PROG;
-	}
 
 	i_size_write(inode, newsize);
 	ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
@@ -2449,25 +2456,7 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
 	loff_t start, end;
 	int error;
 
-	start = round_down(offset, blocksize);
-	end = round_up(offset + length, blocksize) - 1;
-	error = filemap_write_and_wait_range(inode->i_mapping, start, end);
-	if (error)
-		return error;
-
-	if (gfs2_is_jdata(ip))
-		error = gfs2_trans_begin(sdp, RES_DINODE + 2 * RES_JDATA,
-					 GFS2_JTRUNC_REVOKES);
-	else
-		error = gfs2_trans_begin(sdp, RES_DINODE, 0);
-	if (error)
-		return error;
-
-	if (gfs2_is_stuffed(ip)) {
-		error = stuffed_zero_range(inode, offset, length);
-		if (error)
-			goto out;
-	} else {
+	if (!gfs2_is_stuffed(ip)) {
 		unsigned int start_off, end_len;
 
 		start_off = offset & (blocksize - 1);
@@ -2490,6 +2479,26 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
 		}
 	}
 
+	start = round_down(offset, blocksize);
+	end = round_up(offset + length, blocksize) - 1;
+	error = filemap_write_and_wait_range(inode->i_mapping, start, end);
+	if (error)
+		return error;
+
+	if (gfs2_is_jdata(ip))
+		error = gfs2_trans_begin(sdp, RES_DINODE + 2 * RES_JDATA,
+					 GFS2_JTRUNC_REVOKES);
+	else
+		error = gfs2_trans_begin(sdp, RES_DINODE, 0);
+	if (error)
+		return error;
+
+	if (gfs2_is_stuffed(ip)) {
+		error = stuffed_zero_range(inode, offset, length);
+		if (error)
+			goto out;
+	}
+
 	if (gfs2_is_jdata(ip)) {
 		BUG_ON(!current->journal_info);
 		gfs2_journaled_truncate_range(inode, offset, length);
-- 
2.26.2

