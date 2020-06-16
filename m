Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A763B1FBCA9
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Jun 2020 19:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592327985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gwnZIrInYHf24mTqtSBYNFgvgM1pq3Ye0GOU+4rxOJU=;
	b=S0x+GfOMOoc1+RMv+Egk7ceO4yvaLP5TAETijDhoFwdz5iv3qKTeZE5/LetV51tSc+50PZ
	jkZ52a60NaOUCo+9YP3IRlT8NeEKN+1z/jMQ5vunBSx0VlXBwDORiYqmrA1FnW03SjCl30
	qE0HXrO5M1LW6/dVWEm7Ml5yRaEotAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-2s-PEh2pOCm5PP-mzo4n7A-1; Tue, 16 Jun 2020 13:19:43 -0400
X-MC-Unique: 2s-PEh2pOCm5PP-mzo4n7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8697A100945D;
	Tue, 16 Jun 2020 17:19:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 415CB5D9D7;
	Tue, 16 Jun 2020 17:19:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0E39833C9;
	Tue, 16 Jun 2020 17:19:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GHJaC8011560 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:19:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89BD37A029; Tue, 16 Jun 2020 17:19:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8428678FDB
	for <cluster-devel@redhat.com>; Tue, 16 Jun 2020 17:19:33 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72235833B1
	for <cluster-devel@redhat.com>; Tue, 16 Jun 2020 17:19:33 +0000 (UTC)
Date: Tue, 16 Jun 2020 13:19:33 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1194682176.34134614.1592327973401.JavaMail.zimbra@redhat.com>
In-Reply-To: <850442235.34134581.1592327923140.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.80, 10.4.195.22]
Thread-Topic: gfs2: simplify code with nq_init functions
Thread-Index: RjkyefzAs/yuiDX47s5Tgq3h3ukF9w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: simplify code with nq_init
	functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

This patch simply cleans up some code to make it more readable by
using helper functions gfs2_glock_nq_init and dq_uninit instead of
doing things manually.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 10 ++++------
 fs/gfs2/bmap.c | 25 +++++++------------------
 fs/gfs2/file.c | 34 +++++++++++++---------------------
 3 files changed, 24 insertions(+), 45 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 72c9560f4467..64bde9796ac3 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -600,14 +600,12 @@ static void gfs2_readahead(struct readahead_control *rac)
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_holder gh;
 
-	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
-	if (gfs2_glock_nq(&gh))
-		goto out_uninit;
+	if (gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, 0, &gh))
+		return;
+
 	if (!gfs2_is_stuffed(ip))
 		mpage_readahead(rac, gfs2_block_map);
-	gfs2_glock_dq(&gh);
-out_uninit:
-	gfs2_holder_uninit(&gh);
+	gfs2_glock_dq_uninit(&gh);
 }
 
 /**
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 6306eaae378b..90313009dc12 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -990,28 +990,17 @@ int gfs2_lblk_to_dblk(struct inode *inode, u32 lblock, u64 *dblock)
 static int gfs2_write_lock(struct inode *inode)
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_inode *m_ip;
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	int error;
 
-	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &ip->i_gh);
-	error = gfs2_glock_nq(&ip->i_gh);
-	if (error)
-		goto out_uninit;
-	if (&ip->i_inode == sdp->sd_rindex) {
-		struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
-
-		error = gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE,
-					   GL_NOCACHE, &m_ip->i_gh);
-		if (error)
-			goto out_unlock;
-	}
-	return 0;
+	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &ip->i_gh);
+	if (error || &ip->i_inode != sdp->sd_rindex)
+		return error;
 
-out_unlock:
-	gfs2_glock_dq(&ip->i_gh);
-out_uninit:
-	gfs2_holder_uninit(&ip->i_gh);
-	return error;
+	m_ip = GFS2_I(sdp->sd_statfs_inode);
+	return gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE, GL_NOCACHE,
+				  &m_ip->i_gh);
 }
 
 static void gfs2_write_unlock(struct inode *inode)
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index fe305e4bfd37..fa2fe43053ac 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -762,8 +762,8 @@ static int gfs2_fsync(struct file *file, loff_t start, loff_t end,
 
 static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to)
 {
-	struct file *file = iocb->ki_filp;
-	struct gfs2_inode *ip = GFS2_I(file->f_mapping->host);
+	struct inode *inode = file_inode(iocb->ki_filp);
+	struct gfs2_inode *ip = GFS2_I(inode);
 	size_t count = iov_iter_count(to);
 	struct gfs2_holder gh;
 	ssize_t ret;
@@ -771,24 +771,21 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to)
 	if (!count)
 		return 0; /* skip atime */
 
-	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, &gh);
-	ret = gfs2_glock_nq(&gh);
+	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_DEFERRED, 0, &gh);
 	if (ret)
-		goto out_uninit;
+		goto out;
 
 	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
 			   is_sync_kiocb(iocb));
 
-	gfs2_glock_dq(&gh);
-out_uninit:
-	gfs2_holder_uninit(&gh);
+	gfs2_glock_dq_uninit(&gh);
+out:
 	return ret;
 }
 
 static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 {
-	struct file *file = iocb->ki_filp;
-	struct inode *inode = file->f_mapping->host;
+	struct inode *inode = file_inode(iocb->ki_filp);
 	struct gfs2_inode *ip = GFS2_I(inode);
 	size_t len = iov_iter_count(from);
 	loff_t offset = iocb->ki_pos;
@@ -803,22 +800,17 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	 * unfortunately, have the option of only flushing a range like the
 	 * VFS does.
 	 */
-	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, &gh);
-	ret = gfs2_glock_nq(&gh);
+	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_DEFERRED, 0, &gh);
 	if (ret)
-		goto out_uninit;
-
-	/* Silently fall back to buffered I/O when writing beyond EOF */
-	if (offset + len > i_size_read(&ip->i_inode))
 		goto out;
 
-	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
-			   is_sync_kiocb(iocb));
+	/* Silently fall back to buffered I/O when writing beyond EOF */
+	if (offset + len <= i_size_read(&ip->i_inode))
+		ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
+				   is_sync_kiocb(iocb));
 
+	gfs2_glock_dq_uninit(&gh);
 out:
-	gfs2_glock_dq(&gh);
-out_uninit:
-	gfs2_holder_uninit(&gh);
 	return ret;
 }
 

