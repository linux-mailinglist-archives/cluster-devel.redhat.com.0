Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9809D40EAB3
	for <lists+cluster-devel@lfdr.de>; Thu, 16 Sep 2021 21:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631819493;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VOb9o/Ci6fjUEkAgCr/PLv7C4rJWqhUWeJusycWMsu4=;
	b=fBzicE3r6oeBk6nMLFCgxzDFkEHDRQtjdH66vJzP55UnrJyC5Ux/D2UTr3q/0dVOPlZEkB
	spSuX/eOS/B97BVYvK6+gUy3R/W69MJ9rM77+JqRLck6qKK4w0wpvIxrOAdGv11LyfAMuN
	5o/r/ZGsNTe0GhMag31lbbhF2W/4J4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-ZjWcc7mkOpq2Usaw7A3BXg-1; Thu, 16 Sep 2021 15:10:43 -0400
X-MC-Unique: ZjWcc7mkOpq2Usaw7A3BXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B95F1800D41;
	Thu, 16 Sep 2021 19:10:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A69D5D6B1;
	Thu, 16 Sep 2021 19:10:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A632F1800FE4;
	Thu, 16 Sep 2021 19:10:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GJAahu021594 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 15:10:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62D145C1CF; Thu, 16 Sep 2021 19:10:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-63.phx2.redhat.com [10.3.114.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A56B5C1C5
	for <cluster-devel@redhat.com>; Thu, 16 Sep 2021 19:10:36 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 16 Sep 2021 14:10:00 -0500
Message-Id: <20210916191003.105866-4-rpeterso@redhat.com>
In-Reply-To: <20210916191003.105866-1-rpeterso@redhat.com>
References: <20210916191003.105866-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2 3/6] gfs2: move GL_SKIP check from
	glops to do_promote
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, each individual "go_lock" glock operation (glop)
checked the GL_SKIP flag, and if set, would skip further processing.

This patch changes the logic so the go_lock caller, function go_promote,
checks the GL_SKIP flag before calling the go_lock op in the first place.
This avoids having to unnecessarily unlock gl_lockref.lock only to
re-lock it again.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 26 ++++++++++++++------------
 fs/gfs2/glops.c |  2 +-
 fs/gfs2/rgrp.c  |  2 --
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 6144d7fe28e6..b8248ceff3c3 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -403,18 +403,20 @@ __acquires(&gl->gl_lockref.lock)
 		if (may_grant(gl, gh)) {
 			if (gh->gh_list.prev == &gl->gl_holders &&
 			    glops->go_lock) {
-				spin_unlock(&gl->gl_lockref.lock);
-				/* FIXME: eliminate this eventually */
-				ret = glops->go_lock(gh);
-				spin_lock(&gl->gl_lockref.lock);
-				if (ret) {
-					if (ret == 1)
-						return 2;
-					gh->gh_error = ret;
-					list_del_init(&gh->gh_list);
-					trace_gfs2_glock_queue(gh, 0);
-					gfs2_holder_wake(gh);
-					goto restart;
+				if (!(gh->gh_flags & GL_SKIP)) {
+					spin_unlock(&gl->gl_lockref.lock);
+					/* FIXME: eliminate this eventually */
+					ret = glops->go_lock(gh);
+					spin_lock(&gl->gl_lockref.lock);
+					if (ret) {
+						if (ret == 1)
+							return 2;
+						gh->gh_error = ret;
+						list_del_init(&gh->gh_list);
+						trace_gfs2_glock_queue(gh, 0);
+						gfs2_holder_wake(gh);
+						goto restart;
+					}
 				}
 				set_bit(HIF_HOLDER, &gh->gh_iflags);
 				trace_gfs2_promote(gh, 1);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 79c621c7863d..4b19f513570f 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -495,7 +495,7 @@ static int inode_go_lock(struct gfs2_holder *gh)
 	struct gfs2_inode *ip = gl->gl_object;
 	int error = 0;
 
-	if (!ip || (gh->gh_flags & GL_SKIP))
+	if (!ip)
 		return 0;
 
 	if (test_bit(GIF_INVALID, &ip->i_flags)) {
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 7a13a687e4f2..1fb66f6e6a0c 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1292,8 +1292,6 @@ int gfs2_rgrp_go_lock(struct gfs2_holder *gh)
 {
 	struct gfs2_rgrpd *rgd = gh->gh_gl->gl_object;
 
-	if (gh->gh_flags & GL_SKIP)
-		return 0;
 	return gfs2_rgrp_bh_get(rgd);
 }
 
-- 
2.31.1

