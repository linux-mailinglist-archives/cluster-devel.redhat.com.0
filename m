Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF7C23DAD6
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6g8hUbgT523aURWidL1XHjMBP9jXFnu3tqeBe17PaVg=;
	b=JHq6bv9nTy0buwg69uQJ2OkQwxyw/hIMeZstv9wg5S8HrTY1u5awGsFvZIodSWFhvUjYU1
	QeKF59tHMFHtb3vrbVPVTlz5txdhN/8ZPq+4XD00YIuDPmEF1WOQmLtda1KR9u2fIpyj9U
	6Uhb9gHoasPY0ga4GwwsUutKOkVpZZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-moAWMkztOVSeE692h8nyOA-1; Thu, 06 Aug 2020 09:38:31 -0400
X-MC-Unique: moAWMkztOVSeE692h8nyOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262108015FB;
	Thu,  6 Aug 2020 13:38:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 171885C1BD;
	Thu,  6 Aug 2020 13:38:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0455596925;
	Thu,  6 Aug 2020 13:38:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcNGl030728 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFB4A60BF1; Thu,  6 Aug 2020 13:38:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C5C86FEF4
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:44 +0100
Message-Id: <20200806133807.111280-10-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/32] libgfs2: Move get_file_buf() into
	structures.c
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

It's only called from there. Open code inode_is_stuffed() as it's simple
enough.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/fs_ops.c     | 27 ---------------------------
 gfs2/libgfs2/libgfs2.h    |  2 --
 gfs2/libgfs2/structures.c | 24 ++++++++++++++++++++++++
 3 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index b5363c05..ee512f67 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -744,33 +744,6 @@ int __gfs2_writei(struct gfs2_inode *ip, void *buf,
 	return copied;
 }
 
-struct gfs2_buffer_head *get_file_buf(struct gfs2_inode *ip, uint64_t lbn,
-				      int prealloc)
-{
-	struct gfs2_sbd *sdp = ip->i_sbd;
-	uint64_t dbn;
-	int new = TRUE;
-
-	if (inode_is_stuffed(ip))
-		unstuff_dinode(ip);
-
-	block_map(ip, lbn, &new, &dbn, NULL, prealloc);
-	if (!dbn) {
-		fprintf(stderr, "get_file_buf\n");
-		exit(1);
-	}
-
-	if (!prealloc && new &&
-	    ip->i_di.di_size < (lbn + 1) << sdp->sd_sb.sb_bsize_shift) {
-		bmodified(ip->i_bh);
-		ip->i_di.di_size = (lbn + 1) << sdp->sd_sb.sb_bsize_shift;
-	}
-	if (dbn == ip->i_di.di_num.no_addr)
-		return ip->i_bh;
-	else
-		return bread(sdp, dbn);
-}
-
 int gfs2_dirent_first(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 					  struct gfs2_dirent **dent)
 {
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index a34e77a7..aa500dfd 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -432,8 +432,6 @@ extern int gfs2_readi(struct gfs2_inode *ip, void *buf, uint64_t offset,
 	__gfs2_writei(ip, buf, offset, size, 1)
 extern int __gfs2_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 			 unsigned int size, int resize);
-extern struct gfs2_buffer_head *get_file_buf(struct gfs2_inode *ip,
-					     uint64_t lbn, int prealloc);
 extern int init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct gfs2_inum *inum,
                        unsigned int mode, uint32_t flags, struct gfs2_inum *parent);
 extern struct gfs2_inode *createi(struct gfs2_inode *dip, const char *filename,
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 0aca7cd0..1e275bca 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -194,6 +194,30 @@ int lgfs2_write_journal_data(struct gfs2_inode *ip)
 	return 0;
 }
 
+static struct gfs2_buffer_head *get_file_buf(struct gfs2_inode *ip, uint64_t lbn, int prealloc)
+{
+	struct gfs2_sbd *sdp = ip->i_sbd;
+	uint64_t dbn;
+	int new = TRUE;
+
+	if (ip->i_di.di_height == 0)
+		unstuff_dinode(ip);
+
+	block_map(ip, lbn, &new, &dbn, NULL, prealloc);
+	if (!dbn)
+		return NULL;
+
+	if (!prealloc && new &&
+	    ip->i_di.di_size < (lbn + 1) << sdp->sd_sb.sb_bsize_shift) {
+		bmodified(ip->i_bh);
+		ip->i_di.di_size = (lbn + 1) << sdp->sd_sb.sb_bsize_shift;
+	}
+	if (dbn == ip->i_di.di_num.no_addr)
+		return ip->i_bh;
+	else
+		return bread(sdp, dbn);
+}
+
 int write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
 {
 	struct gfs2_log_header lh;
-- 
2.26.2

