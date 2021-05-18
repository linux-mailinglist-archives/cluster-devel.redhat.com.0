Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01D263879A9
	for <lists+cluster-devel@lfdr.de>; Tue, 18 May 2021 15:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621343682;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GfBDQ8bo5Js7n+w6oSD4Tn693B2TgCW9Rjdi2lc+sRY=;
	b=daQmmaavEKmBAaDJ0mSbW66BxNkcY/b5n51IkCAWnz6X5gwZZzafpo/axqVFE45l3ntfVS
	9GnaEuXHMWS1hzrBynYvdvMDWIK2w4DF2SR8cz4/OzZjgsMWXDM8GOrbRC3elkJq3hwfAv
	EqcyKUCEuRJMYWCCIwf1MUTIuVnAvhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-T9KL4J8NORO-UG57_06Hkw-1; Tue, 18 May 2021 09:14:40 -0400
X-MC-Unique: T9KL4J8NORO-UG57_06Hkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41AD8E7B42;
	Tue, 18 May 2021 13:14:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 360EB59452;
	Tue, 18 May 2021 13:14:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22D6855344;
	Tue, 18 May 2021 13:14:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14IDEZev008984 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 May 2021 09:14:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9F5D5D71D; Tue, 18 May 2021 13:14:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D599A5D762
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 13:14:31 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D63B518095C4
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 13:14:31 +0000 (UTC)
Date: Tue, 18 May 2021 09:14:31 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <594947899.28357434.1621343671827.JavaMail.zimbra@redhat.com>
In-Reply-To: <1048075113.28357420.1621343657187.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.114, 10.4.195.5]
Thread-Topic: gfs2: fix a deadlock on withdraw-during mount
Thread-Index: 7QrH2ywAf2KJfwfgsrlJ3+0KNhthrw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [gfs2 PATCH] gfs2: fix a deadlock on
	withdraw-during mount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

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
---
 fs/gfs2/glock.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d7bee2ab5d2b..5af436c94d2a 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -582,6 +582,16 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
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
@@ -671,17 +681,25 @@ __acquires(&gl->gl_lockref.lock)
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
 

