Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189327D9C
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A9739F736;
	Thu, 23 May 2019 13:05:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A76959474;
	Thu, 23 May 2019 13:05:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C8131806B14;
	Thu, 23 May 2019 13:05:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4V09009969 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9AA5F6090E; Thu, 23 May 2019 13:04:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6678E69185
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:04:09 -0500
Message-Id: <20190523130421.21003-15-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 14/26] gfs2: Ignore dlm recovery
	requests if gfs2 is withdrawn
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 23 May 2019 13:05:24 +0000 (UTC)

When a node fails, user space informs dlm of the node failure,
and dlm instructs gfs2 on the surviving nodes to perform journal
recovery. It does this by calling various callback functions in
lock_dlm.c. To mark its progress, it keeps generation numbers
and recover bits in a dlm "control" lock lvb, which is seen by
all nodes to determine which journals need to be replayed.

The gfs2 on all nodes get the same recovery requests from dlm,
so they all try to do the recovery, but only one will be
granted the exclusive lock on the journal. The others fail
with a "Busy" message on their "try lock."

However, when a node is withdrawn, it cannot safely do any
recovery or safely replay any journals. To make matters worse,
gfs2 might withdraw as a result of attempting recovery. For
example, this might happen if the device goes offline, or if
an hba fails. But in today's gfs2 code, it doesn't check for
being withdrawn at any step in the recovery process. What's
worse if that these callbacks from dlm have no return code,
so there is no way to indicate failure back to dlm. We can
send a "Recovery failed" uevent eventually, but that tells
user space what happened, not dlm's kernel code.

Before this patch, lock_dlm would perform its recovery steps but
ignore the result, and eventually it would still update its
generation number in the lvb, despite the fact that it may have
withdrawn or encountered an error. The other nodes would then
see the newer generation number in the lvb and conclude that
they don't need to do recovery because the generation number
is newer than the last one they saw. They think a different
node has already recovered the journal.

This patch adds checks to several of the callbacks used by dlm
in its recovery state machine so that the functions are ignored
and skipped if an io error has occurred or if the file system
is withdrawn. That prevents the lvb bits from being updated, and
therefore dlm and user space still see the need for recovery to
take place.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lock_dlm.c | 18 ++++++++++++++++++
 fs/gfs2/recovery.c |  5 +++++
 2 files changed, 23 insertions(+)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 31df26ed7854..9329f86ffcbe 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -1081,6 +1081,10 @@ static void gdlm_recover_prep(void *arg)
 	struct gfs2_sbd *sdp = arg;
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
 
+	if (gfs2_withdrawn(sdp)) {
+		fs_err(sdp, "recover_prep ignored due to withdraw.\n");
+		return;
+	}
 	spin_lock(&ls->ls_recover_spin);
 	ls->ls_recover_block = ls->ls_recover_start;
 	set_bit(DFL_DLM_RECOVERY, &ls->ls_recover_flags);
@@ -1103,6 +1107,11 @@ static void gdlm_recover_slot(void *arg, struct dlm_slot *slot)
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
 	int jid = slot->slot - 1;
 
+	if (gfs2_withdrawn(sdp)) {
+		fs_err(sdp, "recover_slot jid %d ignored due to withdraw.\n",
+		       jid);
+		return;
+	}
 	spin_lock(&ls->ls_recover_spin);
 	if (ls->ls_recover_size < jid + 1) {
 		fs_err(sdp, "recover_slot jid %d gen %u short size %d\n",
@@ -1127,6 +1136,10 @@ static void gdlm_recover_done(void *arg, struct dlm_slot *slots, int num_slots,
 	struct gfs2_sbd *sdp = arg;
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
 
+	if (gfs2_withdrawn(sdp)) {
+		fs_err(sdp, "recover_done ignored due to withdraw.\n");
+		return;
+	}
 	/* ensure the ls jid arrays are large enough */
 	set_recover_size(sdp, slots, num_slots);
 
@@ -1154,6 +1167,11 @@ static void gdlm_recovery_result(struct gfs2_sbd *sdp, unsigned int jid,
 {
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
 
+	if (gfs2_withdrawn(sdp)) {
+		fs_err(sdp, "recovery_result jid %d ignored due to withdraw.\n",
+		       jid);
+		return;
+	}
 	if (test_bit(DFL_NO_DLM_OPS, &ls->ls_recover_flags))
 		return;
 
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 4ce2bfdbefdc..9e15b5aa2cfb 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -307,6 +307,11 @@ void gfs2_recover_func(struct work_struct *work)
 	int jlocked = 0;
 
 	t_start = ktime_get();
+	if (gfs2_withdrawn(sdp)) {
+		fs_err(sdp, "jid=%u: Recovery not attempted due to withdraw.\n",
+		       jd->jd_jid);
+		goto fail;
+	}
 	if (sdp->sd_args.ar_spectator)
 		goto fail;
 	if (jd->jd_jid != sdp->sd_lockstruct.ls_jid) {
-- 
2.21.0

