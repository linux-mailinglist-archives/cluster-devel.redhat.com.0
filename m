Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38139671815
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 10:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674035065;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4WwjtPTvg3dbfLBE9vX5iRJAtphGCEZEkdJLVGyAJuo=;
	b=USAw8Uue4oAJkZD8SuIcBjcv5znhPGmDc7Nm1ZoAjov9vSUWMrRQCJQKyI8tgF0Tr34gdN
	irZeKuAN9HbUj3INEI1WFh9aA4PfSVvuvphRRYO1UL33M+nrGpGCIEmNiiStDTjGoIomFA
	OBTuaXHXadxdLiFL2thNhNqlviVXwzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-JNm5gBEbONeXvGgwxkhvfg-1; Wed, 18 Jan 2023 04:44:21 -0500
X-MC-Unique: JNm5gBEbONeXvGgwxkhvfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AEBA100F90C;
	Wed, 18 Jan 2023 09:44:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FD972026D4B;
	Wed, 18 Jan 2023 09:44:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3229B1946A72;
	Wed, 18 Jan 2023 09:44:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C125C1946A6E for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 09:44:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6D68492B01; Wed, 18 Jan 2023 09:44:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EF65492B00
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 09:44:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84EAB3C0F696
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 09:44:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-s0dDHFcoNeKBMiF8cD-HAA-1; Wed, 18 Jan 2023 04:44:14 -0500
X-MC-Unique: s0dDHFcoNeKBMiF8cD-HAA-1
Received: from 213-147-167-250.nat.highway.webapn.at ([213.147.167.250]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pI4zI-000A8d-6U; Wed, 18 Jan 2023 09:44:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Date: Wed, 18 Jan 2023 10:43:27 +0100
Message-Id: <20230118094329.9553-8-hch@lst.de>
In-Reply-To: <20230118094329.9553-1-hch@lst.de>
References: <20230118094329.9553-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 7/9] gfs2: handle a NULL folio in
 gfs2_jhead_process_page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

filemap_get_folio can return NULL, so exit early for that case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/lops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 1902413d5d123e..51d4b610127cdb 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -472,6 +472,8 @@ static void gfs2_jhead_process_page(struct gfs2_jdesc *jd, unsigned long index,
 	struct folio *folio;
 
 	folio = filemap_get_folio(jd->jd_inode->i_mapping, index);
+	if (!folio)
+		return;
 
 	folio_wait_locked(folio);
 	if (folio_test_error(folio))
-- 
2.39.0

