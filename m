Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE194257E7
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Oct 2021 18:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633623935;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=huN0qiqtKshcwoQQWPoOtweSqrVBgKdkPBPxqZVeYWs=;
	b=UWRFBJkaaA676wNWXnjlp1KYtMiuJpZKWNVnDi+dkWnnmBDNPo+btrcsAitS3LHd0RsRFI
	F8YBAm38fXJtRkRElBYQeEfLnGS/vNqk4ZTg0DuvnnWZj4umGr4VB8jdATUthmIKKZcQZl
	oiwgPxzxuYmZHS9t5QGZ0KfYGJTKelU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-H7vO9oRBNZiHrfChhSNirA-1; Thu, 07 Oct 2021 10:43:50 -0400
X-MC-Unique: H7vO9oRBNZiHrfChhSNirA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCD1A84A5ED;
	Thu,  7 Oct 2021 14:43:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2241226367;
	Thu,  7 Oct 2021 14:43:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7B7C4E590;
	Thu,  7 Oct 2021 14:43:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197EK8AP018284 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 10:20:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90BA6179B3; Thu,  7 Oct 2021 14:20:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D7C4652B7;
	Thu,  7 Oct 2021 14:19:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Oct 2021 16:19:49 +0200
Message-Id: <20211007141949.2948426-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix glock_hash_walk bugs
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

So far, glock_hash_walk took a reference on each glock it iterated over, and it
was the examiner's responsibility to drop those references.  Dropping the final
reference to a glock can sleep and the examiners are called in a RCU critical
section with spin locks held, so examiners that didn't need the extra reference
had to drop it asynchronously via gfs2_glock_queue_put or similar.  This wasn't
done correctly in thaw_glock which did call gfs2_glock_put, and not at all in
dump_glock_func.

Change glock_hash_walk to not take glock references at all.  That way, the
examiners that don't need them won't have to bother with slow asynchronous
puts, and the examiners that do need references can take them themselves.

Reported-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e0eaa9cf9fb6..058d06e5d8c3 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1893,10 +1893,10 @@ static void glock_hash_walk(glock_examiner examiner, const struct gfs2_sbd *sdp)
 	do {
 		rhashtable_walk_start(&iter);
 
-		while ((gl = rhashtable_walk_next(&iter)) && !IS_ERR(gl))
-			if (gl->gl_name.ln_sbd == sdp &&
-			    lockref_get_not_dead(&gl->gl_lockref))
+		while ((gl = rhashtable_walk_next(&iter)) && !IS_ERR(gl)) {
+			if (gl->gl_name.ln_sbd == sdp)
 				examiner(gl);
+		}
 
 		rhashtable_walk_stop(&iter);
 	} while (cond_resched(), gl == ERR_PTR(-EAGAIN));
@@ -1938,7 +1938,6 @@ static void flush_delete_work(struct gfs2_glock *gl)
 					   &gl->gl_delete, 0);
 		}
 	}
-	gfs2_glock_queue_work(gl, 0);
 }
 
 void gfs2_flush_delete_work(struct gfs2_sbd *sdp)
@@ -1955,10 +1954,10 @@ void gfs2_flush_delete_work(struct gfs2_sbd *sdp)
 
 static void thaw_glock(struct gfs2_glock *gl)
 {
-	if (!test_and_clear_bit(GLF_FROZEN, &gl->gl_flags)) {
-		gfs2_glock_put(gl);
+	if (!test_and_clear_bit(GLF_FROZEN, &gl->gl_flags))
+		return;
+	if (!lockref_get_not_dead(&gl->gl_lockref))
 		return;
-	}
 	set_bit(GLF_REPLY_PENDING, &gl->gl_flags);
 	gfs2_glock_queue_work(gl, 0);
 }
@@ -1974,9 +1973,12 @@ static void clear_glock(struct gfs2_glock *gl)
 	gfs2_glock_remove_from_lru(gl);
 
 	spin_lock(&gl->gl_lockref.lock);
-	if (gl->gl_state != LM_ST_UNLOCKED)
-		handle_callback(gl, LM_ST_UNLOCKED, 0, false);
-	__gfs2_glock_queue_work(gl, 0);
+	if (!__lockref_is_dead(&gl->gl_lockref)) {
+		gl->gl_lockref.count++;
+		if (gl->gl_state != LM_ST_UNLOCKED)
+			handle_callback(gl, LM_ST_UNLOCKED, 0, false);
+		__gfs2_glock_queue_work(gl, 0);
+	}
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
-- 
2.26.3

