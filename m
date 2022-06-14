Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396054BA82
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jun 2022 21:27:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655234819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3I+4u8orXekJQPkWfRkjnOgte2/Zm/DRQrOgloMT6RE=;
	b=iBVsKq3aI08tT3mpRckM8E0wQp90feO1y/tIGUsvDfbqnS5b73UwlB7q7NuALLz4NEEy25
	qK+EvzyGdmvR54i8lRTX04AsJ+xo+XJfXeY1wKeK9zhvCAqwCEjfDrjy9bAdJZSO9Oy5SP
	sePak13tfYbeEyz5jBITZ3VwHwfv46k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-2lPMBvHnMX2IvgfaEy9FAw-1; Tue, 14 Jun 2022 15:26:53 -0400
X-MC-Unique: 2lPMBvHnMX2IvgfaEy9FAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35703811E75;
	Tue, 14 Jun 2022 19:26:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1513540CFD0A;
	Tue, 14 Jun 2022 19:26:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AF01E194707F;
	Tue, 14 Jun 2022 19:26:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CB5D71947067 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 19:26:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 996101121319; Tue, 14 Jun 2022 19:26:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 778691121314;
 Tue, 14 Jun 2022 19:26:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 14 Jun 2022 15:26:41 -0400
Message-Id: <20220614192641.2104173-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm/tool] dlm_controld: ensure to stop
 kernel dlm if quit
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will ensure that we stop kernel lockspace activity before
dlm_controld exits itself because e.g. the connection to corosync got
lost. This can be if corosync got killed or shutdown.

If we don't ensure the lockspace is stopped it can be that a kernel
warning got triggered:

Call trace of warning was:
[14003.162881] Call Trace:
[14003.162883]  [<000003ff80796d70>] dlm_midcomms_get_mhandle+0x170/0x1f0 [dlm]
[14003.162892] ([<000003ff80796d6c>] dlm_midcomms_get_mhandle+0x16c/0x1f0 [dlm])
[14003.162901]  [<000003ff80787366>] create_message+0x56/0x100 [dlm]
[14003.162909]  [<000003ff8078849c>] send_common+0x7c/0x130 [dlm]
[14003.162928]  [<000003ff8078b50c>] _convert_lock+0x3c/0x140 [dlm]
[14003.162936]  [<000003ff8078b698>] convert_lock+0x88/0xd0 [dlm]
[14003.162944]  [<000003ff80790008>] dlm_lock+0x158/0x1b0 [dlm]
[14003.162952]  [<000003ff807ff4c6>] gdlm_lock+0x1f6/0x2f0 [gfs2]
[14003.162997]  [<000003ff807d96c8>] do_xmote+0x1f8/0x440 [gfs2]
[14003.163008]  [<000003ff807d9d88>] gfs2_glock_nq+0x88/0x130 [gfs2]
[14003.163020]  [<000003ff807fac92>] gfs2_statfs_sync+0x52/0x180 [gfs2]
[14003.163031]  [<000003ff807f2b70>] gfs2_quotad+0xc0/0x360 [gfs2]
[14003.163043]  [<0000000050527cfc>] kthread+0x17c/0x190
[14003.163061]  [<00000000504af5dc>] __ret_from_fork+0x3c/0x60
[14003.163064]  [<0000000050d6df4a>] ret_from_fork+0xa/0x30

Which indicates that there was still lock activity and a dlm fence action
"closing connection" which gets triggered by a configfs removal was not
synchronized between lock activity and recovery.

On dlm_controld log side there was a:

Feb 24 12:12:40 4008 cpg_dispatch error 2

which probably indicates that the corosync daemon left.

Instrumenting the dlm kernel handling indicates when a:

killall corosync

is executed the "ls->ls_in_recovery" write lock is not held. I did a
write lock instrumentation by printout "RECOVERY LOCK" and
"RECOVERY UNLOCK", when the per ls "ls_in_recovery" write lock is being
held. This lock is important to held, because the "closing connection"
aka dlm kernel fence action requires to have no lockspace lock activity
anymore going on.

Instrumented printout when corosync gets killed:

