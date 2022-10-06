Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 477BD5F6B11
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Oct 2022 17:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665071786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ubZkm3iqiD4EZ0iNyfCzQtpmeBA8U+xctWHtczZHsYA=;
	b=XaojX6+BC0iHmAhdmwNpDOLJ/kN+GpZKNN8VMCdvDQFhOHXLODSKnAAvWsOGm/qb5tPbPU
	+2vYKGvmmnavm0PfTLwt9UK4AFX9YzCikuPGcSJF1BtHV47DEEKYn23RVhc+PrJl/RXEsi
	tg9jFJYL2HSBS6DRWnKCwSBPHx8eC8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-aJ34xGX8M76v2RwMALKRQw-1; Thu, 06 Oct 2022 11:56:21 -0400
X-MC-Unique: aJ34xGX8M76v2RwMALKRQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10069857F92;
	Thu,  6 Oct 2022 15:56:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8719B1121320;
	Thu,  6 Oct 2022 15:56:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 144CE19465B9;
	Thu,  6 Oct 2022 15:56:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0EA601946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Oct 2022 15:56:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0339B40FF656; Thu,  6 Oct 2022 15:56:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D317840FF655;
 Thu,  6 Oct 2022 15:56:16 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  6 Oct 2022 11:56:06 -0400
Message-Id: <20221006155606.687350-2-aahringo@redhat.com>
In-Reply-To: <20221006155606.687350-1-aahringo@redhat.com>
References: <20221006155606.687350-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 2/2] fs: dlm: relax sending to
 allow receiving
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch drops additionally the sock_mutex when there is a sending
message burst. Since we have acknowledge handling we free sending
buffers only when we receive an ack back, but if we are stuck in
send_to_sock() looping because dlm sends a lot of messages and we never
leave the loop the sending buffer will up very quickly. We can't receive
during this iteration because the sock_mutex is held. This patch will
unlock the sock_mutex so it should be possible to receive messages when
a burst of sending messages happens. This will allow to free up memory
because acks which are already received can be processed.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index f6078980bc03..4b25899085e6 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1418,7 +1418,10 @@ static void send_to_sock(struct connection *con)
 	const int msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 	struct writequeue_entry *e;
 	int len, offset, ret;
-	int count = 0;
+	int count;
+
+again:
+	count = 0;
 
 	mutex_lock(&con->sock_mutex);
 	if (con->sock == NULL)
@@ -1453,14 +1456,16 @@ static void send_to_sock(struct connection *con)
 		} else if (ret < 0)
 			goto out;
 
+		spin_lock(&con->writequeue_lock);
+		writequeue_entry_complete(e, ret);
+
 		/* Don't starve people filling buffers */
 		if (++count >= MAX_SEND_MSG_COUNT) {
+			spin_unlock(&con->writequeue_lock);
+			mutex_unlock(&con->sock_mutex);
 			cond_resched();
-			count = 0;
+			goto again;
 		}
-
-		spin_lock(&con->writequeue_lock);
-		writequeue_entry_complete(e, ret);
 	}
 	spin_unlock(&con->writequeue_lock);
 
-- 
2.31.1

