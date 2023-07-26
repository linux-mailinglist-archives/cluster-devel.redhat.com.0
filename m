Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0427763EA1
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 20:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690396570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=STCJdkDEVG2S3alSvEWF/EZt+bAAx1dSkJI3ODCQk6c=;
	b=B2UcdSmUSaRWh/IxakXhKcivQoECALA6p62K+HYdEQxiDTRFXl5EaTb1CDokzz1wUyzFU0
	x6QbQlrG13xliwSu5mySxUzWLlHtVDqkpy7RpJspDGCmC56i2Md4HuDHoHPwpvFQwC6uEy
	D610ekDFcYo8PVmq4Iv+iSjd8qHyvQ8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-nfLho9ewOnqwLc_9jZ6HBg-1; Wed, 26 Jul 2023 14:36:09 -0400
X-MC-Unique: nfLho9ewOnqwLc_9jZ6HBg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F8873C0C492;
	Wed, 26 Jul 2023 18:36:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A2BF46A3A9;
	Wed, 26 Jul 2023 18:36:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C2A3F1946A78;
	Wed, 26 Jul 2023 18:36:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25ED71946A6C for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 17:01:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F3652200B41D; Wed, 26 Jul 2023 17:01:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.22.32.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB802200BA74
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 17:01:08 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 26 Jul 2023 12:01:08 -0500
Message-ID: <20230726170108.389793-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH] gfs2: conversion deadlock do_promote bypass
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

I know the description is vague or hard to grasp, but it's hard to be
succinct for this problem.

In this case the failing scenario is this:
1. We have a glock in the SH state
2. A process requests an asychronous lock of the glock in EX mode.
   (rename)
3. Before the lock is granted, more processes (read / ls) request the
   glock in SH again.
4. gfs2 sends a request to DLM for the lock in EX because that holder is
   at the top of the queue.
5. Somehow the dlm request gets canceled, so dlm sends us back a
   response with state==SH and LM_OUT_CANCELED.
6. finish_xmote gets called to process the response from dlm. It detects
   the glock is not in the requested mode, and demote is not in progress
   so it goes through this codepath:
	if (unlikely(state != gl->gl_target)) {
		if (gh && !test_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags)) {
			if (ret & LM_OUT_CANCELED) {
   At this point, finish_xmote cannot grant the canceled EX holder, but
   the glock is still in SH mode.
7. Before this patch, finish_xmote moves the holder to the end of the
   queue and finds the next holder, which is for SH. Then it does:
				gl->gl_target = gh->gh_state;
				goto retry;
The retry calls do_xmote, which detects the requested state (SH) is equal
to the current state, and does:
	GLOCK_BUG_ON(gl, gl->gl_state == gl->gl_target);
To do_xmote, it is invalid to transition a glock to the existing state.

This patch adds a check for the next holder wanting the state the glock
is already in, and if that's the case, it doesn't need to call do_xmote
at all. It can simply call do_promote and promote the holders needing
the glock in the existing state. The patch adds a goto promote which
jumps to the end of finish_xmote where it calls do_promote.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1438e7465e30..d1e1fd786417 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -595,6 +595,8 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 					list_move_tail(&gh->gh_list, &gl->gl_holders);
 				gh = find_first_waiter(gl);
 				gl->gl_target = gh->gh_state;
+				if (gl->gl_state == gl->gl_target)
+					goto promote;
 				goto retry;
 			}
 			/* Some error or failed "try lock" - report it */
@@ -640,6 +642,7 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 				goto out;
 			}
 		}
+promote:
 		do_promote(gl);
 	}
 out:
-- 
2.41.0

