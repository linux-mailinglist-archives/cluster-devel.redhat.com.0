Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44D57299D71
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Oct 2020 01:07:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-hog4zZn6NIKHnjYFEY4aPQ-1; Mon, 26 Oct 2020 20:07:31 -0400
X-MC-Unique: hog4zZn6NIKHnjYFEY4aPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE5AD6408A;
	Tue, 27 Oct 2020 00:07:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFF1C5578C;
	Tue, 27 Oct 2020 00:07:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7665181A06E;
	Tue, 27 Oct 2020 00:07:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09QNujtA021507 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 19:56:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CAD62022799; Mon, 26 Oct 2020 23:56:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07A74200E210
	for <cluster-devel@redhat.com>; Mon, 26 Oct 2020 23:56:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC9B085828D
	for <cluster-devel@redhat.com>; Mon, 26 Oct 2020 23:56:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-417-lWV5jWa0PXCuP6mlc81roA-1;
	Mon, 26 Oct 2020 19:56:40 -0400
X-MC-Unique: lWV5jWa0PXCuP6mlc81roA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1C1AC20882;
	Mon, 26 Oct 2020 23:56:38 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 26 Oct 2020 19:55:04 -0400
Message-Id: <20201026235516.1025100-68-sashal@kernel.org>
In-Reply-To: <20201026235516.1025100-1-sashal@kernel.org>
References: <20201026235516.1025100-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09QNujtA021507
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Jamie Iles <jamie@nuviainc.com>,
	cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.4 68/80] gfs2: use-after-free in
	sysfs deregistration
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Jamie Iles <jamie@nuviainc.com>

[ Upstream commit c2a04b02c060c4858762edce4674d5cba3e5a96f ]

syzkaller found the following splat with CONFIG_DEBUG_KOBJECT_RELEASE=y:

  Read of size 1 at addr ffff000028e896b8 by task kworker/1:2/228

  CPU: 1 PID: 228 Comm: kworker/1:2 Tainted: G S                5.9.0-rc8+ #101
  Hardware name: linux,dummy-virt (DT)
  Workqueue: events kobject_delayed_cleanup
  Call trace:
   dump_backtrace+0x0/0x4d8
   show_stack+0x34/0x48
   dump_stack+0x174/0x1f8
   print_address_description.constprop.0+0x5c/0x550
   kasan_report+0x13c/0x1c0
   __asan_report_load1_noabort+0x34/0x60
   memcmp+0xd0/0xd8
   gfs2_uevent+0xc4/0x188
   kobject_uevent_env+0x54c/0x1240
   kobject_uevent+0x2c/0x40
   __kobject_del+0x190/0x1d8
   kobject_delayed_cleanup+0x2bc/0x3b8
   process_one_work+0x96c/0x18c0
   worker_thread+0x3f0/0xc30
   kthread+0x390/0x498
   ret_from_fork+0x10/0x18

  Allocated by task 1110:
   kasan_save_stack+0x28/0x58
   __kasan_kmalloc.isra.0+0xc8/0xe8
   kasan_kmalloc+0x10/0x20
   kmem_cache_alloc_trace+0x1d8/0x2f0
   alloc_super+0x64/0x8c0
   sget_fc+0x110/0x620
   get_tree_bdev+0x190/0x648
   gfs2_get_tree+0x50/0x228
   vfs_get_tree+0x84/0x2e8
   path_mount+0x1134/0x1da8
   do_mount+0x124/0x138
   __arm64_sys_mount+0x164/0x238
   el0_svc_common.constprop.0+0x15c/0x598
   do_el0_svc+0x60/0x150
   el0_svc+0x34/0xb0
   el0_sync_handler+0xc8/0x5b4
   el0_sync+0x15c/0x180

  Freed by task 228:
   kasan_save_stack+0x28/0x58
   kasan_set_track+0x28/0x40
   kasan_set_free_info+0x24/0x48
   __kasan_slab_free+0x118/0x190
   kasan_slab_free+0x14/0x20
   slab_free_freelist_hook+0x6c/0x210
   kfree+0x13c/0x460

