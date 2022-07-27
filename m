Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54907582AC8
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jul 2022 18:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658939082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LlkvHnTtPVOjVRLhbXLFmzddqT3ifEsXGc0o8Xe/x60=;
	b=GyhuvDiCC113u3k75JCmK+CIX1ueR98ixoMbsZagW10cq/2b3Oc67PMC61z4dLJaua1Pwt
	bwZVPpwQeB1q8+27B62LXKyb2OKKnoWalH6lpeQhKSQaaVzjaM/9tW4GBIa2lRhgQZZKQs
	tp77j6xzDohe/TsPcIXKNO1MZht9iok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-oo2kb5_zOQW-kvUyn7zBBg-1; Wed, 27 Jul 2022 12:24:39 -0400
X-MC-Unique: oo2kb5_zOQW-kvUyn7zBBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 969BC8037AF;
	Wed, 27 Jul 2022 16:24:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88B9E1415118;
	Wed, 27 Jul 2022 16:24:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 463B81945DA9;
	Wed, 27 Jul 2022 16:24:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 769B71945DA2 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5AF6740C1288; Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 345CF403D0E0
 for <cluster-devel@redhat.com>; Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 27 Jul 2022 11:02:21 -0500
Message-Id: <20220727160222.227803-3-rpeterso@redhat.com>
In-Reply-To: <20220727160222.227803-1-rpeterso@redhat.com>
References: <20220727160222.227803-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 2/3] gfs2: Dequeue waiters when withdrawn
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

When a withdraw occurs, ordinary (not system) glocks may not be granted
anymore. This patch takes measures to remove any pending waiters from
the glocks that will never be granted.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 14 ++++++++++++++
 fs/gfs2/glock.h |  1 +
 fs/gfs2/util.c  |  5 +++++
 3 files changed, 20 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e540d1290099..0bfecffd71f1 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2223,6 +2223,20 @@ static void dump_glock_func(struct gfs2_glock *gl)
 	dump_glock(NULL, gl, true);
 }
 
+static void withdraw_dq(struct gfs2_glock *gl)
+{
+	spin_lock(&gl->gl_lockref.lock);
+	if (!__lockref_is_dead(&gl->gl_lockref) &&
+	    glock_blocked_by_withdraw(gl))
+		do_error(gl, LM_OUT_ERROR); /* remove pending waiters */
+	spin_unlock(&gl->gl_lockref.lock);
+}
+
+void gfs2_gl_dq_holders(struct gfs2_sbd *sdp)
+{
+	glock_hash_walk(withdraw_dq, sdp);
+}
+
 /**
  * gfs2_gl_hash_clear - Empty out the glock hash table
  * @sdp: the filesystem
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index c0ae9100a0bc..d6fc449aa7ff 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -273,6 +273,7 @@ extern void gfs2_cancel_delete_work(struct gfs2_glock *gl);
 extern bool gfs2_delete_work_queued(const struct gfs2_glock *gl);
 extern void gfs2_flush_delete_work(struct gfs2_sbd *sdp);
 extern void gfs2_gl_hash_clear(struct gfs2_sbd *sdp);
+extern void gfs2_gl_dq_holders(struct gfs2_sbd *sdp);
 extern void gfs2_glock_finish_truncate(struct gfs2_inode *ip);
 extern void gfs2_glock_thaw(struct gfs2_sbd *sdp);
 extern void gfs2_glock_add_to_lru(struct gfs2_glock *gl);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 78cb12d0fba1..acf94c83b29b 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -164,6 +164,11 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 		}
 		if (!ret)
 			gfs2_make_fs_ro(sdp);
+		/*
+		 * Dequeue any pending non-system glock holders that can no
+		 * longer be granted because the file system is withdrawn.
+		 */
+		gfs2_gl_dq_holders(sdp);
 		gfs2_freeze_unlock(&freeze_gh);
 	}
 
-- 
2.36.1

