Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 076F21F1CBB
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632174;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o/nopJeZgMXJNLxzb51xA78VtceNKTkZf9zzlMwZ7aA=;
	b=af36ykliFOLCf+/aIFBIly315S2RH6NG0kEBFBtSMBWEQUSaTsaVx0KxmdUMLQ1e9NiFDx
	BsVXy2gR6A86uOLrxL+0UqmOK/WvKkDN4rwn9Co2/AL7+M0TIOlKKUxQv15iOiqdyhadsu
	icFIYP9GM5pFnKcEq/Mvm4TvRn1AUR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-_5-R-1-ONjWEGDjYurNMuw-1; Mon, 08 Jun 2020 12:02:52 -0400
X-MC-Unique: _5-R-1-ONjWEGDjYurNMuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4D18107ACF5;
	Mon,  8 Jun 2020 16:02:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D538F60C1D;
	Mon,  8 Jun 2020 16:02:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C15D41809554;
	Mon,  8 Jun 2020 16:02:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0v5V011681 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 519FD1CA; Mon,  8 Jun 2020 16:00:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75BAD648DB;
	Mon,  8 Jun 2020 16:00:56 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:28 +0200
Message-Id: <20200608160039.549204-10-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/20] gfs2: Keep track of deleted inode
	generations in LVBs
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

When deleting an inode, keep track of the generation of the deleted inode in
the inode glock Lock Value Block (LVB).  When trying to delete an inode
remotely, check the last-known inode generation against the deleted inode
generation to skip duplicate remote deletes.  This avoids taking the resource
group glock in order to verify the block type.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c                  | 19 +++++++++++++++++++
 fs/gfs2/glock.h                  |  3 +++
 fs/gfs2/glops.c                  |  2 +-
 fs/gfs2/super.c                  |  3 +++
 include/uapi/linux/gfs2_ondisk.h |  6 ++++++
 5 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 86e9e621f346..12681616eb76 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -755,6 +755,25 @@ __acquires(&gl->gl_lockref.lock)
 	return;
 }
 
+void gfs2_inode_remember_delete(struct gfs2_glock *gl, u64 generation)
+{
+	struct gfs2_inode_lvb *ri = (void *)gl->gl_lksb.sb_lvbptr;
+
+	if (ri->ri_magic == 0)
+		ri->ri_magic = cpu_to_be32(GFS2_MAGIC);
+	if (ri->ri_magic == cpu_to_be32(GFS2_MAGIC))
+		ri->ri_generation_deleted = cpu_to_be64(generation);
+}
+
+bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64 generation)
+{
+	struct gfs2_inode_lvb *ri = (void *)gl->gl_lksb.sb_lvbptr;
+
+	if (ri->ri_magic != cpu_to_be32(GFS2_MAGIC))
+		return false;
+	return generation <= be64_to_cpu(ri->ri_generation_deleted);
+}
+
 static void delete_work_func(struct work_struct *work)
 {
 	struct gfs2_glock *gl = container_of(work, struct gfs2_glock, gl_delete);
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index b8adaf80e4c5..5c1b60fdedcf 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -306,4 +306,7 @@ static inline void glock_clear_object(struct gfs2_glock *gl, void *object)
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
+extern void gfs2_inode_remember_delete(struct gfs2_glock *gl, u64 generation);
+extern bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64 generation);
+
 #endif /* __GLOCK_DOT_H__ */
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 9e9c7a4b8c66..63ae9e45ce34 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -692,7 +692,7 @@ const struct gfs2_glock_operations gfs2_inode_glops = {
 	.go_lock = inode_go_lock,
 	.go_dump = inode_go_dump,
 	.go_type = LM_TYPE_INODE,
-	.go_flags = GLOF_ASPACE | GLOF_LRU,
+	.go_flags = GLOF_ASPACE | GLOF_LRU | GLOF_LVB,
 	.go_free = inode_go_free,
 };
 
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 956fced0a8ec..e69efed9fb51 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1315,6 +1315,8 @@ static void gfs2_evict_inode(struct inode *inode)
 		goto out;
 	}
 
+	if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
+		goto out_truncate;
 	error = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
 	if (error)
 		goto out_truncate;
@@ -1368,6 +1370,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	   that subsequent inode creates don't see an old gl_object. */
 	glock_clear_object(ip->i_gl, ip);
 	error = gfs2_dinode_dealloc(ip);
+	gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
 	goto out_unlock;
 
 out_truncate:
diff --git a/include/uapi/linux/gfs2_ondisk.h b/include/uapi/linux/gfs2_ondisk.h
index 2dc10a034de1..07e508e6691b 100644
--- a/include/uapi/linux/gfs2_ondisk.h
+++ b/include/uapi/linux/gfs2_ondisk.h
@@ -171,6 +171,12 @@ struct gfs2_rindex {
 #define GFS2_RGF_NOALLOC	0x00000008
 #define GFS2_RGF_TRIMMED	0x00000010
 
+struct gfs2_inode_lvb {
+	__be32 ri_magic;
+	__be32 __pad;
+	__be64 ri_generation_deleted;
+};
+
 struct gfs2_rgrp_lvb {
 	__be32 rl_magic;
 	__be32 rl_flags;
-- 
2.26.2

