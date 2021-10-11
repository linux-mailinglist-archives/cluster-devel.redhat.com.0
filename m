Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC594297AA
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PrULoUubuk/dBPc4NMlneHIF6INuA595Ib14Jy6zwT4=;
	b=iAczWWANaFfu1G6TNAg7UOpnaRxvc9He6MLP7Im+9rBhBFQZmNxJI7oZjz3TW0Huhz0IeQ
	ldd0FjBeQT0jPeO9I12Ba3LnBYkHHtBu4Qju5DgZfBoER1Pm6pckcRJggUFOwlPUak5XcX
	3yZJeFVnLTRnESRwhB9oCSf2+zLMFXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-IbwI25TAM9aH2ZM3a_K6ow-1; Mon, 11 Oct 2021 15:40:37 -0400
X-MC-Unique: IbwI25TAM9aH2ZM3a_K6ow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC4BB84A5E3;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C2AB1106AC5;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEC521801241;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeTbZ028762 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52F0726DFD; Mon, 11 Oct 2021 19:40:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 228A226DE2
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:29 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:39:57 -0500
Message-Id: <20211011194008.50097-3-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 02/13] gfs2: Save ip from
	gfs2_glock_nq_init
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Andreas Gruenbacher <agruenba@redhat.com>

Before this patch, when a glock was locked by function gfs2_glock_nq_init,
it initialized the holder gh_ip (return address) as gfs2_glock_nq_init.
That made it extremely difficult to track down problems because many
functions call gfs2_glock_nq_init. This patch changes the function so
that it saves gh_ip from the caller of gfs2_glock_nq_init, which makes
it easy to backtrack which holder took the lock.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c |  8 ++++----
 fs/gfs2/glock.h | 13 ++++++++++---
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b8248ceff3c3..983bfe50bb90 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -824,7 +824,7 @@ static void gfs2_glock_poke(struct gfs2_glock *gl)
 	struct gfs2_holder gh;
 	int error;
 
-	gfs2_holder_init(gl, LM_ST_SHARED, flags, &gh);
+	__gfs2_holder_init(gl, LM_ST_SHARED, flags, &gh, _RET_IP_);
 	error = gfs2_glock_nq(&gh);
 	if (!error)
 		gfs2_glock_dq(&gh);
@@ -1121,12 +1121,12 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
  *
  */
 
-void gfs2_holder_init(struct gfs2_glock *gl, unsigned int state, u16 flags,
-		      struct gfs2_holder *gh)
+void __gfs2_holder_init(struct gfs2_glock *gl, unsigned int state, u16 flags,
+			struct gfs2_holder *gh, unsigned long ip)
 {
 	INIT_LIST_HEAD(&gh->gh_list);
 	gh->gh_gl = gl;
-	gh->gh_ip = _RET_IP_;
+	gh->gh_ip = ip;
 	gh->gh_owner_pid = get_pid(task_pid(current));
 	gh->gh_state = state;
 	gh->gh_flags = flags;
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 31a8f2f649b5..2a71e2068a95 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -188,8 +188,15 @@ extern int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 extern void gfs2_glock_hold(struct gfs2_glock *gl);
 extern void gfs2_glock_put(struct gfs2_glock *gl);
 extern void gfs2_glock_queue_put(struct gfs2_glock *gl);
-extern void gfs2_holder_init(struct gfs2_glock *gl, unsigned int state,
-			     u16 flags, struct gfs2_holder *gh);
+
+extern void __gfs2_holder_init(struct gfs2_glock *gl, unsigned int state,
+			       u16 flags, struct gfs2_holder *gh,
+			       unsigned long ip);
+static inline void gfs2_holder_init(struct gfs2_glock *gl, unsigned int state,
+				    u16 flags, struct gfs2_holder *gh) {
+	__gfs2_holder_init(gl, state, flags, gh, _RET_IP_);
+}
+
 extern void gfs2_holder_reinit(unsigned int state, u16 flags,
 			       struct gfs2_holder *gh);
 extern void gfs2_holder_uninit(struct gfs2_holder *gh);
@@ -239,7 +246,7 @@ static inline int gfs2_glock_nq_init(struct gfs2_glock *gl,
 {
 	int error;
 
-	gfs2_holder_init(gl, state, flags, gh);
+	__gfs2_holder_init(gl, state, flags, gh, _RET_IP_);
 
 	error = gfs2_glock_nq(gh);
 	if (error)
-- 
2.31.1

