Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39D487AA4
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Jan 2022 17:44:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641573857;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=27WEx6pE8oFXrFWCodcIVggXR/rPq2ep7EoltEcpjx0=;
	b=SJbLe3R2wORL4AGd1GYv/sfNlSAj0EnU1T2OsRm5MJje3Bw7ZlYYRxDDcgV3lT15KxN4+y
	jjl5Zchm+4V3VozDlhRnN0o/MaMaK8uK9CY2zsiDfYzKwDhhBrZ2yPA9dECMshgOH2ZA5a
	8+HQzw54amtnc6ten4Klh7kFuspvarA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-KjEg1EdOO6mhhrXWpqtBIA-1; Fri, 07 Jan 2022 11:44:14 -0500
X-MC-Unique: KjEg1EdOO6mhhrXWpqtBIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8638E1006AA6;
	Fri,  7 Jan 2022 16:44:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E182ED64;
	Fri,  7 Jan 2022 16:44:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CED231809CB8;
	Fri,  7 Jan 2022 16:44:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 207GhvEW009689 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jan 2022 11:43:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8D0D679A0F; Fri,  7 Jan 2022 16:43:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4289878AB4
	for <cluster-devel@redhat.com>; Fri,  7 Jan 2022 16:43:57 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  7 Jan 2022 11:43:56 -0500
Message-Id: <20220107164356.547051-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: tell dlm to cancel timed out iopen
	locks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Function gfs2_upgrade_iopen_glock tries to upgrade the iopen glock
first with a "try" lock and then with an ASYNC request with timeout.

Before this patch, if a timeout occurred, gfs2 dequeued the glock and
went on its way. However, if the dlm lock request is never canceled, it
could get stuck on dlm's "Convert" queue forever trying to convert the
lock to EX. In some cases this led to complete cluster deadlock because
the lock could not be granted in EX until demoted, and it couldn't be
demoted because other nodes have the glock held in SH (until eviction).
Dlm never took it off its conversion queue because the lock request was
never canceled by gfs2, which let it run its course.

This patch makes gfs2 cancel dlm requests for iopen glocks if they time
out. That allows dlm to remove it from its Conversion queue and grant
the glock to other compatible SH requesters.

The dlm responds to the cancel request by sending gfs2 an AST callback
when the lock request is properly canceled. If another request is made
for the dlm lock, dlm returns -EBUSY until the AST is sent. Therefore,
this patch changes it from glock_dq to glock_dq_wait after the timeout,
thereby waiting for the glock state machine to progress after receiving
the AST from dlm.

The purpose of the "try" lock and glock timeout was to prevent blocking
on the lock during evict, since the order of the iopen and inode glocks
cannot be guaranteed. However, waiting for dlm to return the cancel AST
should be relatively quick and guaranteed, so should never result in
deadlock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  |  5 +++++
 fs/gfs2/incore.h |  1 +
 fs/gfs2/super.c  | 14 +++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b7ab8430333c..0874e821ab29 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -672,6 +672,9 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 
 	/* Check for state != intended state */
 	if (unlikely(state != gl->gl_target)) {
+		if ((ret & LM_OUT_CANCELED) &&
+		    test_bit(GLF_CANCELING, &gl->gl_flags))
+			goto out;
 		if (gh && !test_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags)) {
 			/* move to back of queue and try next entry */
 			if (ret & LM_OUT_CANCELED) {
@@ -2365,6 +2368,8 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
 		*p++ = 'n';
 	if (test_bit(GLF_INSTANTIATE_IN_PROG, gflags))
 		*p++ = 'N';
+	if (test_bit(GLF_CANCELING, gflags))
+		*p++ = 'c';
 	*p = 0;
 	return buf;
 }
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 8c00fb389ae5..3572b4a2a831 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -329,6 +329,7 @@ enum {
 	GLF_LRU				= 13,
 	GLF_OBJECT			= 14, /* Used only for tracing */
 	GLF_BLOCKING			= 15,
+	GLF_CANCELING			= 16, /* Now canceling lock request */
 	GLF_PENDING_DELETE		= 17,
 	GLF_FREEING			= 18, /* Wait for glock to be freed */
 };
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 143a47359d1b..e23bc7de5248 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1193,7 +1193,19 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
 		test_bit(GLF_DEMOTE, &ip->i_gl->gl_flags),
 		timeout);
 	if (!test_bit(HIF_HOLDER, &gh->gh_iflags)) {
-		gfs2_glock_dq(gh);
+		if (sdp->sd_lockstruct.ls_ops->lm_cancel) {
+			set_bit(GLF_CANCELING,  &gh->gh_gl->gl_flags);
+			sdp->sd_lockstruct.ls_ops->lm_cancel(gh->gh_gl);
+		}
+		/*
+		 * We canceled the dlm lock, so we must wait for dlm to send
+		 * us the AST callback, otherwise we will get -EBUSY if anyone
+		 * tries to lock the glock again while the dlm lock is still
+		 * on the dlm conversion queue.
+		 */
+		gfs2_glock_dq_wait(gh);
+		clear_bit(GLF_CANCELING,  &gh->gh_gl->gl_flags);
+		smp_mb__after_atomic();
 		return false;
 	}
 	return true;
-- 
2.33.1

