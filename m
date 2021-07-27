Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A5EC83D7C47
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407444;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gLRqH/1MeaSo2fgFc21YmeluobLSvHz0dYt8/d3JYtw=;
	b=C7BR522xVYYJ7Yo1I2IATAfhyhBqlbERWpxiF/o18SJxcUiHab2HuF23hGzrhCIj5i7iML
	yifV60SfhMugpp4lmAWd6VX2w6MTT/qxGIEfT8CMu9jugKj7VSCopLEi4w+0AHVmPjvyd+
	vFdf3s4H2F8qeUa5jNlzTN0JTkfzAC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-c3U4JsdJNhiKGaxyy-lp6Q-1; Tue, 27 Jul 2021 13:37:23 -0400
X-MC-Unique: c3U4JsdJNhiKGaxyy-lp6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57682A0C00;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 470816A8F8;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 355124A7C8;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbGFY022837 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0CC51980E; Tue, 27 Jul 2021 17:37:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9388E19630
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:16 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:37:01 -0500
Message-Id: <20210727173709.210711-8-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 07/15] gfs2: init system threads before
	freeze lock
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Patch 96b1454f2e ("gfs2: move freeze glock outside the make_fs_rw and _ro
functions") changed the gfs2 mount sequence so that it holds the freeze
lock before calling gfs2_make_fs_rw. Before this patch, gfs2_make_fs_rw
called init_threads to initialize the quotad and logd threads. That is a
problem if the system needs to withdraw due to IO errors early in the
mount sequence, for example, while initializing the system statfs inode:

1. An IO error causes the statfs glock to not sync properly after
   recovery, and leaves items on the ail list.
2. The leftover items on the ail list causes its do_xmote call to fail,
   which makes it want to withdraw. But since the glock code cannot
   withdraw (because the withdraw sequence uses glocks) it relies upon
   the logd daemon to initiate the withdraw.`
3. The withdraw can never be performed by the logd daemon because all
   this takes place before the logd daemon is started.

This patch moves function init_threads from super.c to ops_fstype.c
and it changes gfs2_fill_super to start its threads before holding the
freeze lock, and if there's an error, stop its threads after releasing
it. This allows the logd to run unblocked by the freeze lock. Thus,
the logd daemon can perform its withdraw sequence properly.

Fixes: 96b1454f2e ("gfs2: move freeze glock outside the make_fs_rw and _ro
functions")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c | 42 ++++++++++++++++++++++++++++++
 fs/gfs2/super.c      | 61 +++++---------------------------------------
 2 files changed, 48 insertions(+), 55 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index bd3b3be1a473..ca76e3b8792c 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1089,6 +1089,34 @@ void gfs2_online_uevent(struct gfs2_sbd *sdp)
 	kobject_uevent_env(&sdp->sd_kobj, KOBJ_ONLINE, envp);
 }
 
+static int init_threads(struct gfs2_sbd *sdp)
+{
+	struct task_struct *p;
+	int error = 0;
+
+	p = kthread_run(gfs2_logd, sdp, "gfs2_logd");
+	if (IS_ERR(p)) {
+		error = PTR_ERR(p);
+		fs_err(sdp, "can't start logd thread: %d\n", error);
+		return error;
+	}
+	sdp->sd_logd_process = p;
+
+	p = kthread_run(gfs2_quotad, sdp, "gfs2_quotad");
+	if (IS_ERR(p)) {
+		error = PTR_ERR(p);
+		fs_err(sdp, "can't start quotad thread: %d\n", error);
+		goto fail;
+	}
+	sdp->sd_quotad_process = p;
+	return 0;
+
+fail:
+	kthread_stop(sdp->sd_logd_process);
+	sdp->sd_logd_process = NULL;
+	return error;
+}
+
 /**
  * gfs2_fill_super - Read in superblock
  * @sb: The VFS superblock
@@ -1217,6 +1245,14 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto fail_per_node;
 	}
 
+	if (!sb_rdonly(sb)) {
+		error = init_threads(sdp);
+		if (error) {
+			gfs2_withdraw_delayed(sdp);
+			goto fail_per_node;
+		}
+	}
+
 	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
 	if (error)
 		goto fail_per_node;
@@ -1226,6 +1262,12 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	gfs2_freeze_unlock(&freeze_gh);
 	if (error) {
+		if (sdp->sd_quotad_process)
+			kthread_stop(sdp->sd_quotad_process);
+		sdp->sd_quotad_process = NULL;
+		if (sdp->sd_logd_process)
+			kthread_stop(sdp->sd_logd_process);
+		sdp->sd_logd_process = NULL;
 		fs_err(sdp, "can't make FS RW: %d\n", error);
 		goto fail_per_node;
 	}
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 4d4ceb0b6903..2bdbba5ea8d7 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -119,34 +119,6 @@ int gfs2_jdesc_check(struct gfs2_jdesc *jd)
 	return 0;
 }
 
-static int init_threads(struct gfs2_sbd *sdp)
-{
-	struct task_struct *p;
-	int error = 0;
-
-	p = kthread_run(gfs2_logd, sdp, "gfs2_logd");
-	if (IS_ERR(p)) {
-		error = PTR_ERR(p);
-		fs_err(sdp, "can't start logd thread: %d\n", error);
-		return error;
-	}
-	sdp->sd_logd_process = p;
-
-	p = kthread_run(gfs2_quotad, sdp, "gfs2_quotad");
-	if (IS_ERR(p)) {
-		error = PTR_ERR(p);
-		fs_err(sdp, "can't start quotad thread: %d\n", error);
-		goto fail;
-	}
-	sdp->sd_quotad_process = p;
-	return 0;
-
-fail:
-	kthread_stop(sdp->sd_logd_process);
-	sdp->sd_logd_process = NULL;
-	return error;
-}
-
 /**
  * gfs2_make_fs_rw - Turn a Read-Only FS into a Read-Write one
  * @sdp: the filesystem
@@ -161,26 +133,17 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	struct gfs2_log_header_host head;
 	int error;
 
-	error = init_threads(sdp);
-	if (error) {
-		gfs2_withdraw_delayed(sdp);
-		return error;
-	}
-
 	j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
-	if (gfs2_withdrawn(sdp)) {
-		error = -EIO;
-		goto fail;
-	}
+	if (gfs2_withdrawn(sdp))
+		return -EIO;
 
 	error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
 	if (error || gfs2_withdrawn(sdp))
-		goto fail;
+		return error;
 
 	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
 		gfs2_consist(sdp);
-		error = -EIO;
-		goto fail;
+		return -EIO;
 	}
 
 	/*  Initialize some head of the log stuff  */
@@ -188,20 +151,8 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	gfs2_log_pointers_init(sdp, head.lh_blkno);
 
 	error = gfs2_quota_init(sdp);
-	if (error || gfs2_withdrawn(sdp))
-		goto fail;
-
-	set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
-
-	return 0;
-
-fail:
-	if (sdp->sd_quotad_process)
-		kthread_stop(sdp->sd_quotad_process);
-	sdp->sd_quotad_process = NULL;
-	if (sdp->sd_logd_process)
-		kthread_stop(sdp->sd_logd_process);
-	sdp->sd_logd_process = NULL;
+	if (!error && !gfs2_withdrawn(sdp))
+		set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 	return error;
 }
 
-- 
2.31.1

