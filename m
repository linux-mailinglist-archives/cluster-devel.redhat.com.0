Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB0681A4D
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 20:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675106693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tFhdpCU1mY4WzckDe90R/knDt2mBRl/a26ltktlLcc8=;
	b=AOEztIqqV+sF6+jG1t8Tm3vMXaEuCnr5hQgRvhJUzeT9W6SwKQn4A48IquaIrBtjBXD96U
	ShwZwrh9F9DjUhRV8zWVoHGQ33vJcWbIYqZjvZ+izUrJLfpw5vBtiR5qu3r1OPhKh0047z
	5GzTw6o0PBLxRsw2+0zrFN2xgDL5jRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-TLtpVxDNNoamUgaIQDzZbA-1; Mon, 30 Jan 2023 14:24:48 -0500
X-MC-Unique: TLtpVxDNNoamUgaIQDzZbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A4BA1818E4B;
	Mon, 30 Jan 2023 19:24:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26227400EAD6;
	Mon, 30 Jan 2023 19:24:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C15CF19465A2;
	Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C2E451946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B32AF422AE; Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EAD0175AD;
 Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 Jan 2023 14:24:33 -0500
Message-Id: <20230130192437.3330300-4-aahringo@redhat.com>
In-Reply-To: <20230130192437.3330300-1-aahringo@redhat.com>
References: <20230130192437.3330300-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm-tool 4/8] dlm_controld: move processing
 of saved messages to plock level
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

