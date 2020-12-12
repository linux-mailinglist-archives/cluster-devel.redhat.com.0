Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 764582D8783
	for <lists+cluster-devel@lfdr.de>; Sat, 12 Dec 2020 17:08:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-TJG-ogfAN4aY6ufJChR4MQ-1; Sat, 12 Dec 2020 11:08:36 -0500
X-MC-Unique: TJG-ogfAN4aY6ufJChR4MQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D717800D53;
	Sat, 12 Dec 2020 16:08:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C41FC5D9C2;
	Sat, 12 Dec 2020 16:08:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABA021809C9F;
	Sat, 12 Dec 2020 16:08:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BCG8J3s016737 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 12 Dec 2020 11:08:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C92CE2166B2A; Sat, 12 Dec 2020 16:08:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E762166B29
	for <cluster-devel@redhat.com>; Sat, 12 Dec 2020 16:08:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D5D8007DF
	for <cluster-devel@redhat.com>; Sat, 12 Dec 2020 16:08:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-417-nRpdoYbWMjS_qKMYzn4jWQ-1;
	Sat, 12 Dec 2020 11:08:12 -0500
X-MC-Unique: nRpdoYbWMjS_qKMYzn4jWQ-1
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 12 Dec 2020 11:07:46 -0500
Message-Id: <20201212160804.2334982-5-sashal@kernel.org>
In-Reply-To: <20201212160804.2334982-1-sashal@kernel.org>
References: <20201212160804.2334982-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BCG8J3s016737
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.9 05/23] gfs2: set lockdep
	subclass for iopen glocks
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 515b269d5bd29a986d5e1c0a0cba87fa865a48b4 ]

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
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c  | 1 +
 fs/gfs2/glops.c  | 1 +
 fs/gfs2/incore.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 120a4193a75a7..ac14ba220340d 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1038,6 +1038,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 	gl->gl_node.next = NULL;
 	gl->gl_flags = 0;
 	gl->gl_name = name;
+	lockdep_set_subclass(&gl->gl_lockref.lock, glops->go_subclass);
 	gl->gl_lockref.count = 1;
 	gl->gl_state = LM_ST_UNLOCKED;
 	gl->gl_target = LM_ST_UNLOCKED;
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 138500953b56f..27bffac51ed55 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -751,6 +751,7 @@ const struct gfs2_glock_operations gfs2_iopen_glops = {
 	.go_callback = iopen_go_callback,
 	.go_demote_ok = iopen_go_demote_ok,
 	.go_flags = GLOF_LRU | GLOF_NONDISK,
+	.go_subclass = 1,
 };
 
 const struct gfs2_glock_operations gfs2_flock_glops = {
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 387e99d6eda9e..d167307a36299 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -243,6 +243,7 @@ struct gfs2_glock_operations {
 			const char *fs_id_buf);
 	void (*go_callback)(struct gfs2_glock *gl, bool remote);
 	void (*go_free)(struct gfs2_glock *gl);
+	const int go_subclass;
 	const int go_type;
 	const unsigned long go_flags;
 #define GLOF_ASPACE 1 /* address space attached */
-- 
2.27.0


