Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADC44297AF
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9qKAKie12+uLyQMBHf/653dThK8zX99QqzwvTVaTEJ8=;
	b=dQfqjIA2D2FxUsmSizVu9eQntKwYGhlKI3giA7CtPpo1QlJ84ePLw5O4mVjw8OO+vTgYHD
	pEof6J8S1Ax/bt72eWaElsyJTCvvV7ZmVIcWSh+2EvUWHAT4w1S2QjZPS+nUwoDyiNW4Ps
	F7FX06sFV8ClwlubOALL/3TKHp5aAKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-DgMhbHz6MYmp3dqtjhNrqQ-1; Mon, 11 Oct 2021 15:40:39 -0400
X-MC-Unique: DgMhbHz6MYmp3dqtjhNrqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74568CF986;
	Mon, 11 Oct 2021 19:40:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6698E57CA4;
	Mon, 11 Oct 2021 19:40:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E246D4EA2F;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeVlv028798 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F305626DFD; Mon, 11 Oct 2021 19:40:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C18BC26DE2
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:02 -0500
Message-Id: <20211011194008.50097-8-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 07/13] gfs2: re-factor function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch simply re-factors function do_promote to reduce the indents.
The logic should be unchanged. This makes future patches more readable.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 51 ++++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 7271b4dd6d6a..562dc3d3d9cd 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -400,38 +400,37 @@ __acquires(&gl->gl_lockref.lock)
 	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
 		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
 			continue;
-		if (may_grant(gl, gh)) {
-			if (gh->gh_list.prev == &gl->gl_holders &&
-			    glops->go_instantiate) {
-				if (!(gh->gh_flags & GL_SKIP)) {
-					spin_unlock(&gl->gl_lockref.lock);
-					/* FIXME: eliminate this eventually */
-					ret = glops->go_instantiate(gh);
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
+		if (!may_grant(gl, gh)) {
+			if (gh->gh_list.prev == &gl->gl_holders)
+				return 1;
+			do_error(gl, 0);
+			break;
+		}
+		if (gh->gh_list.prev == &gl->gl_holders &&
+		    glops->go_instantiate) {
+			if (!(gh->gh_flags & GL_SKIP)) {
+				spin_unlock(&gl->gl_lockref.lock);
+				/* FIXME: eliminate this eventually */
+				ret = glops->go_instantiate(gh);
+				spin_lock(&gl->gl_lockref.lock);
+				if (ret) {
+					if (ret == 1)
+						return 2;
+					gh->gh_error = ret;
+					list_del_init(&gh->gh_list);
+					trace_gfs2_glock_queue(gh, 0);
+					gfs2_holder_wake(gh);
+					goto restart;
 				}
-				set_bit(HIF_HOLDER, &gh->gh_iflags);
-				trace_gfs2_promote(gh);
-				gfs2_holder_wake(gh);
-				goto restart;
 			}
 			set_bit(HIF_HOLDER, &gh->gh_iflags);
 			trace_gfs2_promote(gh);
 			gfs2_holder_wake(gh);
-			continue;
+			goto restart;
 		}
-		if (gh->gh_list.prev == &gl->gl_holders)
-			return 1;
-		do_error(gl, 0);
-		break;
+		set_bit(HIF_HOLDER, &gh->gh_iflags);
+		trace_gfs2_promote(gh);
+		gfs2_holder_wake(gh);
 	}
 	return 0;
 }
-- 
2.31.1

