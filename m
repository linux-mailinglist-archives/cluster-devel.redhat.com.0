Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E5770AF4
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Aug 2023 23:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691184635;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yHIRX2O+6mIMxE4FpqjVQjNg4JGLX2ES7am1BfGsSwg=;
	b=D5OMWTRArdn/rvRokVvduenHXSHNQpVoj/h8Kq4W3rMlUTOogf4bkT7KR4FEkANMml7rzQ
	sGizkNEK1RaigKPcLlZPgSIIg+lX4QAGM4xBiP/f3XyoEq7H4U8+XhUosOy4KSNIqeTiAw
	q9lo9liQYM5BrGEbzdyZy4xYnFItETc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-uivrmhorPeyDPUmVcRC62g-1; Fri, 04 Aug 2023 17:30:31 -0400
X-MC-Unique: uivrmhorPeyDPUmVcRC62g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93470185A792;
	Fri,  4 Aug 2023 21:30:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB8F9F7FB8;
	Fri,  4 Aug 2023 21:30:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 637321946597;
	Fri,  4 Aug 2023 21:30:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 17109194658D for <cluster-devel@listman.corp.redhat.com>;
 Fri,  4 Aug 2023 21:30:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B7674112132E; Fri,  4 Aug 2023 21:30:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2334F1121325;
 Fri,  4 Aug 2023 21:30:22 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  4 Aug 2023 23:30:22 +0200
Message-Id: <20230804213022.1498916-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH] gfs2: Fix freeze consistency check in
 gfs2_trans_add_meta
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Function gfs2_trans_add_meta() checks for the SDF_FROZEN flag to make
sure that no buffers are added to a transaction while the filesystem is
frozen.  With the recent freeze/thaw rework, the SDF_FROZEN flag is
cleared after thaw_super() is called, which is sufficient for
serializing freeze/thaw.

However, other filesystem operations started after thaw_super() may now
be calling gfs2_trans_add_meta() before the SDF_FROZEN flag is cleared,
which will trigger the SDF_FROZEN check in gfs2_trans_add_meta().  Fix
that by checking the s_writers.frozen state instead.

In addition, make sure not to call gfs2_assert_withdraw() with the
sd_log_lock spin lock held.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/trans.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index ec1631257978..6a58880668f7 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -230,9 +230,11 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 {
 
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+	struct super_block *sb = sdp->sd_vfs;
 	struct gfs2_bufdata *bd;
 	struct gfs2_meta_header *mh;
 	struct gfs2_trans *tr = current->journal_info;
+	bool withdraw = false;
 
 	lock_buffer(bh);
 	if (buffer_pinned(bh)) {
@@ -266,9 +268,10 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 		       (unsigned long long)bd->bd_bh->b_blocknr);
 		BUG();
 	}
-	if (unlikely(test_bit(SDF_FROZEN, &sdp->sd_flags))) {
+	if (unlikely(sb->s_writers.frozen == SB_FREEZE_COMPLETE)) {
 		fs_info(sdp, "GFS2:adding buf while frozen\n");
-		gfs2_assert_withdraw(sdp, 0);
+		withdraw = true;
+		goto out_unlock;
 	}
 	if (unlikely(gfs2_withdrawn(sdp))) {
 		fs_info(sdp, "GFS2:adding buf while withdrawn! 0x%llx\n",
@@ -281,6 +284,8 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 	tr->tr_num_buf_new++;
 out_unlock:
 	gfs2_log_unlock(sdp);
+	if (withdraw)
+		gfs2_assert_withdraw(sdp, 0);
 out:
 	unlock_buffer(bh);
 }
-- 
2.40.1

