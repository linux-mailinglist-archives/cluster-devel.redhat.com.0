Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB014742FBA
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Jun 2023 23:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688075532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6UCUjbfrjCRlXH9VZi7fTsH4/KP0Y6Q0yvhS5S25id8=;
	b=E87z6ESXwJxoSvj0lbhXfWs4cwBdXXnIMB7kJKrdW76nDsrUP6Njlzwpw/+etpDQxZzkvs
	2qXGykRidUt7Z1kVqmi1TMp48NbWxOXTVihi/unwhtoRNKTFybY6A80bbtUsjv2sp2HD69
	8OuzeQH+H6KoyWGZki8zy4RdqVnpfZo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-K42GICThNTGCbJjFpOfAIQ-1; Thu, 29 Jun 2023 17:52:09 -0400
X-MC-Unique: K42GICThNTGCbJjFpOfAIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B62A3C11CC0;
	Thu, 29 Jun 2023 21:52:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5038240C2063;
	Thu, 29 Jun 2023 21:52:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 04D161946A47;
	Thu, 29 Jun 2023 21:52:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE7F819465B6 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 29 Jun 2023 21:52:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8FCF15230A1; Thu, 29 Jun 2023 21:52:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1BD415230A0
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:52:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 837E73814947
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:52:06 +0000 (UTC)
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-9BiKxPMtPcWKEpznvIvamg-1; Thu,
 29 Jun 2023 17:52:04 -0400
X-MC-Unique: 9BiKxPMtPcWKEpznvIvamg-1
Received: by b221-5.in.mailobj.net [192.168.90.25] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Thu, 29 Jun 2023 23:52:02 +0200 (CEST)
X-EA-Auth: IotyenF4/umU0ZnNEfNRYcA4iNvIyKfnNgylSBABxKCWziWNjq5HJWJd2DAbytP60ExoGcmb2zoNuRUeth0oMxjaLd/N/tX+
Date: Fri, 30 Jun 2023 03:21:53 +0530
From: Deepak R Varma <drv@mailo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Message-ID: <7ad72f9d1a97d673483c206d8ac9a88f2e32d3b9.1688073459.git.drv@mailo.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v3 5/6] gfs2: Replace kmap() by
 kmap_local_page() in gfs2_read_super
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mailo.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The use of kmap() is being deprecated in favor of kmap_local_page().

There are two main problems with kmap(): (1) It comes with an overhead as
the mapping space is restricted and protected by a global lock for
synchronization and (2) it also requires global TLB invalidation when the
kmap’s pool wraps and it might block when the mapping space is fully
utilized until a slot becomes available.

With kmap_local_page() the mappings are per thread, CPU local, can take
page faults, and can be called from any context (including interrupts).
It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
the tasks can be preempted and, when they are scheduled to run again, the
kernel virtual addresses are restored and still valid.

Therefore, replace kmap() with kmap_local_page() in gfs2_read_super().

Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Changes in v3:
   - Patch included in patch set

Changes in v2:
   - None

 fs/gfs2/ops_fstype.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 8a27957dbfee..80fe61662412 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -264,9 +264,9 @@ static int gfs2_read_super(struct gfs2_sbd *sdp, sector_t sector, int silent)
 		__free_page(page);
 		return -EIO;
 	}
-	p = kmap(page);
+	p = kmap_local_page(page);
 	gfs2_sb_in(sdp, p);
-	kunmap(page);
+	kunmap_local(p);
 	__free_page(page);
 	return gfs2_check_sb(sdp, silent);
 }
-- 
2.34.1



