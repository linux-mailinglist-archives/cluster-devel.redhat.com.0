Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9E556FB5
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jun 2022 03:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655946280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qpqNTEc3yOlKl1OHH4bYBkAECpbIcE6ccea+Z+MtSQQ=;
	b=Cdd2/pRl/pgfiLWotKaOeSzAN2vyrkm+24dDFSUvBMLwpIpLqmyG6q+11CQYTH8hgdM4B9
	isL2LJGfc+7+QVInCwdxMBLhBRQeJNhaR2lYnzm6p2//e5wMvxHTg+FekE5i9CpfPh4Pc0
	KYeSN0XwkhJvpjTdCic8wKdUuhPN57A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-msqcKWGlP22tdpkeTPAqoQ-1; Wed, 22 Jun 2022 21:04:36 -0400
X-MC-Unique: msqcKWGlP22tdpkeTPAqoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CBAF81D9E8;
	Thu, 23 Jun 2022 01:04:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 498EC4011A3E;
	Thu, 23 Jun 2022 01:04:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B5F66194B945;
	Thu, 23 Jun 2022 01:04:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 321C9194B943 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Jun 2022 01:04:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E91A1410F3B; Thu, 23 Jun 2022 01:04:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 005EF141510C;
 Thu, 23 Jun 2022 01:04:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 21:04:22 -0400
Message-Id: <20220623010422.1926026-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix grammar in lowcomms
 output
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes some grammar output in lowcomms implementation by
removing the "successful" word which should be "successfully" but it
can never be unsuccessfully so we remove it.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 19e82f08c0e0..a4e84e8d94c8 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -529,7 +529,7 @@ static void lowcomms_write_space(struct sock *sk)
 		return;
 
 	if (!test_and_set_bit(CF_CONNECTED, &con->flags)) {
-		log_print("successful connected to node %d", con->nodeid);
+		log_print("connected to node %d", con->nodeid);
 		queue_work(send_workqueue, &con->swork);
 		return;
 	}
@@ -1931,7 +1931,7 @@ static int dlm_sctp_connect(struct connection *con, struct socket *sock,
 		return ret;
 
 	if (!test_and_set_bit(CF_CONNECTED, &con->flags))
-		log_print("successful connected to node %d", con->nodeid);
+		log_print("connected to node %d", con->nodeid);
 
 	return 0;
 }
-- 
2.31.1

