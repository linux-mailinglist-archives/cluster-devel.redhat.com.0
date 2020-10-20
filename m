Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3640E294445
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 23:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603228210;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=71AVdRMOJAlU+J7ac2gp6QSFX2oUVWRoTzII9yOGc24=;
	b=TM0wSXyl4fZto5BnxzFFjOd8XhvyCf3Gvh8LRfIShM2hdL0eMrWF+BFi1Ix1ImCgDt/kFQ
	RQYeasHyg0OsoqdNhBloWqnSATEtyGEe2sGSaZ3Z2YdFUG5CoaQ07Wgm3amyDPsqoowXsT
	vbm6wQxALa4n6YW/0FKwyYJMU9xrBQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-LMJhK-IFPYmBw5sJE5ipDg-1; Tue, 20 Oct 2020 17:10:08 -0400
X-MC-Unique: LMJhK-IFPYmBw5sJE5ipDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF6AE803F42;
	Tue, 20 Oct 2020 21:10:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC40F5B4A3;
	Tue, 20 Oct 2020 21:10:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EA1E8C7CD;
	Tue, 20 Oct 2020 21:10:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KLA2NS005664 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 17:10:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 82B7D55798; Tue, 20 Oct 2020 21:10:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-138.rdu2.redhat.com [10.10.119.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 120B76266E;
	Tue, 20 Oct 2020 21:10:01 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 20 Oct 2020 17:09:55 -0400
Message-Id: <20201020210957.1009638-2-aahringo@redhat.com>
In-Reply-To: <20201020210957.1009638-1-aahringo@redhat.com>
References: <20201020210957.1009638-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/3] fs: dlm: cleanup
	dlm_local_addr properly
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch assigns the dlm_local_addr entries to NULL after we freeing
the memory of the entry. This required because the user can changed some
settings with less addresses than before and a NULL check on start
functionality will check on a dangled pointer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 11e5e92148fda..9973293bfddcd 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1248,8 +1248,10 @@ static void deinit_local(void)
 {
 	int i;
 
-	for (i = 0; i < dlm_local_count; i++)
+	for (i = 0; i < dlm_local_count; i++) {
 		kfree(dlm_local_addr[i]);
+		dlm_local_addr[i] = NULL;
+	}
 }
 
 /* Initialise SCTP socket and bind to all interfaces
-- 
2.26.2

