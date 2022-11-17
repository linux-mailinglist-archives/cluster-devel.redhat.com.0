Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE862E7E9
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w4Afjvx+MbxlfFf8F1WckOPnGEClucvI+w9MEVzRfcg=;
	b=IYnfxNIOnozvfZopxyLAeS/otSVGQNGTd08LvcD+cI3wolm0f4D9ns9rGh9oCJeHRFud8j
	zESkVFSIpMv1HI6UmkEXvVJDZsqmNj9nKmAxLRqFLtGiU+hRR5kMzCdfffHkngXkzxBZxs
	hv8f4rQW9XMDG8FvSgTfK27Qz5vvPwU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-YT4wthVcPW6r1x1N1Etljg-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: YT4wthVcPW6r1x1N1Etljg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30B7E833AF7;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75E2A2166B29;
	Thu, 17 Nov 2022 22:12:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7906719465A8;
	Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29D4A1946595 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7AF02166B44; Thu, 17 Nov 2022 22:12:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F7EF2166B29;
 Thu, 17 Nov 2022 22:12:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:40 -0500
Message-Id: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 01/18] fs: dlm: avoid
 false-positive checker warning
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch avoid the false-positive checker warning about writing 112
bytes into a 88 bytes field "e->request", see:

[   54.891560] dlm: csmb1: dlm_recover_directory 23 out 2 messages
[   54.990542] ------------[ cut here ]------------
[   54.991012] memcpy: detected field-spanning write (size 112) of single field "&e->request" at fs/dlm/requestqueue.c:47 (size 88)
[   54.992150] WARNING: CPU: 0 PID: 297 at fs/dlm/requestqueue.c:47 dlm_add_requestqueue+0x177/0x180
[   54.993002] CPU: 0 PID: 297 Comm: kworker/u4:3 Not tainted 6.1.0-rc5-00008-ge01d50cbd6ee #248
[   54.993878] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-1.fc36 04/01/2014
[   54.994718] Workqueue: dlm_recv process_recv_sockets
[   54.995230] RIP: 0010:dlm_add_requestqueue+0x177/0x180
[   54.995731] Code: e7 01 0f 85 3b ff ff ff b9 58 00 00 00 48 c7 c2 c0 41 74 82 4c 89 ee 48 c7 c7 20 42 74 82 c6 05 8b 8d 30 02 01 e8 51 07 be 00 <0f> 0b e9 12 ff ff ff 66 90 0f 1f 44 00 00 41 57 48 8d 87 10 08 00
[   54.997483] RSP: 0018:ffffc90000b1fbe8 EFLAGS: 00010282
[   54.997990] RAX: 0000000000000000 RBX: ffff888024fc3d00 RCX: 0000000000000000
[   54.998667] RDX: 0000000000000001 RSI: ffffffff81155014 RDI: fffff52000163f73
[   54.999342] RBP: ffff88800dbac000 R08: 0000000000000001 R09: ffffc90000b1fa5f
[   54.999997] R10: fffff52000163f4b R11: 203a7970636d656d R12: ffff88800cfb0018
[   55.000673] R13: 0000000000000070 R14: ffff888024fc3d18 R15: 0000000000000000
[   55.001344] FS:  0000000000000000(0000) GS:ffff88806d600000(0000) knlGS:0000000000000000
[   55.002078] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   55.002603] CR2: 00007f35d4f0b9a0 CR3: 0000000025495002 CR4: 0000000000770ef0
[   55.003258] PKRU: 55555554
[   55.003514] Call Trace:
[   55.003756]  <TASK>
[   55.003953]  dlm_receive_buffer+0x1c0/0x200
[   55.004348]  dlm_process_incoming_buffer+0x46d/0x780
[   55.004786]  ? kernel_recvmsg+0x8b/0xc0
[   55.005150]  receive_from_sock.isra.0+0x168/0x420
[   55.005582]  ? process_listen_recv_socket+0x10/0x10
[   55.006018]  ? finish_task_switch.isra.0+0xe0/0x400
[   55.006469]  ? __switch_to+0x2fe/0x6a0
[   55.006808]  ? read_word_at_a_time+0xe/0x20
[   55.007197]  ? strscpy+0x146/0x190
[   55.007505]  process_one_work+0x3d0/0x6b0
[   55.007863]  worker_thread+0x8d/0x620
[   55.008209]  ? __kthread_parkme+0xd8/0xf0
[   55.008565]  ? process_one_work+0x6b0/0x6b0
[   55.008937]  kthread+0x171/0x1a0
[   55.009251]  ? kthread_exit+0x60/0x60
[   55.009582]  ret_from_fork+0x1f/0x30
[   55.009903]  </TASK>
[   55.010120] ---[ end trace 0000000000000000 ]---
[   55.025783] dlm: csmb1: dlm_recover 5 generation 3 done: 201 ms
[   55.026466] gfs2: fsid=smbcluster:csmb1.0: recover generation 3 done

It seems the checker is unable to detect the additional length bytes
which was allocated additionally for the flexible array in struct
dlm_message. To solve it we split the memcpy() into copy for the 88 bytes
struct and another memcpy() for the flexible array m_extra field.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/requestqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index 036a9a0078f6..8be2893ad15b 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -44,7 +44,8 @@ void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid, struct dlm_message *ms)
 
 	e->recover_seq = ls->ls_recover_seq & 0xFFFFFFFF;
 	e->nodeid = nodeid;
-	memcpy(&e->request, ms, le16_to_cpu(ms->m_header.h_length));
+	memcpy(&e->request, ms, sizeof(*ms));
+	memcpy(&e->request.m_extra, ms->m_extra, length);
 
 	atomic_inc(&ls->ls_requestqueue_cnt);
 	mutex_lock(&ls->ls_requestqueue_mutex);
-- 
2.31.1

