Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFEA4297B6
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bmZkVhVoxoXKusI9rwLjpzFZ+NNIVa74Be9SZINchaY=;
	b=Ldax1cIvt069yMcp6y9bNYzk5QV7dV9HwBiLqT+f6tw/4Ucz1dwRsfnTEbVJrtSGrNWUu4
	9ESVzBVaNK0x1v+7+A64A8Ab6z0SgH0LfO4841ecoZ9+El5kzVWkfE8fBA9c8crWcku7gN
	yAsU89AzrmARA+cpKSiD7Go/vwavquk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-Y2PXHvAzMGCr87MG-TXVSQ-1; Mon, 11 Oct 2021 15:40:39 -0400
X-MC-Unique: Y2PXHvAzMGCr87MG-TXVSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3593A19057A2;
	Mon, 11 Oct 2021 19:40:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2828860871;
	Mon, 11 Oct 2021 19:40:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6130180598A;
	Mon, 11 Oct 2021 19:40:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeVHD028804 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50FD82657E; Mon, 11 Oct 2021 19:40:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EF4E2657D
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:03 -0500
Message-Id: <20211011194008.50097-9-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 08/13] gfs2: further simplify
	do_promote
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch further simplifies function do_promote by eliminating some
redundant code in favor of using a lock_released flag. This is just
prep work for a future patch.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 562dc3d3d9cd..1d64b45d1ea9 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -394,10 +394,12 @@ __acquires(&gl->gl_lockref.lock)
 {
 	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	struct gfs2_holder *gh, *tmp;
+	bool lock_released;
 	int ret;
 
 restart:
 	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
+		lock_released = false;
 		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
 			continue;
 		if (!may_grant(gl, gh)) {
@@ -407,30 +409,31 @@ __acquires(&gl->gl_lockref.lock)
 			break;
 		}
 		if (gh->gh_list.prev == &gl->gl_holders &&
-		    glops->go_instantiate) {
-			if (!(gh->gh_flags & GL_SKIP)) {
-				spin_unlock(&gl->gl_lockref.lock);
-				/* FIXME: eliminate this eventually */
-				ret = glops->go_instantiate(gh);
-				spin_lock(&gl->gl_lockref.lock);
-				if (ret) {
-					if (ret == 1)
-						return 2;
-					gh->gh_error = ret;
-					list_del_init(&gh->gh_list);
-					trace_gfs2_glock_queue(gh, 0);
-					gfs2_holder_wake(gh);
-					goto restart;
-				}
+		    !(gh->gh_flags & GL_SKIP) && glops->go_instantiate) {
+			lock_released = true;
+			spin_unlock(&gl->gl_lockref.lock);
+			ret = glops->go_instantiate(gh);
+			spin_lock(&gl->gl_lockref.lock);
+			if (ret) {
+				if (ret == 1)
+					return 2;
+				gh->gh_error = ret;
+				list_del_init(&gh->gh_list);
+				trace_gfs2_glock_queue(gh, 0);
+				gfs2_holder_wake(gh);
+				goto restart;
 			}
-			set_bit(HIF_HOLDER, &gh->gh_iflags);
-			trace_gfs2_promote(gh);
-			gfs2_holder_wake(gh);
-			goto restart;
 		}
 		set_bit(HIF_HOLDER, &gh->gh_iflags);
 		trace_gfs2_promote(gh);
 		gfs2_holder_wake(gh);
+		/*
+		 * If we released the gl_lockref.lock the holders list may have
+		 * changed. For that reason, we start again at the start of
+		 * the holders queue.
+		 */
+		if (lock_released)
+			goto restart;
 	}
 	return 0;
 }
-- 
2.31.1

