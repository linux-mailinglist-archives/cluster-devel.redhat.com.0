Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2082132947E
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 23:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614636343;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R+WLpQw8GZ3/B/thH0ipmmq4RnD4pzndma7/xLpj/6k=;
	b=dPf2dBiGAMBD2CFpRgHyGOsBzlS0jPu0/sl9IyLWe8y8O9yFQweC9jXRVBRMfA88wb/TGL
	YlWx81V8mlWHSq+kZQY0uqGLkGX8LlosUKDhvNFvaGXguTUuN7dASIXDR8BmMZZtrMtXTu
	KFCEt27VYU3NNgbkMAb2VEZb/YyyloE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-nKOluT3xMX6vDGM-485tmA-1; Mon, 01 Mar 2021 17:05:41 -0500
X-MC-Unique: nKOluT3xMX6vDGM-485tmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E68CE653;
	Mon,  1 Mar 2021 22:05:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 306CD6A03D;
	Mon,  1 Mar 2021 22:05:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 179EC18095CC;
	Mon,  1 Mar 2021 22:05:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121M5bcp006002 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 17:05:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9EE63100239A; Mon,  1 Mar 2021 22:05:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6D9610013C1;
	Mon,  1 Mar 2021 22:05:36 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 17:05:20 -0500
Message-Id: <20210301220520.514470-14-aahringo@redhat.com>
In-Reply-To: <20210301220520.514470-1-aahringo@redhat.com>
References: <20210301220520.514470-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 13/13] fs: dlm: add shutdown hook
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes issues which occurs when dlm lowcomms synchronize their
workqueues but dlm application layer already released the lockspace. In
such cases messages like:

dlm: gfs2: release_lockspace final free
dlm: invalid lockspace 3841231384 from 1 cmd 1 type 11

are printed on the kernel log. This patch is solving this issue by
introducing a new "shutdown" hook before calling "stop" hook when the
lockspace is going to be released finally. This should pretend any
dlm messages sitting in the workqueues during or after lockspace
removal.

It's necessary to call dlm_scand_stop() as I instrumented
dlm_lowcomms_get_buffer() code to report a warning after it's called after
dlm_midcomms_shutdown() functionality, see below:

WARNING: CPU: 1 PID: 3794 at fs/dlm/midcomms.c:1003 dlm_midcomms_get_buffer+0x167/0x180
Modules linked in: joydev iTCO_wdt intel_pmc_bxt iTCO_vendor_support drm_ttm_helper ttm pcspkr serio_raw i2c_i801 i2c_smbus drm_kms_helper virtio_scsi lpc_ich virtio_balloon virtio_console xhci_pci xhci_pci_renesas cec qemu_fw_cfg drm [last unloaded: qxl]
CPU: 1 PID: 3794 Comm: dlm_scand Tainted: G        W         5.11.0+ #26
Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.13.0-2.module+el8.3.0+7353+9de0a3cc 04/01/2014
RIP: 0010:dlm_midcomms_get_buffer+0x167/0x180
Code: 5d 41 5c 41 5d 41 5e 41 5f c3 0f 0b 45 31 e4 5b 5d 4c 89 e0 41 5c 41 5d 41 5e 41 5f c3 4c 89 e7 45 31 e4 e8 3b f1 ec ff eb 86 <0f> 0b 4c 89 e7 45 31 e4 e8 2c f1 ec ff e9 74 ff ff ff 0f 1f 80 00
RSP: 0018:ffffa81503f8fe60 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff8f969827f200 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffffad1e89a0 RDI: ffff8f96a5294160
RBP: 0000000000000001 R08: 0000000000000000 R09: ffff8f96a250bc60
R10: 00000000000045d3 R11: 0000000000000000 R12: ffff8f96a250bc60
R13: ffffa81503f8fec8 R14: 0000000000000070 R15: 0000000000000c40
FS:  0000000000000000(0000) GS:ffff8f96fbc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055aa3351c000 CR3: 000000010bf22000 CR4: 00000000000006e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 dlm_scan_rsbs+0x420/0x670
 ? dlm_uevent+0x20/0x20
 dlm_scand+0xbf/0xe0
 kthread+0x13a/0x150
 ? __kthread_bind_mask+0x60/0x60
 ret_from_fork+0x22/0x30

