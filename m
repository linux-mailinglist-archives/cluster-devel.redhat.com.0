Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802C583224
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jul 2022 20:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658947027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QAib7LTVBKzoVMA7qISoSWyz4b6ZgkPd1LzNj+KG7lg=;
	b=AdDIi4MsR4JHxgBQEci242e0BHymLKs7uNpo21mv3tyfNzcDkIdIKjQO1KhfcC6iM/oPpL
	tQn5HA8R7pc8PvIE9EIe12asJiVaxRqotHobOLCq82E6gX8EUzXWD1DROVvPSiwhhZJztS
	mDhBBBnlWgHgiKfw5c/Ni3Vjh141OpE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-3S2SSIVFM7ikJbfJZ8hPnw-1; Wed, 27 Jul 2022 14:37:04 -0400
X-MC-Unique: 3S2SSIVFM7ikJbfJZ8hPnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23D1A3C0D196;
	Wed, 27 Jul 2022 18:37:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D36112026D07;
	Wed, 27 Jul 2022 18:37:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F4FE1945DAD;
	Wed, 27 Jul 2022 18:37:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0FE431945DA7 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Jul 2022 18:34:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E2E89404D883; Wed, 27 Jul 2022 18:34:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF6ED40C1288;
 Wed, 27 Jul 2022 18:34:28 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 27 Jul 2022 14:34:27 -0400
Message-Id: <20220727183427.1530561-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 1/1] fs: dlm: allow non-null
 sb_lvbptr for dlm_lock
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

I experience issues when putting a lkbsb on the stack and have sb_lvbptr
field to a dangled pointer while not using DLM_LKF_VALBLK. It will crash
with the following kernel message, the dangled pointer is here
0xdeadbeef as example:

[  102.749317] BUG: unable to handle page fault for address: 00000000deadbeef
[  102.749320] #PF: supervisor read access in kernel mode
[  102.749323] #PF: error_code(0x0000) - not-present page
[  102.749325] PGD 0 P4D 0
[  102.749332] Oops: 0000 [#1] PREEMPT SMP PTI
[  102.749336] CPU: 0 PID: 1567 Comm: lock_torture_wr Tainted: G        W         5.19.0-rc3+ #1565
[  102.749343] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.16.0-2.module+el8.7.0+15506+033991b0 04/01/2014
[  102.749344] RIP: 0010:memcpy_erms+0x6/0x10
[  102.749353] Code: cc cc cc cc eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 f3 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 <f3> a4 c3 0f 1f 80 00 00 00 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
[  102.749355] RSP: 0018:ffff97a58145fd08 EFLAGS: 00010202
[  102.749358] RAX: ffff901778b77070 RBX: 0000000000000000 RCX: 0000000000000040
[  102.749360] RDX: 0000000000000040 RSI: 00000000deadbeef RDI: ffff901778b77070
[  102.749362] RBP: ffff97a58145fd10 R08: ffff901760b67a70 R09: 0000000000000001
[  102.749364] R10: ffff9017008e2cb8 R11: 0000000000000001 R12: ffff901760b67a70
[  102.749366] R13: ffff901760b78f00 R14: 0000000000000003 R15: 0000000000000001
[  102.749368] FS:  0000000000000000(0000) GS:ffff901876e00000(0000) knlGS:0000000000000000
[  102.749372] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  102.749374] CR2: 00000000deadbeef CR3: 000000017c49a004 CR4: 0000000000770ef0
[  102.749376] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  102.749378] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  102.749379] PKRU: 55555554
[  102.749381] Call Trace:
[  102.749382]  <TASK>
[  102.749383]  ? send_args+0xb2/0xd0
[  102.749389]  send_common+0xb7/0xd0
[  102.749395]  _unlock_lock+0x2c/0x90
[  102.749400]  unlock_lock.isra.56+0x62/0xa0
[  102.749405]  dlm_unlock+0x21e/0x330
[  102.749411]  ? lock_torture_stats+0x80/0x80 [dlm_locktorture]
[  102.749416]  torture_unlock+0x5a/0x90 [dlm_locktorture]
[  102.749419]  ? preempt_count_sub+0xba/0x100
[  102.749427]  lock_torture_writer+0xbd/0x150 [dlm_locktorture]
[  102.786186]  kthread+0x10a/0x130
[  102.786581]  ? kthread_complete_and_exit+0x20/0x20
[  102.787156]  ret_from_fork+0x22/0x30
[  102.787588]  </TASK>
[  102.787855] Modules linked in: dlm_locktorture torture rpcsec_gss_krb5 intel_rapl_msr intel_rapl_common kvm_intel iTCO_wdt iTCO_vendor_support kvm vmw_vsock_virtio_transport qxl irqbypass vmw_vsock_virtio_transport_common drm_ttm_helper crc32_pclmul joydev crc32c_intel ttm vsock virtio_scsi virtio_balloon snd_pcm drm_kms_helper virtio_console snd_timer snd drm soundcore syscopyarea i2c_i801 sysfillrect sysimgblt i2c_smbus pcspkr fb_sys_fops lpc_ich serio_raw
[  102.792536] CR2: 00000000deadbeef
[  102.792930] ---[ end trace 0000000000000000 ]---

This patch fixes the issue by checking also on DLM_LKF_VALBLK on exflags
is set when copying the lvbptr array instead of if it's just null which
fixes for me the issue.

I think this patch can fix other dlm users as well, depending how they
handle the init, freeing memory handling of sb_lvbptr and don't set
DLM_LKF_VALBLK for some dlm_lock() calls. It might a there could be a
hidden issue all the time. However with checking on DLM_LKF_VALBLK the
user always need to provide a sb_lvbptr non-null value. There might be
more intelligent handling between per ls lvblen, DLM_LKF_VALBLK and
non-null to report the user the way how DLM API is used is wrong but can
be added for later, this will only fix the current behaviour.

Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 44c85930211d..078af3805a88 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3647,7 +3647,7 @@ static void send_args(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	case cpu_to_le32(DLM_MSG_REQUEST_REPLY):
 	case cpu_to_le32(DLM_MSG_CONVERT_REPLY):
 	case cpu_to_le32(DLM_MSG_GRANT):
-		if (!lkb->lkb_lvbptr)
+		if (!lkb->lkb_lvbptr || !(lkb->lkb_exflags & DLM_LKF_VALBLK))
 			break;
 		memcpy(ms->m_extra, lkb->lkb_lvbptr, r->res_ls->ls_lvblen);
 		break;
-- 
2.31.1

