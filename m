Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74374558320
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jun 2022 19:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656005138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AjpIS2fIUKQUVBqsii9fDmHk9l5JfRHsf5FT4OkeuT4=;
	b=a5N9Rs0uoacZakRQA/qggfF35GRWaa+lYQh4aZ49kSwPtqJuuEkk3G1aQ6PQzcEP/DuZ3B
	56+YLOKpLgek4S+evBZOry9aOu1n8t2aZREvLUm5f6IS135MF1qArs0/FlajrhNPF/cNbg
	lnxyFG0/PpaiprD96Wqaal4COvMtxbU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-DKvrBmPkPlKcItKOs4VT3g-1; Thu, 23 Jun 2022 13:25:35 -0400
X-MC-Unique: DKvrBmPkPlKcItKOs4VT3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D2358001EA;
	Thu, 23 Jun 2022 17:25:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D8904050C47;
	Thu, 23 Jun 2022 17:25:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A3218194B95E;
	Thu, 23 Jun 2022 17:25:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0261A194B959 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Jun 2022 17:25:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 887E11121315; Thu, 23 Jun 2022 17:25:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66B211121314;
 Thu, 23 Jun 2022 17:25:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jun 2022 13:25:30 -0400
Message-Id: <20220623172530.2073884-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm-tool] controld: fix memory leak
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Compile with -fsanitize=address unveils the following memory leak:

==1175==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 216 byte(s) in 3 object(s) allocated from:
    #0 0x7f0881809b17 in calloc (/lib64/libasan.so.6+0xaeb17)
    #1 0x55b3f110bc78 in send_protocol /builddir/devel/dlm/dlm_controld/daemon_cpg.c:1872

SUMMARY: AddressSanitizer: 216 byte(s) leaked in 3 allocation(s).

This patch free's the allocated buffer in send_protocol which should be
copied in a different buffer by _send_message() already.
---
 dlm_controld/daemon_cpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dlm_controld/daemon_cpg.c b/dlm_controld/daemon_cpg.c
index f215edfd..e6a03a28 100644
--- a/dlm_controld/daemon_cpg.c
+++ b/dlm_controld/daemon_cpg.c
@@ -1886,6 +1886,7 @@ static void send_protocol(struct protocol *proto)
 	protocol_out(pr);
 
 	_send_message(cpg_handle_daemon, buf, len, DLM_MSG_PROTOCOL);
+	free(buf);
 }
 
 int set_protocol(void)
-- 
2.31.1

