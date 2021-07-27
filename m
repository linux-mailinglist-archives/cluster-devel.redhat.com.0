Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7AF3D7C4F
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qvQ2rhHqpSLI3oX+wWusIEeJVcqn8/S9EXC8OFwDuIs=;
	b=UQ1CTdIVPw/NQJOobPsSyvUZ5GSBtccrKrFfY7EXrP8oFh6BsqwB41EXTIq5wcCLXC80Id
	jUll6SPS8Nb0FsPTpXQOcDcH8A40Cgs5h+HSvIwnMI6ycseXYKBa74kBMHvUH8/pOzEAuH
	/WWaAbbVAvAoREDfJpFCFX/9oZWK3RI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-qm3bzncaOsGk6IJ4kI-d0g-1; Tue, 27 Jul 2021 13:37:26 -0400
X-MC-Unique: qm3bzncaOsGk6IJ4kI-d0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFDF9802928;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE21510372C2;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD003180084A;
	Tue, 27 Jul 2021 17:37:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbIGX022862 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03A84179B3; Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C91B7710C4
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:17 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:37:05 -0500
Message-Id: <20210727173709.210711-12-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 11/15] gfs2: reduce redundant code in
	gfs2_trans_add_*
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

Before this patch, functions gfs2_trans_add_data and gfs2_trans_add_meta
did similar checks to see if the buffer_head had an existing bd element,
and if not, assigned one, temporarily dropping locks to allow for better
simultaneous operations. These checks were identical except that the
meta version held the page lock after unlocking the log_lock and buffer
lock.

This patch consolidates the similar code into the helper function,
gfs2_alloc_bufdata, for consistency and to eliminate code redundancy.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/trans.c | 46 ++++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 63fec11ef2ce..4f70d381fd67 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -163,8 +163,20 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
 					       struct buffer_head *bh)
 {
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_bufdata *bd;
 
+	bd = bh->b_private;
+	if (bd)
+		goto out_check_gl;
+
+	gfs2_log_unlock(sdp);
+	unlock_buffer(bh);
+	lock_page(bh->b_page);
+	bd = bh->b_private;
+	if (bd)
+		goto out_noalloc;
+
 	bd = kmem_cache_zalloc(gfs2_bufdata_cachep, GFP_NOFS | __GFP_NOFAIL);
 	bd->bd_bh = bh;
 	bd->bd_gl = gl;
@@ -172,6 +184,12 @@ static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
 	INIT_LIST_HEAD(&bd->bd_ail_st_list);
 	INIT_LIST_HEAD(&bd->bd_ail_gl_list);
 	bh->b_private = bd;
+out_noalloc:
+	unlock_page(bh->b_page);
+	lock_buffer(bh);
+	gfs2_log_lock(sdp);
+out_check_gl:
+	gfs2_assert(sdp, bd->bd_gl == gl);
 	return bd;
 }
 
@@ -201,18 +219,7 @@ void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh)
 		goto out;
 	}
 	gfs2_log_lock(sdp);
-	bd = bh->b_private;
-	if (bd == NULL) {
-		gfs2_log_unlock(sdp);
-		unlock_buffer(bh);
-		if (bh->b_private == NULL)
-			bd = gfs2_alloc_bufdata(gl, bh);
-		else
-			bd = bh->b_private;
-		lock_buffer(bh);
-		gfs2_log_lock(sdp);
-	}
-	gfs2_assert(sdp, bd->bd_gl == gl);
+	bd = gfs2_alloc_bufdata(gl, bh);
 	set_bit(TR_TOUCHED, &tr->tr_flags);
 	if (list_empty(&bd->bd_list)) {
 		set_bit(GLF_LFLUSH, &bd->bd_gl->gl_flags);
@@ -241,20 +248,7 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 		goto out;
 	}
 	gfs2_log_lock(sdp);
-	bd = bh->b_private;
-	if (bd == NULL) {
-		gfs2_log_unlock(sdp);
-		unlock_buffer(bh);
-		lock_page(bh->b_page);
-		if (bh->b_private == NULL)
-			bd = gfs2_alloc_bufdata(gl, bh);
-		else
-			bd = bh->b_private;
-		unlock_page(bh->b_page);
-		lock_buffer(bh);
-		gfs2_log_lock(sdp);
-	}
-	gfs2_assert(sdp, bd->bd_gl == gl);
+	bd = gfs2_alloc_bufdata(gl, bh);
 	set_bit(TR_TOUCHED, &tr->tr_flags);
 	if (!list_empty(&bd->bd_list))
 		goto out_unlock;
-- 
2.31.1

