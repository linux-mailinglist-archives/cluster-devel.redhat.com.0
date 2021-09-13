Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8759E409D1F
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Sep 2021 21:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631561465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s3cu2VEGoLzBLte6VyRfaLnsBh1/5286XWwuiX3Fsc0=;
	b=MkLtZ2YmsfAsLwuMo+PHXn5ljXYZ5T19MiJiYA0jYTM5R0FBVKnkh/ZMDSH6xOz+gs2Tx8
	7h4oUHsVcJvPeiNq8oGjLcuNXLkFeWckcwYuWfKXpAJEmtedLwVJOFN5M4tiBXF/tGqlcd
	zJ7Lkd+AkZx/Gsd5pVcNz8VvbhsZwhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-AIQexrhGMnCgs3YViHD-Hw-1; Mon, 13 Sep 2021 15:31:04 -0400
X-MC-Unique: AIQexrhGMnCgs3YViHD-Hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3A51802E70;
	Mon, 13 Sep 2021 19:31:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B208A1972D;
	Mon, 13 Sep 2021 19:31:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DF484EA2A;
	Mon, 13 Sep 2021 19:31:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18DJUY09016766 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Sep 2021 15:30:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A91E5D9DD; Mon, 13 Sep 2021 19:30:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-80.phx2.redhat.com [10.3.112.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC3B55D9CA
	for <cluster-devel@redhat.com>; Mon, 13 Sep 2021 19:30:33 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 13 Sep 2021 14:30:27 -0500
Message-Id: <20210913193028.75116-4-rpeterso@redhat.com>
In-Reply-To: <20210913193028.75116-1-rpeterso@redhat.com>
References: <20210913193028.75116-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/4] gfs2: move GL_SKIP check from
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, each individual "go_lock" glock operation
(glop) would check the GL_SKIP flag, and if set, would skip further
processing. This patch changes the logic so the go_lock caller,
function go_promote, checks the GL_SKIP flag before calling the
go_lock op in the first place. There are two main reasons for doing
this:

1. For cases in the GL_SKIP is specified, it avoids having to
   unnecessarily unlock gl_lockref.lock only to re-lock it again.
2. This makes it a little easier to follow and understand the next
   patch which breaks up function do_promote.

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

