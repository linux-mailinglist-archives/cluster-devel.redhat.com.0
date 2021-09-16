Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 98C9540EAB0
	for <lists+cluster-devel@lfdr.de>; Thu, 16 Sep 2021 21:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631819442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MuTQoBk96NMyVB6aznwLuZqjFl0LXAvinwjz9tkTNIE=;
	b=fYZK7OqwI2P/lYzfkkGoORVrCA+ENZYKNLwQPHeLUWCA4m1LIva3VkBE2QZ7gX5pOsYcoz
	4YzVjmmeNoVrMw317nHFr7PkFEsGno+znxV/sIRPIKIbtXGRT5QrDhXWtQbyAZ6pY/ciJ3
	iH/568DsrNRbC8iJusb1NwD1mTjMtQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-8n2TcEKANlCFptya0w-vKg-1; Thu, 16 Sep 2021 15:10:41 -0400
X-MC-Unique: 8n2TcEKANlCFptya0w-vKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49149801B3D;
	Thu, 16 Sep 2021 19:10:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F291007607;
	Thu, 16 Sep 2021 19:10:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2C5E4EA2A;
	Thu, 16 Sep 2021 19:10:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GJAbk1021614 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 15:10:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 087775C1CF; Thu, 16 Sep 2021 19:10:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-63.phx2.redhat.com [10.3.114.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7F885C1C5
	for <cluster-devel@redhat.com>; Thu, 16 Sep 2021 19:10:36 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 16 Sep 2021 14:10:02 -0500
Message-Id: <20210916191003.105866-6-rpeterso@redhat.com>
In-Reply-To: <20210916191003.105866-1-rpeterso@redhat.com>
References: <20210916191003.105866-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2 5/6] gfs2: simplify do_promote and
	fix promote trace
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, the gfs2_promote kernel trace point would would only
record the "first" flag if the go_lock function was called. This patch
simplifies do_promote by eliminating the redundant code in do_promote
and fixes the trace point by adding a new gfs2_first_holder function.
This will also be used in a future patch.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 19 ++++++++++++-------
 fs/gfs2/glock.h |  7 +++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b8248ceff3c3..4fcf340603e7 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -394,6 +394,7 @@ __acquires(&gl->gl_lockref.lock)
 {
 	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	struct gfs2_holder *gh, *tmp;
+	int first;
 	int ret;
 
 restart:
@@ -401,8 +402,8 @@ __acquires(&gl->gl_lockref.lock)
 		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
 			continue;
 		if (may_grant(gl, gh)) {
-			if (gh->gh_list.prev == &gl->gl_holders &&
-			    glops->go_lock) {
+			first = gfs2_first_holder(gh);
+			if (first && glops->go_lock) {
 				if (!(gh->gh_flags & GL_SKIP)) {
 					spin_unlock(&gl->gl_lockref.lock);
 					/* FIXME: eliminate this eventually */
@@ -418,14 +419,18 @@ __acquires(&gl->gl_lockref.lock)
 						goto restart;
 					}
 				}
-				set_bit(HIF_HOLDER, &gh->gh_iflags);
-				trace_gfs2_promote(gh, 1);
-				gfs2_holder_wake(gh);
-				goto restart;
 			}
 			set_bit(HIF_HOLDER, &gh->gh_iflags);
-			trace_gfs2_promote(gh, 0);
+			trace_gfs2_promote(gh, first);
 			gfs2_holder_wake(gh);
+			/*
+			 * If this was the first holder, we may have released
+			 * the gl_lockref.lock, so the holders list may have
+			 * changed. For that reason, we start again at the
+			 * start of the holders queue.
+			 */
+			if (first)
+				goto restart;
 			continue;
 		}
 		if (gh->gh_list.prev == &gl->gl_holders)
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 31a8f2f649b5..699c5e95006a 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -325,6 +325,13 @@ static inline void glock_clear_object(struct gfs2_glock *gl, void *object)
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
+static inline bool gfs2_first_holder(struct gfs2_holder *gh)
+{
+	struct gfs2_glock *gl = gh->gh_gl;
+
+	return (gh->gh_list.prev == &gl->gl_holders);
+}
+
 extern void gfs2_inode_remember_delete(struct gfs2_glock *gl, u64 generation);
 extern bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64 generation);
 
-- 
2.31.1

