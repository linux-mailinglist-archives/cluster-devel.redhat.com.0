Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECF7879F3
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4kmIPl82QlFlfdEPTZ6/KOVcZ1th9lFZlK8b4+z36x8=;
	b=UfCxi+KisW9jWzwCDdhFgD/OzPkE2q4HazuWGp+WB1avVdO9zJk2V3aihWyUcEo/mXnUUO
	XbacroYezEo4eYxuZ7AM/pQo6eCmq5Fw058zRb6BDAWXgG65YORBjJhBCF5dg8RbM8bzyS
	TmcPJD3+dfjlBPZ5uADCr8sG3+c2H1c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-W_OW3xqONU-OM29naVsbaQ-1; Thu, 24 Aug 2023 17:11:07 -0400
X-MC-Unique: W_OW3xqONU-OM29naVsbaQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C14E6858EED;
	Thu, 24 Aug 2023 21:11:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B42284A9004;
	Thu, 24 Aug 2023 21:11:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7657619465B5;
	Thu, 24 Aug 2023 21:11:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F4701946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:11:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A6F7492C3A; Thu, 24 Aug 2023 21:11:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 810C9492C14;
 Thu, 24 Aug 2023 21:11:04 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:11:00 +0200
Message-Id: <20230824211101.3242346-4-agruenba@redhat.com>
In-Reply-To: <20230824211101.3242346-1-agruenba@redhat.com>
References: <20230824211101.3242346-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 3/4] gfs2: Fix logd wakeup on I/O error
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

When quotad detects an I/O error, it sets sd_log_error and then it wakes
up logd to withdraw the filesystem.  However, logd doesn't wake up when
sd_log_error is set.  Fix that.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index aaca22f2aa2d..abe4397dc59b 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1340,6 +1340,7 @@ int gfs2_logd(void *data)
 				test_bit(SDF_FORCE_AIL_FLUSH, &sdp->sd_flags) ||
 				gfs2_ail_flush_reqd(sdp) ||
 				gfs2_jrnl_flush_reqd(sdp) ||
+				sdp->sd_log_error ||
 				kthread_should_stop(),
 				t);
 	}
-- 
2.40.1

