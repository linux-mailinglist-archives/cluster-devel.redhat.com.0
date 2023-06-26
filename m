Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E13473DAC4
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jun 2023 11:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687770277;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RVEVx49mxNIII67NO2PpPsiMVgXqHBi6kJxlBTilANo=;
	b=D8xPnMCSMZXMFqJERCK8bIz2AmAArZ6cz1iT4g34x7s0RQ++m2p573wqsADdnQR0F1zC+w
	nS0a3xhAMBjF5PMcNtE8cCRw+tBs6KLX9dp+KTMLG4Y4l3PJx1UVdUOdMDQ+23jy3fKEox
	bM81TUT3NwCGkLDUhEcwnmkvjINdH/I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-TtZnFyU6NIOesX0GNd2-Ng-1; Mon, 26 Jun 2023 05:04:32 -0400
X-MC-Unique: TtZnFyU6NIOesX0GNd2-Ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E177288CC49;
	Mon, 26 Jun 2023 09:04:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CD87112132D;
	Mon, 26 Jun 2023 09:04:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 22833194658C;
	Mon, 26 Jun 2023 09:04:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A5961946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 26 Jun 2023 06:51:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8D27A492B03; Mon, 26 Jun 2023 06:51:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A0F492B01
 for <cluster-devel@redhat.com>; Mon, 26 Jun 2023 06:51:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67C4E185A78F
 for <cluster-devel@redhat.com>; Mon, 26 Jun 2023 06:51:27 +0000 (UTC)
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-98-uFLIXDNyOBeV4eATaelp6w-1; Mon,
 26 Jun 2023 02:51:18 -0400
X-MC-Unique: uFLIXDNyOBeV4eATaelp6w-1
Received: by b221-6.in.mailobj.net [192.168.90.26] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Mon, 26 Jun 2023 08:51:16 +0200 (CEST)
X-EA-Auth: Eu/Q3BBGOZASBNR3dpmx6ET/wlVioDsvV4FoUhX+WcVKwrfl6adetu3e6VtSUbBvxZC7qTm86HVr6Td9HE/uWXqx2GV65Gol
Date: Mon, 26 Jun 2023 12:21:09 +0530
From: Deepak R Varma <drv@mailo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Message-ID: <ZJk1XTtgLFxIcxzp@bu2204.myguest.virtualbox.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 26 Jun 2023 09:04:29 +0000
Subject: [Cluster-devel] [PATCH v2] gfs2: Replace deprecated kmap_atomic()
 by kmap_local_page()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mailo.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().

Therefore, replace kmap_atomic() with kmap_local_page() in
gfs2_internal_read() and stuffed_readpage().

kmap_atomic() disables page-faults and preemption (the latter only for
!PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
gfs2_internal_read() and stuffed_readpage() does not depend on the
above-mentioned side effects.

Therefore, a mere replacement of the old API with the new one is all that
is required (i.e., there is no need to explicitly add any calls to
pagefault_disable() and/or preempt_disable()).

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Note: The Patch is build tested only. I will be happy to run recommended testing
with some guidance if required.

Changes in v2:
   - Update patch description to correct the replacement function name from
     kmap_local_folio to kmap_local _page 


 fs/gfs2/aops.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 3b41542d6697..7bd92054d353 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -432,10 +432,10 @@ static int stuffed_readpage(struct gfs2_inode *ip, struct page *page)
 	if (error)
 		return error;
 
-	kaddr = kmap_atomic(page);
+	kaddr = kmap_local_page(page);
 	memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
 	memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	flush_dcache_page(page);
 	brelse(dibh);
 	SetPageUptodate(page);
@@ -498,12 +498,12 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
 				continue;
 			return PTR_ERR(page);
 		}
-		p = kmap_atomic(page);
+		p = kmap_local_page(page);
 		amt = size - copied;
 		if (offset + size > PAGE_SIZE)
 			amt = PAGE_SIZE - offset;
 		memcpy(buf + copied, p + offset, amt);
-		kunmap_atomic(p);
+		kunmap_local(p);
 		put_page(page);
 		copied += amt;
 		index++;
-- 
2.34.1



