Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CD18626C3F1
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 17:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600268441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nk3S3CvuXNjAGRqGXte7ZUVAwYxnS610tYkAwbxFWRo=;
	b=HjEnqN75gYUujxq/Zqyjv4oNxPpKK6OxY5jVpJEq16DFppKPrYzUnSxGLNU7YSUULQCJo1
	DEDzQ8pvvmJCeOn4NpHaGtUuAz/JLx+RJDM92vy2BoBGEeLjTRAuxiYRD1s79hQA6wqDab
	z+Ah2wptU3jL3w1dg9cYCCxaUSVpKFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-Kh7ccv8BO4yh-7hyY4WbYw-1; Wed, 16 Sep 2020 11:00:39 -0400
X-MC-Unique: Kh7ccv8BO4yh-7hyY4WbYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2015A195E412;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D110171F9;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7988183D034;
	Wed, 16 Sep 2020 15:00:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GF0UaI018924 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C917A5DE77; Wed, 16 Sep 2020 15:00:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 972955DE51
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 15:00:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 16 Sep 2020 10:00:16 -0500
Message-Id: <20200916150020.36582-3-rpeterso@redhat.com>
In-Reply-To: <20200916150020.36582-1-rpeterso@redhat.com>
References: <20200916150020.36582-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/6] gfs2: factor evict_deleted_inode
	out of gfs2_evict_inode
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Function gfs2_evict_inode is way too big, complex and unreadable. This is a
baby step toward breaking it apart to be more readable. It factors out
the portion that deletes the online bits for a dinode that is unlinked and
needs to be deleted. A future patch will factor out more. (If I factor
out too much, the patch itself becomes unreadable).

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 67 +++++++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index ab08b9a1102c..1e00a72a158d 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1310,6 +1310,45 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
 	return true;
 }
 
+/**
+ * evict_deleted_inode - delete the pieces of an unlinked evicted inode
+ * @inode: The inode to evict
+ */
+static int evict_deleted_inode(struct inode *inode)
+{
+	struct gfs2_inode *ip = GFS2_I(inode);
+	int ret;
+
+	if (S_ISDIR(inode->i_mode) &&
+	    (ip->i_diskflags & GFS2_DIF_EXHASH)) {
+		ret = gfs2_dir_exhash_dealloc(ip);
+		if (ret)
+			goto out;
+	}
+
+	if (ip->i_eattr) {
+		ret = gfs2_ea_dealloc(ip);
+		if (ret)
+			goto out;
+	}
+
+	if (!gfs2_is_stuffed(ip)) {
+		ret = gfs2_file_dealloc(ip);
+		if (ret)
+			goto out;
+	}
+
+	/* We're about to clear the bitmap for the dinode, but as soon as we
+	   do, gfs2_create_inode can create another inode at the same block
+	   location and try to set gl_object again. We clear gl_object here so
+	   that subsequent inode creates don't see an old gl_object. */
+	glock_clear_object(ip->i_gl, ip);
+	ret = gfs2_dinode_dealloc(ip);
+	gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
+out:
+	return ret;
+}
+
 /**
  * gfs2_evict_inode - Remove an inode from cache
  * @inode: The inode to evict
@@ -1396,33 +1435,7 @@ static void gfs2_evict_inode(struct inode *inode)
 			goto out_truncate;
 		}
 	}
-
-	if (S_ISDIR(inode->i_mode) &&
-	    (ip->i_diskflags & GFS2_DIF_EXHASH)) {
-		ret = gfs2_dir_exhash_dealloc(ip);
-		if (ret)
-			goto out_unlock;
-	}
-
-	if (ip->i_eattr) {
-		ret = gfs2_ea_dealloc(ip);
-		if (ret)
-			goto out_unlock;
-	}
-
-	if (!gfs2_is_stuffed(ip)) {
-		ret = gfs2_file_dealloc(ip);
-		if (ret)
-			goto out_unlock;
-	}
-
-	/* We're about to clear the bitmap for the dinode, but as soon as we
-	   do, gfs2_create_inode can create another inode at the same block
-	   location and try to set gl_object again. We clear gl_object here so
-	   that subsequent inode creates don't see an old gl_object. */
-	glock_clear_object(ip->i_gl, ip);
-	ret = gfs2_dinode_dealloc(ip);
-	gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
+	ret = evict_deleted_inode(inode);
 	goto out_unlock;
 
 out_truncate:
-- 
2.26.2

