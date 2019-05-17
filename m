Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075421D89
	for <lists+cluster-devel@lfdr.de>; Fri, 17 May 2019 20:40:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FEA9CD4A6;
	Fri, 17 May 2019 18:39:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7211D60BE0;
	Fri, 17 May 2019 18:39:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AC553D87;
	Fri, 17 May 2019 18:39:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HIdJTd022284 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 14:39:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E06560FAF; Fri, 17 May 2019 18:39:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-117-66.ams2.redhat.com [10.36.117.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9095061101;
	Fri, 17 May 2019 18:39:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 17 May 2019 20:39:11 +0200
Message-Id: <20190517183912.7085-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/2] gfs2: Clean up freeing struct gfs2_sbd
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 17 May 2019 18:40:08 +0000 (UTC)

Add a free_sbd function for freeing a struct gfs2_sbd.  Use that for
freeing a super-block descriptor, either directly or via kobject_put.
Free sd_lkstats inside the kobject release function: that way,
gfs2_put_super will no longer leak sd_lkstats.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c | 23 ++++++++++++++---------
 fs/gfs2/super.h      |  2 ++
 fs/gfs2/sys.c        |  3 +--
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 46f6615eaf12..f5312f3b58ee 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -64,6 +64,13 @@ static void gfs2_tune_init(struct gfs2_tune *gt)
 	gt->gt_complain_secs = 10;
 }
 
+void free_sbd(struct gfs2_sbd *sdp)
+{
+	if (sdp->sd_lkstats)
+		free_percpu(sdp->sd_lkstats);
+	kfree(sdp);
+}
+
 static struct gfs2_sbd *init_sbd(struct super_block *sb)
 {
 	struct gfs2_sbd *sdp;
@@ -75,10 +82,8 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 
 	sdp->sd_vfs = sb;
 	sdp->sd_lkstats = alloc_percpu(struct gfs2_pcpu_lkstats);
-	if (!sdp->sd_lkstats) {
-		kfree(sdp);
-		return NULL;
-	}
+	if (!sdp->sd_lkstats)
+		goto fail;
 	sb->s_fs_info = sdp;
 
 	set_bit(SDF_NOJOURNALID, &sdp->sd_flags);
@@ -137,8 +142,11 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 	mutex_init(&sdp->sd_freeze_mutex);
 
 	return sdp;
-}
 
+fail:
+	free_sbd(sdp);
+	return NULL;
+}
 
 /**
  * gfs2_check_sb - Check superblock
@@ -1089,8 +1097,7 @@ static int fill_super(struct super_block *sb, struct gfs2_args *args, int silent
 	if (error) {
 		/* In this case, we haven't initialized sysfs, so we have to
 		   manually free the sdp. */
-		free_percpu(sdp->sd_lkstats);
-		kfree(sdp);
+		free_sbd(sdp);
 		sb->s_fs_info = NULL;
 		return error;
 	}
@@ -1193,7 +1200,6 @@ static int fill_super(struct super_block *sb, struct gfs2_args *args, int silent
 	gfs2_lm_unmount(sdp);
 fail_debug:
 	gfs2_delete_debugfs_file(sdp);
-	free_percpu(sdp->sd_lkstats);
 	/* gfs2_sys_fs_del must be the last thing we do, since it causes
 	 * sysfs to call function gfs2_sbd_release, which frees sdp. */
 	gfs2_sys_fs_del(sdp);
@@ -1373,7 +1379,6 @@ static void gfs2_kill_sb(struct super_block *sb)
 	sdp->sd_root_dir = NULL;
 	sdp->sd_master_dir = NULL;
 	shrink_dcache_sb(sb);
-	free_percpu(sdp->sd_lkstats);
 	kill_block_super(sb);
 }
 
diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index 73c97dccae21..720d257371b5 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -47,6 +47,8 @@ extern void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh,
 extern int gfs2_statfs_sync(struct super_block *sb, int type);
 extern void gfs2_freeze_func(struct work_struct *work);
 
+extern void free_sbd(struct gfs2_sbd *sdp);
+
 extern struct file_system_type gfs2_fs_type;
 extern struct file_system_type gfs2meta_fs_type;
 extern const struct export_operations gfs2_export_ops;
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 08e4996adc23..348903010911 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -304,7 +304,7 @@ static void gfs2_sbd_release(struct kobject *kobj)
 {
 	struct gfs2_sbd *sdp = container_of(kobj, struct gfs2_sbd, sd_kobj);
 
-	kfree(sdp);
+	free_sbd(sdp);
 }
 
 static struct kobj_type gfs2_ktype = {
@@ -682,7 +682,6 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
 fail_tune:
 	sysfs_remove_group(&sdp->sd_kobj, &tune_group);
 fail_reg:
-	free_percpu(sdp->sd_lkstats);
 	fs_err(sdp, "error %d adding sysfs files\n", error);
 	kobject_put(&sdp->sd_kobj);
 	sb->s_fs_info = NULL;
-- 
2.20.1

