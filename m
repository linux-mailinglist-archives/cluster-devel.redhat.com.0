Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D187A598B3D
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Aug 2022 20:32:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660847569;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2QA4CR1Z+Gj/4YUyNj2waps/dpjAPMFZTjUWWf0Qr4c=;
	b=SN8em7KU/0kWU5A2R4pUD31bYC+83Fw/CmkjtiMg7r0eaYNtgwqteXz4S7aVhTvvVGdBEx
	Wq5XuJF1Ne6QfT+grwSU7h+VeaNCBKSfVyoc89GivRanGMotSA0Bm9Pv4UvboDlqxd1mG8
	XFBNj6BW4ck3ju9Uv8dhEdWCNMj19c4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-iaZNludXMEui1GHESR3U7g-1; Thu, 18 Aug 2022 14:32:45 -0400
X-MC-Unique: iaZNludXMEui1GHESR3U7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37ACD380670E;
	Thu, 18 Aug 2022 18:32:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 743C52166B26;
	Thu, 18 Aug 2022 18:32:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6247C194F847;
	Thu, 18 Aug 2022 18:32:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1B44F1946A41 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 18:32:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F23BFC15BC3; Thu, 18 Aug 2022 18:32:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.17.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD7D4C15BBA
 for <cluster-devel@redhat.com>; Thu, 18 Aug 2022 18:32:39 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 18 Aug 2022 13:32:37 -0500
Message-Id: <20220818183238.121677-3-rpeterso@redhat.com>
In-Reply-To: <20220818183238.121677-1-rpeterso@redhat.com>
References: <20220818183238.121677-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [GFS2 v3 PATCH 2/3] gfs2: Dequeue waiters when
 withdrawn
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
index 0b36a16659b6..0ffe7d474cd5 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2194,6 +2194,20 @@ static void dump_glock_func(struct gfs2_glock *gl)
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
index 5aed8b500cf5..0199a3dcb114 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -274,6 +274,7 @@ extern void gfs2_cancel_delete_work(struct gfs2_glock *gl);
 extern bool gfs2_delete_work_queued(const struct gfs2_glock *gl);
 extern void gfs2_flush_delete_work(struct gfs2_sbd *sdp);
 extern void gfs2_gl_hash_clear(struct gfs2_sbd *sdp);
+extern void gfs2_gl_dq_holders(struct gfs2_sbd *sdp);
 extern void gfs2_glock_thaw(struct gfs2_sbd *sdp);
 extern void gfs2_glock_add_to_lru(struct gfs2_glock *gl);
 extern void gfs2_glock_free(struct gfs2_glock *gl);
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
2.37.2

