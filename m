Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D26BF2D8
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Mar 2023 21:41:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679085694;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NA9Q+vk8C6MioB+mWvSan/tQIrdbqdtH0v1rLkU+nWA=;
	b=bHQlEMm0YKxH2wjgMJLFrlYb//XJNtoE/iy0mPwSO4yAiy813FtVp+yBOfG4dNhJf60hzc
	zzJMbR2O0ILfdjIrNWG2xlNgsFvmzb4gUizVmf4Erl0yRb2txByzbu/zwoHDv443Nj/CiO
	ulvrzi7re+vr/Z5MgifLIl1RncpmFWM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-FJOgfzA_PLSkxw4O9mp7gg-1; Fri, 17 Mar 2023 16:41:30 -0400
X-MC-Unique: FJOgfzA_PLSkxw4O9mp7gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEF583C0F395;
	Fri, 17 Mar 2023 20:41:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3B64C15BA0;
	Fri, 17 Mar 2023 20:41:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 38AA61946A50;
	Fri, 17 Mar 2023 20:41:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD2EC19466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B400C1410F1F; Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F52F1410F1B;
 Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Mar 2023 16:41:00 -0400
Message-Id: <20230317204102.1776638-2-aahringo@redhat.com>
In-Reply-To: <20230317204102.1776638-1-aahringo@redhat.com>
References: <20230317204102.1776638-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 1/3] dlm_controld: initialize waiter->flags
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

From: Andreas Gruenbacher <agruenba@redhat.com>

In function add_waiter(), waiter->flags is left uninitialized.  Fix that.

In function add_lock(), the allocated lock is zeroed out and then all
fields except po->flags are initialized.  That's not wrong, but it seems
easier to initialize po->flags instead, like add_waiter() does now.
---
 dlm_controld/plock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 24ad777a..f03f3abe 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -455,7 +455,6 @@ static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
 	po = malloc(sizeof(struct posix_lock));
 	if (!po)
 		return -ENOMEM;
-	memset(po, 0, sizeof(struct posix_lock));
 
 	po->start = start;
 	po->end = end;
@@ -463,6 +462,7 @@ static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
 	po->owner = owner;
 	po->pid = pid;
 	po->ex = ex;
+	po->flags = 0;
 	list_add_tail(&po->list, &r->locks);
 
 	return 0;
@@ -680,6 +680,7 @@ static int add_waiter(struct lockspace *ls, struct resource *r,
 	if (!w)
 		return -ENOMEM;
 	memcpy(&w->info, in, sizeof(struct dlm_plock_info));
+	w->flags = 0;
 	list_add_tail(&w->list, &r->waiters);
 	return 0;
 }
@@ -1095,6 +1096,7 @@ static void save_pending_plock(struct lockspace *ls, struct resource *r,
 		return;
 	}
 	memcpy(&w->info, in, sizeof(struct dlm_plock_info));
+	w->flags = 0;
 	list_add_tail(&w->list, &r->pending);
 }
 
@@ -1967,6 +1969,7 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 			w->info.pid	= le32_to_cpu(pp->pid);
 			w->info.nodeid	= le32_to_cpu(pp->nodeid);
 			w->info.ex	= pp->ex;
+			w->flags	= 0;
 			list_add_tail(&w->list, &r->waiters);
 		}
 		pp++;
-- 
2.31.1

