Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 816F226C3F5
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 17:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600268442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ygz+HTP3KihI86WHYvDGr/nWI2ySsdssSl4cIO2vLJM=;
	b=W6CJAOYNblulGJaGPfZXjygXLO06EqxmvmFVJZ5/A2T+ZXo6Ne5/RxIpOZNTwVuCwy0AIP
	fuw9R67bQxpaIXU0/4MWJ4kG+qMFFORtDsISjNCcDyCO1ke0BPnm7TnxPa2AJuDJa0amuS
	Dj0NBSlaQaamx0EhVKmBRC712xmblQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-3BXXvMNgNz6C6pa_Em-kdA-1; Wed, 16 Sep 2020 11:00:40 -0400
X-MC-Unique: 3BXXvMNgNz6C6pa_Em-kdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CB84AF21A;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B07C75147;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E1B744A64;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GF0VYB018935 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:00:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71E284D; Wed, 16 Sep 2020 15:00:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 419445DE51
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 15:00:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 16 Sep 2020 10:00:18 -0500
Message-Id: <20200916150020.36582-5-rpeterso@redhat.com>
In-Reply-To: <20200916150020.36582-1-rpeterso@redhat.com>
References: <20200916150020.36582-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 4/6] gfs2: factor out evict code
	related to dinodes we are not deleting
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Now that we've factored out the delete-dinode case to simplify gfs2_evict_inode
we take it a step further and factor out the other case: where we don't
delete the inode.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 52 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 1e2ff066f8d4..9fc4135a35c0 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1422,6 +1422,39 @@ static enum dinode_demise evict_should_delete(struct inode *inode,
 	return SHOULD_DELETE_DINODE;
 }
 
+/**
+ * evict_saved_inode - evict an inode whose dinode has not been deleted
+ * @inode: The inode to evict
+ */
+static int evict_saved_inode(struct inode *inode)
+{
+	struct super_block *sb = inode->i_sb;
+	struct gfs2_sbd *sdp = sb->s_fs_info;
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct address_space *metamapping;
+	int ret;
+
+	gfs2_log_flush(sdp, ip->i_gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
+		       GFS2_LFC_EVICT_INODE);
+	metamapping = gfs2_glock2aspace(ip->i_gl);
+	if (test_bit(GLF_DIRTY, &ip->i_gl->gl_flags)) {
+		filemap_fdatawrite(metamapping);
+		filemap_fdatawait(metamapping);
+	}
+	write_inode_now(inode, 1);
+	gfs2_ail_flush(ip->i_gl, 0);
+
+	ret = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
+	if (ret)
+		return ret;
+
+	/* Needs to be done before glock release & also in a transaction */
+	truncate_inode_pages(&inode->i_data, 0);
+	truncate_inode_pages(metamapping, 0);
+	gfs2_trans_end(sdp);
+	return 0;
+}
+
 /**
  * gfs2_evict_inode - Remove an inode from cache
  * @inode: The inode to evict
@@ -1449,7 +1482,6 @@ static void gfs2_evict_inode(struct inode *inode)
 	struct gfs2_sbd *sdp = sb->s_fs_info;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_holder gh;
-	struct address_space *metamapping;
 	int ret;
 
 	if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
@@ -1471,23 +1503,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	goto out_unlock;
 
 out_truncate:
-	gfs2_log_flush(sdp, ip->i_gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
-		       GFS2_LFC_EVICT_INODE);
-	metamapping = gfs2_glock2aspace(ip->i_gl);
-	if (test_bit(GLF_DIRTY, &ip->i_gl->gl_flags)) {
-		filemap_fdatawrite(metamapping);
-		filemap_fdatawait(metamapping);
-	}
-	write_inode_now(inode, 1);
-	gfs2_ail_flush(ip->i_gl, 0);
-
-	ret = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
-	if (ret)
-		goto out_unlock;
-	/* Needs to be done before glock release & also in a transaction */
-	truncate_inode_pages(&inode->i_data, 0);
-	truncate_inode_pages(metamapping, 0);
-	gfs2_trans_end(sdp);
+	ret = evict_saved_inode(inode);
 
 out_unlock:
 	if (gfs2_rs_active(&ip->i_res))
-- 
2.26.2

