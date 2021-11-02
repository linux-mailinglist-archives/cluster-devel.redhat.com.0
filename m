Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C7443665
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880694;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HPF4knoa3k/5e3Jeo3SwVCjGQfEX031iaaSlsMf5CXI=;
	b=SMfMVSZQeMX1Q8l1CstVPEFXi6FxM0CdwL6l4YIsDPkhAWa4izCHIQdlhFgssprgUoDhMa
	SMnmD5WFy8BcYPg+sOnyqURnM/d10onXenFt2aPBpJ/x0XDn/JH8fv5gb9FWhjIhSLX1TV
	8rknklkxXyVSqAp0EaPTqudE1LXTvZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-pjePL6S5MxS5quCO3ubP2w-1; Tue, 02 Nov 2021 15:18:11 -0400
X-MC-Unique: pjePL6S5MxS5quCO3ubP2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F01FF10A8E0C;
	Tue,  2 Nov 2021 19:18:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3366104A9C1;
	Tue,  2 Nov 2021 19:18:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06A0B4EA30;
	Tue,  2 Nov 2021 19:18:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JI1AF020842 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:18:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A30857CAB; Tue,  2 Nov 2021 19:18:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0ABA357CD3;
	Tue,  2 Nov 2021 19:18:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:24 -0400
Message-Id: <20211102191724.210095-19-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 18/18] fs: dlm: filter user
	dlm messages for kernel locks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes the following crash by receiving a invalid message:

[  160.672220] ==================================================================
[  160.676206] BUG: KASAN: user-memory-access in dlm_user_add_ast+0xc3/0x370
[  160.679659] Read of size 8 at addr 00000000deadbeef by task kworker/u32:13/319
[  160.681447]
[  160.681824] CPU: 10 PID: 319 Comm: kworker/u32:13 Not tainted 5.14.0-rc2+ #399
[  160.683472] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.14.0-1.module+el8.6.0+12648+6ede71a5 04/01/2014
[  160.685574] Workqueue: dlm_recv process_recv_sockets
[  160.686721] Call Trace:
[  160.687310]  dump_stack_lvl+0x56/0x6f
[  160.688169]  ? dlm_user_add_ast+0xc3/0x370
[  160.689116]  kasan_report.cold.14+0x116/0x11b
[  160.690138]  ? dlm_user_add_ast+0xc3/0x370
[  160.690832]  dlm_user_add_ast+0xc3/0x370
[  160.691502]  _receive_unlock_reply+0x103/0x170
[  160.692241]  _receive_message+0x11df/0x1ec0
[  160.692926]  ? rcu_read_lock_sched_held+0xa1/0xd0
[  160.693700]  ? rcu_read_lock_bh_held+0xb0/0xb0
[  160.694427]  ? lock_acquire+0x175/0x400
[  160.695058]  ? do_purge.isra.51+0x200/0x200
[  160.695744]  ? lock_acquired+0x360/0x5d0
[  160.696400]  ? lock_contended+0x6a0/0x6a0
[  160.697055]  ? lock_release+0x21d/0x5e0
[  160.697686]  ? lock_is_held_type+0xe0/0x110
[  160.698352]  ? lock_is_held_type+0xe0/0x110
[  160.699026]  ? ___might_sleep+0x1cc/0x1e0
[  160.699698]  ? dlm_wait_requestqueue+0x94/0x140
[  160.700451]  ? dlm_process_requestqueue+0x240/0x240
[  160.701249]  ? down_write_killable+0x2b0/0x2b0
[  160.701988]  ? do_raw_spin_unlock+0xa2/0x130
[  160.702690]  dlm_receive_buffer+0x1a5/0x210
[  160.703385]  dlm_process_incoming_buffer+0x726/0x9f0
[  160.704210]  receive_from_sock+0x1c0/0x3b0
[  160.704886]  ? dlm_tcp_shutdown+0x30/0x30
[  160.705561]  ? lock_acquire+0x175/0x400
[  160.706197]  ? rcu_read_lock_sched_held+0xa1/0xd0
[  160.706941]  ? rcu_read_lock_bh_held+0xb0/0xb0
[  160.707681]  process_recv_sockets+0x32/0x40
[  160.708366]  process_one_work+0x55e/0xad0
[  160.709045]  ? pwq_dec_nr_in_flight+0x110/0x110
[  160.709820]  worker_thread+0x65/0x5e0
[  160.710423]  ? process_one_work+0xad0/0xad0
[  160.711087]  kthread+0x1ed/0x220
[  160.711628]  ? set_kthread_struct+0x80/0x80
[  160.712314]  ret_from_fork+0x22/0x30

The issue is that we received a DLM message for a user lock but the
destination lock is a kernel lock. Note that the address which is trying
to derefence is 00000000deadbeef, which is in a kernel lock
lkb->lkb_astparam, this field should never be derefenced by the DLM
kernel stack. In case of a user lock lkb->lkb_astparam is lkb->lkb_ua
(memory is shared by a union field). The struct lkb_ua will be handled
by the DLM kernel stack but on a kernel lock it will contain invalid
data and ends in most likely crashing the kernel.

It can be reproduced with two cluster nodes.

node 2:
dlm_tool join test
echo "862 fooobaar 1 2 1" > /sys/kernel/debug/dlm/test_locks
echo "862 3 1" > /sys/kernel/debug/dlm/test_waiters

node 1:
dlm_tool join test

python:
foo = DLM(h_cmd=3, o_nextcmd=1, h_nodeid=1, h_lockspace=0x77222027, \
          m_type=7, m_flags=0x1, m_remid=0x862, m_result=0xFFFEFFFE)
newFile = open("/sys/kernel/debug/dlm/comms/2/rawmsg", "wb")
newFile.write(bytes(foo))

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 0dbe273566c0..54705d367076 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3989,6 +3989,14 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	int from = ms->m_header.h_nodeid;
 	int error = 0;
 
+	/* currently mixing of user/kernel locks are not supported */
+	if (ms->m_flags & DLM_IFL_USER && ~lkb->lkb_flags & DLM_IFL_USER) {
+		log_error(lkb->lkb_resource->res_ls,
+			  "got user dlm message for a kernel lock");
+		error = -EINVAL;
+		goto out;
+	}
+
 	switch (ms->m_type) {
 	case DLM_MSG_CONVERT:
 	case DLM_MSG_UNLOCK:
@@ -4017,6 +4025,7 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 		error = -EINVAL;
 	}
 
+out:
 	if (error)
 		log_error(lkb->lkb_resource->res_ls,
 			  "ignore invalid message %d from %d %x %x %x %d",
-- 
2.27.0

