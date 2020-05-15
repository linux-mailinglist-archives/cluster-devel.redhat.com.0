Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6EA1D58BA
	for <lists+cluster-devel@lfdr.de>; Fri, 15 May 2020 20:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589566344;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uvN/LsGzf8BaPioFQQDxY1BPCRj35mnPVHh4/KUqZas=;
	b=fK7VwWIGSo5iWfETYNswdzhS/bco9lhH2wGiSBCsLhr/AIhj5/M6mO3nCsprAxeg+m48os
	FoYTGocyjSof/KzRuyLonXHFSlOs5utDTKUl3Pgp+2Li9gW5IoHRj+8fJW/UgDrYMsdcxw
	cECM9kTiVYiO0fHSE6fHpYXju/VGQTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-XtJ8GKBUMW2-ggsBSnyQRQ-1; Fri, 15 May 2020 14:12:20 -0400
X-MC-Unique: XtJ8GKBUMW2-ggsBSnyQRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B27460;
	Fri, 15 May 2020 18:12:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B8DE1C8;
	Fri, 15 May 2020 18:12:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DD224E9F9;
	Fri, 15 May 2020 18:12:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04FIC85R027287 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 14:12:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE13B5D714; Fri, 15 May 2020 18:12:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D956962491
	for <cluster-devel@redhat.com>; Fri, 15 May 2020 18:12:06 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49E9D18095FF
	for <cluster-devel@redhat.com>; Fri, 15 May 2020 18:12:06 +0000 (UTC)
Date: Fri, 15 May 2020 14:12:06 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1099822417.28383190.1589566326233.JavaMail.zimbra@redhat.com>
In-Reply-To: <872818650.28383176.1589566286773.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.160, 10.4.195.30]
Thread-Topic: gfs2: Fix gfs2_ail_empty_gl
Thread-Index: 75CIWrHJQQEBY0GYx/EYYIIMAuRZFQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Fix gfs2_ail_empty_gl
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Function gfs2_ail_empty_gl is part of the sync process (go_sync) for
a glock. The go_sync glop is called to sync the metadata for a glock
so we can, in good conscience, tell dlm to release the lock to another
node. Its goal is not only to sync the metadata for the glock, but
also to ensure all the glock's revokes are written properly as well.

The sync is accomplished by first calling a log_flush. Then it calls
function gfs2_ail_empty_gl to make sure all the revokes are written
for the glock.

Before this patch, function gfs2_ail_empty_gl was not doing that
correctly. It was checking for NEW items that needed to be revoked
(gl_ail_count) and if there weren't any, it was exiting. But the
log flush could have introduced new items on the sdp revokes list,
so they're still pending, but still accounted for in gl->gl_revokes.

This patch rearranges function gfs2_ail_empty_gl so that it first
processes new revokes for its ail list, then follows through with
its second log flush (for revokes both new and old) and then calls
log_flush_wait to make sure the revokes are written back.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 68 +++++++++++++++++++++------------------------------------
 1 file changed, 25 insertions(+), 43 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 9406e46c31fc..cdd48f52d6b3 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -90,56 +90,38 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_trans tr;
 	int ret;
+	bool need_flush = false;
 
 	memset(&tr, 0, sizeof(tr));
 	INIT_LIST_HEAD(&tr.tr_buf);
 	INIT_LIST_HEAD(&tr.tr_databuf);
 	tr.tr_revokes = atomic_read(&gl->gl_ail_count);
 
-	if (!tr.tr_revokes) {
-		bool have_revokes;
-		bool log_in_flight;
-
-		/*
-		 * We have nothing on the ail, but there could be revokes on
-		 * the sdp revoke queue, in which case, we still want to flush
-		 * the log and wait for it to finish.
-		 *
-		 * If the sdp revoke list is empty too, we might still have an
-		 * io outstanding for writing revokes, so we should wait for
-		 * it before returning.
-		 *
-		 * If none of these conditions are true, our revokes are all
-		 * flushed and we can return.
-		 */
-		gfs2_log_lock(sdp);
-		have_revokes = !list_empty(&sdp->sd_log_revokes);
-		log_in_flight = atomic_read(&sdp->sd_log_in_flight);
-		gfs2_log_unlock(sdp);
-		if (have_revokes)
-			goto flush;
-		if (log_in_flight)
-			log_flush_wait(sdp);
-		return 0;
+	if (tr.tr_revokes) {
+		/* A shortened, inline version of gfs2_trans_begin()
+		 * tr->alloced is not set since the transaction structure is
+		 * on the stack */
+		tr.tr_reserved = 1 + gfs2_struct2blk(sdp, tr.tr_revokes,
+						     sizeof(u64));
+		tr.tr_ip = _RET_IP_;
+		ret = gfs2_log_reserve(sdp, tr.tr_reserved);
+		if (ret < 0)
+			return ret;
+		WARN_ON_ONCE(current->journal_info);
+		current->journal_info = &tr;
+
+		__gfs2_ail_flush(gl, 0, tr.tr_revokes);
+
+		gfs2_trans_end(sdp);
+		need_flush = true;
+	} else if (atomic_read(&gl->gl_revokes)) {
+		need_flush = true;
+	}
+	if (need_flush) {
+		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
+			       GFS2_LFC_AIL_EMPTY_GL);
+		log_flush_wait(sdp);
 	}
-
-	/* A shortened, inline version of gfs2_trans_begin()
-         * tr->alloced is not set since the transaction structure is
-         * on the stack */
-	tr.tr_reserved = 1 + gfs2_struct2blk(sdp, tr.tr_revokes, sizeof(u64));
-	tr.tr_ip = _RET_IP_;
-	ret = gfs2_log_reserve(sdp, tr.tr_reserved);
-	if (ret < 0)
-		return ret;
-	WARN_ON_ONCE(current->journal_info);
-	current->journal_info = &tr;
-
-	__gfs2_ail_flush(gl, 0, tr.tr_revokes);
-
-	gfs2_trans_end(sdp);
-flush:
-	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
-		       GFS2_LFC_AIL_EMPTY_GL);
 	return 0;
 }
 

