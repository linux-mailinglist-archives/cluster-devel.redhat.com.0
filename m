Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C8CF21DE9F0
	for <lists+cluster-devel@lfdr.de>; Fri, 22 May 2020 16:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590159105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y7PAVsm2WvfUZCpVXXtbYvxwrEVoFQKiNS027mScuYE=;
	b=McetgZHmW79f2BDA2SMdhvB6xhF28iTGRcMMq3ZzRCkqUP2naXpRgo2wP6dVyDBXXI4WED
	6U0nIMIvGAHPOwFtGqpdWmJdW64UkYmvDZNH3cRUWF7X7F9C5q/g2b1BcOxodXzgyftIws
	7Db5fAx7kvhljFmgvMy02dAdS8fAXVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-v5idetLfMnm5sJhbcXdXPQ-1; Fri, 22 May 2020 10:51:43 -0400
X-MC-Unique: v5idetLfMnm5sJhbcXdXPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BE29872FE4;
	Fri, 22 May 2020 14:51:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA147959A;
	Fri, 22 May 2020 14:51:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47D1D54D0D;
	Fri, 22 May 2020 14:51:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MEpdQe009221 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 10:51:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 433FC2028DCC; Fri, 22 May 2020 14:51:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F2D72028CD2
	for <cluster-devel@redhat.com>; Fri, 22 May 2020 14:51:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 240B680028C
	for <cluster-devel@redhat.com>; Fri, 22 May 2020 14:51:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-483-5DzFiMcSMViiy100N6aFuQ-1;
	Fri, 22 May 2020 10:51:34 -0400
X-MC-Unique: 5DzFiMcSMViiy100N6aFuQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 77D5A22409;
	Fri, 22 May 2020 14:51:32 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 22 May 2020 10:51:12 -0400
Message-Id: <20200522145120.434921-11-sashal@kernel.org>
In-Reply-To: <20200522145120.434921-1-sashal@kernel.org>
References: <20200522145120.434921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04MEpdQe009221
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.19 11/19] Revert "gfs2: Don't
	demote a glock until its revokes are written"
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit b14c94908b1b884276a6608dea3d0b1b510338b7 ]

This reverts commit df5db5f9ee112e76b5202fbc331f990a0fc316d6.

This patch fixes a regression: patch df5db5f9ee112 allowed function
run_queue() to bypass its call to do_xmote() if revokes were queued for
the glock. That's wrong because its call to do_xmote() is what is
responsible for calling the go_sync() glops functions to sync both
the ail list and any revokes queued for it. By bypassing the call,
gfs2 could get into a stand-off where the glock could not be demoted
until its revokes are written back, but the revokes would not be
written back because do_xmote() was never called.

It "sort of" works, however, because there are other mechanisms like
the log flush daemon (logd) that can sync the ail items and revokes,
if it deems it necessary. The problem is: without file system pressure,
it might never deem it necessary.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index f8a5eef3d014..ccdd8c821abd 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -636,9 +636,6 @@ __acquires(&gl->gl_lockref.lock)
 			goto out_unlock;
 		if (nonblock)
 			goto out_sched;
-		smp_mb();
-		if (atomic_read(&gl->gl_revokes) != 0)
-			goto out_sched;
 		set_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags);
 		GLOCK_BUG_ON(gl, gl->gl_demote_state == LM_ST_EXCLUSIVE);
 		gl->gl_target = gl->gl_demote_state;
-- 
2.25.1