Use the same pattern as f2fs + ext4 where the kobject destruction must
complete before allowing the FS itself to be freed.  This means that we
need an explicit free_sbd in the callers.

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
[Also go to fail_free when init_names fails.]
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/ops_fstype.c | 22 +++++-----------------
 fs/gfs2/super.c      |  1 +
 fs/gfs2/sys.c        |  5 ++++-
 4 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 5f89c515f5bb7..33a6b074209da 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -694,6 +694,7 @@ struct gfs2_sbd {
 	struct super_block *sd_vfs;
 	struct gfs2_pcpu_lkstats __percpu *sd_lkstats;
 	struct kobject sd_kobj;
+	struct completion sd_kobj_unregister;
 	unsigned long sd_flags;	/* SDF_... */
 	struct gfs2_sb_host sd_sb;
 
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index e0c55765b06d2..338666a97fff6 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1094,26 +1094,14 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 
 	error = init_names(sdp, silent);
-	if (error) {
-		/* In this case, we haven't initialized sysfs, so we have to
-		   manually free the sdp. */
-		free_sbd(sdp);
-		sb->s_fs_info = NULL;
-		return error;
-	}
+	if (error)
+		goto fail_free;
 
 	snprintf(sdp->sd_fsname, sizeof(sdp->sd_fsname), "%s", sdp->sd_table_name);
 
 	error = gfs2_sys_fs_add(sdp);
-	/*
-	 * If we hit an error here, gfs2_sys_fs_add will have called function
-	 * kobject_put which causes the sysfs usage count to go to zero, which
-	 * causes sysfs to call function gfs2_sbd_release, which frees sdp.
-	 * Subsequent error paths here will call gfs2_sys_fs_del, which also
-	 * kobject_put to free sdp.
-	 */
 	if (error)
-		return error;
+		goto fail_free;
 
 	gfs2_create_debugfs_file(sdp);
 
@@ -1210,9 +1198,9 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	gfs2_lm_unmount(sdp);
 fail_debug:
 	gfs2_delete_debugfs_file(sdp);
-	/* gfs2_sys_fs_del must be the last thing we do, since it causes
-	 * sysfs to call function gfs2_sbd_release, which frees sdp. */
 	gfs2_sys_fs_del(sdp);
+fail_free:
+	free_sbd(sdp);
 	sb->s_fs_info = NULL;
 	return error;
 }
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 5fa1eec4fb4f5..5935ce5ae5636 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -695,6 +695,7 @@ static void gfs2_put_super(struct super_block *sb)
 
 	/*  At this point, we're through participating in the lockspace  */
 	gfs2_sys_fs_del(sdp);
+	free_sbd(sdp);
 }
 
 /**
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index dd15b8e4af2ce..1c6e52dc878e3 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -302,7 +302,7 @@ static void gfs2_sbd_release(struct kobject *kobj)
 {
 	struct gfs2_sbd *sdp = container_of(kobj, struct gfs2_sbd, sd_kobj);
 
-	free_sbd(sdp);
+	complete(&sdp->sd_kobj_unregister);
 }
 
 static struct kobj_type gfs2_ktype = {
@@ -652,6 +652,7 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
 	sprintf(ro, "RDONLY=%d", sb_rdonly(sb));
 	sprintf(spectator, "SPECTATOR=%d", sdp->sd_args.ar_spectator ? 1 : 0);
 
+	init_completion(&sdp->sd_kobj_unregister);
 	sdp->sd_kobj.kset = gfs2_kset;
 	error = kobject_init_and_add(&sdp->sd_kobj, &gfs2_ktype, NULL,
 				     "%s", sdp->sd_table_name);
@@ -682,6 +683,7 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
 fail_reg:
 	fs_err(sdp, "error %d adding sysfs files\n", error);
 	kobject_put(&sdp->sd_kobj);
+	wait_for_completion(&sdp->sd_kobj_unregister);
 	sb->s_fs_info = NULL;
 	return error;
 }
@@ -692,6 +694,7 @@ void gfs2_sys_fs_del(struct gfs2_sbd *sdp)
 	sysfs_remove_group(&sdp->sd_kobj, &tune_group);
 	sysfs_remove_group(&sdp->sd_kobj, &lock_module_group);
 	kobject_put(&sdp->sd_kobj);
+	wait_for_completion(&sdp->sd_kobj_unregister);
 }
 
 static int gfs2_uevent(struct kset *kset, struct kobject *kobj,
-- 
2.25.1


