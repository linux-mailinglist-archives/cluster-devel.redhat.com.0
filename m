Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7632681A4B
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 20:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675106691;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Yfc4Lil2EkhmCI4FjHntcem6giLAEwBs0dQ9yJ1ksQ=;
	b=JCfhYi/+P/yUhsDZnFQgyCqXr9qt8Bk3hP9HEpJvygsTxKNEG7RPGg4ldnUZbe0gCo+7/5
	c4TMys/kyuRz5ihWu7nNrHE947c0c9jZf5myBBSURCwxtsJnVdbEk9P3G1zclhnorWckQt
	5uyLcwFEVIUPUrB48QXANtDirPChr3U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-CUlds1RPP9CSgQGqaLBwZQ-1; Mon, 30 Jan 2023 14:24:48 -0500
X-MC-Unique: CUlds1RPP9CSgQGqaLBwZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A61C801779;
	Mon, 30 Jan 2023 19:24:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1084C15BAE;
	Mon, 30 Jan 2023 19:24:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A401719465A0;
	Mon, 30 Jan 2023 19:24:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 019EB1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC282422AE; Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8073175AD;
 Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 Jan 2023 14:24:34 -0500
Message-Id: <20230130192437.3330300-5-aahringo@redhat.com>
In-Reply-To: <20230130192437.3330300-1-aahringo@redhat.com>
References: <20230130192437.3330300-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm-tool 5/8] dlm_controld: remove ls
 parameter
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The ls parameter in write_result() is not used, so we can remove it.
---
 dlm_controld/plock.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index c2c80360..462c9212 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -684,8 +684,7 @@ static int add_waiter(struct lockspace *ls, struct resource *r,
 	return 0;
 }
 
-static void write_result(struct lockspace *ls, struct dlm_plock_info *in,
-			 int rv)
+static void write_result(struct dlm_plock_info *in, int rv)
 {
 	int write_rv;
 
@@ -719,7 +718,7 @@ static void do_waiters(struct lockspace *ls, struct resource *r)
 		rv = lock_internal(ls, r, in);
 
 		if (in->nodeid == our_nodeid)
-			write_result(ls, in, rv);
+			write_result(in, rv);
 
 		free(w);
 	}
@@ -744,7 +743,7 @@ static void do_lock(struct lockspace *ls, struct dlm_plock_info *in,
 
  out:
 	if (in->nodeid == our_nodeid && rv != -EINPROGRESS)
-		write_result(ls, in, rv);
+		write_result(in, rv);
 
 	do_waiters(ls, r);
 	put_resource(ls, r);
@@ -768,7 +767,7 @@ static void do_unlock(struct lockspace *ls, struct dlm_plock_info *in,
 	}
 
 	if (in->nodeid == our_nodeid)
-		write_result(ls, in, rv);
+		write_result(in, rv);
 
  skip_result:
 	do_waiters(ls, r);
@@ -787,7 +786,7 @@ static void do_get(struct lockspace *ls, struct dlm_plock_info *in,
 	else
 		rv = 0;
 
-	write_result(ls, in, rv);
+	write_result(in, rv);
 	put_resource(ls, r);
 }
 
@@ -830,7 +829,7 @@ static void __receive_plock(struct lockspace *ls, struct dlm_plock_info *in,
 		log_elock(ls, "receive_plock error from %d optype %d",
 			  from, in->optype);
 		if (from == our_nodeid)
-			write_result(ls, in, -EINVAL);
+			write_result(in, -EINVAL);
 	}
 }
 
-- 
2.31.1

