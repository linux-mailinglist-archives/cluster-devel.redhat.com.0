Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B507150FF
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C4Tm1OBlPtL32lfL8k1O2kMnI4p0B0SfEHtzeOYu6Ug=;
	b=BbSQ1jz1Y9rwoOvUTV0oHRU0LqmXnwUHqmRz31iV2FKHkRnD86f5ZX1JR2VrsOWyutZkj5
	G99qCdAq+mSc7e8Md7u6tgelAuaPTStNAGUQyoXrTkT9xFXSIO3PJUB14Ad3rHrmfEqv5u
	66ZxWRvBpb1GJfjMbcdIHyqgdf6r+0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-KFh75pisML-ZvqsmZYVwFA-1; Mon, 29 May 2023 17:44:46 -0400
X-MC-Unique: KFh75pisML-ZvqsmZYVwFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86ED08037AB;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7994C140EBB8;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B33751946A44;
	Mon, 29 May 2023 21:44:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CD13E194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B2A732166B30; Mon, 29 May 2023 21:44:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 882F02166B2E;
 Mon, 29 May 2023 21:44:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:33 -0400
Message-Id: <20230529214440.2542721-5-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 05/12] fs: dlm: don't check
 othercon twice
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes an another check if con->othercon set inside the
branch which already does that.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 5aad4d4842eb..b28505b8b23b 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1497,8 +1497,7 @@ int dlm_lowcomms_close(int nodeid)
 	call_srcu(&connections_srcu, &con->rcu, connection_release);
 	if (con->othercon) {
 		clean_one_writequeue(con->othercon);
-		if (con->othercon)
-			call_srcu(&connections_srcu, &con->othercon->rcu, connection_release);
+		call_srcu(&connections_srcu, &con->othercon->rcu, connection_release);
 	}
 	srcu_read_unlock(&connections_srcu, idx);
 
-- 
2.31.1

