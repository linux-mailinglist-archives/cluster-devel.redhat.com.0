Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 79AEA3C7644
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 20:10:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626199837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DJotOiBIr1+v4qjDM39i/ZT3iFXIThouGVCxfnXg4q8=;
	b=PJm2sfoaHMo4ymOMIXKnp7hY8mTt6uyBEbjZKPi5aZVtW/TmZneRx6RWuAcm8HyXW6kIEX
	lGZACc//KP8D3n2meXDohbSZBNENDSa8DyQT9TLTrCHgAGJJNgK8WwHKBSSfhk2ljEudAm
	GZZe3WiSMaat1RDTilmBTx3sILuMY64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-EIjAjKsHNcu6-uMT-rdUqQ-1; Tue, 13 Jul 2021 14:10:36 -0400
X-MC-Unique: EIjAjKsHNcu6-uMT-rdUqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D2F4802CB5;
	Tue, 13 Jul 2021 18:10:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA7A5D6AB;
	Tue, 13 Jul 2021 18:10:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDC114EA2A;
	Tue, 13 Jul 2021 18:10:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DIA6FK022136 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 14:10:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EE0B100F49F; Tue, 13 Jul 2021 18:10:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0943E100EB3D
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:10:05 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 13 Jul 2021 13:09:57 -0500
Message-Id: <20210713180958.66995-10-rpeterso@redhat.com>
In-Reply-To: <20210713180958.66995-1-rpeterso@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 09/10] gfs2: fix deadlock in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

This patch moves the withdraw out of function gfs2_ail1_empty and
makes each of the callers check for a withdraw by calling new function
check_ail1_withdraw. Function gfs2_flush_revokes now does this check
after releasing the gfs2_log_lock to avoid the deadlock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index bd2ff5ef4b91..7e0ac87f7d71 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -379,11 +379,6 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 	ret = list_empty(&sdp->sd_ail1_list);
 	spin_unlock(&sdp->sd_ail_lock);
 
-	if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags)) {
-		gfs2_lm(sdp, "fatal: I/O error(s)\n");
-		gfs2_withdraw(sdp);
-	}
-
 	return ret;
 }
 
@@ -801,6 +796,15 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
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
@@ -821,6 +825,7 @@ void gfs2_flush_revokes(struct gfs2_sbd *sdp)
 	gfs2_log_lock(sdp);
 	gfs2_ail1_empty(sdp, max_revokes);
 	gfs2_log_unlock(sdp);
+	check_ail1_withdraw(sdp);
 }
 
 /**
@@ -982,6 +987,7 @@ void gfs2_ail_drain(struct gfs2_sbd *sdp)
 static void empty_ail1_list(struct gfs2_sbd *sdp)
 {
 	unsigned long start = jiffies;
+	int empty;
 
 	for (;;) {
 		if (time_after(jiffies, start + (HZ * 600))) {
@@ -992,7 +998,9 @@ static void empty_ail1_list(struct gfs2_sbd *sdp)
 		}
 		gfs2_ail1_start(sdp);
 		gfs2_ail1_wait(sdp);
-		if (gfs2_ail1_empty(sdp, 0))
+		empty = gfs2_ail1_empty(sdp, 0);
+		check_ail1_withdraw(sdp);
+		if (empty)
 			return;
 	}
 }
@@ -1364,6 +1372,7 @@ int gfs2_logd(void *data)
 
 		if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
 			gfs2_ail1_empty(sdp, 0);
+			check_ail1_withdraw(sdp);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 						  GFS2_LFC_LOGD_JFLUSH_REQD);
 		}
@@ -1372,6 +1381,7 @@ int gfs2_logd(void *data)
 			gfs2_ail1_start(sdp);
 			gfs2_ail1_wait(sdp);
 			gfs2_ail1_empty(sdp, 0);
+			check_ail1_withdraw(sdp);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 						  GFS2_LFC_LOGD_AIL_FLUSH_REQD);
 		}
-- 
2.31.1

