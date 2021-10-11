Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id D0E6A4297B5
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sIo7bne8LVrc5Gek5yZFLhWYyt6Xb/BFjq0cA3NrUsA=;
	b=ItTqkGEQu4o+SIIyyNCTJBsNO59eL4OPldxjq1sZRp+FhBHl18jFNdQ/eaXIs8ZuD3Wjvz
	Y1g63PD423prvf9L7rhzkMzJPzPl6/sFPnfkwzkya9TrXRIqs89cDPhiwgLBHjhdUdSSiy
	dXHjp03H5wiLrpMDq0sZ9rN0boUKXRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-yFtC4e3xPB28V-E-Jx_EMg-1; Mon, 11 Oct 2021 15:40:38 -0400
X-MC-Unique: yFtC4e3xPB28V-E-Jx_EMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F3A101AFAC;
	Mon, 11 Oct 2021 19:40:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6706257CA5;
	Mon, 11 Oct 2021 19:40:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E86A01806D02;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeVhv028813 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A293E2657E; Mon, 11 Oct 2021 19:40:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 708742657D
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:04 -0500
Message-Id: <20211011194008.50097-10-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 09/13] gfs2: split glock
	instantiation off from do_promote
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

Before this patch, function do_promote had a section of code that did
the actual instantiation.  This patch splits that off into its own
function, gfs2_instantiate, which prepares us for the next patch that
will use that function.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 47 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1d64b45d1ea9..39bfac34e8a4 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -380,6 +380,33 @@ static void do_error(struct gfs2_glock *gl, const int ret)
 	}
 }
 
+/**
+ * gfs2_instantiate - Call the glops instantiate function
+ * @gl: The glock
+ *
+ * Returns: 0 if instantiate was successful, 2 if type specific operation is
+ * underway, or error.
+ */
+static int gfs2_instantiate(struct gfs2_holder *gh)
+{
+	struct gfs2_glock *gl = gh->gh_gl;
+	const struct gfs2_glock_operations *glops = gl->gl_ops;
+	int ret;
+
+	ret = glops->go_instantiate(gh);
+	switch(ret) {
+	case 0:
+		break;
+	case 1:
+		ret = 2;
+		break;
+	default:
+		gh->gh_error = ret;
+		break;
+	}
+	return ret;
+}
+
 /**
  * do_promote - promote as many requests as possible on the current queue
  * @gl: The glock
@@ -392,7 +419,6 @@ static int do_promote(struct gfs2_glock *gl)
 __releases(&gl->gl_lockref.lock)
 __acquires(&gl->gl_lockref.lock)
 {
-	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	struct gfs2_holder *gh, *tmp;
 	bool lock_released;
 	int ret;
@@ -409,19 +435,20 @@ __acquires(&gl->gl_lockref.lock)
 			break;
 		}
 		if (gh->gh_list.prev == &gl->gl_holders &&
-		    !(gh->gh_flags & GL_SKIP) && glops->go_instantiate) {
+		    !(gh->gh_flags & GL_SKIP) && gl->gl_ops->go_instantiate) {
 			lock_released = true;
 			spin_unlock(&gl->gl_lockref.lock);
-			ret = glops->go_instantiate(gh);
+			ret = gfs2_instantiate(gh);
 			spin_lock(&gl->gl_lockref.lock);
 			if (ret) {
-				if (ret == 1)
-					return 2;
-				gh->gh_error = ret;
-				list_del_init(&gh->gh_list);
-				trace_gfs2_glock_queue(gh, 0);
-				gfs2_holder_wake(gh);
-				goto restart;
+				if (ret == 2)
+					return ret;
+				else {
+					list_del_init(&gh->gh_list);
+					trace_gfs2_glock_queue(gh, 0);
+					gfs2_holder_wake(gh);
+					goto restart;
+				}
 			}
 		}
 		set_bit(HIF_HOLDER, &gh->gh_iflags);
-- 
2.31.1

