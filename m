Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D317516A97
	for <lists+cluster-devel@lfdr.de>; Mon,  2 May 2022 07:58:21 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-ng8mDPebPWOkXRZUDKwhqw-1; Mon, 02 May 2022 01:58:14 -0400
X-MC-Unique: ng8mDPebPWOkXRZUDKwhqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFCE2802803;
	Mon,  2 May 2022 05:58:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4CD1403156;
	Mon,  2 May 2022 05:58:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D3D61947062;
	Mon,  2 May 2022 05:58:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 142CE1947060 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 May 2022 05:58:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED80CC53362; Mon,  2 May 2022 05:58:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E97EAC53360
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 05:58:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFDFE800882
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 05:58:11 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-tQNP2xKkMki2d15RdEZHRA-1; Mon, 02 May 2022 01:58:09 -0400
X-MC-Unique: tQNP2xKkMki2d15RdEZHRA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nlOot-00EZ01-QF; Mon, 02 May 2022 05:42:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  2 May 2022 06:41:57 +0100
Message-Id: <20220502054159.3471078-2-willy@infradead.org>
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
Subject: [Cluster-devel] [PATCH 1/3] jffs2: Pass the file pointer to
 jffs2_do_readpage_unlock()
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In preparation for unifying the read_cache_page() and read_folio()
implementations, make jffs2_do_readpage_unlock() get the inode
from the page instead of passing it in from read_cache_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/jffs2/file.c | 4 ++--
 fs/jffs2/gc.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index f8616683fbee..492fb2da0403 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -112,7 +112,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 
 int jffs2_do_readpage_unlock(void *data, struct page *pg)
 {
-	int ret = jffs2_do_readpage_nolock(data, pg);
+	int ret = jffs2_do_readpage_nolock(pg->mapping->host, pg);
 	unlock_page(pg);
 	return ret;
 }
@@ -124,7 +124,7 @@ static int jffs2_read_folio(struct file *file, struct folio *folio)
 	int ret;
 
 	mutex_lock(&f->sem);
-	ret = jffs2_do_readpage_unlock(folio->mapping->host, &folio->page);
+	ret = jffs2_do_readpage_unlock(file, &folio->page);
 	mutex_unlock(&f->sem);
 	return ret;
 }
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 373b3b7c9f44..a53bac7569b6 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1327,7 +1327,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 	 * trying to write out, read_cache_page() will not deadlock. */
 	mutex_unlock(&f->sem);
 	page = read_cache_page(inode->i_mapping, start >> PAGE_SHIFT,
-			       jffs2_do_readpage_unlock, inode);
+			       jffs2_do_readpage_unlock, NULL);
 	if (IS_ERR(page)) {
 		pr_warn("read_cache_page() returned error: %ld\n",
 			PTR_ERR(page));
-- 
2.34.1

