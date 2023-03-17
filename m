Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A512C6BF2D7
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Mar 2023 21:41:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679085691;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ld/Q6Ucvq9AVIMQruImJcUJMfpcZp0OQoQkgEuZOUSc=;
	b=DqINjUc07LkGSb+tX6E0JNL3kbxSYlP4DDv58y9wo7tA6Nkl+xDoJ3vrwxs3l/WZdE9Mub
	lfSQ5gLdNONYmmpVNVItcw774fb4uCsBDPC+nwptk4s35sfkY64q1gsgkVwmbaKOAxa+l3
	Vvb2Wz8JWRplExzC1WfVQW8gX8sozCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-qa4rslv-NEOYKtNumMqA3w-1; Fri, 17 Mar 2023 16:41:26 -0400
X-MC-Unique: qa4rslv-NEOYKtNumMqA3w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D24D685A5A3;
	Fri, 17 Mar 2023 20:41:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C72EE492B00;
	Fri, 17 Mar 2023 20:41:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 523FA1946A63;
	Fri, 17 Mar 2023 20:41:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2FFE019466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Mar 2023 20:41:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12E221410F1C; Fri, 17 Mar 2023 20:41:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2FFA1410F1B;
 Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Mar 2023 16:41:02 -0400
Message-Id: <20230317204102.1776638-4-aahringo@redhat.com>
In-Reply-To: <20230317204102.1776638-1-aahringo@redhat.com>
References: <20230317204102.1776638-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 3/3] dlm_controld: remove unnecessary
 list_empty check
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

All that do_waiters() does is iterate the the waiters list of a
resource, so there is no need to check if the waiters list is empty
before calling do_waiters().
---
 dlm_controld/plock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 85d6fdf2..ad9b0f27 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -2055,8 +2055,7 @@ void purge_plocks(struct lockspace *ls, int nodeid, int unmount)
 			send_pending_plocks(ls, r);
 		}
 		
-		if (!list_empty(&r->waiters))
-			do_waiters(ls, r);
+		do_waiters(ls, r);
 
 		if (!opt(plock_ownership_ind) &&
 		    list_empty(&r->locks) && list_empty(&r->waiters)) {
-- 
2.31.1

