Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47475AE45
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jul 2023 14:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689855856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=15ndCLE4j0PsQN0Q64B61q2EhsOt1Wz13WNh/mOTMa4=;
	b=U2NTLE6lWMd7bIBcz2NfYi/G4LLpgy/GeZDYvnqrD/WhI1TmhgOIaXFssbL8EFCAbp0Jxx
	30/Tmy9rPY94O1kPYziIJyvq0vGnLqDC6Yzi9Dlit+rSWePN4KHh7B1eHVCIxOTgPPdDhu
	OwRx2GhPzbeI+xHRgSSVAc9kLb0MgD4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-U5hTvw8YN0K3_l847oMd7Q-1; Thu, 20 Jul 2023 08:24:12 -0400
X-MC-Unique: U5hTvw8YN0K3_l847oMd7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8AC03C0C49E;
	Thu, 20 Jul 2023 12:24:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADFAAC57969;
	Thu, 20 Jul 2023 12:24:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 589F41946A6A;
	Thu, 20 Jul 2023 12:24:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02ECF19465BA for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Jul 2023 12:22:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C79EB207B315; Thu, 20 Jul 2023 12:22:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E492200B41D;
 Thu, 20 Jul 2023 12:22:46 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 20 Jul 2023 08:22:39 -0400
Message-Id: <20230720122241.1381845-2-aahringo@redhat.com>
In-Reply-To: <20230720122241.1381845-1-aahringo@redhat.com>
References: <20230720122241.1381845-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCHv4 v6.5-rc2 1/3] fs: dlm: remove twice newline
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

This patch removes a newline which log_print() already adds, also
removes wrapped string that causes a checkpatch warning.
---
 fs/dlm/plock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 70a4752ed913..a34f605d8505 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -240,8 +240,8 @@ static int dlm_plock_callback(struct plock_op *op)
 	rv = notify(fl, 0);
 	if (rv) {
 		/* XXX: We need to cancel the fs lock here: */
-		log_print("dlm_plock_callback: lock granted after lock request "
-			  "failed; dangling lock!\n");
+		log_print("%s: lock granted after lock request failed; dangling lock!",
+			  __func__);
 		goto out;
 	}
 
-- 
2.31.1

