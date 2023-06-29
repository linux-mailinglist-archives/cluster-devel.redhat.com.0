Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B1742FB8
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Jun 2023 23:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688075502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=VqAL1afVs3VwQQxoVXsOQ91yHzULT56tCGgI4gabYgw=;
	b=bfy/Zr0fAxNxBfgcQjnGvVUVmDyAEETJQNc6C6ulPnsRZ8WsHgUWAWMgIm2dgWQz9gUhDU
	Jw5GIA+5UJonbDxQr/2qnhCDyn8oGfqcYD26v17Ld2Synq+wPAgylPHiDs6WY+0xW7IVPa
	JWxJBIk18q51sazZx5KguQt0tGj/OWg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-YFWKV8lHPUqEug_hsIeUgg-1; Thu, 29 Jun 2023 17:51:39 -0400
X-MC-Unique: YFWKV8lHPUqEug_hsIeUgg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E65D3C11CC6;
	Thu, 29 Jun 2023 21:51:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7399B492C13;
	Thu, 29 Jun 2023 21:51:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E18AD1946A47;
	Thu, 29 Jun 2023 21:51:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE33919465B6 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 29 Jun 2023 21:51:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9B2D400F1F; Thu, 29 Jun 2023 21:51:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1F9A492B02
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:51:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1F20104458D
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:51:32 +0000 (UTC)
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-GJCZnCMCPfS1nNlUPOzBHw-1; Thu,
 29 Jun 2023 17:51:28 -0400
X-MC-Unique: GJCZnCMCPfS1nNlUPOzBHw-1
Received: by b221-1.in.mailobj.net [192.168.90.21] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Thu, 29 Jun 2023 23:51:27 +0200 (CEST)
X-EA-Auth: P5HCG1ciElwbYgm7onYtMKqytCsT9R2NvTWwxi5496GTptuJln+k/TlBbmf/Liqh+qR0xtiWqaFWGGY8kby6/5SK7yiAPc69
Date: Fri, 30 Jun 2023 03:21:17 +0530
From: Deepak R Varma <drv@mailo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Message-ID: <4817527acb9e015b3c6929517993ea50ba3427ad.1688073459.git.drv@mailo.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v3 4/6] gfs2: Replace kmap_atomic() by
 kmap_local_page() in lops.c
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

Therefore, replace kmap_atomic() with kmap_local_page() in following
functions of lops.c:
   - gfs2_jhead_pg_srch()
   - gfs2_check_magic()
   - gfs2_before_commit()

kmap_atomic() disables page-faults and preemption (the latter only for
!PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
stuffed_readpage() does not depend on the above-mentioned side effects.

Therefore, a mere replacement of the old API with the new one is all that
is required (i.e., there is no need to explicitly add any calls to
pagefault_disable() and/or preempt_disable()).

Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Changes in v3:
   - Patch included in patch series

Changes in v2:
   - None


 fs/gfs2/lops.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 1902413d5d12..a7c2296cb3c6 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -427,7 +427,7 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
 {
 	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
 	struct gfs2_log_header_host lh;
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	unsigned int offset;
 	bool ret = false;
 
@@ -441,7 +441,7 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
 			}
 		}
 	}
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	return ret;
 }
 
@@ -626,11 +626,11 @@ static void gfs2_check_magic(struct buffer_head *bh)
 	__be32 *ptr;
 
 	clear_buffer_escaped(bh);
-	kaddr = kmap_atomic(bh->b_page);
+	kaddr = kmap_local_page(bh->b_page);
 	ptr = kaddr + bh_offset(bh);
 	if (*ptr == cpu_to_be32(GFS2_MAGIC))
 		set_buffer_escaped(bh);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 static int blocknr_cmp(void *priv, const struct list_head *a,
@@ -699,10 +699,10 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 				void *kaddr;
 				page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
 				ptr = page_address(page);
-				kaddr = kmap_atomic(bd2->bd_bh->b_page);
+				kaddr = kmap_local_page(bd2->bd_bh->b_page);
 				memcpy(ptr, kaddr + bh_offset(bd2->bd_bh),
 				       bd2->bd_bh->b_size);
-				kunmap_atomic(kaddr);
+				kunmap_local(kaddr);
 				*(__be32 *)ptr = 0;
 				clear_buffer_escaped(bd2->bd_bh);
 				unlock_buffer(bd2->bd_bh);
-- 
2.34.1



