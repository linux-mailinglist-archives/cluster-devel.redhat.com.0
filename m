Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9C775EF2
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 14:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691584137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NsqPZxz3hxmg4qRsdHF7o2l2SGRNDOnIiLEsUC7K4Uc=;
	b=RVu0qkPkVkymduXB8l/Vk95wGCK11JwxCPocaGyrpTKDQhJyFAWdl+bJYMOWbDgXtgh757
	nhqa5oP9CqTYfudt/Q9h39MbpjpfN1V9DcEFYIBf40V1bkT8z8CsDbYEU3h7yr9lPnDOcA
	Q+Yh9/DbDmLuTm7crrpMLne5e+Ra2tk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-V7f5OH3mPXiltwTvfGNhkw-1; Wed, 09 Aug 2023 08:28:54 -0400
X-MC-Unique: V7f5OH3mPXiltwTvfGNhkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 340692A59546;
	Wed,  9 Aug 2023 12:28:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28C5740C6F4E;
	Wed,  9 Aug 2023 12:28:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC73B1946594;
	Wed,  9 Aug 2023 12:28:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E476C1946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 12:11:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C4AB21121318; Wed,  9 Aug 2023 12:11:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 474601121315;
 Wed,  9 Aug 2023 12:11:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  9 Aug 2023 14:11:26 +0200
Message-Id: <20230809121127.1754804-2-agruenba@redhat.com>
In-Reply-To: <20230809121127.1754804-1-agruenba@redhat.com>
References: <20230809121127.1754804-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 2/3] gfs2: Remove LM_FLAG_PRIORITY flag
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The last user of this flag was removed in commit b77b4a4815a9 ("gfs2:
Rework freeze / thaw logic").

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 Documentation/filesystems/gfs2-glocks.rst |  3 +--
 fs/gfs2/glock.c                           | 22 ++++++----------------
 fs/gfs2/glock.h                           |  9 ---------
 fs/gfs2/lock_dlm.c                        |  5 -----
 4 files changed, 7 insertions(+), 32 deletions(-)

diff --git a/Documentation/filesystems/gfs2-glocks.rst b/Documentation/filesystems/gfs2-glocks.rst
index d14f230f0b12..93a690b9bcf2 100644
--- a/Documentation/filesystems/gfs2-glocks.rst
+++ b/Documentation/filesystems/gfs2-glocks.rst
@@ -20,8 +20,7 @@ The gl_holders list contains all the queued lock requests (not
 just the holders) associated with the glock. If there are any
 held locks, then they will be contiguous entries at the head
 of the list. Locks are granted in strictly the order that they
-are queued, except for those marked LM_FLAG_PRIORITY which are
-used only during recovery, and even then only for journal locks.
+are queued.
 
 There are three lock states that users of the glock layer can request,
 namely shared (SH), deferred (DF) and exclusive (EX). Those translate
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d0c82b721f90..0a3222651869 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -591,8 +591,7 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 		if (gh && !test_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags)) {
 			/* move to back of queue and try next entry */
 			if (ret & LM_OUT_CANCELED) {
-				if ((gh->gh_flags & LM_FLAG_PRIORITY) == 0)
-					list_move_tail(&gh->gh_list, &gl->gl_holders);
+				list_move_tail(&gh->gh_list, &gl->gl_holders);
 				gh = find_first_waiter(gl);
 				gl->gl_target = gh->gh_state;
 				goto retry;
@@ -679,8 +678,7 @@ __acquires(&gl->gl_lockref.lock)
 	    gh && !(gh->gh_flags & LM_FLAG_NOEXP))
 		goto skip_inval;
 
-	lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
-		      LM_FLAG_PRIORITY);
+	lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP);
 	GLOCK_BUG_ON(gl, gl->gl_state == target);
 	GLOCK_BUG_ON(gl, gl->gl_state == gl->gl_target);
 	if ((target == LM_ST_UNLOCKED || target == LM_ST_DEFERRED) &&
@@ -1515,27 +1513,21 @@ __acquires(&gl->gl_lockref.lock)
 		}
 		if (test_bit(HIF_HOLDER, &gh2->gh_iflags))
 			continue;
