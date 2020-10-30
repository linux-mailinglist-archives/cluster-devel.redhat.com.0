Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0382A1098
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:53:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eFn2vQPARvIZVSxxv630NPResTlIx7UvuIGkDocBvvs=;
	b=NI9S/I9ALthvYNcQmLka/0VJRjvSvHbPuRj3BYs2/DPJH8dTIwKVg0HGF38f+wlmsIy8NJ
	wyXhx3jwmjKa/+adaUvPvCcN4yP9vtjYsT3IDpdKkePEv39iOB7UloJxoy4hkx/pdgrhdO
	nHf2Hv7Yva4Bkb3ahLaJqzUJDQVW/xM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-d3eObBkhOne2nFjGY2x_9g-1; Fri, 30 Oct 2020 17:53:41 -0400
X-MC-Unique: d3eObBkhOne2nFjGY2x_9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB9C283DC21;
	Fri, 30 Oct 2020 21:53:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB0A35C1C4;
	Fri, 30 Oct 2020 21:53:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5EF8181A86E;
	Fri, 30 Oct 2020 21:53:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULrSKQ024273 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:53:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E25B5756DE; Fri, 30 Oct 2020 21:53:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3551168433;
	Fri, 30 Oct 2020 21:53:21 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:51 +0100
Message-Id: <20201030215152.1567790-17-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 16/17] gfs2: Allow node-wide exclusive glock
	sharing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Bob Peterson <rpeterso@redhat.com>

Introduce a new LM_FLAG_NODE_SCOPE glock holder flag: when taking a
glock in LM_ST_EXCLUSIVE (EX) mode and with the LM_FLAG_NODE_SCOPE flag
set, the exclusive lock is shared among all local processes who are
holding the glock in EX mode and have the LM_FLAG_NODE_SCOPE flag set.
>From the point of view of other nodes, the lock is still held
exclusively.

A future patch will start using this flag to improve performance with
rgrp sharing.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 22 +++++++++++++++++++---
 fs/gfs2/glock.h |  6 ++++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 5441c17562c5..f1462b2fd0c3 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -313,9 +313,23 @@ void gfs2_glock_put(struct gfs2_glock *gl)
 static inline int may_grant(const struct gfs2_glock *gl, const struct gfs2_holder *gh)
 {
 	const struct gfs2_holder *gh_head = list_first_entry(&gl->gl_holders, const struct gfs2_holder, gh_list);
-	if ((gh->gh_state == LM_ST_EXCLUSIVE ||
-	     gh_head->gh_state == LM_ST_EXCLUSIVE) && gh != gh_head)
-		return 0;
+
+	if (gh != gh_head) {
+		/**
+		 * Here we make a special exception to grant holders who agree
+		 * to share the EX lock with other holders who also have the
+		 * bit set. If the original holder has the LM_FLAG_NODE_SCOPE bit
+		 * is set, we grant more holders with the bit set.
+		 */
+		if (gh_head->gh_state == LM_ST_EXCLUSIVE &&
+		    (gh_head->gh_flags & LM_FLAG_NODE_SCOPE) &&
+		    gh->gh_state == LM_ST_EXCLUSIVE &&
+		    (gh->gh_flags & LM_FLAG_NODE_SCOPE))
+			return 1;
+		if ((gh->gh_state == LM_ST_EXCLUSIVE ||
+		     gh_head->gh_state == LM_ST_EXCLUSIVE))
+			return 0;
+	}
 	if (gl->gl_state == gh->gh_state)
 		return 1;
 	if (gh->gh_flags & GL_EXACT)
@@ -2034,6 +2048,8 @@ static const char *hflags2str(char *buf, u16 flags, unsigned long iflags)
 		*p++ = 'A';
 	if (flags & LM_FLAG_PRIORITY)
 		*p++ = 'p';
+	if (flags & LM_FLAG_NODE_SCOPE)
+		*p++ = 'n';
 	if (flags & GL_ASYNC)
 		*p++ = 'a';
 	if (flags & GL_EXACT)
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 53813364517b..31a8f2f649b5 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -75,6 +75,11 @@ enum {
  * request and directly join the other shared lock.  A shared lock request
  * without the priority flag might be forced to wait until the deferred
  * requested had acquired and released the lock.
+ *
+ * LM_FLAG_NODE_SCOPE
+ * This holder agrees to share the lock within this node. In other words,
+ * the glock is held in EX mode according to DLM, but local holders on the
+ * same node can share it.
  */
 
 #define LM_FLAG_TRY		0x0001
@@ -82,6 +87,7 @@ enum {
 #define LM_FLAG_NOEXP		0x0004
 #define LM_FLAG_ANY		0x0008
 #define LM_FLAG_PRIORITY	0x0010
+#define LM_FLAG_NODE_SCOPE	0x0020
 #define GL_ASYNC		0x0040
 #define GL_EXACT		0x0080
 #define GL_SKIP			0x0100
-- 
2.26.2

