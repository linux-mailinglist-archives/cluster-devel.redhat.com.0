Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D825E8810
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Sep 2022 05:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663991558;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3G1VrrLvYJ7MrbsK19m22XFQRvd7YcWq9IeFy6ACQL8=;
	b=HAMwovmB8vJ0wZouHqXwZ5uR0t5s5QbWEMz6oAFb1EAhM0cCedcwAuQZbFXQruXp1WlU2k
	Q7vQSG51awwFynpq80rChpUodyxCuxRYBLGKy4yfUOj6343BsRBzpC7rKcAWlN1KcHmTX0
	x73gNzdzk9L+3tcWBu3eG/6bPAQ0s5s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-VW6wUJ1QOoql_s3ZSfulXA-1; Fri, 23 Sep 2022 23:52:35 -0400
X-MC-Unique: VW6wUJ1QOoql_s3ZSfulXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70B81C0513D;
	Sat, 24 Sep 2022 03:52:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26AC317593;
	Sat, 24 Sep 2022 03:52:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC06A19465B9;
	Sat, 24 Sep 2022 03:52:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0394419465A4 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 24 Sep 2022 03:52:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D7960C15BA5; Sat, 24 Sep 2022 03:52:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D05F2C15BA4
 for <cluster-devel@redhat.com>; Sat, 24 Sep 2022 03:52:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B41213C0CD39
 for <cluster-devel@redhat.com>; Sat, 24 Sep 2022 03:52:31 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-Wb7H8VFFNS6gV6wgjYhbIQ-1; Fri, 23 Sep 2022 23:52:29 -0400
X-MC-Unique: Wb7H8VFFNS6gV6wgjYhbIQ-1
Received: by mail-pj1-f49.google.com with SMTP id
 o99-20020a17090a0a6c00b002039c4fce53so7603117pjo.2
 for <cluster-devel@redhat.com>; Fri, 23 Sep 2022 20:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3G1VrrLvYJ7MrbsK19m22XFQRvd7YcWq9IeFy6ACQL8=;
 b=r2d7BpNG9qw8t37L/aw+FL8wMYS0AK7RVoPM/XV4u1AW/h2i2jbAw5nwPz96RZigZu
 pAURWjTtR0ZGTaC8mRibUgojtyHmo7pN5rQnzpM+EAza0D1Nl+dly3c19r/CAV5ySwHs
 O79a4AdRO3wkZkMbAmyTxrWURdu42b1+kebBgjHaBeS4YTFMz3R+TaLONrS/h6MkToJa
 sf8CtXXJvS1emtZANlm4eOw6jdYMg4+df+BzmmQpHKFHKNryh2fQP33jf41/mkfahWxc
 S8FA61whu7QtPXXRYHnMSeh6ern1XTnbeehRz2JEM5SEatusVZgCUkN191FeNgAv8nsC
 rcXQ==
X-Gm-Message-State: ACrzQf2g1daaXGFOxfu5XSESHhh6xuxMbKhKZYcXrUXaXfxW2GvLJ//8
 CpooLmoB7yq2L1q+vYffoZBZ8Q==
X-Google-Smtp-Source: AMsMyM7rnV2yIjKRf0nltcgFw8A9YXNZErvQrcy80Et2nD0M74m5fnkvIhGCvlr8i5XgmYrnMTnW2Q==
X-Received: by 2002:a17:90b:4f90:b0:202:9be9:2c92 with SMTP id
 qe16-20020a17090b4f9000b002029be92c92mr24644365pjb.140.1663991548677; 
 Fri, 23 Sep 2022 20:52:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a6-20020aa795a6000000b0053abb15b3d9sm7492138pfk.19.2022.09.23.20.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 20:52:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christine Caulfield <ccaulfie@redhat.com>
Date: Fri, 23 Sep 2022 20:52:26 -0700
Message-Id: <20220924035226.3359297-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; h=from:subject;
 bh=e/Y6GTN0SCVQ259nA/pYwlFozQeGo0Cl6K1VpFhG2NE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLn75X8LVs9287oq0AOqk6fbfl+f5Dh2O94OSeNFT
 BKSCt3iJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy5++QAKCRCJcvTf3G3AJtFrD/
 9Auvgp4BKi9bKLLuhvLc/e/O1WDJsOFfuNo6xlL0Xxa1D97BC+ujNjbyj/GdCB94rJesYm9EjqgR9r
 pElxGT9NyZ+UiAThiQZEwy7SLXa2Yo6qq5eR99rppLpm1JtU/SduOCUqUEc06k6AqNBizpJyLwwTXz
 t12Mn9xZYWjzZrgr7syXWkFSjQAIqiy3xmDbYeFZzRc3SyWbu/K3jCrJwZfRFnxCngJ9dKHtvLBsCU
 4lFASXpkFsPGvWy51J3wAFTccWeqg7u/mJLIq6sG8N+MWUXVqOkdSBReA/koc21tIknyinJKvhcxc1
 vy9iRiQrEhG4czlnJStU2wv/YK48Jrz9jpvPWGgioWkGeHj9GX9IvcN5vJES/4uyJRe+y3QGops8Ch
 m3Vtm9AviVzNO6hkLBFgNbE9QyFjp6DfNJerwNrn9X4TN9M0heZmNkLDtM9wEMzFa/2ebOUauYzcIk
 llXFIXE74Xmfn+hAs2gwW8CI6CDVe7pQsC8Eew2fri1vXFtJjwV/Lg3/wzpxxKKixCoN/J1Z/ZoFqz
 OmE08kuUfMPGbCE+dfkMRt5a7aD0xuSrbTzIhnLa4R1r6m2y/j2/RBofyLao1CpX1tRBbVmka+bLBh
 BpYILJHURIleLwR3p8UBMg5WMtI9M+UzAFy4NhXoWCkDr12hhvS3tpk1BiEQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH] dlm: Split memcpy() of struct dlm_message
 flexible array
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, cluster-devel@redhat.com,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

To work around a misbehavior of the compiler's ability to see into
composite flexible array structs (as detailed in the coming memcpy()
hardening series[1]), split the memcpy() of the header and the payload
so no false positive run-time overflow warning will be generated.

[1] https://lore.kernel.org/linux-hardening/20220901065914.1417829-2-keescook@chromium.org/

Cc: Christine Caulfield <ccaulfie@redhat.com>
Cc: David Teigland <teigland@redhat.com>
Cc: cluster-devel@redhat.com
Reported-by: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/dlm/requestqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index 036a9a0078f6..63f45c3c53a2 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -44,7 +44,8 @@ void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid, struct dlm_message *ms)
 
 	e->recover_seq = ls->ls_recover_seq & 0xFFFFFFFF;
 	e->nodeid = nodeid;
-	memcpy(&e->request, ms, le16_to_cpu(ms->m_header.h_length));
+	e->request = *ms;
+	memcpy(&e->request.m_extra, ms->m_extra, length);
 
 	atomic_inc(&ls->ls_requestqueue_cnt);
 	mutex_lock(&ls->ls_requestqueue_mutex);
-- 
2.34.1

