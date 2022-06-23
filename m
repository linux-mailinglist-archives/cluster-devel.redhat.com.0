Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA59557119
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jun 2022 04:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655951604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+f8Jdu8LfZTOFy6WXjtrytPzBoh73tAghd9xBrwh/as=;
	b=cMoOHwH4c4K+7X2qHqlVzAK983ALBusK6dW29ayER2Ss3L1+MdArBHVBLu4bojjAj0p1zS
	U7YuP7Vx8rMt8uUpM+8zmGikBTdznYKI2wIaGgUbA3YfL2QqhXsxKWZAPnNb3c9gt/8RbE
	FaLY1rW2zy+9voJ9jXcr6wJRn8/9hwQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-1gtrYYuAM-6lxJY4-SaAKA-1; Wed, 22 Jun 2022 22:33:19 -0400
X-MC-Unique: 1gtrYYuAM-6lxJY4-SaAKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488CD38035A1;
	Thu, 23 Jun 2022 02:33:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B4ECC15D42;
	Thu, 23 Jun 2022 02:33:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ED711194B948;
	Thu, 23 Jun 2022 02:33:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B70DE194B940 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9973B112131B; Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79C6F1121319;
 Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 22:33:10 -0400
Message-Id: <20220623023311.1934436-2-aahringo@redhat.com>
In-Reply-To: <20220623023311.1934436-1-aahringo@redhat.com>
References: <20220623023311.1934436-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm-tool 2/3] libdlm: force unset the
 DLM_LSFL_TIMEWARN flag
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch forces to disable the DLM_LSFL_TIMEWARN flag for libdlm users
as this feature is now deprecated and we will just unset it even if the
user sets it.
---
 libdlm/libdlm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libdlm/libdlm.c b/libdlm/libdlm.c
index fbdf9a09..c5e78616 100644
--- a/libdlm/libdlm.c
+++ b/libdlm/libdlm.c
@@ -1344,6 +1344,7 @@ static dlm_lshandle_t create_lockspace(const char *name, mode_t mode,
 
 dlm_lshandle_t dlm_new_lockspace(const char *name, mode_t mode, uint32_t flags)
 {
+	flags &= ~DLM_LSFL_TIMEWARN;
 	return create_lockspace(name, mode, flags);
 }
 
-- 
2.31.1

