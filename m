Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC34373FF3
	for <lists+cluster-devel@lfdr.de>; Wed,  5 May 2021 18:31:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-8O8tilVFMWyD-KkeHism8Q-1; Wed, 05 May 2021 12:31:53 -0400
X-MC-Unique: 8O8tilVFMWyD-KkeHism8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB5181006706;
	Wed,  5 May 2021 16:31:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD1E45D6AC;
	Wed,  5 May 2021 16:31:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCA03180B463;
	Wed,  5 May 2021 16:31:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 145GVmVV031757 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 5 May 2021 12:31:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E21D2053497; Wed,  5 May 2021 16:31:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A18D2051B83
	for <cluster-devel@redhat.com>; Wed,  5 May 2021 16:31:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2282480A0B0
	for <cluster-devel@redhat.com>; Wed,  5 May 2021 16:31:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-393-PE56z_78O3O5g9Y6QD7HKQ-3;
	Wed, 05 May 2021 12:31:39 -0400
X-MC-Unique: PE56z_78O3O5g9Y6QD7HKQ-3
Received: by mail.kernel.org (Postfix) with ESMTPSA id B71DE613E6;
	Wed,  5 May 2021 16:31:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed,  5 May 2021 12:29:38 -0400
Message-Id: <20210505163125.3460440-10-sashal@kernel.org>
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 145GVmVV031757
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.12 010/116] fs: dlm: add shutdown
	hook
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 9d232469bcd772dbedb9e75a165c681b920524ee ]

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
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
index 2ab2a38cb3b7..6a3660bdbb46 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1607,6 +1607,29 @@ static int work_start(void)
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
@@ -1628,12 +1651,6 @@ static void stop_conn(struct connection *con)
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
@@ -1690,19 +1707,6 @@ static void work_flush(void)
 
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
2.30.2


