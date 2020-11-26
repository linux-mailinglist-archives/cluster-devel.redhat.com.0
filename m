Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C588B2C5C68
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Nov 2020 20:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606417355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TBXBMqaBAungIt91YNzFweuDnSMIHrDgtGH0hdZLtQs=;
	b=Tsx9gWw9i9zMz4zQ7B//58FxVZICUlerUcSiSb3ZG98CkjO8VUe8dMC/awFOq5gGHmrAx2
	cna2TS54kg0TBdAJdhMNWwsQlYjDgocD6mNnl/rbajBoKhgAHhfjGLd+UanamQpmTQfbVX
	ncw4s5CioMRQgNMHNr1qxwhi8jVNDu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-a3vVFS0zN9eZX6Rf_5TTMA-1; Thu, 26 Nov 2020 14:02:34 -0500
X-MC-Unique: a3vVFS0zN9eZX6Rf_5TTMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A6DC1E7EF;
	Thu, 26 Nov 2020 19:02:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDAB060C05;
	Thu, 26 Nov 2020 19:02:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B8FC4BB7B;
	Thu, 26 Nov 2020 19:02:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQJ2MHX008295 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 14:02:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AA922189B8; Thu, 26 Nov 2020 19:02:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5419189B6;
	Thu, 26 Nov 2020 19:02:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 26 Nov 2020 20:02:16 +0100
Message-Id: <20201126190216.539712-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Upgrade shared glocks for atime
	updates
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Commit 20f829999c38 ("gfs2: Rework read and page fault locking") lifted
the glock lock taking from the low-level ->readpage and ->readahead
address space operations to the higher-level ->read_iter file and
->fault vm operations.  The glocks are still taken in LM_ST_SHARED mode
only.  On filesystems mounted without the noatime option, ->read_iter
sometimes needs to update the atime as well, though.  Right now, this
leads to a failed locking mode assertion in gfs2_dirty_inode.

Fix that by introducing a new update_time inode operation.  There, if
the glock is held non-exclusively, upgrade it to an exclusive lock.

Reported-by: Alexander Aring <aahringo@redhat.com>
Fixes: 20f829999c38 ("gfs2: Rework read and page fault locking")
Cc: stable@vger.kernel.org # v5.8+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 077ccb1b3ccc..eed1a1bac6f6 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -2116,6 +2116,25 @@ loff_t gfs2_seek_hole(struct file *file, loff_t offset)
 	return vfs_setpos(file, ret, inode->i_sb->s_maxbytes);
 }
 
+static int gfs2_update_time(struct inode *inode, struct timespec64 *time,
+			    int flags)
+{
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_glock *gl = ip->i_gl;
+	struct gfs2_holder *gh;
+	int error;
+
+	gh = gfs2_glock_is_locked_by_me(gl);
+	if (gh && !gfs2_glock_is_held_excl(gl)) {
+		gfs2_glock_dq(gh);
+		gfs2_holder_reinit(LM_ST_EXCLUSIVE, 0, gh);
+		error = gfs2_glock_nq(gh);
+		if (error)
+			return error;
+	}
+	return generic_update_time(inode, time, flags);
+}
+
 const struct inode_operations gfs2_file_iops = {
 	.permission = gfs2_permission,
 	.setattr = gfs2_setattr,
@@ -2124,6 +2143,7 @@ const struct inode_operations gfs2_file_iops = {
 	.fiemap = gfs2_fiemap,
 	.get_acl = gfs2_get_acl,
 	.set_acl = gfs2_set_acl,
+	.update_time = gfs2_update_time,
 };
 
 const struct inode_operations gfs2_dir_iops = {
@@ -2143,6 +2163,7 @@ const struct inode_operations gfs2_dir_iops = {
 	.fiemap = gfs2_fiemap,
 	.get_acl = gfs2_get_acl,
 	.set_acl = gfs2_set_acl,
+	.update_time = gfs2_update_time,
 	.atomic_open = gfs2_atomic_open,
 };
 

