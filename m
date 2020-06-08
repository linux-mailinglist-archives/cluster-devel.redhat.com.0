Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4363A1F1C92
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632060;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hPaqhGQ8YKO9t7QTBTMKaS+D0jOKYYuKS3Qti9Fxiq4=;
	b=X8tUTy81493dMkSU1RLqqf/X+dtaV3G4anJn6cNef92bhcRrgZY3Vmi56Wp1hGbLVkHqXO
	KdwAwZ59wn9TjXSN3ivFzEB5N0mH8l/UNbIoZdFn1FjoFXjUejUCRPeRsqUiE8QsXuND1E
	O1JR4FHdZwC37F8/0dWhtVQpIIiaqeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-SSeILXIONxihuKL6lIGCJA-1; Mon, 08 Jun 2020 12:00:58 -0400
X-MC-Unique: SSeILXIONxihuKL6lIGCJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E9B7107B28B;
	Mon,  8 Jun 2020 16:00:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E1987F4DF;
	Mon,  8 Jun 2020 16:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A88BB348B;
	Mon,  8 Jun 2020 16:00:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0r8n011646 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 089EF648DB; Mon,  8 Jun 2020 16:00:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C4B48926C;
	Mon,  8 Jun 2020 16:00:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:25 +0200
Message-Id: <20200608160039.549204-7-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 06/20] gfs2: introduce new
	gfs2_glock_assert_withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

Before this patch, asserts based on glocks did not print the glock with
the error. This patch introduces a new macro, gfs2_glock_assert_withdraw
which first prints the glock, then takes the assert.

This also changes a few glock asserts to the new macro.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 7 ++++---
 fs/gfs2/glock.h | 9 +++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 9a5dadc93cfc..64541d8bf9ad 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -164,7 +164,7 @@ void gfs2_glock_free(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 
-	BUG_ON(atomic_read(&gl->gl_revokes));
+	gfs2_glock_assert_withdraw(gl, atomic_read(&gl->gl_revokes) == 0);
 	rhashtable_remove_fast(&gl_hash_table, &gl->gl_node, ht_parms);
 	smp_mb();
 	wake_up_glock(gl);
@@ -626,7 +626,8 @@ __acquires(&gl->gl_lockref.lock)
 		 */
 		if ((atomic_read(&gl->gl_ail_count) != 0) &&
 		    (!cmpxchg(&sdp->sd_log_error, 0, -EIO))) {
-			gfs2_assert_warn(sdp, !atomic_read(&gl->gl_ail_count));
+			gfs2_glock_assert_warn(gl,
+					       !atomic_read(&gl->gl_ail_count));
 			gfs2_dump_glock(NULL, gl, true);
 		}
 		glops->go_inval(gl, target == LM_ST_DEFERRED ? 0 : DIO_METADATA);
@@ -1836,7 +1837,7 @@ void gfs2_glock_finish_truncate(struct gfs2_inode *ip)
 	int ret;
 
 	ret = gfs2_truncatei_resume(ip);
-	gfs2_assert_withdraw(gl->gl_name.ln_sbd, ret == 0);
+	gfs2_glock_assert_withdraw(gl, ret == 0);
 
 	spin_lock(&gl->gl_lockref.lock);
 	clear_bit(GLF_LOCK, &gl->gl_flags);
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index b8adaf80e4c5..1c547dff7c57 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -205,6 +205,15 @@ extern void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl,
 #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {		\
 			gfs2_dump_glock(NULL, gl, true);	\
 			BUG(); } } while(0)
+#define gfs2_glock_assert_warn(gl, x) do { if (unlikely(!(x))) {	\
+			gfs2_dump_glock(NULL, gl, true);		\
+			gfs2_assert_warn((gl)->gl_name.ln_sbd, (x)); } } \
+	while (0)
+#define gfs2_glock_assert_withdraw(gl, x) do { if (unlikely(!(x))) {	\
+			gfs2_dump_glock(NULL, gl, true);		\
+			gfs2_assert_withdraw((gl)->gl_name.ln_sbd, (x)); } } \
+	while (0)
+
 extern __printf(2, 3)
 void gfs2_print_dbg(struct seq_file *seq, const char *fmt, ...);
 
-- 
2.26.2

