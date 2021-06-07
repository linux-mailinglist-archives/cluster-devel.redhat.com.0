Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 962BB39E198
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Jun 2021 18:12:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-FA7ZvKGZNiKgVEftzNbqNw-1; Mon, 07 Jun 2021 12:12:57 -0400
X-MC-Unique: FA7ZvKGZNiKgVEftzNbqNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69103107ACF5;
	Mon,  7 Jun 2021 16:12:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB615D6D5;
	Mon,  7 Jun 2021 16:12:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68F4044A59;
	Mon,  7 Jun 2021 16:12:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157GCoNm016304 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 12:12:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6C12204795C; Mon,  7 Jun 2021 16:12:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F7C2047963
	for <cluster-devel@redhat.com>; Mon,  7 Jun 2021 16:12:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FCCD101A531
	for <cluster-devel@redhat.com>; Mon,  7 Jun 2021 16:12:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-434-O-zw_docP5SL6aKbr9fKrg-1;
	Mon, 07 Jun 2021 12:12:43 -0400
X-MC-Unique: O-zw_docP5SL6aKbr9fKrg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4751B613CD;
	Mon,  7 Jun 2021 16:12:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  7 Jun 2021 12:11:47 -0400
Message-Id: <20210607161215.3583176-21-sashal@kernel.org>
In-Reply-To: <20210607161215.3583176-1-sashal@kernel.org>
References: <20210607161215.3583176-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 157GCoNm016304
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.12 21/49] gfs2: fix a deadlock on
	withdraw-during-mount
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 865cc3e9cc0b1d4b81c10d53174bced76decf888 ]

Before this patch, gfs2 would deadlock because of the following
sequence during mount:

mount
   gfs2_fill_super
      gfs2_make_fs_rw <--- Detects IO error with glock
         kthread_stop(sdp->sd_quotad_process);
            <--- Blocked waiting for quotad to finish

logd
   Detects IO error and the need to withdraw
   calls gfs2_withdraw
      gfs2_make_fs_ro
         kthread_stop(sdp->sd_quotad_process);
            <--- Blocked waiting for quotad to finish

gfs2_quotad
   gfs2_statfs_sync
      gfs2_glock_wait <---- Blocked waiting for statfs glock to be granted

glock_work_func
   do_xmote <---Detects IO error, can't release glock: blocked on withdraw
      glops->go_inval
      glock_blocked_by_withdraw
         requeue glock work & exit <--- work requeued, blocked by withdraw

This patch makes a special exception for the statfs system inode glock,
which allows the statfs glock UNLOCK to proceed normally. That allows the
quotad daemon to exit during the withdraw, which allows the logd daemon
to exit during the withdraw, which allows the mount to exit.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 9567520d79f7..142f746d7b33 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -583,6 +583,16 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
+static bool is_system_glock(struct gfs2_glock *gl)
+{
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+	struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
+
+	if (gl == m_ip->i_gl)
+		return true;
+	return false;
+}
+
 /**
  * do_xmote - Calls the DLM to change the state of a lock
  * @gl: The lock state
@@ -672,17 +682,25 @@ __acquires(&gl->gl_lockref.lock)
 	 * to see sd_log_error and withdraw, and in the meantime, requeue the
 	 * work for later.
 	 *
+	 * We make a special exception for some system glocks, such as the
+	 * system statfs inode glock, which needs to be granted before the
+	 * gfs2_quotad daemon can exit, and that exit needs to finish before
+	 * we can unmount the withdrawn file system.
+	 *
 	 * However, if we're just unlocking the lock (say, for unmount, when
 	 * gfs2_gl_hash_clear calls clear_glock) and recovery is complete
 	 * then it's okay to tell dlm to unlock it.
 	 */
 	if (unlikely(sdp->sd_log_error && !gfs2_withdrawn(sdp)))
 		gfs2_withdraw_delayed(sdp);
-	if (glock_blocked_by_withdraw(gl)) {
-		if (target != LM_ST_UNLOCKED ||
-		    test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags)) {
+	if (glock_blocked_by_withdraw(gl) &&
+	    (target != LM_ST_UNLOCKED ||
+	     test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags))) {
+		if (!is_system_glock(gl)) {
 			gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
 			goto out;
+		} else {
+			clear_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
 		}
 	}
 
-- 
2.30.2


