Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A93441F03E5
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wbo4RSeXShZGwLrJPoHWeLTdSAlUwS+l8Wf4TPW2LIw=;
	b=bSdveaXlCAfggQBeK7xiERQfgAL11tqIRJ3HKgrCaJvMjpdJ9vpiAS/DH4dJz/wNzDPEpz
	RkeR9LOf+r+LwvAdPot67376b4HpFmZKcmmLTXRsLcgFSJQkW+UYHYGPAmVonOkIHjaiJa
	PK1Kqo5ofHQwsD5o9Z4SmJgvWiij3wg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-gG96nqT0O-Ga7dkd9MrCAA-1; Fri, 05 Jun 2020 20:24:06 -0400
X-MC-Unique: gG96nqT0O-Ga7dkd9MrCAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFEBC835B47;
	Sat,  6 Jun 2020 00:24:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0FBF7BA04;
	Sat,  6 Jun 2020 00:24:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EC858A8CA;
	Sat,  6 Jun 2020 00:24:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Gl96l020702 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:47:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 317CE7B610; Fri,  5 Jun 2020 16:47:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-115-80.phx2.redhat.com [10.3.115.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E86937B60D
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:47:08 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  5 Jun 2020 11:47:00 -0500
Message-Id: <20200605164701.30776-6-rpeterso@redhat.com>
In-Reply-To: <20200605164701.30776-1-rpeterso@redhat.com>
References: <20200605164701.30776-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 5/6] gfs2: new slab for transactions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds a new slab for gfs2 transactions. That allows us to
have an initialization function and protect against some errors.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c |  2 ++
 fs/gfs2/log.c   |  9 +++++----
 fs/gfs2/main.c  |  9 +++++++++
 fs/gfs2/trans.c | 22 ++++++++++++++++++----
 fs/gfs2/trans.h |  1 +
 fs/gfs2/util.c  |  1 +
 fs/gfs2/util.h  |  1 +
 7 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4862dae868a2..224fb3bd503c 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -91,6 +91,8 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	memset(&tr, 0, sizeof(tr));
 	INIT_LIST_HEAD(&tr.tr_buf);
 	INIT_LIST_HEAD(&tr.tr_databuf);
+	INIT_LIST_HEAD(&tr.tr_ail1_list);
+	INIT_LIST_HEAD(&tr.tr_ail2_list);
 	tr.tr_revokes = atomic_read(&gl->gl_ail_count);
 
 	if (!tr.tr_revokes) {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index fcc7f58d74f0..64efa3f743af 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -30,6 +30,7 @@
 #include "util.h"
 #include "dir.h"
 #include "trace_gfs2.h"
+#include "trans.h"
 
 static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
 
@@ -378,7 +379,7 @@ static void ail2_empty(struct gfs2_sbd *sdp, unsigned int new_tail)
 		list_del(&tr->tr_list);
 		gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
 		gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
-		kfree(tr);
+		gfs2_trans_free(sdp, tr);
 	}
 
 	spin_unlock(&sdp->sd_ail_lock);
@@ -863,14 +864,14 @@ static void ail_drain(struct gfs2_sbd *sdp)
 		gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail1_list);
 		gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
 		list_del(&tr->tr_list);
-		kfree(tr);
+		gfs2_trans_free(sdp, tr);
 	}
 	while (!list_empty(&sdp->sd_ail2_list)) {
 		tr = list_first_entry(&sdp->sd_ail2_list, struct gfs2_trans,
 				      tr_list);
 		gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
 		list_del(&tr->tr_list);
-		kfree(tr);
+		gfs2_trans_free(sdp, tr);
 	}
 	spin_unlock(&sdp->sd_ail_lock);
 }
@@ -1010,7 +1011,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	trace_gfs2_log_flush(sdp, 0, flags);
 	up_write(&sdp->sd_log_flush_lock);
 
