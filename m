Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23990742FBE
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Jun 2023 23:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688075571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Dn4FxUBt1nJ2/5Cw/yPMrck6RPvZ2RavcA0IvoH9SbU=;
	b=C4gyitABZKSnL4gXuWYplhrilCpm1xFP2fmHoD/b7536VJ9Z3ggWYR617ZNFwVs4BUxDy8
	5++ZH90aAKanY/szI6f5kPRwb1qTeRW9TcnonkkQ3lMZ9ZGcPJMeK69E+gBkbtj7a69l4t
	gQLtRoCsY0J/wafgkfeT8Ai5wtvEI5U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-nBw8OGRCMz6C2TXcr4pUZw-1; Thu, 29 Jun 2023 17:52:45 -0400
X-MC-Unique: nBw8OGRCMz6C2TXcr4pUZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A172891F21;
	Thu, 29 Jun 2023 21:52:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE9A2166B25;
	Thu, 29 Jun 2023 21:52:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CD3F1946A47;
	Thu, 29 Jun 2023 21:52:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D67319465B6 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 29 Jun 2023 21:52:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3E84740C6CCD; Thu, 29 Jun 2023 21:52:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37BB440C6F5A
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:52:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D3743C11CD0
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:52:42 +0000 (UTC)
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-OrRzQKxaN92IhQ0u2klxJA-1; Thu,
 29 Jun 2023 17:52:38 -0400
X-MC-Unique: OrRzQKxaN92IhQ0u2klxJA-1
Received: by b221-2.in.mailobj.net [192.168.90.22] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Thu, 29 Jun 2023 23:52:36 +0200 (CEST)
X-EA-Auth: Rz1yyKWhBlZLKK+E7BgmFVdgRQu2DOQ6nBvjfd3qC+VEec0HVUJnMCWv71/GeS1XHqO4oOENrwt389pQ/71L0tyeKcGUbMkM
Date: Fri, 30 Jun 2023 03:22:27 +0530
From: Deepak R Varma <drv@mailo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Message-ID: <4bed561513ba76486ea3fc87f97e6c646f98cbe7.1688073459.git.drv@mailo.com>
References: <cover.1688073459.git.drv@mailo.com>
MIME-Version: 1.0
In-Reply-To: <cover.1688073459.git.drv@mailo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v3 6/6] gfs2: Replace kmap_atomic() by
 kmap_local_page() in gfs2_write_buf_to_page
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
Cc: Deepak R Varma <drv@mailo.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mailo.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().

Therefore, replace kmap_atomic() with kmap_local_page() in
gfs2_write_buf_to_page().

kmap_atomic() disables page-faults and preemption (the latter only for
!PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
gfs2_write_buf_to_page() does not depend on the above-mentioned side
effects.

Therefore, a mere replacement of the old API with the new one is all that
is required (i.e., there is no need to explicitly add any calls to
pagefault_disable() and/or preempt_disable()).

Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Changes in v3:
   - Patch included in patch set

Changes in v2:
   - None


 fs/gfs2/quota.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 386ca770ce2e..e5767133aeea 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -764,10 +764,10 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
 	}
 
 	/* Write to the page, now that we have setup the buffer(s) */
-	kaddr = kmap_atomic(page);
+	kaddr = kmap_local_page(page);
 	memcpy(kaddr + off, buf, bytes);
 	flush_dcache_page(page);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	unlock_page(page);
 	put_page(page);
 
-- 
2.34.1



