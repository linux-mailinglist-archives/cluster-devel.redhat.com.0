Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 460593F4DDB
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Aug 2021 17:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629734212;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FJx7EDtkXJF6IuGlo8GKNhAnRUNHJGzzLBmCcvN3qos=;
	b=ClqaBySPD8qO7z3l4vl3knJNDf5s0LADYRzY7dzrvbTCbuE4y0HOLXFkLpZi5WU0GH5GgI
	Ew0NuKJVbChmPO5dq8f+A0k3OUtBErSRndewOxuTNbYyMPQPpyW8CTbq0CzEixR6/6H2Ry
	EDxvRuJwmzbghQqN3FLAkuhTv0llUps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-FEkxVRKrODGQFZj3zUlrAg-1; Mon, 23 Aug 2021 11:56:51 -0400
X-MC-Unique: FEkxVRKrODGQFZj3zUlrAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2495D801AC0;
	Mon, 23 Aug 2021 15:56:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0711B5D6AB;
	Mon, 23 Aug 2021 15:56:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA0174BB7C;
	Mon, 23 Aug 2021 15:56:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17NFuluW026917 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 11:56:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 40EF15C3E0; Mon, 23 Aug 2021 15:56:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BE0E1E6;
	Mon, 23 Aug 2021 15:56:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: bobp@redhat.com
Date: Mon, 23 Aug 2021 11:56:33 -0400
Message-Id: <20210823155633.1681341-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RFC gfs2/for-next] fs: gfs2: release dlm
	gfs2 ls on withdraw
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will introduce a new gfs2 lock ops callback for release a
possible lock infrastructure e.g. dlm. There is currently an issue with
gfs2 and dlm by hitting ctrl-c during mount operation (sometimes it
works, most times not). The issue is here that when the gfs2 filesystem
is not withdrawn we don't release the dlm lockspace again and next mount
dlm_new_lockspace() will return -EEXIST. This patch will ensure that we
call dlm_release_lockspace() in the error path of gfs2_fill_super() even if
the filesystem isn't withdrawn yet. Moreover it will do that in all
cases even if the filesystem is not withdrawn yet.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
Hi,

no idea if the gfs2_withdrawn(sdp) should be always evaluated to
"false", but then there are cases when it returns "true" and the
gfs2 dlm lockspace will not be released... next mount there will be
a -EEXIST, as described in the commit message.

If gfs2_withdrawn(sdp) should return "false" always maybe there is some
missing wait and we should printout a warning if it's returning true...
in this case and an error path we have a problem which can be observed
at the next mount.

- Alex

 fs/gfs2/glock.h      |  1 +
 fs/gfs2/lock_dlm.c   | 24 ++++++++++++++++++------
 fs/gfs2/ops_fstype.c |  6 +++++-
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 31a8f2f649b5..c8fd1352b0e1 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -130,6 +130,7 @@ struct lm_lockops {
 	void (*lm_recovery_result) (struct gfs2_sbd *sdp, unsigned int jid,
 				    unsigned int result);
 	void (*lm_unmount) (struct gfs2_sbd *sdp);
+	void (*lm_release) (struct gfs2_sbd *sdp);
 	void (*lm_withdraw) (struct gfs2_sbd *sdp);
 	void (*lm_put_lock) (struct gfs2_glock *gl);
 	int (*lm_lock) (struct gfs2_glock *gl, unsigned int req_state,
diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 50578f881e6d..776667ca4da1 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -1248,6 +1248,14 @@ static const struct dlm_lockspace_ops gdlm_lockspace_ops = {
 	.recover_done = gdlm_recover_done,
 };
 
+static void gdlm_ls_release(struct lm_lockstruct *ls)
+{
+	if (ls->ls_dlm) {
+		dlm_release_lockspace(ls->ls_dlm, 2);
+		ls->ls_dlm = NULL;
+	}
+}
+
 static int gdlm_mount(struct gfs2_sbd *sdp, const char *table)
 {
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
@@ -1338,7 +1346,7 @@ static int gdlm_mount(struct gfs2_sbd *sdp, const char *table)
 	return 0;
 
 fail_release:
-	dlm_release_lockspace(ls->ls_dlm, 2);
+	gdlm_ls_release(ls);
 fail_free:
 	free_recover_size(ls);
 fail:
@@ -1374,14 +1382,17 @@ static void gdlm_unmount(struct gfs2_sbd *sdp)
 
 	/* mounted_lock and control_lock will be purged in dlm recovery */
 release:
-	if (ls->ls_dlm) {
-		dlm_release_lockspace(ls->ls_dlm, 2);
-		ls->ls_dlm = NULL;
-	}
-
+	gdlm_ls_release(ls);
 	free_recover_size(ls);
 }
 
+static void gdlm_release(struct gfs2_sbd *sdp)
+{
+	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
+
+	gdlm_ls_release(ls);
+}
+
 static const match_table_t dlm_tokens = {
 	{ Opt_jid, "jid=%d"},
 	{ Opt_id, "id=%d"},
@@ -1396,6 +1407,7 @@ const struct lm_lockops gfs2_dlm_ops = {
 	.lm_first_done = gdlm_first_done,
 	.lm_recovery_result = gdlm_recovery_result,
 	.lm_unmount = gdlm_unmount,
+	.lm_release = gdlm_release,
 	.lm_put_lock = gdlm_put_lock,
 	.lm_lock = gdlm_lock,
 	.lm_cancel = gdlm_cancel,
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 7f8410d8fdc1..ef25ed884db2 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1075,8 +1075,12 @@ static int gfs2_lm_mount(struct gfs2_sbd *sdp, int silent)
 void gfs2_lm_unmount(struct gfs2_sbd *sdp)
 {
 	const struct lm_lockops *lm = sdp->sd_lockstruct.ls_ops;
-	if (likely(!gfs2_withdrawn(sdp)) && lm->lm_unmount)
+	if (likely(!gfs2_withdrawn(sdp)) && lm->lm_unmount) {
 		lm->lm_unmount(sdp);
+	} else {
+		if (lm->lm_release)
+			lm->lm_release(sdp);
+	}
 }
 
 static int wait_on_journal(struct gfs2_sbd *sdp)
-- 
2.27.0

