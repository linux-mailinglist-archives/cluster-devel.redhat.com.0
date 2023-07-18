Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415275842D
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Jul 2023 20:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689703670;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MtKFy5OXgVICH4eSzUBHyPH3TdnYIlEk7+UESLNSAuI=;
	b=Nu5kx0oC1qG5hYnjRLhSJsXE1GTJOCaE5R0sC6SW2Mmmz2X0OpJECCSEvhQGTYhA6DPpcZ
	wtexGE9BBd/RrzlraMCCg9LMgSgGNvFhVB/pRo2kg7I5I+lWROfiu9VMGXxdDHfBfiS7zI
	FSPjXsE61rYzDhRshG0wE7zYyrHxpMw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-GzAMuzosOcqIklZ-mNiXqQ-1; Tue, 18 Jul 2023 14:07:43 -0400
X-MC-Unique: GzAMuzosOcqIklZ-mNiXqQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 517961C16607;
	Tue, 18 Jul 2023 18:07:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15940492B01;
	Tue, 18 Jul 2023 18:07:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F30719465A3;
	Tue, 18 Jul 2023 18:07:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1CDFB194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Jul 2023 18:07:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6E1B1207B320; Tue, 18 Jul 2023 18:07:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DA64200BA8B;
 Tue, 18 Jul 2023 18:07:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 18 Jul 2023 14:07:19 -0400
Message-Id: <20230718180721.745569-2-aahringo@redhat.com>
In-Reply-To: <20230718180721.745569-1-aahringo@redhat.com>
References: <20230718180721.745569-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCHv3 v6.5-rc2 1/3] fs: dlm: remove twice newline
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
Cc: ocfs2-devel@lists.linux.dev, mark@fasheh.com, cluster-devel@redhat.com,
 joseph.qi@linux.alibaba.com, jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes a newline which log_print() already adds, also
removes wrapped string that causes a checkpatch warning.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
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

