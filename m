Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B66DC38799A
	for <lists+cluster-devel@lfdr.de>; Tue, 18 May 2021 15:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621343541;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WsTNrTcwb+wr2HWhooDL3BJJWE1kXSGM0D7/Nhzj6mA=;
	b=gQfpuNjElLrqP3vefCS13kGA5zQ17nZaRR86IJIfslIP+rUy6B8HdS8pYnqh3/PkxHzMQQ
	1CeqQdBoDtAfs21msNqp+sdfLyrtdlHyxrPnTD+k57hly3W5y5lymfy9PGdGYEKRAJbgBt
	4ULnx6iXvJqaVR0ITkMRstmvk7LisIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-SqC0qW7pNAi6MM8pfirJYA-1; Tue, 18 May 2021 09:12:20 -0400
X-MC-Unique: SqC0qW7pNAi6MM8pfirJYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C1C1883520;
	Tue, 18 May 2021 13:12:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76ED4BA6D;
	Tue, 18 May 2021 13:12:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 214A71801028;
	Tue, 18 May 2021 13:12:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14IDCBN4008827 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 May 2021 09:12:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1489B18BAA; Tue, 18 May 2021 13:12:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC875DEAD
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 13:12:11 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07BB155344
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 13:12:11 +0000 (UTC)
Date: Tue, 18 May 2021 09:12:10 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <16881786.28357200.1621343530958.JavaMail.zimbra@redhat.com>
In-Reply-To: <892198597.28357144.1621343494850.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.114, 10.4.195.24]
Thread-Topic: gfs2: fix scheduling while atomic bug in glocks
Thread-Index: jxH9vF5u67Cncw8a/o9ccatanDfDxQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [gfs2 patch] gfs2: fix scheduling while atomic bug
	in glocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Before this patch, in the unlikely event that gfs2_glock_dq encountered a
withdraw, it would do a wait_on_bit to wait for its journal to be
recovered, but it never released the glock's spin_lock, which caused a
scheduling-while-atomic error.

This patch unlocks the lockref spin_lock before waiting for recovery.

Fixes: 601ef0d52e961 ("gfs2: Force withdraw to replay journals and wait
for it to finish"
Reported-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 79f47f227e81..d7bee2ab5d2b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1471,9 +1471,11 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
 	    glock_blocked_by_withdraw(gl) &&
 	    gh->gh_gl != sdp->sd_jinode_gl) {
 		sdp->sd_glock_dqs_held++;
+		spin_unlock(&gl->gl_lockref.lock);
 		might_sleep();
 		wait_on_bit(&sdp->sd_flags, SDF_WITHDRAW_RECOVERY,
 			    TASK_UNINTERRUPTIBLE);
+		spin_lock(&gl->gl_lockref.lock);
 	}
 	if (gh->gh_flags & GL_NOCACHE)
 		handle_callback(gl, LM_ST_UNLOCKED, 0, false);

