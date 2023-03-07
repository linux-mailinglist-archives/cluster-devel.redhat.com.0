Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAE56AE828
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 18:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678209203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Akv2MeWUmKuOwY+KTaLnNgHvXPSiBfOeaqK4Z03iZgQ=;
	b=LoKRuEt37QKzaQH04p7PHvAs4wnKx8rZ6UeARQvN9Y1HjkjQ0f2iJy4891JlRQmQAiUimD
	rcnmdZUC9YTUWx8Kih5myi8fHI9JypNRmoY7AiVSGnhHHYM+VEAnnMz2doOMh+TRAW+LlT
	yM77RwTgrDHeywqSBtamtIOGQmP+YHI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-h1iGeKCKMkCU_ALF3MEGOg-1; Tue, 07 Mar 2023 12:13:19 -0500
X-MC-Unique: h1iGeKCKMkCU_ALF3MEGOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97EA73850554;
	Tue,  7 Mar 2023 17:13:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E2154051E44;
	Tue,  7 Mar 2023 17:13:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6800E19465A8;
	Tue,  7 Mar 2023 17:13:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34B8319465A4 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 271891400E43; Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02DE7140EBF4;
 Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Mar 2023 12:13:03 -0500
Message-Id: <20230307171307.2785162-6-aahringo@redhat.com>
In-Reply-To: <20230307171307.2785162-1-aahringo@redhat.com>
References: <20230307171307.2785162-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 5/9] dlm_controld: constify
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

