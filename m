Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6F93F1F1CBD
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632176;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F9ug7BXWi+A2+wF9Unb04jXpv+LrTPncc5yhqAUd9w8=;
	b=gw7Dzzo9Si0G8zFdC8a3pWMOp+4bWnYk87OWdRKxCDx3PNS3vN6TbLPATnrsvfOabKiWIi
	r4xVRoJAZvDbjbGHjG5kjF7k397Ibdx3RqsOblcy0TYS3V7PqIyBz1mzIU+IZ+2u51QNyk
	hH5ENjnqvEuk3AzwPOjcq7Qw8LxPOHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-KyY0URbpP8qrAjoE7Cj-5w-1; Mon, 08 Jun 2020 12:02:49 -0400
X-MC-Unique: KyY0URbpP8qrAjoE7Cj-5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45C5418FF666;
	Mon,  8 Jun 2020 16:02:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36AAB60C1D;
	Mon,  8 Jun 2020 16:02:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22A1318095FF;
	Mon,  8 Jun 2020 16:02:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G16nY011770 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:01:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0061A60C1D; Mon,  8 Jun 2020 16:01:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32D3A648DB;
	Mon,  8 Jun 2020 16:01:05 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:33 +0200
Message-Id: <20200608160039.549204-15-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 14/20] gfs2: Move inode generation number
	check into gfs2_inode_lookup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Move the inode generation number check from gfs2_lookup_by_inum into
gfs2_inode_lookup: gfs2_inode_lookup may be able to decide that an inode with
the given inode generation number cannot exist without having to verify the
block type or reading the inode from disk.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 812a6ae03f6c..499f861b6e09 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -114,6 +114,10 @@ static void gfs2_set_iop(struct inode *inode)
  * placeholder because it doesn't otherwise make sense), the on-disk block type
  * is verified to be @blktype.
  *
+ * When @no_formal_ino is non-zero, this function will return ERR_PTR(-ESTALE)
+ * if it detects that @no_formal_ino doesn't match the actual inode generation
+ * number.  However, it doesn't always know unless @type is DT_UNKNOWN.
+ *
  * Returns: A VFS inode, or an error
  */
 
@@ -157,6 +161,11 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 			if (error)
 				goto fail;
 
+			error = -ESTALE;
+			if (no_formal_ino &&
+			    gfs2_inode_already_deleted(ip->i_gl, no_formal_ino))
+				goto fail;
+
 			if (blktype != GFS2_BLKST_FREE) {
 				error = gfs2_check_blk_type(sdp, no_addr,
 							    blktype);
@@ -189,13 +198,23 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 			inode->i_mode = DT2IF(type);
 		}
 
+		if (gfs2_holder_initialized(&i_gh))
+			gfs2_glock_dq_uninit(&i_gh);
+
 		gfs2_set_iop(inode);
+	}
 
-		unlock_new_inode(inode);
+	if (no_formal_ino && ip->i_no_formal_ino &&
+	    no_formal_ino != ip->i_no_formal_ino) {
+		if (inode->i_state & I_NEW)
+			goto fail;
+		iput(inode);
+		return ERR_PTR(-ESTALE);
 	}
 
-	if (gfs2_holder_initialized(&i_gh))
-		gfs2_glock_dq_uninit(&i_gh);
+	if (inode->i_state & I_NEW)
+		unlock_new_inode(inode);
+
 	return inode;
 
 fail:
@@ -221,16 +240,12 @@ struct inode *gfs2_lookup_by_inum(struct gfs2_sbd *sdp, u64 no_addr,
 	struct inode *inode;
 	int error;
 
-	inode = gfs2_inode_lookup(sb, DT_UNKNOWN, no_addr, 0, blktype);
+	inode = gfs2_inode_lookup(sb, DT_UNKNOWN, no_addr, no_formal_ino,
+				  blktype);
 	if (IS_ERR(inode))
 		return inode;
 
-	/* Two extra checks for NFS only */
 	if (no_formal_ino) {
-		error = -ESTALE;
-		if (GFS2_I(inode)->i_no_formal_ino != no_formal_ino)
-			goto fail_iput;
-
 		error = -EIO;
 		if (GFS2_I(inode)->i_diskflags & GFS2_DIF_SYSTEM)
 			goto fail_iput;
-- 
2.26.2

