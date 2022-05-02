Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB8516A93
	for <lists+cluster-devel@lfdr.de>; Mon,  2 May 2022 07:58:14 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-OGDybIpmOgq6QEYoUChFVA-1; Mon, 02 May 2022 01:58:10 -0400
X-MC-Unique: OGDybIpmOgq6QEYoUChFVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A783D29AB3FF;
	Mon,  2 May 2022 05:58:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B013A40D1B9F;
	Mon,  2 May 2022 05:58:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E365B1947062;
	Mon,  2 May 2022 05:58:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 360B31947060 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 May 2022 05:58:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 20A2BC53360; Mon,  2 May 2022 05:58:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CA18C53362
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 05:58:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C7A29AA387
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 05:58:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-5bExcaIGOxui2yfnTQNgMw-1; Mon, 02 May 2022 01:58:03 -0400
X-MC-Unique: 5bExcaIGOxui2yfnTQNgMw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nlOot-00EZ03-Sh; Mon, 02 May 2022 05:42:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  2 May 2022 06:41:58 +0100
Message-Id: <20220502054159.3471078-3-willy@infradead.org>
In-Reply-To: <20220502054159.3471078-1-willy@infradead.org>
References: <20220502054159.3471078-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 2/3] nfs: Pass the file pointer to
 nfs_symlink_filler()
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
Cc: cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In preparation for unifying the read_cache_page() and read_folio()
implementations, make nfs_symlink_filler() get the inode
from the page instead of passing it in from read_cache_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/nfs/symlink.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/symlink.c b/fs/nfs/symlink.c
index 25ba299fdac2..8b53538bcc75 100644
--- a/fs/nfs/symlink.c
+++ b/fs/nfs/symlink.c
@@ -28,7 +28,7 @@
 
 static int nfs_symlink_filler(void *data, struct page *page)
 {
-	struct inode *inode = data;
+	struct inode *inode = page->mapping->host;
 	int error;
 
 	error = NFS_PROTO(inode)->readlink(inode, page, 0, PAGE_SIZE);
@@ -67,7 +67,7 @@ static const char *nfs_get_link(struct dentry *dentry,
 		if (err)
 			return err;
 		page = read_cache_page(&inode->i_data, 0, nfs_symlink_filler,
-				inode);
+				NULL);
 		if (IS_ERR(page))
 			return ERR_CAST(page);
 	}
-- 
2.34.1

