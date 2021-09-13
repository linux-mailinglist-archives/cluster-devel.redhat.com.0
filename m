Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 96536409D1B
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Sep 2021 21:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631561463;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z7bDxSDMMuGDO/xFtnHqkASfQ+0L7uxFhAom8PyXY+Q=;
	b=Xx4E1u2Hqtt4mnnBMo6CaZH2tLjkRQHyOQs+KaruLIhNLg3QCM+tCwJXCVe4yGlBTz8bHa
	veCQd6DNb6L7AreemVwc0iTIngidy5zqiG+FgV+qBn+xDRb8Mku3cRmz3bzowXv9f0W4g9
	Fkj4VAl7YcuHdamBxGHQm1Pwi9uRJKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-k5UqbtO_NJWPeQcZ9l2cSg-1; Mon, 13 Sep 2021 15:31:02 -0400
X-MC-Unique: k5UqbtO_NJWPeQcZ9l2cSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BF941084689;
	Mon, 13 Sep 2021 19:31:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 764366D983;
	Mon, 13 Sep 2021 19:30:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 407FB4EA2A;
	Mon, 13 Sep 2021 19:30:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18DJUYfn016775 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Sep 2021 15:30:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 796125D9DD; Mon, 13 Sep 2021 19:30:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-80.phx2.redhat.com [10.3.112.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 483035D9CA
	for <cluster-devel@redhat.com>; Mon, 13 Sep 2021 19:30:34 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 13 Sep 2021 14:30:28 -0500
Message-Id: <20210913193028.75116-5-rpeterso@redhat.com>
In-Reply-To: <20210913193028.75116-1-rpeterso@redhat.com>
References: <20210913193028.75116-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 4/4] gfs2: rework go_lock mechanism for
	node_scope race
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, glocks only performed their go_lock glop function
when the first holder was queued. When we introduced the new "node
scope" mechanism, we allowed multiple holders to hold a glock in EX
at the same time, with local locking. But it introduced a new race:
If the first holder specified GL_SKIP (skip the go_lock function until
deemed necessary) any secondary holders WITHOUT GL_SKIP assumed the
go_lock mechanism had been performed. In the case of rgrps, that was
not always the case: for example, when the first process is searching
for free blocks for allocation (GL_SKIP) and a second holder (without
GL_SKIP) wants to free blocks, which just assumes the buffers exist.

To remedy this race, this patch reworks how the GL_SKIP mechanism is
managed. The first holder checks if GL_SKIP is specified, and if so,
a new glock flag, GLF_GO_LOCK_SKIPPED, is set. Subsequent holders
without GL_SKIP who need the lock check this flag to see if the
go_lock function was skipped, and call it if necessary.

This also "accidentally" fixes a minor bug with glock do-promote
tracing: glocks that had no "go_lock" glop would not properly log the
"first" flag to the kernel trace.

Fixes: 06e908cd9ead ("gfs2: Allow node-wide exclusive glock sharing")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 81 ++++++++++++++++++++++++++++++++----------------
 fs/gfs2/glops.c  |  1 +
 fs/gfs2/incore.h |  1 +
 fs/gfs2/rgrp.c   |  1 +
 4 files changed, 58 insertions(+), 26 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b8248ceff3c3..faad2cb105bb 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -380,6 +380,46 @@ static void do_error(struct gfs2_glock *gl, const int ret)
 	}
 }
 
+static int glock_go_lock(struct gfs2_glock *gl, struct gfs2_holder *gh,
+			 struct gfs2_holder *gh1)
+__releases(&gl->gl_lockref.lock)
+__acquires(&gl->gl_lockref.lock)
+{
+	const struct gfs2_glock_operations *glops = gl->gl_ops;
+	int ret = 0;
+
+	/*
+	 * When the first holder on the list is granted, it can SKIP or not.
+	 * If it skips go_lock, it sets the GLF_GO_LOCK_SKIPPED flag.
+	 * All subsequent holders need to know if it was skipped. They may
+	 * also choose to skip go_lock, but only the first granted should
+	 * set GLF_GO_LOCK_SKIPPED. If not skipped, they need to know if
+	 * go_lock was previously skipped, call go_lock, and clear the flag.
+	 */
+	if (gh->gh_flags & GL_SKIP) {
+		if (gh == gh1)
+		    set_bit(GLF_GO_LOCK_SKIPPED, &gl->gl_flags);
+		goto out;
+	}
+	if ((gh == gh1) || test_bit(GLF_GO_LOCK_SKIPPED, &gl->gl_flags)) {
+		spin_unlock(&gl->gl_lockref.lock);
+		/* FIXME: eliminate this eventually */
+		ret = glops->go_lock(gh);
+		spin_lock(&gl->gl_lockref.lock);
+		clear_bit(GLF_GO_LOCK_SKIPPED, &gl->gl_flags);
+		if (ret) {
+			if (ret == 1)
+				return 2;
+			gh->gh_error = ret;
+			list_del_init(&gh->gh_list);
+			trace_gfs2_glock_queue(gh, 0);
+			gfs2_holder_wake(gh);
+		}
+	}
+out:
+	return ret;
+}
+
 /**
  * do_promote - promote as many requests as possible on the current queue
  * @gl: The glock
@@ -389,46 +429,33 @@ static void do_error(struct gfs2_glock *gl, const int ret)
  */
 
 static int do_promote(struct gfs2_glock *gl)
