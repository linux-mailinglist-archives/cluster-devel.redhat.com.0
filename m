Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3D607FB9
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Oct 2022 22:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666383828;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sGHLZ9i0PhLNYdkQgOx4/ANbgE0oImZMeP1p17umZas=;
	b=CobZq0R1HN52nqblAZhm4Zo78UMjGxIrR5blFB9QHaX3vvkXliHH6vRUl33jt4QakxehQM
	RXsVo05elCXKp9dCUOPITqTdP+SF3nRqfk1G3vLyUAKVIQV623W0gJcsJAEyc9dEBycRp3
	LjB+fZIWBa4VF2iTxgn1cxoFevCx7kc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-A1RbXV3jM4OuA41Q3iP73g-1; Fri, 21 Oct 2022 16:23:40 -0400
X-MC-Unique: A1RbXV3jM4OuA41Q3iP73g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27DB2855438;
	Fri, 21 Oct 2022 20:23:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1DE7492B04;
	Fri, 21 Oct 2022 20:23:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 609F119465A0;
	Fri, 21 Oct 2022 20:23:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EEFEF1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Oct 2022 20:23:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B2B732166B32; Fri, 21 Oct 2022 20:23:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8616D2166B2C;
 Fri, 21 Oct 2022 20:23:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 Oct 2022 16:23:27 -0400
Message-Id: <20221021202328.869453-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH 1/2] fs: dlm: fix sock release if listen
 fails
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes a double sock_release() call when the listen() is
called for the dlm lowcomms listen socket. The caller of
dlm_listen_for_all should never care about releasing the socket if
dlm_listen_for_all() fails, it's done now only once if listen() fails.

Cc: stable@vger.kernel.org
Fixes: 2dc6b1158c28 ("fs: dlm: introduce generic listen")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 59f64c596233..2cb9f3b49e05 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1820,7 +1820,7 @@ static int dlm_listen_for_all(void)
 	result = sock->ops->listen(sock, 5);
 	if (result < 0) {
 		dlm_close_sock(&listen_con.sock);
-		goto out;
+		return result;
 	}
 
 	return 0;
@@ -2023,7 +2023,6 @@ int dlm_lowcomms_start(void)
 	dlm_proto_ops = NULL;
 fail_proto_ops:
 	dlm_allow_conn = 0;
-	dlm_close_sock(&listen_con.sock);
 	work_stop();
 fail_local:
 	deinit_local();
-- 
2.31.1

