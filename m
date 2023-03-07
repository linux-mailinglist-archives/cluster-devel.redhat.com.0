Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5606AE825
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 18:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678209201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hRSP8k9FzRRDSRexlf8upO3nRh5oyeI3HYr4vRwia+s=;
	b=Hsr9/GA2ZK+b7g4SI66XvRpa0a8CXK2RP6YxL1rTI567OvrvrTMulZq3BX4Swu+4Zwmmkh
	csSrMJlD4D07CMS2L1UfaNcnTM3swDiSTpQnwlJ8Im0uNI07btZWQc+9jRivA+fHdMoTiQ
	1Re05KD/nO3p7yEG6jyanBuiYYVwLVQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-A2tk-RGDNjy7c9cvBWl4hg-1; Tue, 07 Mar 2023 12:13:16 -0500
X-MC-Unique: A2tk-RGDNjy7c9cvBWl4hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 461343C0E457;
	Tue,  7 Mar 2023 17:13:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9A3C15BA0;
	Tue,  7 Mar 2023 17:13:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D844119465B8;
	Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8744F1946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7A7B114171C4; Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55D8D140EBF4;
 Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Mar 2023 12:13:05 -0500
Message-Id: <20230307171307.2785162-8-aahringo@redhat.com>
In-Reply-To: <20230307171307.2785162-1-aahringo@redhat.com>
References: <20230307171307.2785162-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 7/9] dlm_controld: use
 write_result()
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

This patch will use write_result() instead of code the same code again
what write_result() is doing.

Reported-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 dlm_controld/plock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 2f0392c3..24ad777a 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -1600,8 +1600,7 @@ void process_plocks(int ci)
 #else
 	if (!(info.flags & DLM_PLOCK_FL_CLOSE)) {
 #endif
-		info.rv = rv;
-		rv = write(plock_device_fd, &info, sizeof(info));
+		write_result(&info, rv);
 	}
 }
 
-- 
2.31.1

