Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C017742FB4
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Jun 2023 23:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688075448;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UpLlHUWZXL87rYGugpIj04FqgAB+oKEsvUu+Ka67nCE=;
	b=Qssd6ZhKWRh1lTfpwo9411bFEjQl5B/PO9MO5S4stgpOYLpCvKw2DqucfBnpRZZXUXi1lO
	bkOtDdj/AZ0GSQEiv3DSCeqZxvHJ7fdgAJTQxiLzibNML9cdvm3KKQsYgoinEnseirMw5z
	/KGPtNWreERuCBi4uTH85CljsxLo+3o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-HFuVt7LvPdmqFsGUMWKcVw-1; Thu, 29 Jun 2023 17:50:45 -0400
X-MC-Unique: HFuVt7LvPdmqFsGUMWKcVw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC5E3830EFF;
	Thu, 29 Jun 2023 21:50:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0A46492C13;
	Thu, 29 Jun 2023 21:50:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BAC331946A47;
	Thu, 29 Jun 2023 21:50:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8C201946A41 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 29 Jun 2023 21:50:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B495AF5CED; Thu, 29 Jun 2023 21:50:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD545F5CEC
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:50:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 077A3891F23
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:50:23 +0000 (UTC)
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-PchPtyyWMXqkqhYwfN_lqg-1; Thu,
 29 Jun 2023 17:50:18 -0400
X-MC-Unique: PchPtyyWMXqkqhYwfN_lqg-1
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Thu, 29 Jun 2023 23:50:16 +0200 (CEST)
X-EA-Auth: 8qhRdke3mHv05h5eyYsrMODcCW4Qllf4hyhJ119mGTYvfLGar6Bbd79n7KIGsdADT98DNArOr+XjY8Xfvucm8mUPvSIQ7zbX
Date: Fri, 30 Jun 2023 03:20:07 +0530
From: Deepak R Varma <drv@mailo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Message-ID: <4d132d7aa9cc71f88e6e02c8f6fcb0fec56542aa.1688073459.git.drv@mailo.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v3 2/6] gfs2: Replace kmap_atomic()+memcpy
 by memcpy_from_page()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mailo.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().

kmap_atomic() disables page-faults and preemption (the latter only for
!PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
gfs2_internal_read() does not depend on the above-mentioned side effects.

Further, memcpy_{from,to}_page() wrappers combine the
{kmap, unmap}_local_page() blocks when they are intended exclusively to
copy contents from/to the temporary mapped page. So, replace the
kmap_atomic()/kunmap_automic() block by the memcpy_from_page() API call.
This change allows to tidy-up code and also eliminate unused variable p.

Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Changes in v3:
   - Split as a separate patch for conversion in gfs2_internal_read() 
   - Use memcpy_from_page() as suggested by Fabio and  Andreas G
   - Included split version in patch set

Changes in v2:
   - Update patch description to correct the replacement function name
     from kmap_local_folio to kmap_local _page



 fs/gfs2/aops.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 3eac4f2f5c27..f47fed657763 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -489,7 +489,6 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
 	unsigned copied = 0;
 	unsigned amt;
 	struct page *page;
-	void *p;
 
 	do {
 		page = read_cache_page(mapping, index, gfs2_read_folio, NULL);
@@ -498,12 +497,12 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
 				continue;
 			return PTR_ERR(page);
 		}
-		p = kmap_atomic(page);
-		amt = size - copied;
 		if (offset + size > PAGE_SIZE)
 			amt = PAGE_SIZE - offset;
-		memcpy(buf + copied, p + offset, amt);
-		kunmap_atomic(p);
+		else
+			amt = size - copied;
+
+		memcpy_from_page(buf, page, offset, amt);
 		put_page(page);
 		copied += amt;
 		index++;
-- 
2.34.1



