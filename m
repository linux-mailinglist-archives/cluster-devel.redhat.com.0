Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C49EF593A72
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660592615;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JeLrClZNGJ02ACNbH8Qq9dpRgGZjYME46erdZJmsIaw=;
	b=MqRtsuwE6fEFP6gXaShYIWljEbYO2WlHWIJtjR9pjasPREi/dVeStIZuo+8mxLRu6Aocwy
	3TtPPQycNwFgP1sPARsyDUW+36BBglt/f7YEVfmy4aYw1gPU1oncvyt+wlWqlA4zM4EZkm
	H74skArhfUADGs4BkiLPUEQep4Bd7YU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-mddwLFq3MCKc-oMzPvdzZQ-1; Mon, 15 Aug 2022 15:43:34 -0400
X-MC-Unique: mddwLFq3MCKc-oMzPvdzZQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0829018A6506;
	Mon, 15 Aug 2022 19:43:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F01EF492CA5;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3EFC61940364;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2B1201940351 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 20F52112131B; Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 090B91121315;
 Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:43:21 -0400
Message-Id: <20220815194328.2208580-10-aahringo@redhat.com>
In-Reply-To: <20220815194328.2208580-1-aahringo@redhat.com>
References: <20220815194328.2208580-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [RESEND dlm/next 09/16] fs: dlm: handle rcom in
 else if branch
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently we handle in dlm_receive_buffer() everything else than a
DLM_MSG type as DLM_RCOM message. Although a different message than
DLM_MSG should be a DLM_RCOM we should explicit check on DLM_RCOM and
drop a log_error() if we see something unexpected.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index da95ba3c295e..c41aa8ab3230 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5108,8 +5108,11 @@ void dlm_receive_buffer(union dlm_packet *p, int nodeid)
 	down_read(&ls->ls_recv_active);
 	if (hd->h_cmd == DLM_MSG)
 		dlm_receive_message(ls, &p->message, nodeid);
-	else
+	else if (hd->h_cmd == DLM_RCOM)
 		dlm_receive_rcom(ls, &p->rcom, nodeid);
+	else
+		log_error(ls, "invalid h_cmd %d from %d lockspace %x",
+			  hd->h_cmd, nodeid, le32_to_cpu(hd->u.h_lockspace));
 	up_read(&ls->ls_recv_active);
 
 	dlm_put_lockspace(ls);
-- 
2.31.1

