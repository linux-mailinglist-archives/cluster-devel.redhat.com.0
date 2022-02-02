Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CCB4A7502
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Feb 2022 16:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643817361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RnB0Sj2bTpWkQ4yBoatrrQPBYw0hHosPF1g49uXzVb8=;
	b=QykwihXiqJjv21x+JzOK8kkbHvZWbPGA+G4VDFzicwyhnkwKHx6c1WEe14rqHkLeaWYlYn
	mVcXgfAYww/9E1w3w3VnYMIyULK/RV+TRNcnjPFT/+j/5R4g8j9LMVBznLK/Guhl1Bg5go
	HsWQVUE+cdHZBsKktTiahRgxt6XHjdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-BPuENdtSNBGGc14j2HDGOQ-1; Wed, 02 Feb 2022 10:55:58 -0500
X-MC-Unique: BPuENdtSNBGGc14j2HDGOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 596F318A2269;
	Wed,  2 Feb 2022 15:55:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47A25838D7;
	Wed,  2 Feb 2022 15:55:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E70324BB7C;
	Wed,  2 Feb 2022 15:55:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 212Ftqn3018315 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 10:55:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83D6223780; Wed,  2 Feb 2022 15:55:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1134222E09;
	Wed,  2 Feb 2022 15:55:31 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed,  2 Feb 2022 16:55:29 +0100
Message-Id: <20220202155529.42634-1-agruenba@redhat.com>
In-Reply-To: <CAHc6FU6+mr5n8ng=P7hNbJjr=yE5YN9LcDHtD1_B10TudgcF-g@mail.gmail.com>
References: <CAHc6FU6+mr5n8ng=P7hNbJjr=yE5YN9LcDHtD1_B10TudgcF-g@mail.gmail.com>
	<20220124172357.554689-3-rpeterso@redhat.com>
	<20220124172357.554689-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Expect -EBUSY after canceling dlm
	locking requests
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Due to the asynchronous nature of the dlm api, when we request a pending
locking request to be canceled with dlm_unlock(DLM_LKF_CANCEL), the
locking request will either complete before it could be canceled, or the
cancellation will succeed.  In either case, gdlm_ast will be called once
and the status will indicate the outcome of the locking request, with
-DLM_ECANCEL indicating a canceled request.

Inside dlm, when a locking request completes before its cancel request
could be processed, gdlm_ast will be called, but the lock will still be
considered busy until a DLM_MSG_CANCEL_REPLY message completes the
cancel request.  During that time, successive dlm_lock() or dlm_unlock()
requests for that lock will return -EBUSY.  In other words, waiting for
the gdlm_ast call before issuing the next locking request is not enough.
There is no way of waiting for a cancel request to actually complete,
either.

We rarely cancel locking requests, but when we do, we don't know when
the next locking request for that lock will occur.  This means that any
dlm_lock() or dlm_unlock() call can potentially return -EBUSY.  When
that happens, this patch simply repeats the request after a short pause.

This workaround could be improved upon by tracking for which dlm locks
cancel requests have been issued, but that isn't strictly necessary and
it would complicate the code.  We haven't seen -EBUSY errors from dlm
without cancel requests.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lock_dlm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 50578f881e6d..2559a79cf14b 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -261,6 +261,7 @@ static int gdlm_lock(struct gfs2_glock *gl, unsigned int req_state,
 	int req;
 	u32 lkf;
 	char strname[GDLM_STRNAME_BYTES] = "";
+	int error;
 
 	req = make_mode(gl->gl_name.ln_sbd, req_state);
 	lkf = make_flags(gl, flags, req);
@@ -279,8 +280,14 @@ static int gdlm_lock(struct gfs2_glock *gl, unsigned int req_state,
 	 * Submit the actual lock request.
 	 */
 
-	return dlm_lock(ls->ls_dlm, req, &gl->gl_lksb, lkf, strname,
+again:
+	error = dlm_lock(ls->ls_dlm, req, &gl->gl_lksb, lkf, strname,
 			GDLM_STRNAME_BYTES - 1, 0, gdlm_ast, gl, gdlm_bast);
+	if (error == -EBUSY) {
+		msleep(20);
+		goto again;
+	}
+	return error;
 }
 
 static void gdlm_put_lock(struct gfs2_glock *gl)
@@ -312,8 +319,14 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
 		return;
 	}
 
+again:
 	error = dlm_unlock(ls->ls_dlm, gl->gl_lksb.sb_lkid, DLM_LKF_VALBLK,
 			   NULL, gl);
+	if (error == -EBUSY) {
+		msleep(20);
+		goto again;
+	}
+
 	if (error) {
 		fs_err(sdp, "gdlm_unlock %x,%llx err=%d\n",
 		       gl->gl_name.ln_type,
-- 
2.33.1

