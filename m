Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C258136D
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Jul 2022 14:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658839888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A6kumZA2NtQpiOMBi14XD84kG0tDv4E8MFqZK0sSrbI=;
	b=MSJBWt8zXhzVrtZ2pwZ5wQeG/x8rnHFLsIwdloqUuLY9YsgOo3prcziPiVQYm9FppPgfGk
	6KG0z0yP6FHgOCoUlgUUqQnTM56BCwu6wopVzQHYhSTQWEBs9FNrjx59jFOSTAOlfASeBi
	63cgXZnf4405BfUIgagjxB8qPfIzcn4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-_jmVlzpSPIyHmFISm3OcAA-1; Tue, 26 Jul 2022 08:51:25 -0400
X-MC-Unique: _jmVlzpSPIyHmFISm3OcAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EF24802E5D;
	Tue, 26 Jul 2022 12:51:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7AAD2026D64;
	Tue, 26 Jul 2022 12:51:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C29A1945D8F;
	Tue, 26 Jul 2022 12:51:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC7771945D86 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 26 Jul 2022 12:51:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE99E492CA7; Tue, 26 Jul 2022 12:51:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABBE4492CA4;
 Tue, 26 Jul 2022 12:51:19 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 26 Jul 2022 08:51:17 -0400
Message-Id: <20220726125118.955056-2-aahringo@redhat.com>
In-Reply-To: <20220726125118.955056-1-aahringo@redhat.com>
References: <20220726125118.955056-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCHv3 dlm/next 1/2] fs: dlm: fix race in lowcomms
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes a race between queue_work() in
_dlm_lowcomms_commit_msg() and srcu_read_unlock(). The queue_work() can
take the final reference of a dlm_msg and so msg->idx can contain
garbage which is signaled by the following warning:

[  676.237050] ------------[ cut here ]------------
[  676.237052] WARNING: CPU: 0 PID: 1060 at include/linux/srcu.h:189 dlm_lowcomms_commit_msg+0x41/0x50
[  676.238945] Modules linked in: dlm_locktorture torture rpcsec_gss_krb5 intel_rapl_msr intel_rapl_common iTCO_wdt iTCO_vendor_support qxl kvm_intel drm_ttm_helper vmw_vsock_virtio_transport kvm vmw_vsock_virtio_transport_common ttm irqbypass crc32_pclmul joydev crc32c_intel serio_raw drm_kms_helper vsock virtio_scsi virtio_console virtio_balloon snd_pcm drm syscopyarea sysfillrect sysimgblt snd_timer fb_sys_fops i2c_i801 lpc_ich snd i2c_smbus soundcore pcspkr
[  676.244227] CPU: 0 PID: 1060 Comm: lock_torture_wr Not tainted 5.19.0-rc3+ #1546
[  676.245216] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.16.0-2.module+el8.7.0+15506+033991b0 04/01/2014
[  676.246460] RIP: 0010:dlm_lowcomms_commit_msg+0x41/0x50
[  676.247132] Code: fe ff ff ff 75 24 48 c7 c6 bd 0f 49 bb 48 c7 c7 38 7c 01 bd e8 00 e7 ca ff 89 de 48 c7 c7 60 78 01 bd e8 42 3d cd ff 5b 5d c3 <0f> 0b eb d8 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48
[  676.249253] RSP: 0018:ffffa401c18ffc68 EFLAGS: 00010282
[  676.249855] RAX: 0000000000000001 RBX: 00000000ffff8b76 RCX: 0000000000000006
[  676.250713] RDX: 0000000000000000 RSI: ffffffffbccf3a10 RDI: ffffffffbcc7b62e
[  676.251610] RBP: ffffa401c18ffc70 R08: 0000000000000001 R09: 0000000000000001
[  676.252481] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000005
[  676.253421] R13: ffff8b76786ec370 R14: ffff8b76786ec370 R15: ffff8b76786ec480
[  676.254257] FS:  0000000000000000(0000) GS:ffff8b7777800000(0000) knlGS:0000000000000000
[  676.255239] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  676.255897] CR2: 00005590205d88b8 CR3: 000000017656c003 CR4: 0000000000770ee0
[  676.256734] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  676.257567] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  676.258397] PKRU: 55555554
[  676.258729] Call Trace:
[  676.259063]  <TASK>
[  676.259354]  dlm_midcomms_commit_mhandle+0xcc/0x110
[  676.259964]  queue_bast+0x8b/0xb0
[  676.260423]  grant_pending_locks+0x166/0x1b0
[  676.261007]  _unlock_lock+0x75/0x90
[  676.261469]  unlock_lock.isra.57+0x62/0xa0
[  676.262009]  dlm_unlock+0x21e/0x330
[  676.262457]  ? lock_torture_stats+0x80/0x80 [dlm_locktorture]
[  676.263183]  torture_unlock+0x5a/0x90 [dlm_locktorture]
[  676.263815]  ? preempt_count_sub+0xba/0x100
[  676.264361]  ? complete+0x1d/0x60
[  676.264777]  lock_torture_writer+0xb8/0x150 [dlm_locktorture]
[  676.265555]  kthread+0x10a/0x130
[  676.266007]  ? kthread_complete_and_exit+0x20/0x20
[  676.266616]  ret_from_fork+0x22/0x30
[  676.267097]  </TASK>
[  676.267381] irq event stamp: 9579855
[  676.267824] hardirqs last  enabled at (9579863): [<ffffffffbb14e6f8>] __up_console_sem+0x58/0x60
[  676.268896] hardirqs last disabled at (9579872): [<ffffffffbb14e6dd>] __up_console_sem+0x3d/0x60
[  676.270008] softirqs last  enabled at (9579798): [<ffffffffbc200349>] __do_softirq+0x349/0x4c7
[  676.271438] softirqs last disabled at (9579897): [<ffffffffbb0d54c0>] irq_exit_rcu+0xb0/0xf0
[  676.272796] ---[ end trace 0000000000000000 ]---

I reproduced this warning with dlm_locktorture test which is currently
not upstream. However this patch fix the issue by make a additional
refcount between dlm_lowcomms_new_msg() and dlm_lowcomms_commit_msg().
In case of the race the kref_put() in dlm_lowcomms_commit_msg() will be
the final put.

Fixes: 2874d1a68c4e ("fs: dlm: add functionality to re-transmit a message")
Cc: stable@kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index a4e84e8d94c8..59f64c596233 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1336,6 +1336,8 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 		return NULL;
 	}
 
+	/* for dlm_lowcomms_commit_msg() */
+	kref_get(&msg->ref);
 	/* we assume if successful commit must called */
 	msg->idx = idx;
 	return msg;
@@ -1375,6 +1377,8 @@ void dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 {
 	_dlm_lowcomms_commit_msg(msg);
 	srcu_read_unlock(&connections_srcu, msg->idx);
+	/* because dlm_lowcomms_new_msg() */
+	kref_put(&msg->ref, dlm_msg_release);
 }
 #endif
 
-- 
2.31.1

