Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC216EE5B2
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Apr 2023 18:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682439986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XoPWecHkekfVDq71DhcNd+vikoIdIqoVv9xiiYx4Xtw=;
	b=ZbQHYx8wfHCTro9FpVctaChD2VON/CxR1B10bXSxeo7YQhGqkBskOVnY4kHqrVLw2YTNsB
	vnAV/q8u5QFzHKH0aqNWoMZPSpuFQE+NcYBtFqAfColQvUC/zlmlf1hI4jZF4QddqHu1C6
	9NdhSgVX3OMBetzhFR5NU2uCpvD2sVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-cFDWua5nPhmLasOPv1daTA-1; Tue, 25 Apr 2023 12:26:22 -0400
X-MC-Unique: cFDWua5nPhmLasOPv1daTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA5D32932491;
	Tue, 25 Apr 2023 16:26:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD6C051FF;
	Tue, 25 Apr 2023 16:26:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 63D5C19465A3;
	Tue, 25 Apr 2023 16:26:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE7601946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Apr 2023 16:26:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2BC1492C14; Tue, 25 Apr 2023 16:26:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.22.9.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B385492C13
 for <cluster-devel@redhat.com>; Tue, 25 Apr 2023 16:26:19 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 25 Apr 2023 12:26:19 -0400
Message-Id: <20230425162619.46830-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH] gfs2: simplify gdlm_put_lock with out_free
 label
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

No change in function. This patch introduces a new label out_free and
consolidates the three places function gdlm_put_lock freed the glock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lock_dlm.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 71911bf9ab34..54911294687c 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -296,10 +296,8 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
 	int error;
 
-	if (gl->gl_lksb.sb_lkid == 0) {
-		gfs2_glock_free(gl);
-		return;
-	}
+	if (gl->gl_lksb.sb_lkid == 0)
+		goto out_free;
 
 	clear_bit(GLF_BLOCKING, &gl->gl_flags);
 	gfs2_glstats_inc(gl, GFS2_LKS_DCOUNT);
@@ -307,17 +305,13 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
 	gfs2_update_request_times(gl);
 
 	/* don't want to call dlm if we've unmounted the lock protocol */
-	if (test_bit(DFL_UNMOUNT, &ls->ls_recover_flags)) {
-		gfs2_glock_free(gl);
-		return;
-	}
+	if (test_bit(DFL_UNMOUNT, &ls->ls_recover_flags))
+		goto out_free;
 	/* don't want to skip dlm_unlock writing the lvb when lock has one */
 
 	if (test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags) &&
-	    !gl->gl_lksb.sb_lvbptr) {
-		gfs2_glock_free(gl);
-		return;
-	}
+	    !gl->gl_lksb.sb_lvbptr)
+		goto out_free;
 
 again:
 	error = dlm_unlock(ls->ls_dlm, gl->gl_lksb.sb_lkid, DLM_LKF_VALBLK,
@@ -331,8 +325,11 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
 		fs_err(sdp, "gdlm_unlock %x,%llx err=%d\n",
 		       gl->gl_name.ln_type,
 		       (unsigned long long)gl->gl_name.ln_number, error);
-		return;
 	}
+	return;
+
+out_free:
+	gfs2_glock_free(gl);
 }
 
 static void gdlm_cancel(struct gfs2_glock *gl)
-- 
2.40.0

