Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C270D72B7D2
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 07:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686549261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9zJTT9J+bM8Et9VGxqlsd6AZoV3wuywDXy3UXbLSk0c=;
	b=U10g4jGxrll8BuhYVJq8a3BtH+jwwaWE6YPek4pSA/Gyz8ykvnDsiOAZOJwWy8Bw0Y/RAa
	Wp1CfeUm/rdWEKJKUlxdR0gDz23cd02Xw5qKoNSmOWWdVFlKlmK9veRyWVwczvLltsb23V
	+Ha07GmMhy85xWYq/nQPLH7AmYInLNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-vbWpcVOaOW-uK0j6Lta_4g-1; Mon, 12 Jun 2023 01:54:18 -0400
X-MC-Unique: vbWpcVOaOW-uK0j6Lta_4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79B80811E85;
	Mon, 12 Jun 2023 05:54:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 661CE40C98D6;
	Mon, 12 Jun 2023 05:54:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0F83D19465A8;
	Mon, 12 Jun 2023 05:54:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9979D194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 05:54:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 731AD1C558; Mon, 12 Jun 2023 05:54:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C28351F7
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 05:54:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CFAA2A59558
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 05:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-f7Z7aiy-P_aK7Ylrk54-zA-1; Mon, 12 Jun 2023 01:54:08 -0400
X-MC-Unique: f7Z7aiy-P_aK7Ylrk54-zA-1
Received: from
 2a02-8389-2341-5b80-8c8c-28f8-1274-e038.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:8c8c:28f8:1274:e038] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q8aEW-002fF9-0q; Mon, 12 Jun 2023 05:36:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: rpeterso@redhat.com,
	agruenba@redhat.com
Date: Mon, 12 Jun 2023 07:36:46 +0200
Message-Id: <20230612053646.585721-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH] gfs2: set FMODE_CAN_ODIRECT instead of a
 dummy direct_IO method
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Since commit a2ad63daa88b ("VFS: add FMODE_CAN_ODIRECT file flag") file
systems can just set the FMODE_CAN_ODIRECT flag at open time instead of
wiring up a dummy direct_IO method to indicate support for direct I/O.

Remove .direct_IO from gfs2_aops, and set FMODE_CAN_ODIRECT in
gfs2_open_common for regular files that do not use data journalling.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/aops.c | 1 -
 fs/gfs2/file.c | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index a5f4be6b9213ed..d95125714ebb38 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -750,7 +750,6 @@ static const struct address_space_operations gfs2_aops = {
 	.release_folio = iomap_release_folio,
 	.invalidate_folio = iomap_invalidate_folio,
 	.bmap = gfs2_bmap,
-	.direct_IO = noop_direct_IO,
 	.migrate_folio = filemap_migrate_folio,
 	.is_partially_uptodate = iomap_is_partially_uptodate,
 	.error_remove_page = generic_error_remove_page,
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 300844f50dcd28..dcb2b7dd2269cf 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -630,6 +630,9 @@ int gfs2_open_common(struct inode *inode, struct file *file)
 		ret = generic_file_open(inode, file);
 		if (ret)
 			return ret;
+
+		if (!gfs2_is_jdata(GFS2_I(inode)))
+			file->f_mode |= FMODE_CAN_ODIRECT;
 	}
 
 	fp = kzalloc(sizeof(struct gfs2_file), GFP_NOFS);
-- 
2.39.2

