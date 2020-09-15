Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A3C2626A73E
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 16:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600180714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w0q+dO0dcINtxgDuDB1FKdRAev2sZQ2WfYwbWrwc+2Q=;
	b=PkRg48d5MCYLifjQU9v+E1xuYrZT7th12RhLsvgSjUr6tz/uwmlst9w4+Edx/L9JVItFeU
	U/7fqJkkjR0cXvUMcvyb0nIoW2CsqoRWOTg4i2s/T4llsuc0iV7UFhdYe9wyapkjYugzvI
	GwJYoE9ZXlNZ1Cltujt9sfs8gi91jHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-q97s2aHMPjacOBNw6-olvg-1; Tue, 15 Sep 2020 10:38:31 -0400
X-MC-Unique: q97s2aHMPjacOBNw6-olvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A7EEEA1CE;
	Tue, 15 Sep 2020 14:38:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E89BB7E731;
	Tue, 15 Sep 2020 14:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9C9F183D023;
	Tue, 15 Sep 2020 14:38:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FEcOrY013092 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 10:38:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8519260BE2; Tue, 15 Sep 2020 14:38:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 567A360C0F
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 14:38:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 15 Sep 2020 09:38:21 -0500
Message-Id: <20200915143822.16485-5-rpeterso@redhat.com>
In-Reply-To: <20200915143822.16485-1-rpeterso@redhat.com>
References: <20200915143822.16485-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 4/5] gfs2: factor out evict code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 fs/gfs2/super.c | 51 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 82c79143681a..46260f370090 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1424,6 +1424,38 @@ static int may_delete_evicted(struct inode *inode, struct gfs2_holder *gh)
 	return -EEXIST;
 }
 
+/**
+ * evict_saved_inode - evict an inode whose dinode has not been deleted
+ * @inode: The inode to evict
+ */
+static void evict_saved_inode(struct inode *inode)
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
+		return;
+
+	/* Needs to be done before glock release & also in a transaction */
+	truncate_inode_pages(&inode->i_data, 0);
+	truncate_inode_pages(metamapping, 0);
+	gfs2_trans_end(sdp);
+}
+
 /**
  * gfs2_evict_inode - Remove an inode from cache
  * @inode: The inode to evict
@@ -1451,7 +1483,6 @@ static void gfs2_evict_inode(struct inode *inode)
 	struct gfs2_sbd *sdp = sb->s_fs_info;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_holder gh;
-	struct address_space *metamapping;
 	int ret;
 
 	if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
@@ -1474,23 +1505,7 @@ static void gfs2_evict_inode(struct inode *inode)
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
+	evict_saved_inode(inode);
 
 out_unlock:
 	if (gfs2_rs_active(&ip->i_res))
-- 
2.26.2

