Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 87C341E22B0
	for <lists+cluster-devel@lfdr.de>; Tue, 26 May 2020 15:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590498438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bLBK8Vzero1OUNvI6dh/HgfhT7UvrHrEI1pRgSkuvWM=;
	b=eF8S8j0vZMfw55gjNi0N1/csDWlwecJftI94fvcQV3IgA/KB843K7Wxe1Lh/rM3NOLm6MX
	DVp3wjutbDlMlEXaRCsMDPSIXmn4VwI0f1xa3WUvvMxRJohV7yU7w8h8NaT76z7D5EgWw4
	ex+fc+mswZK76HFaPOgISIAJrX5QO1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-lo7-ihz-OPyBteRz9PqA8A-1; Tue, 26 May 2020 09:07:14 -0400
X-MC-Unique: lo7-ihz-OPyBteRz9PqA8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262F1100CC8C;
	Tue, 26 May 2020 13:07:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 141709F63;
	Tue, 26 May 2020 13:07:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F20D41809554;
	Tue, 26 May 2020 13:07:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04QD5gNm010720 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 09:05:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C05025D9E7; Tue, 26 May 2020 13:05:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B3E15D9E5
	for <cluster-devel@redhat.com>; Tue, 26 May 2020 13:05:42 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 26 May 2020 08:05:36 -0500
Message-Id: <20200526130536.295081-9-rpeterso@redhat.com>
In-Reply-To: <20200526130536.295081-1-rpeterso@redhat.com>
References: <20200526130536.295081-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 8/8] gfs2: introduce new
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Before this patch, asserts based on glocks did not print the glock with
the error. This patch introduces a new macro, gfs2_glock_assert_withdraw
which first prints the glock, then takes the assert.

This also changes a few glock asserts to the new macro.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
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
index b8adaf80e4c5..8472d5ba0142 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -205,6 +205,15 @@ extern void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl,
 #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {		\
 			gfs2_dump_glock(NULL, gl, true);	\
 			BUG(); } } while(0)
+#define gfs2_glock_assert_warn(gl, x) do { if (unlikely(!(x))) {	\
+			gfs2_dump_glock(NULL, gl, true);		\
+			gfs2_assert_warn((gl)->gl_name.ln_sbd, (x)); } } \
+	while(0)
+#define gfs2_glock_assert_withdraw(gl, x) do { if (unlikely(!(x))) {	\
+			gfs2_dump_glock(NULL, gl, true);		\
+			gfs2_assert_withdraw((gl)->gl_name.ln_sbd, (x)); } } \
+	while(0)
+
 extern __printf(2, 3)
 void gfs2_print_dbg(struct seq_file *seq, const char *fmt, ...);
 
-- 
2.26.2

