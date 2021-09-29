Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8C0141C82F
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Sep 2021 17:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632928760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3tfyN9/5CxFt4Nj14MPOeNqTg+14+Po7IPEu+jhP5ZU=;
	b=YXa/z0F2NUymF5awVx353yO2NLOqIhx6PYAd9mrICqPSin/sQovMeGXu++5LMXX/zoyqDc
	rGKACwiU0p/2mO3yGs7RmjoYWD7cc+388jBx3D8XzuVp6/LB3+IL7X/eLzgNYGheF0TKur
	tPvSuqdR5aVS495sNG/vE8rG5BcjPlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-sFo9vw2ONXeOpvyefeZ1yw-1; Wed, 29 Sep 2021 11:19:18 -0400
X-MC-Unique: sFo9vw2ONXeOpvyefeZ1yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EFF310247A7;
	Wed, 29 Sep 2021 15:19:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 597956A900;
	Wed, 29 Sep 2021 15:19:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D3C34EA42;
	Wed, 29 Sep 2021 15:19:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18TElSLl009731 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 10:47:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E755360CC6; Wed, 29 Sep 2021 14:47:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA63560CC9;
	Wed, 29 Sep 2021 14:47:27 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Bob Peterson <rpeterso@redhat.com>
Date: Wed, 29 Sep 2021 16:47:26 +0200
Message-Id: <20210929144726.2691676-1-agruenba@redhat.com>
In-Reply-To: <20210929131616.192330-1-rpeterso@redhat.com>
References: <20210929131616.192330-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Save caller ip in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Bob,

On Wed, Sep 29, 2021 at 3:16 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, when a glock was locked by function gfs2_glock_nq_init,
> it initializes the holder gh_ip (return address) as gfs2_glock_nq_init.
> That made it extremely difficult to track down problems because many
> functions call gfs2_glock_nq_init. This patch changes the function so
> that it saves gh_ip from the caller of gfs2_glock_nq_init, which makes
> it easy to backtrack which holder took the lock.

looks reasonable, but I think we can achieve this more cleanly by
passing _RET_IP_ to gfs2_holder_init as below.  We want the same kind of
treatment for gfs2_glock_poke as well, at least theoretically.

Thanks,
Andreas

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 6dfd33dc206b..ebf541c82635 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -829,7 +829,7 @@ static void gfs2_glock_poke(struct gfs2_glock *gl)
 	struct gfs2_holder gh;
 	int error;
 
-	gfs2_holder_init(gl, LM_ST_SHARED, flags, &gh);
+	__gfs2_holder_init(gl, LM_ST_SHARED, flags, &gh, _RET_IP_);
 	error = gfs2_glock_nq(&gh);
 	if (!error)
 		gfs2_glock_dq(&gh);
@@ -1126,12 +1126,12 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
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
index 699c5e95006a..c2b8cc7f5544 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -188,8 +188,15 @@ extern int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 extern void gfs2_glock_hold(struct gfs2_glock *gl);
 extern void gfs2_glock_put(struct gfs2_glock *gl);
 extern void gfs2_glock_queue_put(struct gfs2_glock *gl);
-extern void gfs2_holder_init(struct gfs2_glock *gl, unsigned int state,
-			     u16 flags, struct gfs2_holder *gh);
+extern void __gfs2_holder_init(struct gfs2_glock *gl, unsigned int state,
+			       u16 flags, struct gfs2_holder *gh,
+			       unsigned long ip);
+
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
2.26.3

