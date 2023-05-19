Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F46709B2D
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 17:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684509696;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=69xY3Y/BguJT9rPxZeZj/wxsVAUQXBLCe0yLxAe0wto=;
	b=AL2QZPo3BnGTe1dI7VBUk6CSBnaQmlU4UB3iHLg9jPWOxbsuU2HZ4lvHjny+jROet+JLI9
	iPPjglQKUKpy1gaagZAG6Ga6pAVlnvc2nawQDdOFiBGFqL3jJhhGRuEnrPzuYVPqw9AB19
	XS/B6yCgt4m3yzRDcepJeJ/Fz9oxw6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-_mEB0oxxPl2syHmst77jsw-1; Fri, 19 May 2023 11:21:33 -0400
X-MC-Unique: _mEB0oxxPl2syHmst77jsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E0BB80013A;
	Fri, 19 May 2023 15:21:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33B54C0004B;
	Fri, 19 May 2023 15:21:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EBDD519465B7;
	Fri, 19 May 2023 15:21:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD44F19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 15:21:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1F1F4F2DE2; Fri, 19 May 2023 15:21:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72D9B4F2DE0;
 Fri, 19 May 2023 15:21:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 19 May 2023 11:21:26 -0400
Message-Id: <20230519152128.65272-3-aahringo@redhat.com>
In-Reply-To: <20230519152128.65272-1-aahringo@redhat.com>
References: <20230519152128.65272-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v6.4-rc2 3/5] fs: dlm: switch posix lock to
 killable only
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will revert commit a6b1533e9a57 ("dlm: make posix locks
interruptible"). It was probably introduced to reach the fcntl()
F_SETLKW requirement to make fcntl() calls interruptible, see:

"F_SETLKW (struct flock *):

 As for F_SETLK, but if a conflicting lock is held on the file,
 then wait for that lock to be released. If a signal is caught
 while waiting, then the call is interrupted and (after the signal
 handler has returned) returns immediately (with return value -1
 and errno set to EINTR; see signal(7))."

This requires to interrupt the current plock operation in question
sitting in the wait_event_interruptible() waiting for op->done becomes
true. This isn't currently the case as do_unlock_close() will act like
the process was killed as it unlocks all previously acquired locks which
can occur into data corruption because the process still thinks it has
the previously acquired locks still acquired.

To test this behaviour a ltp testcase was created [0]. After this patch
the process can't be interrupted anymore which is against the API
but considered currently as a limitation of DLM. However it will stop to
unlock all previously acquired locks and the user process isn't aware of
it.

It requires more work in DLM to support such feature as intended. It
requires some lock request cancellation request which does not yet
exists for dlm plock user space communication. As this feature never
worked as intended and have side effects as mentioned aboe this patch moves
the wait to killable again.

[0] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/testcases/kernel/syscalls/fcntl/fcntl42.c

Cc: stable@vger.kernel.org
Fixes: a6b1533e9a57 ("dlm: make posix locks interruptible")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index fea2157fac5b..31bc601ee3d8 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -155,7 +155,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 
 	send_op(op);
 
-	rv = wait_event_interruptible(recv_wq, (op->done != 0));
+	rv = wait_event_killable(recv_wq, (op->done != 0));
 	if (rv == -ERESTARTSYS) {
 		spin_lock(&ops_lock);
 		/* recheck under ops_lock if we got a done != 0,
-- 
2.31.1