-__releases(&gl->gl_lockref.lock)
-__acquires(&gl->gl_lockref.lock)
 {
 	const struct gfs2_glock_operations *glops = gl->gl_ops;
-	struct gfs2_holder *gh, *tmp;
+	struct gfs2_holder *gh, *gh1, *tmp;
 	int ret;
 
 restart:
+	gh1 = list_first_entry(&gl->gl_holders, struct gfs2_holder, gh_list);
+
 	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
 		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
 			continue;
 		if (may_grant(gl, gh)) {
-			if (gh->gh_list.prev == &gl->gl_holders &&
-			    glops->go_lock) {
-				if (!(gh->gh_flags & GL_SKIP)) {
-					spin_unlock(&gl->gl_lockref.lock);
-					/* FIXME: eliminate this eventually */
-					ret = glops->go_lock(gh);
-					spin_lock(&gl->gl_lockref.lock);
-					if (ret) {
-						if (ret == 1)
-							return 2;
-						gh->gh_error = ret;
-						list_del_init(&gh->gh_list);
-						trace_gfs2_glock_queue(gh, 0);
-						gfs2_holder_wake(gh);
-						goto restart;
-					}
-				}
-				set_bit(HIF_HOLDER, &gh->gh_iflags);
-				trace_gfs2_promote(gh, 1);
-				gfs2_holder_wake(gh);
-				goto restart;
+			ret = 0;
+			if (glops->go_lock) {
+				ret = glock_go_lock(gl, gh, gh1);
+				if (ret == 2)
+					return ret;
 			}
+
 			set_bit(HIF_HOLDER, &gh->gh_iflags);
-			trace_gfs2_promote(gh, 0);
+			trace_gfs2_promote(gh, gh == gh1 ? 1 : 0);
 			gfs2_holder_wake(gh);
+			if (ret)
+				goto restart;
 			continue;
 		}
-		if (gh->gh_list.prev == &gl->gl_holders)
+		if (gh == gh1)
 			return 1;
 		do_error(gl, 0);
 		break;
@@ -2148,6 +2175,8 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
 		*p++ = 'P';
 	if (test_bit(GLF_FREEING, gflags))
 		*p++ = 'x';
+	if (test_bit(GLF_GO_LOCK_SKIPPED, gflags))
+		*p++ = 's';
 	*p = 0;
 	return buf;
 }
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4b19f513570f..923efcd71269 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -477,6 +477,7 @@ int gfs2_inode_refresh(struct gfs2_inode *ip)
 	error = gfs2_dinode_in(ip, dibh->b_data);
 	brelse(dibh);
 	clear_bit(GIF_INVALID, &ip->i_flags);
+	clear_bit(GLF_GO_LOCK_SKIPPED, &ip->i_gl->gl_flags);
 
 	return error;
 }
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 0fe49770166e..4880818db83d 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -315,6 +315,7 @@ struct gfs2_alloc_parms {
 
 enum {
 	GLF_LOCK			= 1,
+	GLF_GO_LOCK_SKIPPED		= 2, /* go_lock was skipped */
 	GLF_DEMOTE			= 3,
 	GLF_PENDING_DEMOTE		= 4,
 	GLF_DEMOTE_IN_PROGRESS		= 5,
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 1fb66f6e6a0c..83fd5c750041 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1248,6 +1248,7 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 		if (rgd->rd_rgl->rl_unlinked == 0)
 			rgd->rd_flags &= ~GFS2_RDF_CHECK;
 	}
+	clear_bit(GLF_GO_LOCK_SKIPPED, &gl->gl_flags);
 	return 0;
 
 fail:
-- 
2.31.1