-	kfree(tr);
+	gfs2_trans_free(sdp, tr);
 }
 
 /**
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index a1a295b739fb..733470ca6be9 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -143,6 +143,12 @@ static int __init init_gfs2_fs(void)
 	if (!gfs2_qadata_cachep)
 		goto fail_cachep7;
 
+	gfs2_trans_cachep = kmem_cache_create("gfs2_trans",
+					       sizeof(struct gfs2_trans),
+					       0, 0, NULL);
+	if (!gfs2_trans_cachep)
+		goto fail_cachep8;
+
 	error = register_shrinker(&gfs2_qd_shrinker);
 	if (error)
 		goto fail_shrinker;
@@ -194,6 +200,8 @@ static int __init init_gfs2_fs(void)
 fail_fs1:
 	unregister_shrinker(&gfs2_qd_shrinker);
 fail_shrinker:
+	kmem_cache_destroy(gfs2_trans_cachep);
+fail_cachep8:
 	kmem_cache_destroy(gfs2_qadata_cachep);
 fail_cachep7:
 	kmem_cache_destroy(gfs2_quotad_cachep);
@@ -236,6 +244,7 @@ static void __exit exit_gfs2_fs(void)
 	rcu_barrier();
 
 	mempool_destroy(gfs2_page_pool);
+	kmem_cache_destroy(gfs2_trans_cachep);
 	kmem_cache_destroy(gfs2_qadata_cachep);
 	kmem_cache_destroy(gfs2_quotad_cachep);
 	kmem_cache_destroy(gfs2_rgrpd_cachep);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index ffe840505082..aa7cd0abb369 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -37,7 +37,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
 		return -EROFS;
 
-	tr = kzalloc(sizeof(struct gfs2_trans), GFP_NOFS);
+	tr = kmem_cache_zalloc(gfs2_trans_cachep, GFP_NOFS);
 	if (!tr)
 		return -ENOMEM;
 
@@ -53,6 +53,9 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	INIT_LIST_HEAD(&tr->tr_databuf);
 	INIT_LIST_HEAD(&tr->tr_buf);
 
+	INIT_LIST_HEAD(&tr->tr_ail1_list);
+	INIT_LIST_HEAD(&tr->tr_ail2_list);
+
 	sb_start_intwrite(sdp->sd_vfs);
 
 	error = gfs2_log_reserve(sdp, tr->tr_reserved);
@@ -65,7 +68,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 
 fail:
 	sb_end_intwrite(sdp->sd_vfs);
-	kfree(tr);
+	kmem_cache_free(gfs2_trans_cachep, tr);
 
 	return error;
 }
@@ -93,7 +96,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
 		gfs2_log_release(sdp, tr->tr_reserved);
 		if (alloced) {
-			kfree(tr);
+			gfs2_trans_free(sdp, tr);
 			sb_end_intwrite(sdp->sd_vfs);
 		}
 		return;
@@ -109,7 +112,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 
 	gfs2_log_commit(sdp, tr);
 	if (alloced && !test_bit(TR_ATTACHED, &tr->tr_flags))
-		kfree(tr);
+		gfs2_trans_free(sdp, tr);
 	up_read(&sdp->sd_log_flush_lock);
 
 	if (sdp->sd_vfs->s_flags & SB_SYNCHRONOUS)
@@ -276,3 +279,14 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 	gfs2_log_unlock(sdp);
 }
 
+void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+{
+	if (tr == NULL)
+		return;
+
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_databuf));
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_buf));
+	kmem_cache_free(gfs2_trans_cachep, tr);
+}
diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
index 6071334de035..83199ce5a5c5 100644
--- a/fs/gfs2/trans.h
+++ b/fs/gfs2/trans.h
@@ -42,5 +42,6 @@ extern void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh);
 extern void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh);
 extern void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
 extern void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len);
+extern void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr);
 
 #endif /* __TRANS_DOT_H__ */
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index aa087a5675af..1cd0328cae20 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -32,6 +32,7 @@ struct kmem_cache *gfs2_bufdata_cachep __read_mostly;
 struct kmem_cache *gfs2_rgrpd_cachep __read_mostly;
 struct kmem_cache *gfs2_quotad_cachep __read_mostly;
 struct kmem_cache *gfs2_qadata_cachep __read_mostly;
+struct kmem_cache *gfs2_trans_cachep __read_mostly;
 mempool_t *gfs2_page_pool __read_mostly;
 
 void gfs2_assert_i(struct gfs2_sbd *sdp)
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index a3542560da6f..6d9157efe16c 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -172,6 +172,7 @@ extern struct kmem_cache *gfs2_bufdata_cachep;
 extern struct kmem_cache *gfs2_rgrpd_cachep;
 extern struct kmem_cache *gfs2_quotad_cachep;
 extern struct kmem_cache *gfs2_qadata_cachep;
+extern struct kmem_cache *gfs2_trans_cachep;
 extern mempool_t *gfs2_page_pool;
 extern struct workqueue_struct *gfs2_control_wq;
 
-- 
2.26.2

