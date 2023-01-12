Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297F6686B4
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:19:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9NNB18gKcnS0Pxpt/ZttEQbkdup0aaw3uvhkV/kxgAQ=;
	b=TB14xF304eOsKXFqmw02C4gHKnZ1pdxk3tdeZDldkVKfbuC65zeqdg9q/QO6fybwXfnoL+
	ZSFOCvR4KYH77kQGiK+RpcpPngiB2FFe7WIHvuG+e9fN2PmK6ZaQzaWHX7YaJqC6afuf4x
	FMwJ9jEoZ5xuuO7QowSJNBuxnTwTclQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-_yBeDnVCOg2zdqMtBvgx9Q-1; Thu, 12 Jan 2023 17:19:13 -0500
X-MC-Unique: _yBeDnVCOg2zdqMtBvgx9Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43F0B884360;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 294FA492B00;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FBBD194706E;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3EAEF1947057 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:19:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1D88D40C2006; Thu, 12 Jan 2023 22:18:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC0AA40C2064;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:18:46 -0500
Message-Id: <20230112221849.1883104-6-aahringo@redhat.com>
In-Reply-To: <20230112221849.1883104-1-aahringo@redhat.com>
References: <20230112221849.1883104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 5/8] fs: dlm: reduce the timeout
 time to 5 secs
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

When a shutdown stucks for any reason we switch to a 5 secs timeout
instead of getting stucked for a long time and even HUNG_TASK reports
about stucking into the wait_event_timeout() handling. In 5 secs it
should already be done in most of all cases, if not we timeout and try
to force a shutdown.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index cf91a5a11b4f..3932c7cf0e7a 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -147,7 +147,7 @@
 /* init value for sequence numbers for testing purpose only e.g. overflows */
 #define DLM_SEQ_INIT		0
 /* 3 minutes wait to sync ending of dlm */
-#define DLM_SHUTDOWN_TIMEOUT	msecs_to_jiffies(3 * 60 * 1000)
+#define DLM_SHUTDOWN_TIMEOUT	msecs_to_jiffies(5000)
 #define DLM_VERSION_NOT_SET	0
 
 struct midcomms_node {
-- 
2.31.1

