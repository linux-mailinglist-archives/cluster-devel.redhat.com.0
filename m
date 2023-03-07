Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 719876AE82B
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 18:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678209206;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tFhdpCU1mY4WzckDe90R/knDt2mBRl/a26ltktlLcc8=;
	b=hPMANn0JrvZNx6GgXzluJKUqi9QUlo65qZgows3ytW2GBJ7sX6f2Bd7hkZwqspepaBXv7/
	ifKG7E7EbEeOpmZYtXMGDvpTKxRZkeYgxdmBMmCPi9v/j4R+3jYCnFGJrG+LyStJdGGvsn
	GXVRfZDh5Fr7zUIWwDr0aHJSZ5a/5bQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-07rVMqbyMiK3iQQ3uQ9AbA-1; Tue, 07 Mar 2023 12:13:17 -0500
X-MC-Unique: 07rVMqbyMiK3iQQ3uQ9AbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 929E7811E9C;
	Tue,  7 Mar 2023 17:13:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 889A94051E44;
	Tue,  7 Mar 2023 17:13:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E59619465A8;
	Tue,  7 Mar 2023 17:13:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D59BD1946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C917014171C4; Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5396140EBF4;
 Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Mar 2023 12:13:01 -0500
Message-Id: <20230307171307.2785162-4-aahringo@redhat.com>
In-Reply-To: <20230307171307.2785162-1-aahringo@redhat.com>
References: <20230307171307.2785162-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 3/9] dlm_controld: move
 processing of saved messages to plock level
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Ad the loglevel is for save plock messages during corosync resource
membership upate. This patch will put the processing of saved messages
on the same loglevel.
---
 dlm_controld/plock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 692787e2..c2c80360 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -1612,7 +1612,7 @@ void process_saved_plocks(struct lockspace *ls)
 	struct dlm_header *hd;
 	int count = 0;
 
-	log_dlock(ls, "process_saved_plocks begin");
+	log_plock(ls, "process_saved_plocks begin");
 
 	if (list_empty(&ls->saved_messages))
 		goto out;
@@ -1643,7 +1643,7 @@ void process_saved_plocks(struct lockspace *ls)
 		count++;
 	}
  out:
-	log_dlock(ls, "process_saved_plocks %d done", count);
+	log_plock(ls, "process_saved_plocks %d done", count);
 }
 
 /* locks still marked SYNCING should not go into the ckpt; the new node
-- 
2.31.1

