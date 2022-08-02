Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6AB588160
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 19:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659463097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7o+r9ooQ072NnbAkpvQi+GJ/qJOu7ATdsdJCjkaISgo=;
	b=eEEhvKZQLM952uvMQH+PyNUBVAxJMRcfWJ/PQk34sapM2/4ptTNHptZLFmTFDAB5o9pFoo
	bLAQW5AzS+J103voJyYk8WdXt38cZwI8RMmTJcQI5VVdjyCLh3BnuNg1WK7cNu0Czbj/Lg
	ds167r5GdsGv8bKFDRopr7CUrjRtZ1I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-hzftx7mJOkuCmIL9x1KXJA-1; Tue, 02 Aug 2022 13:58:15 -0400
X-MC-Unique: hzftx7mJOkuCmIL9x1KXJA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B84718F0262;
	Tue,  2 Aug 2022 17:58:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A21A7492C3B;
	Tue,  2 Aug 2022 17:58:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 59DE61946A5C;
	Tue,  2 Aug 2022 17:58:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E7F91946A57 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 17:58:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E62F51410F3C; Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE6DF1410DDA
 for <cluster-devel@redhat.com>; Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue,  2 Aug 2022 12:58:10 -0500
Message-Id: <20220802175811.438067-3-rpeterso@redhat.com>
In-Reply-To: <20220802175811.438067-1-rpeterso@redhat.com>
References: <20220802175811.438067-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

When a withdraw occurs, ordinary (not system) glocks may not be granted
anymore. Later, when the file system is unmounted, gfs2_gl_hash_clear()
tries to clear out all the glocks, but these un-grantable pending
waiters prevent some glocks from being freed. So the unmount hangs, at
least for its ten-minute timeout period.

This patch takes measures to remove any pending waiters from
the glocks that will never be granted. This allows the unmount to
proceed in a reasonable period of time.

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
index 95c79a3ec161..88185a341504 100644
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

