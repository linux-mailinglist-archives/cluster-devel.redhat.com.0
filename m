Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B059B463ECB
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Nov 2021 20:47:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638301677;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0EWoMqUxfrJ/a6+HH3oQt18ApQ7ws5y2ddxDfYhtzgc=;
	b=Cbm0u55moBpMCVFY+ya8cdj86rhr3E6l8ujhCE8/bxN4VSaY2Z8HfHlPYOHPb7BLCdpkKU
	gnXVDGtywJ3Jj5gx3uBPjZtgF2dosMVCKukYjy2zxmrWdNcjattA8QujguNi3CsJ6yFYPI
	/RdL//kbf8p9RFep9by9u/41jmYR7QI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-URQmu1L6Pd6gMtRIN8Z78w-1; Tue, 30 Nov 2021 14:47:54 -0500
X-MC-Unique: URQmu1L6Pd6gMtRIN8Z78w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEB6B83DD56;
	Tue, 30 Nov 2021 19:47:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD98E5F4F5;
	Tue, 30 Nov 2021 19:47:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19FA01809C89;
	Tue, 30 Nov 2021 19:47:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUJlhMe022121 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 14:47:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6563E45D67; Tue, 30 Nov 2021 19:47:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 091E567842;
	Tue, 30 Nov 2021 19:47:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 30 Nov 2021 14:47:15 -0500
Message-Id: <20211130194720.666400-2-aahringo@redhat.com>
In-Reply-To: <20211130194720.666400-1-aahringo@redhat.com>
References: <20211130194720.666400-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 2/7] fs: dlm: check for pending
	users filling buffers
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Currently we don't care if the DLM application stack is filling buffers
(not committed yet) while we transmit some already committed buffers.
By checking on active writequeue users before dequeue a writequeue entry
we know there is coming more data and do nothing. We wait until the send
worker will be triggered again if the writequeue entry users hit zero.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index f7fc1ac76ce8..6d500ebc6145 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -201,7 +201,10 @@ static struct writequeue_entry *con_next_wq(struct connection *con)
 
 	e = list_first_entry(&con->writequeue, struct writequeue_entry,
 			     list);
-	if (e->len == 0)
+	/* if len is zero nothing is to send, if there are users filling
+	 * buffers we wait until the users are done so we can send more.
+	 */
+	if (e->users || e->len == 0)
 		return NULL;
 
 	return e;
-- 
2.27.0

