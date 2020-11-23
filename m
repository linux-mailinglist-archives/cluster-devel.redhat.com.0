Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 99AC92C0F4C
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 16:53:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606146838;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o7TJUd8dXNhoX3PQPNZgNR4FSPUC863SIoS2w2C7gdA=;
	b=IWvi3dI/uxEl5x2dY+MU6PV2H+Of5xxEDk+sfCIenIrrk4z4InZJ5+7/LTyEgjYSU+tfv2
	FJDreJjhNMaZUSJnmE+0O4tZsTILcsUHTIbUSFZio5sze79ztBcb9Q0qInSkme872S5/9N
	/80oy+6izGueZNI5y2NPB9XggrjyX40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-UIsdGVeDPoiE0JsuauqF7A-1; Mon, 23 Nov 2020 10:53:55 -0500
X-MC-Unique: UIsdGVeDPoiE0JsuauqF7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98846108DE98;
	Mon, 23 Nov 2020 15:53:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 171FA6091B;
	Mon, 23 Nov 2020 15:53:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5379B180954D;
	Mon, 23 Nov 2020 15:53:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANFrmVj015389 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 10:53:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E78D85D9EF; Mon, 23 Nov 2020 15:53:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-203.rdu2.redhat.com [10.10.114.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B9415D9E3;
	Mon, 23 Nov 2020 15:53:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 23 Nov 2020 10:53:35 -0500
Message-Id: <20201123155335.354986-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2/for-next] fs: gfs2: add set of subclass
	for iopen glocks
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch introduce a new globs attribute to define the subclass of the
glock lockref spinlock. This avoid the following lockdep warning, which
occurs when we lock an inode lock while an iopen lock is held:

============================================
WARNING: possible recursive locking detected
5.10.0-rc3+ #4990 Not tainted
--------------------------------------------
kworker/0:1/12 is trying to acquire lock:
ffff9067d45672d8 (&gl->gl_lockref.lock){+.+.}-{3:3}, at: lockref_get+0x9/0x20

but task is already holding lock:
ffff9067da308588 (&gl->gl_lockref.lock){+.+.}-{3:3}, at: delete_work_func+0x164/0x260

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&gl->gl_lockref.lock);
  lock(&gl->gl_lockref.lock);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

3 locks held by kworker/0:1/12:
 #0: ffff9067c1bfdd38 ((wq_completion)delete_workqueue){+.+.}-{0:0}, at: process_one_work+0x1b7/0x540
 #1: ffffac594006be70 ((work_completion)(&(&gl->gl_delete)->work)){+.+.}-{0:0}, at: process_one_work+0x1b7/0x540
 #2: ffff9067da308588 (&gl->gl_lockref.lock){+.+.}-{3:3}, at: delete_work_func+0x164/0x260

stack backtrace:
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.10.0-rc3+ #4990
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.13.0-2.fc32 04/01/2014
Workqueue: delete_workqueue delete_work_func
Call Trace:
 dump_stack+0x8b/0xb0
 __lock_acquire.cold+0x19e/0x2e3
 lock_acquire+0x150/0x410
 ? lockref_get+0x9/0x20
 _raw_spin_lock+0x27/0x40
 ? lockref_get+0x9/0x20
 lockref_get+0x9/0x20
 delete_work_func+0x188/0x260
 process_one_work+0x237/0x540
 worker_thread+0x4d/0x3b0
 ? process_one_work+0x540/0x540
 kthread+0x127/0x140
 ? __kthread_bind_mask+0x60/0x60
 ret_from_fork+0x22/0x30

Suggested-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/gfs2/glock.c  | 1 +
 fs/gfs2/glops.c  | 1 +
 fs/gfs2/incore.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d98a2e5dab9f..35a6fd103761 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1035,6 +1035,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 	gl->gl_node.next = NULL;
 	gl->gl_flags = 0;
 	gl->gl_name = name;
+	lockdep_set_subclass(&gl->gl_lockref.lock, glops->go_subclass);
 	gl->gl_lockref.count = 1;
 	gl->gl_state = LM_ST_UNLOCKED;
 	gl->gl_target = LM_ST_UNLOCKED;
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index dae69ad74544..dc5014739318 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -770,6 +770,7 @@ const struct gfs2_glock_operations gfs2_iopen_glops = {
 	.go_callback = iopen_go_callback,
 	.go_demote_ok = iopen_go_demote_ok,
 	.go_flags = GLOF_LRU | GLOF_NONDISK,
+	.go_subclass = 1,
 };
 
 const struct gfs2_glock_operations gfs2_flock_glops = {
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index d7707307f4b1..f8858d995b24 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -247,6 +247,7 @@ struct gfs2_glock_operations {
 			const char *fs_id_buf);
 	void (*go_callback)(struct gfs2_glock *gl, bool remote);
 	void (*go_free)(struct gfs2_glock *gl);
+	const int go_subclass;
 	const int go_type;
 	const unsigned long go_flags;
 #define GLOF_ASPACE 1 /* address space attached */
-- 
2.26.2

