Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA0775EDB
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 14:26:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691584002;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IT75vDJryqbD1F0qfyAheCbuTtHQMyqgQgGNppP3DVM=;
	b=bo4wpBpGl8/n4keuVAAY0CiqdqMS+/d9JrmeEtZBTg8DNJ0jV+F+yDW3io/l1TS84cUbuD
	7kFybMJXAOScE6BIYKBtAJ2sHQFKisP9PZBeBFnSlZn3oi5Wfzs6Ci4FSgpccVwMN4I1hk
	LTyqFScir8I3ArMmxXvFprxKwuu+2Cg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-aYYBbV37MreDrcdQ-w2-fg-1; Wed, 09 Aug 2023 08:26:39 -0400
X-MC-Unique: aYYBbV37MreDrcdQ-w2-fg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E0308DC664;
	Wed,  9 Aug 2023 12:26:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B68A140E96E;
	Wed,  9 Aug 2023 12:26:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ED2C219465A4;
	Wed,  9 Aug 2023 12:26:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 19FBE19465A2 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 12:11:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 087241121314; Wed,  9 Aug 2023 12:11:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D47A1121315;
 Wed,  9 Aug 2023 12:11:28 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  9 Aug 2023 14:11:25 +0200
Message-Id: <20230809121127.1754804-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 1/3] gfs2: do_promote cleanup
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Change function do_promote to return true on success, and false
otherwise.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1438e7465e30..d0c82b721f90 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -468,10 +468,10 @@ int gfs2_instantiate(struct gfs2_holder *gh)
  * do_promote - promote as many requests as possible on the current queue
  * @gl: The glock
  * 
- * Returns: 1 if there is a blocked holder at the head of the list
+ * Returns true on success (i.e., progress was made or there are no waiters).
  */
 
-static int do_promote(struct gfs2_glock *gl)
+static bool do_promote(struct gfs2_glock *gl)
 {
 	struct gfs2_holder *gh, *current_gh;
 
@@ -484,10 +484,10 @@ static int do_promote(struct gfs2_glock *gl)
 			 * If we get here, it means we may not grant this
 			 * holder for some reason. If this holder is at the
 			 * head of the list, it means we have a blocked holder
-			 * at the head, so return 1.
+			 * at the head, so return false.
 			 */
 			if (list_is_first(&gh->gh_list, &gl->gl_holders))
-				return 1;
+				return false;
 			do_error(gl, 0);
 			break;
 		}
@@ -497,7 +497,7 @@ static int do_promote(struct gfs2_glock *gl)
 		if (!current_gh)
 			current_gh = gh;
 	}
-	return 0;
+	return true;
 }
 
 /**
@@ -834,7 +834,7 @@ __acquires(&gl->gl_lockref.lock)
 	} else {
 		if (test_bit(GLF_DEMOTE, &gl->gl_flags))
 			gfs2_demote_wake(gl);
-		if (do_promote(gl) == 0)
+		if (do_promote(gl))
 			goto out_unlock;
 		gh = find_first_waiter(gl);
 		gl->gl_target = gh->gh_state;
-- 
2.40.1

