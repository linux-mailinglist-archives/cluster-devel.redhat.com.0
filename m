Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3163F5FCA
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 16:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629813778;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kyB7tKweXFlblOpM58JPM7hKT7yAasvFvBT7AbMGxtI=;
	b=OdR4b+ALuomMsw0jIJcr/OG4wSHjFsJMagsAV7bjgYBlb7XLE85iKvdy96IwU/knYAh+Zr
	6RufZ8RoLipIjeNDFwKDTBr5iH6PLlW3TruA11G0lGRhjA8vDW4dpdp1UaclbwYReoUB3g
	OCM1R6dvDnXLrGgow15BFEeKngrBSDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-GX9NdzQ0Or-BdSeTG_lFAQ-1; Tue, 24 Aug 2021 10:02:55 -0400
X-MC-Unique: GX9NdzQ0Or-BdSeTG_lFAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C7187180C;
	Tue, 24 Aug 2021 14:02:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E69725C3DF;
	Tue, 24 Aug 2021 14:02:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2092181A1F3;
	Tue, 24 Aug 2021 14:02:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OE2jfW000454 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 10:02:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D48D060C82; Tue, 24 Aug 2021 14:02:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-176.phx2.redhat.com [10.3.114.176])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3BD860C0F
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 14:02:45 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 24 Aug 2021 09:02:39 -0500
Message-Id: <20210824140241.149386-2-rpeterso@redhat.com>
In-Reply-To: <20210824140241.149386-1-rpeterso@redhat.com>
References: <20210824140241.149386-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: switch go_xmote_bh glop to
	pass gh not gl
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

Before this patch, the go_xmote_bh function was passed gl, the glock
pointer. This patch switches it to gh, the holder, which points to the gl.
This facilitates improvements for the next patch.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 4 ++--
 fs/gfs2/glops.c  | 5 +++--
 fs/gfs2/incore.h | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e0eaa9cf9fb6..d43eed1696ab 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -562,9 +562,9 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 	if (test_and_clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags))
 		gfs2_demote_wake(gl);
 	if (state != LM_ST_UNLOCKED) {
-		if (glops->go_xmote_bh) {
+		if (gh && glops->go_xmote_bh) {
 			spin_unlock(&gl->gl_lockref.lock);
-			rv = glops->go_xmote_bh(gl);
+			rv = glops->go_xmote_bh(gh);
 			spin_lock(&gl->gl_lockref.lock);
 			if (rv) {
 				do_error(gl, rv);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 79c621c7863d..6d0770564493 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -598,10 +598,11 @@ static int freeze_go_sync(struct gfs2_glock *gl)
 
 /**
  * freeze_go_xmote_bh - After promoting/demoting the freeze glock
- * @gl: the glock
+ * @gh: the holder of the glock
  */
-static int freeze_go_xmote_bh(struct gfs2_glock *gl)
+static int freeze_go_xmote_bh(struct gfs2_holder *gh)
 {
+	struct gfs2_glock *gl = gh->gh_gl;
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
 	struct gfs2_glock *j_gl = ip->i_gl;
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 0fe49770166e..354d6230d0f7 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -217,7 +217,7 @@ struct lm_lockname {
 
 struct gfs2_glock_operations {
 	int (*go_sync) (struct gfs2_glock *gl);
-	int (*go_xmote_bh)(struct gfs2_glock *gl);
+	int (*go_xmote_bh)(struct gfs2_holder *gh);
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
 	int (*go_lock) (struct gfs2_holder *gh);
-- 
2.31.1

