Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2674F6764D0
	for <lists+cluster-devel@lfdr.de>; Sat, 21 Jan 2023 08:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674284630;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dhtgDUov3OaCzjD6ZOk7Y/bvFnZoNJ17iYtVJ43FaOw=;
	b=Q9CZenybUyH3X3Ow+vhcev0CVAs1o8dwIMKNAXyXQukl67HcTFpjPniJgefoxNqC89wT2Z
	XLZA55WfY32h7eRarw33gCsgY5h2vYtnWPDZKbskkS/uk3k/D/2Uy4fiiKA2TakQ+wVn8V
	M9K1MqK6zLUFz6JXTQi1TBPFd07WnrE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-7vvte_OdP4OnUma0aX6wsQ-1; Sat, 21 Jan 2023 02:03:46 -0500
X-MC-Unique: 7vvte_OdP4OnUma0aX6wsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1F113804061;
	Sat, 21 Jan 2023 07:03:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E65A41731B;
	Sat, 21 Jan 2023 07:03:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A8AF81946597;
	Sat, 21 Jan 2023 07:03:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D3A151946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 21 Jan 2023 07:03:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C88D2492C3E; Sat, 21 Jan 2023 07:03:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0F69492C3C
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 07:03:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AF603C021A0
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 07:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-2tAiKk1TP1eP8tjNxMaz5A-1; Sat, 21 Jan 2023 02:03:41 -0500
X-MC-Unique: 2tAiKk1TP1eP8tjNxMaz5A-1
Received: from [2001:4bb8:19a:2039:6754:cc81:9ace:36fc] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pJ7pK-00DSQK-T2; Sat, 21 Jan 2023 06:58:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Date: Sat, 21 Jan 2023 07:57:53 +0100
Message-Id: <20230121065755.1140136-6-hch@lst.de>
In-Reply-To: <20230121065755.1140136-1-hch@lst.de>
References: <20230121065755.1140136-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 5/7] shmem: open code the page cache lookup
 in shmem_get_folio_gfp
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use the very low level filemap_get_entry helper to look up the
entry in the xarray, and then:

 - don't bother locking the folio if only doing a userfault notification
 - open code locking the page and checking for truncation in a related
   code block

This will allow to eventually remove the FGP_ENTRY flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/shmem.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index a8371ffeeee54a..23d5cf8182cb1f 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1856,12 +1856,10 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	sbinfo = SHMEM_SB(inode->i_sb);
 	charge_mm = vma ? vma->vm_mm : NULL;
 
-	folio = __filemap_get_folio(mapping, index, FGP_ENTRY | FGP_LOCK, 0);
+	folio = filemap_get_entry(mapping, index);
 	if (folio && vma && userfaultfd_minor(vma)) {
-		if (!xa_is_value(folio)) {
-			folio_unlock(folio);
+		if (!xa_is_value(folio))
 			folio_put(folio);
-		}
 		*fault_type = handle_userfault(vmf, VM_UFFD_MINOR);
 		return 0;
 	}
@@ -1877,6 +1875,14 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	}
 
 	if (folio) {
+		folio_lock(folio);
+
+		/* Has the page been truncated? */
+		if (unlikely(folio->mapping != mapping)) {
+			folio_unlock(folio);
+			folio_put(folio);
+			goto repeat;
+		}
 		if (sgp == SGP_WRITE)
 			folio_mark_accessed(folio);
 		if (folio_test_uptodate(folio))
-- 
2.39.0

