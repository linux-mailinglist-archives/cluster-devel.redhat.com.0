Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74A69E9A1
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Feb 2023 22:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677015643;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l1Z4+lV4uJiVwFmMjEvWMuCkFkH+VgF5wsbqDMp7c/Y=;
	b=CH8E090hlZ0q1o9Ute6j0aqbvszdfCYThYElRwIKqZwOhWNLRZV/AZaf1MqIYh1OPmlZLm
	KMue3Y1hBHJEFhZXOFYJfkMnNS4nuru5F2PShqytJdl9stro9nVUySFEzbSNj5ybDvcXzj
	aI4dG6yxibK6R9Vm2/qVx0Oz4zRAvVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-Wu1mgnTWOu-gVZTMFR6SfA-1; Tue, 21 Feb 2023 16:40:39 -0500
X-MC-Unique: Wu1mgnTWOu-gVZTMFR6SfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 294D2802D2E;
	Tue, 21 Feb 2023 21:40:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 838C9440D9;
	Tue, 21 Feb 2023 21:40:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5480C19465B1;
	Tue, 21 Feb 2023 21:40:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AB76F1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8FE46440DD; Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC3F440D9;
 Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 21 Feb 2023 16:40:10 -0500
Message-Id: <20230221214014.871804-3-aahringo@redhat.com>
In-Reply-To: <20230221214014.871804-1-aahringo@redhat.com>
References: <20230221214014.871804-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm/next 2/6] DLM: increase socket backlog
 to avoid hangs with 16 nodes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

On a 16 node virtual cluster with e1000 NICs joining the 12th node prints
SYN flood warnings for the DLM port:
Dec 21 01:46:41 localhost kernel: [ 2146.516664] TCP: request_sock_TCP: Possible SYN flooding on port 21064. Sending cookies.  Check SNMP counters.

And then joining a DLM lockspace hangs:
```
Dec 21 01:49:00 localhost kernel: [ 2285.780913] INFO: task xapi-clusterd:17638 blocked for more than 120 seconds.
Dec 21 01:49:00 localhost kernel: [ 2285.786476]       Not tainted 4.4.0+10 #1
Dec 21 01:49:00 localhost kernel: [ 2285.789043] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Dec 21 01:49:00 localhost kernel: [ 2285.794611] xapi-clusterd   D ffff88001930bc58     0 17638      1 0x00000000
Dec 21 01:49:00 localhost kernel: [ 2285.794615]  ffff88001930bc58 ffff880025593800 ffff880022433800 ffff88001930c000
Dec 21 01:49:00 localhost kernel: [ 2285.794617]  ffff88000ef4a660 ffff88000ef4a658 ffff880022433800 ffff88000ef4a000
Dec 21 01:49:00 localhost kernel: [ 2285.794619]  ffff88001930bc70 ffffffff8159f6b4 7fffffffffffffff ffff88001930bd10
Dec 21 01:49:00 localhost kernel: [ 2285.794644]  [<ffffffff811570fe>] ? printk+0x4d/0x4f
Dec 21 01:49:00 localhost kernel: [ 2285.794647]  [<ffffffff810b1741>] ? __raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Dec 21 01:49:00 localhost kernel: [ 2285.794649]  [<ffffffff815a085d>] wait_for_completion+0x9d/0x110
Dec 21 01:49:00 localhost kernel: [ 2285.794653]  [<ffffffff810979e0>] ? wake_up_q+0x80/0x80
Dec 21 01:49:00 localhost kernel: [ 2285.794661]  [<ffffffffa03fa4b8>] dlm_new_lockspace+0x908/0xac0 [dlm]
Dec 21 01:49:00 localhost kernel: [ 2285.794665]  [<ffffffff810aaa60>] ? prepare_to_wait_event+0x100/0x100
Dec 21 01:49:00 localhost kernel: [ 2285.794670]  [<ffffffffa0402e37>] device_write+0x497/0x6b0 [dlm]
Dec 21 01:49:00 localhost kernel: [ 2285.794673]  [<ffffffff811834f0>] ? handle_mm_fault+0x7f0/0x13b0
Dec 21 01:49:00 localhost kernel: [ 2285.794677]  [<ffffffff811b4438>] __vfs_write+0x28/0xd0
Dec 21 01:49:00 localhost kernel: [ 2285.794679]  [<ffffffff811b4b7f>] ? rw_verify_area+0x6f/0xd0
Dec 21 01:49:00 localhost kernel: [ 2285.794681]  [<ffffffff811b4dc1>] vfs_write+0xb1/0x190
Dec 21 01:49:00 localhost kernel: [ 2285.794686]  [<ffffffff8105ffc2>] ? __do_page_fault+0x302/0x420
Dec 21 01:49:00 localhost kernel: [ 2285.794688]  [<ffffffff811b5986>] SyS_write+0x46/0xa0
Dec 21 01:49:00 localhost kernel: [ 2285.794690]  [<ffffffff815a31ae>] entry_SYSCALL_64_fastpath+0x12/0x71
```

The previous limit of 5 seems like an arbitrary number, that doesn't match any
known DLM cluster size upper bound limit.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Cc: Christine Caulfield <ccaulfie@redhat.com>
Cc: David Teigland <teigland@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 07b9221dcae3..577aa9c87d30 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1809,7 +1809,7 @@ static int dlm_listen_for_all(void)
 	sock->sk->sk_data_ready = lowcomms_listen_data_ready;
 	release_sock(sock->sk);
 
-	result = sock->ops->listen(sock, 5);
+	result = sock->ops->listen(sock, 128);
 	if (result < 0) {
 		dlm_close_sock(&listen_con.sock);
 		return result;
-- 
2.31.1

