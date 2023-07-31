Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6D67698FB
	for <lists+cluster-devel@lfdr.de>; Mon, 31 Jul 2023 16:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690812447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nBKCzRGKgciHUTVUqC+yIEJW3dHXRjUejQFrm1LVR3E=;
	b=OWObT2BgEjVyKcingWJj2NfKw0TePUQ0lkM5lYz6TzigKzhVxIEJmuZaWyu410+nEC3k/4
	LWB4EyXqQ7jVXLkGDGSbdtxlX0k0/8pPy0m6y/uEetUUou+jb53XiMA4btRnogPPWnG4Lx
	M1rB0EeDVedT8OnCfGCZQhmATMfPZzI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-ZHQgKnulOvC7e9WYCDK7YQ-1; Mon, 31 Jul 2023 10:07:23 -0400
X-MC-Unique: ZHQgKnulOvC7e9WYCDK7YQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FF072A59554;
	Mon, 31 Jul 2023 14:07:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06E38207B356;
	Mon, 31 Jul 2023 14:07:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A81719452C3;
	Mon, 31 Jul 2023 14:06:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6C20F1946A52 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 31 Jul 2023 14:06:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 560832166B27; Mon, 31 Jul 2023 14:06:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBAE02166B25;
 Mon, 31 Jul 2023 14:06:15 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 31 Jul 2023 16:06:13 +0200
Message-Id: <20230731140614.390794-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH 1/2] gfs2: Use mapping->gfp_mask for
 metadata inodes
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Set mapping->gfp mask to GFP_NOFS for all metadata inodes so that
allocating pages in the address space of those inodes won't call back
into the filesystem.  This allows to switch back from
find_or_create_page() to grab_cache_page() in two places.

Partially reverts commit 220cca2a4f58 ("GFS2: Change truncate page
allocation to be GFP_NOFS").

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 10 ++++++++--
 fs/gfs2/lops.c  |  7 +++----
 fs/gfs2/quota.c |  2 +-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 17c994a0c0d0..85ff065ac90c 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -278,8 +278,14 @@ struct inode *gfs2_lookup_simple(struct inode *dip, const char *name)
 	 */
 	if (inode == NULL)
 		return ERR_PTR(-ENOENT);
-	else
-		return inode;
+
+	/*
+	 * Must not call back into the filesystem when allocating
+	 * pages in the metadata inode's address space.
+	 */
+	mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
+
+	return inode;
 }
 
 
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 251322b01631..483f69807062 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -456,7 +456,7 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
  * Find the folio with 'index' in the journal's mapping. Search the folio for
  * the journal head if requested (cleanup == false). Release refs on the
  * folio so the page cache can reclaim it. We grabbed a
- * reference on this folio twice, first when we did a find_or_create_page()
+ * reference on this folio twice, first when we did a grab_cache_page()
  * to obtain the folio to add it to the bio and second when we do a
  * filemap_get_folio() here to get the folio to wait on while I/O on it is being
  * completed.
@@ -481,7 +481,7 @@ static void gfs2_jhead_process_page(struct gfs2_jdesc *jd, unsigned long index,
 	if (!*done)
 		*done = gfs2_jhead_pg_srch(jd, head, &folio->page);
 
-	/* filemap_get_folio() and the earlier find_or_create_page() */
+	/* filemap_get_folio() and the earlier grab_cache_page() */
 	folio_put_refs(folio, 2);
 }
 
@@ -535,8 +535,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head,
 
 		for (; block < je->lblock + je->blocks; block++, dblock++) {
 			if (!page) {
-				page = find_or_create_page(mapping,
-						block >> shift, GFP_NOFS);
+				page = grab_cache_page(mapping, block >> shift);
 				if (!page) {
 					ret = -ENOMEM;
 					done = true;
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 704192b73605..96d41ee034d7 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -724,7 +724,7 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
 	blk = index << (PAGE_SHIFT - sdp->sd_sb.sb_bsize_shift);
 	boff = off % bsize;
 
-	page = find_or_create_page(mapping, index, GFP_NOFS);
+	page = grab_cache_page(mapping, index);
 	if (!page)
 		return -ENOMEM;
 	if (!page_has_buffers(page))
-- 
2.40.1

