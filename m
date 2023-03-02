Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B06A87AE
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777320;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Akv2MeWUmKuOwY+KTaLnNgHvXPSiBfOeaqK4Z03iZgQ=;
	b=Elyd1FPf+BB+mFRtOFfswBrzRWKr4vaOKeFw2KBrI37m3BuvVkmW/Q2XYMHec4V8rGpw68
	mj6kechpfd2B5njsU2RLqhj9kWlqFT1d37Z1trO3byyGS3yMrb90CAeYYvY50G9D1Fhiyo
	fKYJJoSs57hYxMc3Sd7925dU8Yd9lnA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-bGN3a-IEM2eHOUN7_1G4ug-1; Thu, 02 Mar 2023 12:15:15 -0500
X-MC-Unique: bGN3a-IEM2eHOUN7_1G4ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96AA929AA2E7;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A1BDC1602A;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95E521948642;
	Thu,  2 Mar 2023 17:15:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 21F3D1948664 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B1C84492B13; Thu,  2 Mar 2023 17:14:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D4D8492B00;
 Thu,  2 Mar 2023 17:14:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:33 -0500
Message-Id: <20230302171441.1509914-6-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-1-aahringo@redhat.com>
References: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 06/14] dlm_controld: constify
 timeval of dt_usec()
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

Those parameters are only used read only. We don't change any data where
those pointers point to.
---
 dlm_controld/plock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 462c9212..8b052a94 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -198,7 +198,7 @@ static unsigned long time_diff_ms(struct timeval *begin, struct timeval *end)
 	return (result.tv_sec * 1000) + (result.tv_usec / 1000);
 }
 
-static uint64_t dt_usec(struct timeval *start, struct timeval *stop)
+static uint64_t dt_usec(const struct timeval *start, const struct timeval *stop)
 {
 	uint64_t dt;
 
-- 
2.31.1

