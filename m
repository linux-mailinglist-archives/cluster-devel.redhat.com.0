Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E35805C8
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Jul 2022 22:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658781530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MIKKemJJInfKJ0/bRrW7N0Ef6BtisMRa/5nJk4tBp8g=;
	b=c3kVMVTEheurtkPKIIkjap8M8pZp+ojIjzF179yW5Ve7f+rXIzTJkaTGqS2UFB5yWsQd2L
	FGZpJaZArNd/0NWaBjNuZaHUoezlKWq4mFuwAv2IqCQRY0ypFmOj5zfXMFcJUTwDVc0YnC
	LE29Qvj0FMzcMBSGQ7njiRl0jTsY+OI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-NRwu3e1nPVO378H-4hf8qA-1; Mon, 25 Jul 2022 16:38:47 -0400
X-MC-Unique: NRwu3e1nPVO378H-4hf8qA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9027E3C025CE;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48586401E5C;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C682C1945D8B;
	Mon, 25 Jul 2022 20:38:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D4AE61945D86 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 20:38:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7E7740C1288; Mon, 25 Jul 2022 20:38:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8977E40C128A;
 Mon, 25 Jul 2022 20:38:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 25 Jul 2022 16:38:31 -0400
Message-Id: <20220725203835.860277-2-aahringo@redhat.com>
In-Reply-To: <20220725203835.860277-1-aahringo@redhat.com>
References: <20220725203835.860277-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 1/5] fs: dlm: remove dlm_del_ast
 prototype
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
Cc: linux-raid@vger.kernel.org, joseph.qi@linux.alibaba.com, mark@fasheh.com,
 cluster-devel@redhat.com, song@kernel.org, jlbec@evilplan.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes dlm_del_ast() prototype which is not being used in
the dlm subsystem because there is not implementation for it.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/dlm/ast.h b/fs/dlm/ast.h
index 181ad7d20c4d..e5e05fcc5813 100644
--- a/fs/dlm/ast.h
+++ b/fs/dlm/ast.h
@@ -11,7 +11,6 @@
 #ifndef __ASTD_DOT_H__
 #define __ASTD_DOT_H__
 
-void dlm_del_ast(struct dlm_lkb *lkb);
 int dlm_add_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
                          int status, uint32_t sbflags, uint64_t seq);
 int dlm_rem_lkb_callback(struct dlm_ls *ls, struct dlm_lkb *lkb,
-- 
2.31.1

