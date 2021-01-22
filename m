Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3C683300921
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Jan 2021 18:01:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611334861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=x5bRBdoiTjq7Ix1x+qhAZRDEV1Z9dm0AIbm6nGcnIDo=;
	b=OIwyLcu0sa/bYYGSVAe2r0ff2JyD/r49HRJIT6UydKxS2506zPEFGnCKZl1HWgDgdpD8kf
	YcQ2RmKyKAqSun1J3VFDO1hsyOy6m6cjRKktKEHT4RMGrkIIZdjv3dxxg2r5JDExHH3xgP
	UH5IItgyzRLYJgS2ns3dbsq4BdwApF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-FS8RCLIqMrSSh2VEFQqUDA-1; Fri, 22 Jan 2021 12:00:59 -0500
X-MC-Unique: FS8RCLIqMrSSh2VEFQqUDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A3B6180A09E;
	Fri, 22 Jan 2021 17:00:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C067450B44;
	Fri, 22 Jan 2021 17:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54E344BB7B;
	Fri, 22 Jan 2021 17:00:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MH0qeR006432 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 12:00:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E08836EF46; Fri, 22 Jan 2021 17:00:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9A4D709AD
	for <cluster-devel@redhat.com>; Fri, 22 Jan 2021 17:00:49 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB83618095FF
	for <cluster-devel@redhat.com>; Fri, 22 Jan 2021 17:00:49 +0000 (UTC)
Date: Fri, 22 Jan 2021 12:00:47 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1424478444.49230230.1611334847588.JavaMail.zimbra@redhat.com>
In-Reply-To: <338502527.49230155.1611334812442.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.58, 10.4.195.3]
Thread-Topic: gfs2: fix glock confusion in function signal_our_withdraw
Thread-Index: ycYX/G01TpABz6/lRORZUi/3mu1C1Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: fix glock confusion in function
 signal_our_withdraw
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

If go_free is defined, function signal_our_withdraw is supposed to
synchronize on the GLF_FREEING flag of the inode glock, but it
accidentally does that on the live glock. Fix that and disambiguate
the glock variables.

Fixes: 601ef0d52e96 ("gfs2: Force withdraw to replay journals and wait for it to finish")
Cc: stable@vger.kernel.org # v5.7+
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 97b1bdc76871..8d3c670c990f 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -118,9 +118,10 @@ void gfs2_freeze_unlock(struct gfs2_holder *freeze_gh)
 
 static void signal_our_withdraw(struct gfs2_sbd *sdp)
 {
-	struct gfs2_glock *gl = sdp->sd_live_gh.gh_gl;
+	struct gfs2_glock *live_gl = sdp->sd_live_gh.gh_gl;
 	struct inode *inode = sdp->sd_jdesc->jd_inode;
 	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_glock *i_gl = ip->i_gl;
 	u64 no_formal_ino = ip->i_no_formal_ino;
 	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 	int ret = 0;
@@ -180,7 +181,8 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 		atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
 		thaw_super(sdp->sd_vfs);
 	} else {
-		wait_on_bit(&gl->gl_flags, GLF_DEMOTE, TASK_UNINTERRUPTIBLE);
+		wait_on_bit(&i_gl->gl_flags, GLF_DEMOTE,
+			    TASK_UNINTERRUPTIBLE);
 	}
 
 	/*
@@ -200,15 +202,15 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	 * on other nodes to be successful, otherwise we remain the owner of
 	 * the glock as far as dlm is concerned.
 	 */
-	if (gl->gl_ops->go_free) {
-		set_bit(GLF_FREEING, &gl->gl_flags);
-		wait_on_bit(&gl->gl_flags, GLF_FREEING, TASK_UNINTERRUPTIBLE);
+	if (i_gl->gl_ops->go_free) {
+		set_bit(GLF_FREEING, &i_gl->gl_flags);
+		wait_on_bit(&i_gl->gl_flags, GLF_FREEING, TASK_UNINTERRUPTIBLE);
 	}
 
 	/*
 	 * Dequeue the "live" glock, but keep a reference so it's never freed.
 	 */
-	gfs2_glock_hold(gl);
+	gfs2_glock_hold(live_gl);
 	gfs2_glock_dq_wait(&sdp->sd_live_gh);
 	/*
 	 * We enqueue the "live" glock in EX so that all other nodes
@@ -247,7 +249,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 		gfs2_glock_nq(&sdp->sd_live_gh);
 	}
 
-	gfs2_glock_queue_put(gl); /* drop the extra reference we acquired */
+	gfs2_glock_queue_put(live_gl); /* drop extra reference we acquired */
 	clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
 
 	/*

