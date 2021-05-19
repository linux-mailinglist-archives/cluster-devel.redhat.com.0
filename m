Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id AF4A5389627
	for <lists+cluster-devel@lfdr.de>; Wed, 19 May 2021 21:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621451195;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z+cbVMCRHXcQDlLoFjbhNP8ANudouAGFBJuXSqGiLf4=;
	b=U7HMTMNAvSIxrEPnEPVDIkWo+f4YdqvvQCbSq0EkU2LVCUEGnn+qG+zQ1hq/TpRmISYlIu
	IbPOcCgzLSJmTngMEZe6xXx93+dFTmWVRAkVbvp6PCslPM/TXpIy8ewoCLspL90pIcPW/B
	UzrTt83VCSdzPCxVlwsBw4Hz8zwjc1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-3WrUB3pYPWKa7qeNafWZcQ-1; Wed, 19 May 2021 15:06:34 -0400
X-MC-Unique: 3WrUB3pYPWKa7qeNafWZcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73FD88015F5;
	Wed, 19 May 2021 19:06:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 576575C1D0;
	Wed, 19 May 2021 19:06:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECFC955346;
	Wed, 19 May 2021 19:06:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14JIs6iV019539 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 May 2021 14:54:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0168D2AC81; Wed, 19 May 2021 18:54:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FF060C04;
	Wed, 19 May 2021 18:54:02 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4091D5F981;
	Wed, 19 May 2021 18:54:02 +0000 (UTC)
Date: Wed, 19 May 2021 14:54:02 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1327422304.29134220.1621450442219.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.185, 10.4.195.1]
Thread-Topic: gfs2: Clean up revokes on normal withdraws
Thread-Index: gLlpnKCQwe8ntg12LTFD+y5h5xTy/Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Clean up revokes on normal
	withdraws
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Before this patch, the system ail lists were cleaned up if the logd
process withdrew, but on other withdraws, they were not cleaned up.
This included the cleaning up of the revokes as well.

This patch reorganizes things a bit so that all withdraws (not just logd)
clean up the ail lists, including any pending revokes.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c  | 7 ++++---
 fs/gfs2/log.h  | 1 +
 fs/gfs2/lops.c | 7 ++++++-
 fs/gfs2/lops.h | 1 +
 fs/gfs2/util.c | 1 +
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 97d54e581a7b..6b8ef7218a22 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -926,13 +926,14 @@ static void log_write_header(struct gfs2_sbd *sdp, u32 flags)
 }
 
 /**
- * ail_drain - drain the ail lists after a withdraw
+ * gfs2_ail_drain - drain the ail lists after a withdraw
  * @sdp: Pointer to GFS2 superblock
  */
-static void ail_drain(struct gfs2_sbd *sdp)
+void gfs2_ail_drain(struct gfs2_sbd *sdp)
 {
 	struct gfs2_trans *tr;
 
+	fs_err(sdp, "Draining ail lists for withdraw.\n");
 	spin_lock(&sdp->sd_ail_lock);
 	/*
 	 * For transactions on the sd_ail1_list we need to drain both the
@@ -956,6 +957,7 @@ static void ail_drain(struct gfs2_sbd *sdp)
 		list_del(&tr->tr_list);
 		gfs2_trans_free(sdp, tr);
 	}
+	gfs2_drain_revokes(sdp);
 	spin_unlock(&sdp->sd_ail_lock);
 }
 
@@ -1162,7 +1164,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	if (tr && list_empty(&tr->tr_list))
 		list_add(&tr->tr_list, &sdp->sd_ail1_list);
 	spin_unlock(&sdp->sd_ail_lock);
-	ail_drain(sdp); /* frees all transactions */
 	tr = NULL;
 	goto out_end;
 }
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index eea58015710e..fc905c2af53c 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -93,5 +93,6 @@ extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
 extern void gfs2_glock_remove_revoke(struct gfs2_glock *gl);
 extern void gfs2_flush_revokes(struct gfs2_sbd *sdp);
+extern void gfs2_ail_drain(struct gfs2_sbd *sdp);
 
 #endif /* __LOG_DOT_H__ */
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 221e7118cc3b..8ee05d25dfa6 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -885,7 +885,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	gfs2_log_write_page(sdp, page);
 }
 
-static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+void gfs2_drain_revokes(struct gfs2_sbd *sdp)
 {
 	struct list_head *head = &sdp->sd_log_revokes;
 	struct gfs2_bufdata *bd;
@@ -900,6 +900,11 @@ static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	}
 }
 
+static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+{
+	gfs2_drain_revokes(sdp);
+}
+
 static void revoke_lo_before_scan(struct gfs2_jdesc *jd,
 				  struct gfs2_log_header_host *head, int pass)
 {
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 31b6dd0d2e5d..f707601597dc 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -20,6 +20,7 @@ extern void gfs2_log_submit_bio(struct bio **biop, int opf);
 extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
 extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
 			   struct gfs2_log_header_host *head, bool keep_cache);
+extern void gfs2_drain_revokes(struct gfs2_sbd *sdp);
 static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
 {
 	return sdp->sd_ldptrs;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 3e08027a6c81..f4325b44956d 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -131,6 +131,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	if (test_bit(SDF_NORECOVERY, &sdp->sd_flags) || !sdp->sd_jdesc)
 		return;
 
+	gfs2_ail_drain(sdp); /* frees all transactions */
 	inode = sdp->sd_jdesc->jd_inode;
 	ip = GFS2_I(inode);
 	i_gl = ip->i_gl;

