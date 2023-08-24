Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D234787A17
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=luy4+e9pBeZL1IZglkE54muJ12Qp4rqBWu041d/z1RQ=;
	b=QzMtW/FsZnGwTcxy8vhs+ohLAI3b6QgfnoudMBqr8n1kh76i2GMVrkAdkXxUft0pQQ+adR
	uYJBLbHewCjRiH/Ding/fnpWFvpilEU7+UxgXVAyRBajHvbxz1bP2woMyJ0POn3vtbFqqu
	ZQPDujWb0OlHuTl9yehngL71OcQYo3w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-itr-y2vqN6yyxSpnASFItg-1; Thu, 24 Aug 2023 17:19:53 -0400
X-MC-Unique: itr-y2vqN6yyxSpnASFItg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E8E4800C7A;
	Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83E7140C2073;
	Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5536B19465B1;
	Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 99DB81946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 87A8AC1602F; Thu, 24 Aug 2023 21:19:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0682C1602B;
 Thu, 24 Aug 2023 21:19:49 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:40 +0200
Message-Id: <20230824211948.3242607-2-agruenba@redhat.com>
In-Reply-To: <20230824211948.3242607-1-agruenba@redhat.com>
References: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 1/9] gfs2: Use qd_sbd more consequently
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Bob Peterson <rpeterso@redhat.com>

Before this patch many of the functions in quota.c got their superblock
pointer, sdp, from the quota_data's glock pointer. That's silly because
the qd already has its own pointer to the superblock (qd_sbd).

This patch changes references to use that instead, eliminating a level
of indirection.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/quota.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 96d41ee034d7..48b9fbffe260 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -119,7 +119,7 @@ static void gfs2_qd_dispose(struct list_head *list)
 
 	while (!list_empty(list)) {
 		qd = list_first_entry(list, struct gfs2_quota_data, qd_lru);
-		sdp = qd->qd_gl->gl_name.ln_sbd;
+		sdp = qd->qd_sbd;
 
 		list_del(&qd->qd_lru);
 
@@ -302,7 +302,7 @@ static int qd_get(struct gfs2_sbd *sdp, struct kqid qid,
 
 static void qd_hold(struct gfs2_quota_data *qd)
 {
-	struct gfs2_sbd *sdp = qd->qd_gl->gl_name.ln_sbd;
+	struct gfs2_sbd *sdp = qd->qd_sbd;
 	gfs2_assert(sdp, !__lockref_is_dead(&qd->qd_lockref));
 	lockref_get(&qd->qd_lockref);
 }
@@ -367,7 +367,7 @@ static void slot_put(struct gfs2_quota_data *qd)
 
 static int bh_get(struct gfs2_quota_data *qd)
 {
-	struct gfs2_sbd *sdp = qd->qd_gl->gl_name.ln_sbd;
+	struct gfs2_sbd *sdp = qd->qd_sbd;
 	struct inode *inode = sdp->sd_qc_inode;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	unsigned int block, offset;
@@ -421,7 +421,7 @@ static int bh_get(struct gfs2_quota_data *qd)
 
 static void bh_put(struct gfs2_quota_data *qd)
 {
-	struct gfs2_sbd *sdp = qd->qd_gl->gl_name.ln_sbd;
+	struct gfs2_sbd *sdp = qd->qd_sbd;
 
 	mutex_lock(&sdp->sd_quota_mutex);
 	gfs2_assert(sdp, qd->qd_bh_count);
@@ -489,8 +489,7 @@ static int qd_fish(struct gfs2_sbd *sdp, struct gfs2_quota_data **qdp)
 
 static void qd_unlock(struct gfs2_quota_data *qd)
 {
-	gfs2_assert_warn(qd->qd_gl->gl_name.ln_sbd,
-			 test_bit(QDF_LOCKED, &qd->qd_flags));
+	gfs2_assert_warn(qd->qd_sbd, test_bit(QDF_LOCKED, &qd->qd_flags));
 	clear_bit(QDF_LOCKED, &qd->qd_flags);
 	bh_put(qd);
 	slot_put(qd);
@@ -666,7 +665,7 @@ static int sort_qd(const void *a, const void *b)
 
 static void do_qc(struct gfs2_quota_data *qd, s64 change, int qc_type)
 {
-	struct gfs2_sbd *sdp = qd->qd_gl->gl_name.ln_sbd;
+	struct gfs2_sbd *sdp = qd->qd_sbd;
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_qc_inode);
 	struct gfs2_quota_change *qc = qd->qd_bh_qc;
 	s64 x;
@@ -881,7 +880,7 @@ static int gfs2_adjust_quota(struct gfs2_inode *ip, loff_t loc,
 
 static int do_sync(unsigned int num_qd, struct gfs2_quota_data **qda)
 {
-	struct gfs2_sbd *sdp = (*qda)->qd_gl->gl_name.ln_sbd;
+	struct gfs2_sbd *sdp = (*qda)->qd_sbd;
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_quota_inode);
 	struct gfs2_alloc_parms ap = { .aflags = 0, };
 	unsigned int data_blocks, ind_blocks;
@@ -1009,11 +1008,12 @@ static int update_qd(struct gfs2_sbd *sdp, struct gfs2_quota_data *qd)
 static int do_glock(struct gfs2_quota_data *qd, int force_refresh,
 		    struct gfs2_holder *q_gh)
 {
-	struct gfs2_sbd *sdp = qd->qd_gl->gl_name.ln_sbd;
+	struct gfs2_sbd *sdp = qd->qd_sbd;
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_quota_inode);
 	struct gfs2_holder i_gh;
 	int error;
 
+	gfs2_assert_warn(sdp, sdp == qd->qd_gl->gl_name.ln_sbd);
 restart:
 	error = gfs2_glock_nq_init(qd->qd_gl, LM_ST_SHARED, 0, q_gh);
 	if (error)
@@ -1091,7 +1091,7 @@ int gfs2_quota_lock(struct gfs2_inode *ip, kuid_t uid, kgid_t gid)
 
 static int need_sync(struct gfs2_quota_data *qd)
 {
-	struct gfs2_sbd *sdp = qd->qd_gl->gl_name.ln_sbd;
+	struct gfs2_sbd *sdp = qd->qd_sbd;
 	struct gfs2_tune *gt = &sdp->sd_tune;
 	s64 value;
 	unsigned int num, den;
@@ -1178,7 +1178,7 @@ void gfs2_quota_unlock(struct gfs2_inode *ip)
 
 static int print_message(struct gfs2_quota_data *qd, char *type)
 {
-	struct gfs2_sbd *sdp = qd->qd_gl->gl_name.ln_sbd;
+	struct gfs2_sbd *sdp = qd->qd_sbd;
 
 	fs_info(sdp, "quota %s for %s %u\n",
 		type,
-- 
2.40.1

