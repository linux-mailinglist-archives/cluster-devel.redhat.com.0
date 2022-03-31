Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CB4EECD3
	for <lists+cluster-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:50 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-XpzzmwPtPRSIydzNOYYlWA-1; Fri, 01 Apr 2022 08:04:46 -0400
X-MC-Unique: XpzzmwPtPRSIydzNOYYlWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDEC63C00089;
	Fri,  1 Apr 2022 12:04:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB77A9E63;
	Fri,  1 Apr 2022 12:04:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 79D221940344;
	Fri,  1 Apr 2022 12:04:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BC2A81947BBB for <cluster-devel@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 22:02:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AE3B32026D6A; Thu, 31 Mar 2022 22:02:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9A092026D64
 for <cluster-devel@redhat.com>; Thu, 31 Mar 2022 22:02:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B541C802809
 for <cluster-devel@redhat.com>; Thu, 31 Mar 2022 22:02:23 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-zhA8CdrDNVi-yBWxmxdrPQ-1; Thu, 31 Mar 2022 18:02:19 -0400
X-MC-Unique: zhA8CdrDNVi-yBWxmxdrPQ-1
Received: by mail-ed1-f44.google.com with SMTP id x34so851777ede.8;
 Thu, 31 Mar 2022 15:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zVX+ni+qIlknEI/UHZP1JghyHCXyos1MEYHumXUzMdo=;
 b=YiO3LgGrfs5q9QLC1TIR7Q4v3br4N64HwfpodKY+MVZDfFfRgv1YzUFlk5q9b04gKu
 Gv/lkO1MHkN00ztwkr9HfrqQENNjvVM62ehCBhFVqw7f4z3V8BpZnBQnDrSYIKwKij1C
 NRq8xnPxH/DNOrs6Azxuh8W74BDOrj934MBJU3k6FYsBL9i5AZ+4lR/Q45uBEUwxfyvJ
 Ci1cxFigFdkB70SKpLtGg6+LmFnhKyOoky6+ivwt2t4amlCl/3zLDB12e1eGdfBSsV8D
 SgSBIRGzJ/dO9cAoAg9jwp9X+DPh2QGkcNhECkYsotsF3b6acNJ/Hatq8xVmzhFlUqk8
 Femg==
X-Gm-Message-State: AOAM532D915BmGa8Ht1uNWO8tQUbuyAhWEneLuNictlLODMCJzOBaBYh
 Rza4669AQw8XRMJP8g8TSh34uqUn5qdFuA==
X-Google-Smtp-Source: ABdhPJy13+OSM+bS9OkKiQ3oVJ1rBRV700cQePPUmDvgd04hMxGLRlCzZdxaK4VZTe3hrAU1uVJHuQ==
X-Received: by 2002:aa7:d445:0:b0:41b:5835:c6da with SMTP id
 q5-20020aa7d445000000b0041b5835c6damr15266061edr.309.1648764138136; 
 Thu, 31 Mar 2022 15:02:18 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n21-20020a170906725500b006e10a7d6d03sm238050ejk.219.2022.03.31.15.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:02:17 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>
Date: Fri,  1 Apr 2022 00:00:12 +0200
Message-Id: <20220331220013.884633-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mailman-Approved-At: Fri, 01 Apr 2022 12:04:43 +0000
Subject: [Cluster-devel] [PATCH 1/2] dlm: remove usage of list iterator for
 list_add() after the loop body
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
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, cluster-devel@redhat.com,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Jakob Koschel <jakobkoschel@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Before, the code implicitly used the head when no element was found
when using &pos->list. Since the new variable is only set if an
element was found, the list_add() is performed within the loop
and only done after the loop if it is done on the list head directly.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 fs/dlm/lock.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index bdb51d209ba2..66e92617d7ea 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1306,13 +1306,17 @@ static inline void unhold_lkb(struct dlm_lkb *lkb)
 static void lkb_add_ordered(struct list_head *new, struct list_head *head,
 			    int mode)
 {
-	struct dlm_lkb *lkb = NULL;
+	struct dlm_lkb *lkb = NULL, *iter;
 
-	list_for_each_entry(lkb, head, lkb_statequeue)
-		if (lkb->lkb_rqmode < mode)
+	list_for_each_entry(iter, head, lkb_statequeue)
+		if (iter->lkb_rqmode < mode) {
+			lkb = iter;
+			list_add_tail(new, &iter->lkb_statequeue);
 			break;
+		}
 
-	__list_add(new, lkb->lkb_statequeue.prev, &lkb->lkb_statequeue);
+	if (!lkb)
+		list_add_tail(new, head);
 }
 
 /* add/remove lkb to rsb's grant/convert/wait queue */

base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
-- 
2.25.1

