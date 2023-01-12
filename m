Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC676686A1
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TZXFxPpbpZp8Wn0GeHP/zXaOsrC9szMxKbc0/N6gY1U=;
	b=UIQV7E7819ZVZnSa3Ssb+LItXBOxLqPcNZOspgzyj1vrZ2I3w6hN7KxHjnSKKAs5WcsgFG
	3uFK+h0tl3aGX6iZIz6fkRJKj3o09BUOn8RTRmNWeoDmcivKUijcChVZh14EEzu9Tr9eB2
	DMAjpAQTsC1qRzr2WA79JWp6y7vSOGs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-W69gMs-lME-LuL-ZMbPj2Q-1; Thu, 12 Jan 2023 17:11:04 -0500
X-MC-Unique: W69gMs-lME-LuL-ZMbPj2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA0821C087A6;
	Thu, 12 Jan 2023 22:11:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD59739D92;
	Thu, 12 Jan 2023 22:11:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C45D1947051;
	Thu, 12 Jan 2023 22:11:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 259B91946A78 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:10:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0AD0A1121318; Thu, 12 Jan 2023 22:10:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4FEE1121314;
 Thu, 12 Jan 2023 22:10:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:10:34 -0500
Message-Id: <20230112221037.1882548-4-aahringo@redhat.com>
In-Reply-To: <20230112221037.1882548-1-aahringo@redhat.com>
References: <20230112221037.1882548-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm/next 4/7] fs: dlm: fix race setting stop
 tx flag
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes to set the stop tx flag before we commit the dlm
message. This flag will report about unexpected transmissions after we
send the DLM_FIN messages out which should be the last message which is
send out. When we commit the dlm fin message it could be that we already
got an ack back and the FIN until CLOSED state change already happened.
We should not set this flag when we are in CLOSED state, to avoid this
race we simple set the tx flag before the state change can be in
progress by moving it before dlm_midcomms_commit_mhandle().

Cc: stable@vger.kernel.org
Fixes: 489d8e559c65 ("fs: dlm: add reliable connection if reconnect")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index a3eb19c8cec5..9d459d5bf800 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -406,6 +406,7 @@ static int dlm_send_fin(struct midcomms_node *node,
 	if (!mh)
 		return -ENOMEM;
 
+	set_bit(DLM_NODE_FLAG_STOP_TX, &node->flags);
 	mh->ack_rcv = ack_rcv;
 
 	m_header = (struct dlm_header *)ppc;
@@ -417,7 +418,6 @@ static int dlm_send_fin(struct midcomms_node *node,
 
 	pr_debug("sending fin msg to node %d\n", node->nodeid);
 	dlm_midcomms_commit_mhandle(mh, NULL, 0);
-	set_bit(DLM_NODE_FLAG_STOP_TX, &node->flags);
 
 	return 0;
 }
-- 
2.31.1

