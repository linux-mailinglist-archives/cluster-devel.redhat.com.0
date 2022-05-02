Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7A51724F
	for <lists+cluster-devel@lfdr.de>; Mon,  2 May 2022 17:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651504491;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5krx4fV3YgtwUy/slD5Xry2Rcoh+oJcOutryEx9gie8=;
	b=iA0OIXTAs0djllz6IUNoBD6lyh/4AkMjf5G1mOsaAqYJ4qVn2wnxVGoAIKMxYSY1JTeTqu
	/rhTY5Yi2UpwUcGh/xtiG1CyTCZb5X63Mvt+a+c1K63ovUhK31oTNsyTzTOqa5yM91cBXk
	cQfgAkzqvPxLXycx7DTjW4jkKq1cU1Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-M7uKbQBNO0CmMpcQYjWDCQ-1; Mon, 02 May 2022 11:14:48 -0400
X-MC-Unique: M7uKbQBNO0CmMpcQYjWDCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B97981C06904;
	Mon,  2 May 2022 15:14:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3A514C3B46;
	Mon,  2 May 2022 15:14:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E73C1947067;
	Mon,  2 May 2022 15:14:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA642194705F for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 May 2022 15:14:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 95C152166B49; Mon,  2 May 2022 15:14:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7784B2166B41;
 Mon,  2 May 2022 15:14:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 May 2022 11:14:09 -0400
Message-Id: <20220502151410.4049410-2-aahringo@redhat.com>
In-Reply-To: <20220502151410.4049410-1-aahringo@redhat.com>
References: <20220502151410.4049410-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 2/3] fs: dlm: use kref_put_lock in
 put_rsb
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will optimize put_rsb() by using kref_put_lock(). The
function kref_put_lock() will only held the lock if the reference is
going to be zero, if not the lock will never be hold.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 97ca728dc194..a331210434b2 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -350,10 +350,12 @@ static void put_rsb(struct dlm_rsb *r)
 {
 	struct dlm_ls *ls = r->res_ls;
 	uint32_t bucket = r->res_bucket;
+	int rv;
 
-	spin_lock(&ls->ls_rsbtbl[bucket].lock);
-	kref_put(&r->res_ref, toss_rsb);
-	spin_unlock(&ls->ls_rsbtbl[bucket].lock);
+	rv = kref_put_lock(&r->res_ref, toss_rsb,
+			   &ls->ls_rsbtbl[bucket].lock);
+	if (rv)
+		spin_unlock(&ls->ls_rsbtbl[bucket].lock);
 }
 
 void dlm_put_rsb(struct dlm_rsb *r)
-- 
2.31.1

