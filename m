Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1869D5F6B12
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Oct 2022 17:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665071793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IevJVIzEiNKkClM9+YN82cRbFzU3xZ4d/+MRae+VtQE=;
	b=XNb9RMDeXxHy0MPl6nsU5bgBOOX4U4Oktr9nxSIVuRQQ2kuyG1WtnPsrwi9C2ExEbyohQs
	z3bpu+fyOLAO0QlvIxJEkBQhHThu7cOlWpnz/ykMlNZbm9GsJmY0/7uP6nH6bMWJLq6xPM
	T/IGfNokxNBM8HOWQG+TAAWpeHlONVQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-HJGfkjdBNreT_v7lF0kwwg-1; Thu, 06 Oct 2022 11:56:22 -0400
X-MC-Unique: HJGfkjdBNreT_v7lF0kwwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FE7D857F90;
	Thu,  6 Oct 2022 15:56:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9EE940C94AD;
	Thu,  6 Oct 2022 15:56:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE5541946A43;
	Thu,  6 Oct 2022 15:56:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBC611946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Oct 2022 15:56:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEC7140FF658; Thu,  6 Oct 2022 15:56:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A90D740FF655;
 Thu,  6 Oct 2022 15:56:16 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  6 Oct 2022 11:56:05 -0400
Message-Id: <20221006155606.687350-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 1/2] fs: dlm: fix possible circular
 locking dependency
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes the following false positive circular locking
dependency:

[   61.272390] ======================================================
[   61.273416] WARNING: possible circular locking dependency detected
[   61.274474] 6.0.0+ #1949 Tainted: G        W
[   61.275318] ------------------------------------------------------
[   61.276336] umount/1205 is trying to acquire lock:
[   61.277135] ffffa17e7d1d2158 ((work_completion)(&con->rwork)){+.+.}-{0:0}, at: __flush_work+0x4d/0x4c0
[   61.278652]
               but task is already holding lock:
[   61.279615] ffffa17e07888c80 (&con->sock_mutex){+.+.}-{3:3}, at: close_connection+0x67/0x180
[   61.281005]
               which lock already depends on the new lock.

[   61.282375]
               the existing dependency chain (in reverse order) is:
[   61.283583]
               -> #1 (&con->sock_mutex){+.+.}-{3:3}:
[   61.284595]        lock_acquire+0xd3/0x300
[   61.285280]        __mutex_lock+0x99/0x1040
[   61.285955]        mutex_lock_nested+0x1b/0x30
[   61.286679]        receive_from_sock+0x40/0x350
[   61.287449]        process_recv_sockets+0x15/0x20
[   61.288249]        process_one_work+0x286/0x5f0
[   61.288989]        worker_thread+0x44/0x390
[   61.289674]        kthread+0x107/0x130
[   61.290310]        ret_from_fork+0x1f/0x30
[   61.291006]
               -> #0 ((work_completion)(&con->rwork)){+.+.}-{0:0}:
[   61.292215]        check_prevs_add+0x18b/0x1040
[   61.292980]        __lock_acquire+0x11ec/0x1630
[   61.293721]        lock_acquire+0xd3/0x300
[   61.294403]        __flush_work+0x6d/0x4c0
[   61.295076]        __cancel_work_timer+0x156/0x1e0
[   61.295855]        cancel_work_sync+0x10/0x20
[   61.296581]        close_connection+0x12a/0x180
[   61.297338]        close_connection+0x150/0x180
[   61.298071]        free_conn+0x21/0xc0
[   61.298682]        foreach_conn+0x49/0x70
[   61.299347]        dlm_lowcomms_stop+0x75/0xf0
[   61.300071]        dlm_release_lockspace+0x3fa/0x520
[   61.300884]        gdlm_unmount+0x64/0x90
[   61.301544]        gfs2_lm_unmount+0x37/0x50
[   61.302262]        gfs2_put_super+0x193/0x220
[   61.303002]        generic_shutdown_super+0x77/0x130
[   61.303843]        kill_block_super+0x27/0x50
[   61.304567]        gfs2_kill_sb+0x68/0x80
[   61.305254]        deactivate_locked_super+0x32/0x80
[   61.306054]        deactivate_super+0x59/0x60
[   61.306760]        cleanup_mnt+0xbd/0x150
[   61.307431]        __cleanup_mnt+0x12/0x20
[   61.308109]        task_work_run+0x6f/0xc0
[   61.308768]        exit_to_user_mode_prepare+0x1c4/0x1d0
[   61.309633]        syscall_exit_to_user_mode+0x1d/0x50
[   61.310469]        do_syscall_64+0x46/0x90
[   61.311139]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   61.312036]
               other info that might help us debug this:

[   61.313328]  Possible unsafe locking scenario:

[   61.314316]        CPU0                    CPU1
[   61.315077]        ----                    ----
[   61.315814]   lock(&con->sock_mutex);
[   61.316432]                                lock((work_completion)(&con->rwork));
[   61.317621]                                lock(&con->sock_mutex);
[   61.318628]   lock((work_completion)(&con->rwork));
[   61.319445]
                *** DEADLOCK ***

It is about the case of having an "other connection" because a race when
dlm start communicating with another node. If the race happens we have
two sockets for the specific communication whereas one is for sending
the other one for receiving. However lockdep things that there is a lock
dependency because it cannot differ the locks from each connection. This
patch calls the second close_connection() as shown in the stacktrace
when the sock_mutex is not held for the "sending" connection. It should
not matter if sock_mutex is held when othercon is being set.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 59f64c596233..f6078980bc03 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -802,14 +802,14 @@ static void close_connection(struct connection *con, bool and_other,
 		clear_bit(CF_READ_PENDING, &con->flags);
 	}
 
-	mutex_lock(&con->sock_mutex);
-	dlm_close_sock(&con->sock);
-
 	if (con->othercon && and_other) {
 		/* Will only re-enter once. */
 		close_connection(con->othercon, false, tx, rx);
 	}
 
+	mutex_lock(&con->sock_mutex);
+	dlm_close_sock(&con->sock);
+
 	/* if we send a writequeue entry only a half way, we drop the
 	 * whole entry because reconnection and that we not start of the
 	 * middle of a msg which will confuse the other end.
-- 
2.31.1