[   28.863103] RECOVERY UNLOCK 1
[   28.868559] dlm: test: dlm_recover 1 generation 11 done: 99 ms
[   46.776997] dlm: connection 000000004b240e16 got EOF from 1
[   46.779023] dlm: connection 000000003833c546 got EOF from 1
[   46.781163] dlm: connection 00000000a48c3263 got EOF from 3
[   46.782559] dlm: connection 0000000009964aad got EOF from 3
[   48.657932] dlm: closing connection to node 3
[   48.660090] dlm: closing connection to node 2
[   48.661558] dlm: closing connection to node 1
[   48.691884] dlm: test: no userland control daemon, stopping lockspace
[   48.693888] RECOVERY LOCK 2
[   48.695633] dlm: dlm user daemon left 1 lockspaces

To fix this issue we ensure that the dlm lockspace activity gets stopped
before removing configfs entries if dlm_controld main loop exits. On the
above handling you can see that it is done afterwards which is too late.

After this patch the ls_in_recovery is held before removal of configfs
entries (closing connection):

[   36.412544] RECOVERY UNLOCK 1
[   36.418378] dlm: test: dlm_recover 1 generation 15 done: 233 ms
[   70.616509] RECOVERY LOCK 2
[   70.666016] dlm: connection 00000000df3f9abb got EOF from 1
[   70.671155] dlm: connection 00000000e69b1ae0 got EOF from 3
[   70.675919] dlm: connection 00000000d18e6d72 got EOF from 3
[   70.730863] dlm: closing connection to node 3
[   70.732917] dlm: closing connection to node 2
[   70.734949] dlm: closing connection to node 1
[   70.843747] dlm: dlm user daemon left 1 lockspaces

Reported-by: Nate Straz <nstraz@redhat.com>
---
change since v2:
 - I changed a little bit the debug messages. This patch fixes
   dlm kernel handling to be in the right context when dlm_controld
   gets killed. I want to have this patch upstream in dlm_controld
   because now several people could run in some kernel warning and
   the answer would be to update dlm userspace.


 dlm_controld/cpg.c        | 10 ++++++++--
 dlm_controld/daemon_cpg.c |  2 ++
 dlm_controld/dlm_daemon.h |  1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/dlm_controld/cpg.c b/dlm_controld/cpg.c
index b9f9a16b..b85fef5f 100644
--- a/dlm_controld/cpg.c
+++ b/dlm_controld/cpg.c
@@ -652,15 +652,21 @@ static void start_kernel(struct lockspace *ls)
 	}
 }
 
-static void stop_kernel(struct lockspace *ls, uint32_t seq)
+void cpg_stop_kernel(struct lockspace *ls)
 {
 	if (!ls->kernel_stopped) {
-		log_group(ls, "stop_kernel cg %u", seq);
+		log_group(ls, "%s", __func__);
 		set_sysfs_control(ls->name, 0);
 		ls->kernel_stopped = 1;
 	}
 }
 
+static void stop_kernel(struct lockspace *ls, uint32_t seq)
+{
+	log_group(ls, "%s seq %u", __func__, seq);
+	cpg_stop_kernel(ls);
+}
+
 /* the first condition is that the local lockspace is stopped which we
    don't need to check for because stop_kernel(), which is synchronous,
    was done when the change was created */
diff --git a/dlm_controld/daemon_cpg.c b/dlm_controld/daemon_cpg.c
index 65593e80..f215edfd 100644
--- a/dlm_controld/daemon_cpg.c
+++ b/dlm_controld/daemon_cpg.c
@@ -2555,6 +2555,8 @@ void close_cpg_daemon(void)
 		log_error("daemon cpg_leave error %d", error);
  fin:
 	list_for_each_entry(ls, &lockspaces, list) {
+		/* stop kernel ls lock activity before configfs cleanup */
+		cpg_stop_kernel(ls);
 		if (ls->cpg_handle)
 			cpg_finalize(ls->cpg_handle);
 	}
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index da261774..22e286fc 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -414,6 +414,7 @@ int set_lockspaces(int *count, struct dlmc_lockspace **lss_out);
 int set_lockspace_nodes(struct lockspace *ls, int option, int *node_count,
 			struct dlmc_node **nodes_out);
 int set_fs_notified(struct lockspace *ls, int nodeid);
+void cpg_stop_kernel(struct lockspace *ls);
 
 /* daemon_cpg.c */
 void init_daemon(void);
-- 
2.31.1

