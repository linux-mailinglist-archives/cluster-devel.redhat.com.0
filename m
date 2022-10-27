Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4408610313
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dT51T5qvOS9trWIOdJrQmow43MGX2aQ/Aa/x/AYEu+s=;
	b=c3q5r0iCFMcbDjOEqPNxOn8/XVznjqup0M1uBU454Bt0pqXgQcfml10sGwhT3C+f2Wz887
	5vg56GYpDAzNZtTg7e8IHV4T6vXX7svtYt5ZkBtAlQayTc0+Uq53cS8iPcVMtpiXDYHDkl
	KNXrftiTqsXDKC0uRc6b/cIRbBQroBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-6n2zJWUhOH24GCacIauFVg-1; Thu, 27 Oct 2022 16:46:02 -0400
X-MC-Unique: 6n2zJWUhOH24GCacIauFVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70C301012469;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA6D62024CC5;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2544B1947B89;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6419E1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B254112C25F; Thu, 27 Oct 2022 20:45:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07C091121325;
 Thu, 27 Oct 2022 20:45:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:26 -0400
Message-Id: <20221027204528.1119036-16-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 16/18] fs: dlm: fix log of lowcomms
 vs midcomms
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will fix a small issue when printing out that
dlm_midcomms_start() failed to start and it was printing out that the
dlm subcomponent lowcomms was failed but lowcomms is behind the midcomms
layer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index c438b909f221..cb7531ed89bc 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -391,7 +391,7 @@ static int threads_start(void)
 	/* Thread for sending/receiving messages for all lockspace's */
 	error = dlm_midcomms_start();
 	if (error) {
-		log_print("cannot start dlm lowcomms %d", error);
+		log_print("cannot start dlm midcomms %d", error);
 		goto scand_fail;
 	}
 
-- 
2.31.1

