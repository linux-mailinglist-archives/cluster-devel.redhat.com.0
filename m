Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C22004986BE
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 18:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643045302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zaceiPR7/8S3Z5MP4YypLGr8wg1lmLbuDMCugFUeWjc=;
	b=Jtn6qum04C8QGsV87u5c4poutNm1Q7zd6qEnbnksxbGUgb4KWWtkgIqcMNE7A665Okw1N/
	kXBt0zIPXDWeOfk/PYNNd02RORCcmeMl6eFd/CJrix5kjHP1I6n+BL3mZAygpeoAT8JTw0
	gtDg/hsBnMEpavkiAZ0or/AWtl3eoFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-0hbs_eHEOe-XV__66FtUcQ-1; Mon, 24 Jan 2022 12:28:19 -0500
X-MC-Unique: 0hbs_eHEOe-XV__66FtUcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD479193F561;
	Mon, 24 Jan 2022 17:28:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1AD177451;
	Mon, 24 Jan 2022 17:28:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C01E180BADA;
	Mon, 24 Jan 2022 17:28:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OHO2HD030460 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 12:24:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BCD8977451; Mon, 24 Jan 2022 17:24:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7555C7744E
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:24:02 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 24 Jan 2022 12:23:56 -0500
Message-Id: <20220124172357.554689-3-rpeterso@redhat.com>
In-Reply-To: <20220124172357.554689-1-rpeterso@redhat.com>
References: <20220124172357.554689-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/3] gfs2: Retry on dlm -EBUSY (stop
	gap)
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

Sometimes when gfs2 cancels a glock request, dlm needs time to take the
request off its Conversion queue. During that time, we get -EBUSY from
dlm, which confuses the glock state machine. Ideally we want dlm to
not return -EBUSY but wait until the operation has completed. This is
a stop-gap measure until dlm has a solution in place.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lock_dlm.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 50578f881e6d..bf03c77b6757 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -258,7 +258,7 @@ static int gdlm_lock(struct gfs2_glock *gl, unsigned int req_state,
 		     unsigned int flags)
 {
 	struct lm_lockstruct *ls = &gl->gl_name.ln_sbd->sd_lockstruct;
-	int req;
+	int req, ret;
 	u32 lkf;
 	char strname[GDLM_STRNAME_BYTES] = "";
 
@@ -278,9 +278,12 @@ static int gdlm_lock(struct gfs2_glock *gl, unsigned int req_state,
 	/*
 	 * Submit the actual lock request.
 	 */
-
-	return dlm_lock(ls->ls_dlm, req, &gl->gl_lksb, lkf, strname,
-			GDLM_STRNAME_BYTES - 1, 0, gdlm_ast, gl, gdlm_bast);
+	do {
+		ret = dlm_lock(ls->ls_dlm, req, &gl->gl_lksb, lkf, strname,
+			       GDLM_STRNAME_BYTES - 1, 0, gdlm_ast, gl,
+			       gdlm_bast);
+	} while (ret == -EBUSY);
+	return ret;
 }
 
 static void gdlm_put_lock(struct gfs2_glock *gl)
@@ -312,8 +315,11 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
 		return;
 	}
 
-	error = dlm_unlock(ls->ls_dlm, gl->gl_lksb.sb_lkid, DLM_LKF_VALBLK,
-			   NULL, gl);
+	do {
+		error = dlm_unlock(ls->ls_dlm, gl->gl_lksb.sb_lkid,
+				   DLM_LKF_VALBLK, NULL, gl);
+	} while (error == -EBUSY);
+
 	if (error) {
 		fs_err(sdp, "gdlm_unlock %x,%llx err=%d\n",
 		       gl->gl_name.ln_type,
@@ -506,7 +512,9 @@ static int sync_unlock(struct gfs2_sbd *sdp, struct dlm_lksb *lksb, char *name)
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
 	int error;
 
-	error = dlm_unlock(ls->ls_dlm, lksb->sb_lkid, 0, lksb, ls);
+	do {
+		error = dlm_unlock(ls->ls_dlm, lksb->sb_lkid, 0, lksb, ls);
+	} while (error == -EBUSY);
 	if (error) {
 		fs_err(sdp, "%s lkid %x error %d\n",
 		       name, lksb->sb_lkid, error);
-- 
2.34.1