To synchronize all dlm scand messages we stop it right before shutdown
hook.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c | 20 +++++++++++---------
 fs/dlm/lowcomms.c  | 42 +++++++++++++++++++++++-------------------
 fs/dlm/lowcomms.h  |  1 +
 3 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 561dcad08ad6..c14cf2b7faab 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -404,12 +404,6 @@ static int threads_start(void)
 	return error;
 }
 
-static void threads_stop(void)
-{
-	dlm_scand_stop();
-	dlm_lowcomms_stop();
-}
-
 static int new_lockspace(const char *name, const char *cluster,
 			 uint32_t flags, int lvblen,
 			 const struct dlm_lockspace_ops *ops, void *ops_arg,
@@ -702,8 +696,11 @@ int dlm_new_lockspace(const char *name, const char *cluster,
 		ls_count++;
 	if (error > 0)
 		error = 0;
-	if (!ls_count)
-		threads_stop();
+	if (!ls_count) {
+		dlm_scand_stop();
+		dlm_lowcomms_shutdown();
+		dlm_lowcomms_stop();
+	}
  out:
 	mutex_unlock(&ls_lock);
 	return error;
@@ -788,6 +785,11 @@ static int release_lockspace(struct dlm_ls *ls, int force)
 
 	dlm_recoverd_stop(ls);
 
+	if (ls_count == 1) {
+		dlm_scand_stop();
+		dlm_lowcomms_shutdown();
+	}
+
 	dlm_callback_stop(ls);
 
 	remove_lockspace(ls);
@@ -880,7 +882,7 @@ int dlm_release_lockspace(void *lockspace, int force)
 	if (!error)
 		ls_count--;
 	if (!ls_count)
-		threads_stop();
+		dlm_lowcomms_stop();
 	mutex_unlock(&ls_lock);
 
 	return error;
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 43dad68e2387..73cc1809050a 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1612,6 +1612,29 @@ static int work_start(void)
 	return 0;
 }
 
+static void shutdown_conn(struct connection *con)
+{
+	if (con->shutdown_action)
+		con->shutdown_action(con);
+}
+
+void dlm_lowcomms_shutdown(void)
+{
+	/* Set all the flags to prevent any
+	 * socket activity.
+	 */
+	dlm_allow_conn = 0;
+
+	if (recv_workqueue)
+		flush_workqueue(recv_workqueue);
+	if (send_workqueue)
+		flush_workqueue(send_workqueue);
+
+	dlm_close_sock(&listen_con.sock);
+
+	foreach_conn(shutdown_conn);
+}
+
 static void _stop_conn(struct connection *con, bool and_other)
 {
 	mutex_lock(&con->sock_mutex);
@@ -1633,12 +1656,6 @@ static void stop_conn(struct connection *con)
 	_stop_conn(con, true);
 }
 
-static void shutdown_conn(struct connection *con)
-{
-	if (con->shutdown_action)
-		con->shutdown_action(con);
-}
-
 static void connection_release(struct rcu_head *rcu)
 {
 	struct connection *con = container_of(rcu, struct connection, rcu);
@@ -1695,19 +1712,6 @@ static void work_flush(void)
 
 void dlm_lowcomms_stop(void)
 {
-	/* Set all the flags to prevent any
-	   socket activity.
-	*/
-	dlm_allow_conn = 0;
-
-	if (recv_workqueue)
-		flush_workqueue(recv_workqueue);
-	if (send_workqueue)
-		flush_workqueue(send_workqueue);
-
-	dlm_close_sock(&listen_con.sock);
-
-	foreach_conn(shutdown_conn);
 	work_flush();
 	foreach_conn(free_conn);
 	work_stop();
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index bcd4dbd1dc98..48bbc4e18761 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -18,6 +18,7 @@
 extern int dlm_allow_conn;
 
 int dlm_lowcomms_start(void);
+void dlm_lowcomms_shutdown(void);
 void dlm_lowcomms_stop(void);
 void dlm_lowcomms_exit(void);
 int dlm_lowcomms_close(int nodeid);
-- 
2.26.2