-		if (unlikely((gh->gh_flags & LM_FLAG_PRIORITY) && !insert_pt))
-			insert_pt = &gh2->gh_list;
 	}
 	trace_gfs2_glock_queue(gh, 1);
 	gfs2_glstats_inc(gl, GFS2_LKS_QCOUNT);
 	gfs2_sbstats_inc(gl, GFS2_LKS_QCOUNT);
 	if (likely(insert_pt == NULL)) {
 		list_add_tail(&gh->gh_list, &gl->gl_holders);
-		if (unlikely(gh->gh_flags & LM_FLAG_PRIORITY))
-			goto do_cancel;
 		return;
 	}
 	list_add_tail(&gh->gh_list, insert_pt);
 do_cancel:
 	gh = list_first_entry(&gl->gl_holders, struct gfs2_holder, gh_list);
-	if (!(gh->gh_flags & LM_FLAG_PRIORITY)) {
-		spin_unlock(&gl->gl_lockref.lock);
-		if (sdp->sd_lockstruct.ls_ops->lm_cancel)
-			sdp->sd_lockstruct.ls_ops->lm_cancel(gl);
-		spin_lock(&gl->gl_lockref.lock);
-	}
+	spin_unlock(&gl->gl_lockref.lock);
+	if (sdp->sd_lockstruct.ls_ops->lm_cancel)
+		sdp->sd_lockstruct.ls_ops->lm_cancel(gl);
+	spin_lock(&gl->gl_lockref.lock);
 	return;
 
 trap_recursive:
@@ -2227,8 +2219,6 @@ static const char *hflags2str(char *buf, u16 flags, unsigned long iflags)
 		*p++ = 'e';
 	if (flags & LM_FLAG_ANY)
 		*p++ = 'A';
-	if (flags & LM_FLAG_PRIORITY)
-		*p++ = 'p';
 	if (flags & LM_FLAG_NODE_SCOPE)
 		*p++ = 'n';
 	if (flags & GL_ASYNC)
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 1f1ba92c15a8..c8685ca7d2a2 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -68,14 +68,6 @@ enum {
  * also be granted in SHARED.  The preferred state is whichever is compatible
  * with other granted locks, or the specified state if no other locks exist.
  *
- * LM_FLAG_PRIORITY
- * Override fairness considerations.  Suppose a lock is held in a shared state
- * and there is a pending request for the deferred state.  A shared lock
- * request with the priority flag would be allowed to bypass the deferred
- * request and directly join the other shared lock.  A shared lock request
- * without the priority flag might be forced to wait until the deferred
- * requested had acquired and released the lock.
- *
  * LM_FLAG_NODE_SCOPE
  * This holder agrees to share the lock within this node. In other words,
  * the glock is held in EX mode according to DLM, but local holders on the
@@ -86,7 +78,6 @@ enum {
 #define LM_FLAG_TRY_1CB		0x0002
 #define LM_FLAG_NOEXP		0x0004
 #define LM_FLAG_ANY		0x0008
-#define LM_FLAG_PRIORITY	0x0010
 #define LM_FLAG_NODE_SCOPE	0x0020
 #define GL_ASYNC		0x0040
 #define GL_EXACT		0x0080
diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 54911294687c..59ab18c79889 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -222,11 +222,6 @@ static u32 make_flags(struct gfs2_glock *gl, const unsigned int gfs_flags,
 		lkf |= DLM_LKF_NOQUEUEBAST;
 	}
 
-	if (gfs_flags & LM_FLAG_PRIORITY) {
-		lkf |= DLM_LKF_NOORDER;
-		lkf |= DLM_LKF_HEADQUE;
-	}
-
 	if (gfs_flags & LM_FLAG_ANY) {
 		if (req == DLM_LOCK_PR)
 			lkf |= DLM_LKF_ALTCW;
-- 
2.40.1

