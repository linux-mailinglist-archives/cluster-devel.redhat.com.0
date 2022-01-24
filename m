Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F84986D6
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 18:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643045523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FRcPx1RxQzUyphO4s1TdVmmJ0JQlUqK6nGd+YgkxjI0=;
	b=FDHreIiKUHBXmEAHlsYGkMy5udbAS0SPQHP1Ggyof6gjgF2E56nxIk+Um0GvvwBO2hQGD7
	aElIgC+15cClDLjs5jmQTc3co2Iiriz71kXOIjYm3jeP69eaDhIVmrdZDk523sPnIi1cru
	UfSnjV/nl/AAVvfs7FW0MRuLphMreVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-wtL69uVwOIaPe8l_C8c7Vw-1; Mon, 24 Jan 2022 12:32:00 -0500
X-MC-Unique: wtL69uVwOIaPe8l_C8c7Vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D893A83DEAB;
	Mon, 24 Jan 2022 17:31:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C95457A443;
	Mon, 24 Jan 2022 17:31:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B24C34A7CB;
	Mon, 24 Jan 2022 17:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OHO28C030455 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 12:24:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 48E5A7744E; Mon, 24 Jan 2022 17:24:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0081177455
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:24:01 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 24 Jan 2022 12:23:55 -0500
Message-Id: <20220124172357.554689-2-rpeterso@redhat.com>
In-Reply-To: <20220124172357.554689-1-rpeterso@redhat.com>
References: <20220124172357.554689-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: cancel timed-out glock
	requests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Andreas Gruenbacher <agruenba@redhat.com>

In the gfs2 evict code it tries to upgrade the iopen glock from SH to
EX. If the attempt to upgrade times out, gfs2 needs to tell dlm to
cancel the lock request or it can deadlock. We also need to wake up
the process waiting for the lock when dlm sends its AST back to gfs2.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b7ab8430333c..78b0dc04c38a 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -672,6 +672,8 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 
 	/* Check for state != intended state */
 	if (unlikely(state != gl->gl_target)) {
+		if (gh && (ret & LM_OUT_CANCELED))
+			gfs2_holder_wake(gh);
 		if (gh && !test_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags)) {
 			/* move to back of queue and try next entry */
 			if (ret & LM_OUT_CANCELED) {
@@ -1281,6 +1283,7 @@ void gfs2_holder_reinit(unsigned int state, u16 flags, struct gfs2_holder *gh)
 {
 	gh->gh_state = state;
 	gh->gh_flags = flags;
+	gh->gh_error = 0;
 	gh->gh_iflags = 0;
 	gh->gh_ip = _RET_IP_;
 	put_pid(gh->gh_owner_pid);
@@ -1694,6 +1697,14 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
 	struct gfs2_glock *gl = gh->gh_gl;
 
 	spin_lock(&gl->gl_lockref.lock);
+	if (list_is_first(&gh->gh_list, &gl->gl_holders) &&
+	    !test_bit(HIF_HOLDER, &gh->gh_iflags)) {
+		spin_unlock(&gl->gl_lockref.lock);
+		gl->gl_name.ln_sbd->sd_lockstruct.ls_ops->lm_cancel(gl);
+		wait_on_bit(&gh->gh_iflags, HIF_WAIT, TASK_UNINTERRUPTIBLE);
+		spin_lock(&gl->gl_lockref.lock);
+	}
+
 	__gfs2_glock_dq(gh);
 	spin_unlock(&gl->gl_lockref.lock);
 }
-- 
2.34.1

