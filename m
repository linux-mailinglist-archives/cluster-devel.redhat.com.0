Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 661421F1CAE
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YQmkOXEH2MPYWIruUf43K14IrDtO8FPOTL8INPA7IzM=;
	b=HdMQzTYnvhH5m5S1tzaZtKJN0mFhyh8e18WzQdfbIOGwUCZDXm9LwyRe7JdAykf0eD/3qz
	J2/MynIjfDK5UrEnve9z41B2gUeo9vEjCcpxMWxRr7+MMqqWuApyeq/jZ8A0y9L9Z+wSFU
	Lu+zpSXzB0nOHaxWypVXRbvNTcbCJDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-SuqPaLFcMbiDBH4XrgZ08Q-1; Mon, 08 Jun 2020 12:02:30 -0400
X-MC-Unique: SuqPaLFcMbiDBH4XrgZ08Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95D4318FF67F;
	Mon,  8 Jun 2020 16:02:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8849F78FD7;
	Mon,  8 Jun 2020 16:02:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74A511809557;
	Mon,  8 Jun 2020 16:02:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G14kN011749 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:01:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C919360C1D; Mon,  8 Jun 2020 16:01:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09F80648DB;
	Mon,  8 Jun 2020 16:01:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:32 +0200
Message-Id: <20200608160039.549204-14-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 13/20] gfs2: Minor gfs2_lookup_by_inum
	cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Use a zero no_formal_ino instead of a NULL pointer to indicate that any inode
generation number will qualify: a valid inode never has a zero no_formal_ino.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/export.c |  4 +++-
 fs/gfs2/glock.c  |  2 +-
 fs/gfs2/inode.c  | 11 +++++++++--
 fs/gfs2/inode.h  |  2 +-
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/export.c b/fs/gfs2/export.c
index 3f717285ee48..756d05779200 100644
--- a/fs/gfs2/export.c
+++ b/fs/gfs2/export.c
@@ -134,7 +134,9 @@ static struct dentry *gfs2_get_dentry(struct super_block *sb,
 	struct gfs2_sbd *sdp = sb->s_fs_info;
 	struct inode *inode;
 
-	inode = gfs2_lookup_by_inum(sdp, inum->no_addr, &inum->no_formal_ino,
+	if (!inum->no_formal_ino)
+		return ERR_PTR(-ESTALE);
+	inode = gfs2_lookup_by_inum(sdp, inum->no_addr, inum->no_formal_ino,
 				    GFS2_BLKST_DINODE);
 	if (IS_ERR(inode))
 		return ERR_CAST(inode);
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index bf7daa35f73f..b6078b0e74b9 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -843,7 +843,7 @@ static void delete_work_func(struct work_struct *work)
 		}
 	}
 
-	inode = gfs2_lookup_by_inum(sdp, no_addr, NULL, GFS2_BLKST_UNLINKED);
+	inode = gfs2_lookup_by_inum(sdp, no_addr, 0, GFS2_BLKST_UNLINKED);
 	if (!IS_ERR_OR_NULL(inode)) {
 		d_prune_aliases(inode);
 		iput(inode);
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index a4112906abc2..812a6ae03f6c 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -207,8 +207,15 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 	return ERR_PTR(error);
 }
 
+/**
+ * gfs2_lookup_by_inum - look up an inode by inode number
+ * @sdp: The super block
+ * @no_addr: The inode number
+ * @no_formal_ino: The inode generation number (0 for any)
+ * @blktype: Requested block type (see gfs2_inode_lookup)
+ */
 struct inode *gfs2_lookup_by_inum(struct gfs2_sbd *sdp, u64 no_addr,
-				  u64 *no_formal_ino, unsigned int blktype)
+				  u64 no_formal_ino, unsigned int blktype)
 {
 	struct super_block *sb = sdp->sd_vfs;
 	struct inode *inode;
@@ -221,7 +228,7 @@ struct inode *gfs2_lookup_by_inum(struct gfs2_sbd *sdp, u64 no_addr,
 	/* Two extra checks for NFS only */
 	if (no_formal_ino) {
 		error = -ESTALE;
-		if (GFS2_I(inode)->i_no_formal_ino != *no_formal_ino)
+		if (GFS2_I(inode)->i_no_formal_ino != no_formal_ino)
 			goto fail_iput;
 
 		error = -EIO;
diff --git a/fs/gfs2/inode.h b/fs/gfs2/inode.h
index 580adbf0b5e1..b52ecf4ffe63 100644
--- a/fs/gfs2/inode.h
+++ b/fs/gfs2/inode.h
@@ -92,7 +92,7 @@ extern struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned type,
 				       u64 no_addr, u64 no_formal_ino,
 				       unsigned int blktype);
 extern struct inode *gfs2_lookup_by_inum(struct gfs2_sbd *sdp, u64 no_addr,
-					 u64 *no_formal_ino,
+					 u64 no_formal_ino,
 					 unsigned int blktype);
 
 extern int gfs2_inode_refresh(struct gfs2_inode *ip);
-- 
2.26.2

