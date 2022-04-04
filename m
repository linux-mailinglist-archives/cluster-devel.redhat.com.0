Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 144844F1A17
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102848;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pzCxVyRf5Xfqw4rr5+Ic5BbDE+dg0m0WzAtDFBJD6Qc=;
	b=X965EeJIWOcLISYqyyvr1eHiqwdDnSeSF4I0GrDL/0OdYyBbIwbBJJy4ywhSGlRunOsKSD
	/iucsKYeAfHK+p7juM2OvQtxUiX+R0gbFbpKdyauWPgg2y4hKJngErjYClvBN4WK6iplk9
	2wegC7orcO34R1siXnRg5ATygcCKMPE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-sDdGd3THNvyrYyGU9ArQyA-1; Mon, 04 Apr 2022 16:07:23 -0400
X-MC-Unique: sDdGd3THNvyrYyGU9ArQyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DBA83800512;
	Mon,  4 Apr 2022 20:07:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDD7740E80F3;
	Mon,  4 Apr 2022 20:06:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1888A194036F;
	Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1D0981940367 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D376C7C2A; Mon,  4 Apr 2022 20:06:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4A9E7C28;
 Mon,  4 Apr 2022 20:06:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:28 -0400
Message-Id: <20220404200646.3170301-2-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 01/19] fs: dlm:
 uninitialized variable on error in dlm_listen_for_all()
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
Content-Type: application/octet-stream; x-default=true

From: Dan Carpenter <dan.carpenter@oracle.com>

The "sock" variable is not initialized on this error path.

Cc: stable@vger.kernel.org
Fixes: 2dc6b1158c28 ("fs: dlm: introduce generic listen")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e284d696c1fd..6ed935ad8247 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1789,7 +1789,7 @@ static int dlm_listen_for_all(void)
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
 	if (result < 0) {
 		log_print("Can't create comms socket: %d", result);
-		goto out;
+		return result;
 	}
 
 	sock_set_mark(sock->sk, dlm_config.ci_mark);
-- 
2.31.1

