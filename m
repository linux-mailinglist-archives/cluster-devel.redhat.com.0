Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B201B787A1A
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911998;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m3vE6xlyjNAZJCw39CBy7JTyclKeEnRC4hxNXSzFX6A=;
	b=GMbpSyk6OUQ2d0vTfjbQzxKZ5OBF8sWLLj0mPioRA0KDC1idTm5C99IBihX6af+7mzdDVT
	mB3fhwQC0ypJqDUB1DPB4N+KrRYVDXv7WseKgKc674u2u0aU/Jpi1YbtubY5FZVvAXR4G0
	q+dB/si7h8gp2lCfobksL/0Hgh0lKsc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-aCXbvvrnMYaVFgdULoyYDw-1; Thu, 24 Aug 2023 17:19:54 -0400
X-MC-Unique: aCXbvvrnMYaVFgdULoyYDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD1B88015A8;
	Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2AC9140E962;
	Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 62AD71946589;
	Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FB5719465B1 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4FA2FC1602F; Thu, 24 Aug 2023 21:19:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C563DC1602B;
 Thu, 24 Aug 2023 21:19:50 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:41 +0200
Message-Id: <20230824211948.3242607-3-agruenba@redhat.com>
In-Reply-To: <20230824211948.3242607-1-agruenba@redhat.com>
References: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 2/9] gfs2: Rename sd_{ glock => kill }_wait
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Rename sd_glock_wait to sd_kill_wait: we'll use it for other things
related to "killing" a filesystem on unmount soon (kill_sb).

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c      | 6 +++---
 fs/gfs2/incore.h     | 2 +-
 fs/gfs2/ops_fstype.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 675bfec77706..e242745cf40f 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -176,7 +176,7 @@ void gfs2_glock_free(struct gfs2_glock *gl)
 	wake_up_glock(gl);
 	call_rcu(&gl->gl_rcu, gfs2_glock_dealloc);
 	if (atomic_dec_and_test(&sdp->sd_glock_disposal))
-		wake_up(&sdp->sd_glock_wait);
+		wake_up(&sdp->sd_kill_wait);
 }
 
 /**
@@ -1231,7 +1231,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 out_free:
 	gfs2_glock_dealloc(&gl->gl_rcu);
 	if (atomic_dec_and_test(&sdp->sd_glock_disposal))
-		wake_up(&sdp->sd_glock_wait);
+		wake_up(&sdp->sd_kill_wait);
 
 out:
 	return ret;
@@ -2188,7 +2188,7 @@ void gfs2_gl_hash_clear(struct gfs2_sbd *sdp)
 	flush_workqueue(glock_workqueue);
 	glock_hash_walk(clear_glock, sdp);
 	flush_workqueue(glock_workqueue);
-	wait_event_timeout(sdp->sd_glock_wait,
+	wait_event_timeout(sdp->sd_kill_wait,
 			   atomic_read(&sdp->sd_glock_disposal) == 0,
 			   HZ * 600);
 	glock_hash_walk(dump_glock_func, sdp);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 04f2d78e8658..7abb43bb8df0 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -716,7 +716,7 @@ struct gfs2_sbd {
 	struct gfs2_glock *sd_rename_gl;
 	struct gfs2_glock *sd_freeze_gl;
 	struct work_struct sd_freeze_work;
-	wait_queue_head_t sd_glock_wait;
+	wait_queue_head_t sd_kill_wait;
 	wait_queue_head_t sd_async_glock_wait;
 	atomic_t sd_glock_disposal;
 	struct completion sd_locking_init;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 8a27957dbfee..19d19491c0d1 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -87,7 +87,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 	set_bit(SDF_NOJOURNALID, &sdp->sd_flags);
 	gfs2_tune_init(&sdp->sd_tune);
 
-	init_waitqueue_head(&sdp->sd_glock_wait);
+	init_waitqueue_head(&sdp->sd_kill_wait);
 	init_waitqueue_head(&sdp->sd_async_glock_wait);
 	atomic_set(&sdp->sd_glock_disposal, 0);
 	init_completion(&sdp->sd_locking_init);
-- 
2.40.1

