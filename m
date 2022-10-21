Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F4607FB7
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Oct 2022 22:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666383823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QKowXkZ3FV97O1ePJlhG2vtVr0Ym5oITV3vfEqsBkto=;
	b=H42azrLrdgXEaV1WN78ltCOs7KtBCBhMUvrOrSv19D6kuOBSwX5Rwl3f+VR9VO2FKS7nvM
	s1Dsqhc2i5sT9qdHQZ6VkD4P9cqbNT+vzLV4e2yN0YUCTDDlXbdN7ACug1tctaJqGO7jMH
	SHi0Mb+BXrvHUCEhfRi72O6vOu6q4gY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-G59agQwXOx-eMiOdowitYA-1; Fri, 21 Oct 2022 16:23:39 -0400
X-MC-Unique: G59agQwXOx-eMiOdowitYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26D4E380350D;
	Fri, 21 Oct 2022 20:23:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79AD2C15BA5;
	Fri, 21 Oct 2022 20:23:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5380B1946589;
	Fri, 21 Oct 2022 20:23:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF36A1946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Oct 2022 20:23:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E0A1E2166B34; Fri, 21 Oct 2022 20:23:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B85E52166B2C;
 Fri, 21 Oct 2022 20:23:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 Oct 2022 16:23:28 -0400
Message-Id: <20221021202328.869453-2-aahringo@redhat.com>
In-Reply-To: <20221021202328.869453-1-aahringo@redhat.com>
References: <20221021202328.869453-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH 2/2] fs: dlm: retry accept() until -EAGAIN
 or error returns
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes a race if we get two times an socket data ready event
while the listen connection worker is queued. Currently it will be
served only once but we need to do it (in this case twice) until we hit
-EAGAIN which tells us there is no pending accept going on.

This patch wraps an do while loop until we receive a return value which
is different than 0 as it was done before commit d11ccd451b65 ("fs: dlm:
listen socket out of connection hash").

Cc: stable@vger.kernel.org
Fixes: d11ccd451b65 ("fs: dlm: listen socket out of connection hash")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 2cb9f3b49e05..871d4e9f49fb 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1543,7 +1543,11 @@ static void process_recv_sockets(struct work_struct *work)
 
 static void process_listen_recv_socket(struct work_struct *work)
 {
-	accept_from_sock(&listen_con);
+	int ret;
+
+	do {
+		ret = accept_from_sock(&listen_con);
+	} while (!ret);
 }
 
 static void dlm_connect(struct connection *con)
-- 
2.31.1

