Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC45F8EAD
	for <lists+cluster-devel@lfdr.de>; Sun,  9 Oct 2022 23:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665349352;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lpTNMLMLVv+Bp1aSFZuOq2FR3KGfP7Npncm0I3IzXxc=;
	b=Hahmg57BMb1E8Y2UW/LVvSzy3iEzYxhzCwDG5cx1a4ZVSKa3tuuLiCf7cB4j0U9g91PMjx
	7hxMks9xw/rb8dTmD25dPNGsr0575j4z9EfnqRZFGu4rMIMnCtnR7VyRneanu9AoOshPzZ
	XPGot8KBplsxuSLt6X+P0CGLtHnNG/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-vjJ8suW6O4C77nb5PCs4YA-1; Sun, 09 Oct 2022 17:02:27 -0400
X-MC-Unique: vjJ8suW6O4C77nb5PCs4YA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3FAF811E81;
	Sun,  9 Oct 2022 21:02:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8F50200BA7E;
	Sun,  9 Oct 2022 21:02:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 81AFC1946A49;
	Sun,  9 Oct 2022 21:02:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B0AD3194658C for <cluster-devel@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 21:02:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A475A112D166; Sun,  9 Oct 2022 21:02:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CEBA112D164
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 21:02:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F4AF29AB3FE
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 21:02:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-4uq9SIpSM1GEFR7gBKwefA-1; Sun, 09 Oct 2022 17:02:21 -0400
X-MC-Unique: 4uq9SIpSM1GEFR7gBKwefA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E92360C9B;
 Sun,  9 Oct 2022 20:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF452C433D6;
 Sun,  9 Oct 2022 20:53:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun,  9 Oct 2022 16:52:54 -0400
Message-Id: <20221009205308.1202627-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH AUTOSEL 5.15 01/15] fs: dlm: fix race in
 lowcomms
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
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 30ea3257e8766027c4d8d609dcbd256ff9a76073 ]

This patch fixes a race between queue_work() in
_dlm_lowcomms_commit_msg() and srcu_read_unlock(). The queue_work() can
take the final reference of a dlm_msg and so msg->idx can contain
garbage which is signaled by the following warning:

[  676.237050] ------------[ cut here ]------------
[  676.237052] WARNING: CPU: 0 PID: 1060 at include/linux/srcu.h:189 dlm_lo=
wcomms_commit_msg+0x41/0x50
[  676.238945] Modules linked in: dlm_locktorture torture rpcsec_gss_krb5 i=
ntel_rapl_msr intel_rapl_common iTCO_wdt iTCO_vendor_support qxl kvm_intel =
drm_ttm_helper vmw_vsock_virtio_transport kvm vmw_vsock_virtio_transport_co=
mmon ttm irqbypass crc32_pclmul joydev crc32c_intel serio_raw drm_kms_helpe=
r vsock virtio_scsi virtio_console virtio_balloon snd_pcm drm syscopyarea s=
ysfillrect sysimgblt snd_timer fb_sys_fops i2c_i801 lpc_ich snd i2c_smbus s=
oundcore pcspkr
[  676.244227] CPU: 0 PID: 1060 Comm: lock_torture_wr Not tainted 5.19.0-rc=
3+ #1546
[  676.245216] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.16.0-2.module+el8=
.7.0+15506+033991b0 04/01/2014
[  676.246460] RIP: 0010:dlm_lowcomms_commit_msg+0x41/0x50
[  676.247132] Code: fe ff ff ff 75 24 48 c7 c6 bd 0f 49 bb 48 c7 c7 38 7c =
01 bd e8 00 e7 ca ff 89 de 48 c7 c7 60 78 01 bd e8 42 3d cd ff 5b 5d c3 <0f=
> 0b eb d8 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48
[  676.249253] RSP: 0018:ffffa401c18ffc68 EFLAGS: 00010282
[  676.249855] RAX: 0000000000000001 RBX: 00000000ffff8b76 RCX: 00000000000=
00006
[  676.250713] RDX: 0000000000000000 RSI: ffffffffbccf3a10 RDI: ffffffffbcc=
7b62e
[  676.251610] RBP: ffffa401c18ffc70 R08: 0000000000000001 R09: 00000000000=
00001
[  676.252481] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00005
[  676.253421] R13: ffff8b76786ec370 R14: ffff8b76786ec370 R15: ffff8b76786=
ec480
[  676.254257] FS:  0000000000000000(0000) GS:ffff8b7777800000(0000) knlGS:=
0000000000000000
[  676.255239] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  676.255897] CR2: 00005590205d88b8 CR3: 000000017656c003 CR4: 00000000007=
70ee0
[  676.256734] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[  676.257567] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
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
[  676.267824] hardirqs last  enabled at (9579863): [<ffffffffbb14e6f8>] __=
up_console_sem+0x58/0x60
[  676.268896] hardirqs last disabled at (9579872): [<ffffffffbb14e6dd>] __=
up_console_sem+0x3d/0x60
[  676.270008] softirqs last  enabled at (9579798): [<ffffffffbc200349>] __=
do_softirq+0x349/0x4c7
[  676.271438] softirqs last disabled at (9579897): [<ffffffffbb0d54c0>] ir=
q_exit_rcu+0xb0/0xf0
[  676.272796] ---[ end trace 0000000000000000 ]---

I reproduced this warning with dlm_locktorture test which is currently
not upstream. However this patch fix the issue by make a additional
refcount between dlm_lowcomms_new_msg() and dlm_lowcomms_commit_msg().
In case of the race the kref_put() in dlm_lowcomms_commit_msg() will be
the final put.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/lowcomms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b11f695261f5..9d7078a1dc8b 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1319,6 +1319,8 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int =
len, gfp_t allocation,
 =09=09return NULL;
 =09}
=20
+=09/* for dlm_lowcomms_commit_msg() */
+=09kref_get(&msg->ref);
 =09/* we assume if successful commit must called */
 =09msg->idx =3D idx;
 =09return msg;
@@ -1353,6 +1355,8 @@ void dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 {
 =09_dlm_lowcomms_commit_msg(msg);
 =09srcu_read_unlock(&connections_srcu, msg->idx);
+=09/* because dlm_lowcomms_new_msg() */
+=09kref_put(&msg->ref, dlm_msg_release);
 }
=20
 void dlm_lowcomms_put_msg(struct dlm_msg *msg)
--=20
2.35.1

