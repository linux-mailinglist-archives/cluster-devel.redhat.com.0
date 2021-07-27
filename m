Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B11843D7C4B
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DI+im945LK8y2nb7PCGQWpuV7b5azOOfgV5xFXdINJ4=;
	b=eO0tN7mMQs3e6ZiLfDv3hTnnQ3qAcuNd+Et7tHxz1Q+5kv6GPciFtdQFr9cZ0Oy1mIPDMW
	2tB8CLgbre5x0FxEtf3GRt0uQMLkSTII6f+EP7DBn4XuOAabqq2mLSwAUYBPKFpDdUOoSF
	lMHSAgGqWDHcZ345J51GXv7IucE5vfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-bolQ5rxgNfyU5XM2WbEuwA-1; Tue, 27 Jul 2021 13:37:24 -0400
X-MC-Unique: bolQ5rxgNfyU5XM2WbEuwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D1BBA0C03;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70A9419630;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61002180084A;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbHgD022849 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61ED219630; Tue, 27 Jul 2021 17:37:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3466D6E6E2
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:17 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:37:03 -0500
Message-Id: <20210727173709.210711-10-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 09/15] gfs2: fix deadlock in
	gfs2_ail1_empty withdraw
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, function gfs2_ail1_empty could issue a file system
withdraw when IO errors were discovered. However, there are several
callers, including gfs2_flush_revokes() which holds the gfs2_log_lock
before calling gfs2_ail1_empty. If gfs2_ail1_empty needed to withdraw
it would leave the gfs2_log_lock held, which resulted in a deadlock
due to other processes that needed the log_lock.

Another problem discovered by Christoph Helwig is that we cannot
withdraw from the log_flush process because it may be called from
the glock workqueue, and the withdraw process waits for that very
workqueue to be flushed. So the withdraw must be ignored until it may
be handled by a more appropriate context like the gfs2_logd daemon.

This patch moves the withdraw out of function gfs2_ail1_empty and
makes each of the callers check for a withdraw by calling new function
check_ail1_withdraw. Function gfs2_flush_revokes now does this check
after releasing the gfs2_log_lock to avoid the deadlock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index f0ee3ff6f9a8..c687a8c4e044 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -364,11 +364,6 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 	ret = list_empty(&sdp->sd_ail1_list);
 	spin_unlock(&sdp->sd_ail_lock);
 
-	if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags)) {
-		gfs2_lm(sdp, "fatal: I/O error(s)\n");
-		gfs2_withdraw(sdp);
-	}
-
 	return ret;
 }
 
@@ -786,6 +781,15 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
 	}
 }
 
+static void check_ail1_withdraw(struct gfs2_sbd *sdp)
+{
+	if (!test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
+		return;
+
+	gfs2_lm(sdp, "fatal: I/O error(s)\n");
+	gfs2_withdraw(sdp);
+}
+
 /**
  * gfs2_flush_revokes - Add as many revokes to the system transaction as we can
  * @sdp: The GFS2 superblock
@@ -1317,6 +1321,7 @@ int gfs2_logd(void *data)
 
 		if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
 			gfs2_ail1_empty(sdp, 0);
+			check_ail1_withdraw(sdp);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 						  GFS2_LFC_LOGD_JFLUSH_REQD);
 		}
@@ -1325,6 +1330,7 @@ int gfs2_logd(void *data)
 			gfs2_ail1_start(sdp);
 			gfs2_ail1_wait(sdp);
 			gfs2_ail1_empty(sdp, 0);
+			check_ail1_withdraw(sdp);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 						  GFS2_LFC_LOGD_AIL_FLUSH_REQD);
 		}
-- 
2.31.1

