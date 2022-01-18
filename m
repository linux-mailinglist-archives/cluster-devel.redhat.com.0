Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A062E491753
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Jan 2022 03:40:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-6aTQf3MJO2-icJwmmc73zg-1; Mon, 17 Jan 2022 21:40:32 -0500
X-MC-Unique: 6aTQf3MJO2-icJwmmc73zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C4031083F60;
	Tue, 18 Jan 2022 02:40:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC13512E22;
	Tue, 18 Jan 2022 02:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DF924BB7C;
	Tue, 18 Jan 2022 02:40:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20I2cmHM025388 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 21:38:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 58923400E132; Tue, 18 Jan 2022 02:38:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54AD5400F3FF
	for <cluster-devel@redhat.com>; Tue, 18 Jan 2022 02:38:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B6FA3C1D8B1
	for <cluster-devel@redhat.com>; Tue, 18 Jan 2022 02:38:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-315-80NKmKIqOxOKsqaitXgslQ-1; Mon, 17 Jan 2022 21:38:44 -0500
X-MC-Unique: 80NKmKIqOxOKsqaitXgslQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 901D3611F1;
	Tue, 18 Jan 2022 02:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38170C36AEB;
	Tue, 18 Jan 2022 02:32:02 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 17 Jan 2022 21:28:49 -0500
Message-Id: <20220118023152.1948105-5-sashal@kernel.org>
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20I2cmHM025388
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.15 005/188] fs: dlm: filter user
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 6c2e3bf68f3e5e5a647aa52be246d5f552d7496d ]

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
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/lock.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c502c065d0075..28d1f35b11a4d 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3973,6 +3973,14 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
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
@@ -4001,6 +4009,7 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 		error = -EINVAL;
 	}
 
+out:
 	if (error)
 		log_error(lkb->lkb_resource->res_ls,
 			  "ignore invalid message %d from %d %x %x %x %d",
-- 
2.34.1


