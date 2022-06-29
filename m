Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19252560701
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656522587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pHU5nm35tqpiapS/O7dLesF3AhUqZcxXK8OXIW+vID4=;
	b=WmjpWjeP6bQmQiqIReROgKZMyLVaIkyOJsWwcg3Igv/xBhtYO3NJy2Feca/g8T5Z3/N+lL
	WX21ZC2oa0Zk+3rvYhM4yLL0/Sj6ZPo9EesgAZemSGu1z/Bc+zid1oDRX4H31NV/nZTTLZ
	EL3sD6bKhv2ENWFiFWtOmiWyKPKUnpw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-HJzeyzl6P-icFdQR2ULaGA-1; Wed, 29 Jun 2022 13:09:22 -0400
X-MC-Unique: HJzeyzl6P-icFdQR2ULaGA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70DDC3801EC7;
	Wed, 29 Jun 2022 17:09:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5837C492C3B;
	Wed, 29 Jun 2022 17:09:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C32CF194705B;
	Wed, 29 Jun 2022 17:09:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB2421947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D00E4492CA6; Wed, 29 Jun 2022 16:37:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BDBC492C3B;
 Wed, 29 Jun 2022 16:37:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:09 +0200
Message-Id: <20220629163711.732931-8-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 7/9] gfs2: do_promote glock holder stealing
 fix
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Bob Peterson <rpeterso@redhat.com>

In do_promote(), when the glock had no strong holders, we were
accidentally calling demote_incompat_holders() with new_gh == NULL, so
no weak holders were considered incompatible.  Instead, the new holder
should have been passed in.

For doing that, the HIF_HOLDER flag needs to be set in new_gh to prevent
may_grant() from complaining.  This means that the new holder will now
be recognized as a current holder, so skip over it explicitly in
demote_incompat_holders() to prevent it from being dequeued.

To further clarify things, we can now rename new_gh to current_gh in
demote_incompat_holders(); after all, the HIF_HOLDER flag is already set,
which means the new holder is already a current holder.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 27b519099579..2138460a7369 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -405,10 +405,13 @@ static void do_error(struct gfs2_glock *gl, const int ret)
 /**
  * demote_incompat_holders - demote incompatible demoteable holders
  * @gl: the glock we want to promote
- * @new_gh: the new holder to be promoted
+ * @current_gh: the newly promoted holder
+ *
+ * We're passing the newly promoted holder in @current_gh, but actually, any of
+ * the strong holders would do.
  */
 static void demote_incompat_holders(struct gfs2_glock *gl,
-				    struct gfs2_holder *new_gh)
+				    struct gfs2_holder *current_gh)
 {
 	struct gfs2_holder *gh, *tmp;
 
@@ -424,8 +427,10 @@ static void demote_incompat_holders(struct gfs2_glock *gl,
 		 */
 		if (!test_bit(HIF_HOLDER, &gh->gh_iflags))
 			return;
+		if (gh == current_gh)
+			continue;
 		if (test_bit(HIF_MAY_DEMOTE, &gh->gh_iflags) &&
-		    !may_grant(gl, new_gh, gh)) {
+		    !may_grant(gl, current_gh, gh)) {
 			/*
 			 * We should not recurse into do_promote because
 			 * __gfs2_glock_dq only calls handle_callback,
@@ -547,14 +552,14 @@ static int do_promote(struct gfs2_glock *gl)
 			do_error(gl, 0);
 			break;
 		}
+		set_bit(HIF_HOLDER, &gh->gh_iflags);
+		trace_gfs2_promote(gh);
+		gfs2_holder_wake(gh);
 		if (!incompat_holders_demoted) {
+			current_gh = gh;
 			demote_incompat_holders(gl, current_gh);
 			incompat_holders_demoted = true;
-			current_gh = gh;
 		}
-		set_bit(HIF_HOLDER, &gh->gh_iflags);
-		trace_gfs2_promote(gh);
-		gfs2_holder_wake(gh);
 	}
 	return 0;
 }
-- 
2.35.1

