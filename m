Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 846DD73FD14
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jun 2023 15:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687873555;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=22kticOLlBJcBUnGrSCh2KVz3Rm0MsIhQTcNFwRgygY=;
	b=IbGVLw85jcHRsrNYtw8Gd7RiQ7GtIUSPI9DanmRr/1zCtnQBDUL3Sg/jFB0AZDqPYJAYKz
	Mc/8wJVOnRcyEx2oB/jGa2DETy0FfX20SKs0Y4b47Y17K9zi5aT40HQj1qsTfNPuADe/BO
	FuaFLd0zOzpRxYU2mTQHrBBsgIJt67M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-8dgH0xX5PjKjYAmeE6uo9Q-1; Tue, 27 Jun 2023 09:45:50 -0400
X-MC-Unique: 8dgH0xX5PjKjYAmeE6uo9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11DBC800969;
	Tue, 27 Jun 2023 13:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0668E140EBB8;
	Tue, 27 Jun 2023 13:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DD6901946589;
	Tue, 27 Jun 2023 13:45:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B794E1946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 27 Jun 2023 13:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 952F1C478C6; Tue, 27 Jun 2023 13:45:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.226.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15BE1C00049;
 Tue, 27 Jun 2023 13:45:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 27 Jun 2023 15:45:45 +0200
Message-Id: <20230627134545.2626053-2-agruenba@redhat.com>
In-Reply-To: <20230627134545.2626053-1-agruenba@redhat.com>
References: <20230627134545.2626053-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 2/2] gfs2: Use memcpy_{from,
 to}_page where appropriate
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Replace kmap_local_page() + memcpy() + kunmap_local() sequences with
memcpy_{from,to}_page() where we are not doing anything else with the
mapped page.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c  |  5 +----
 fs/gfs2/lops.c  | 12 +++++-------
 fs/gfs2/quota.c |  5 +----
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index c45bac9b5408..b11ec198183b 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -488,7 +488,6 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
 	unsigned copied = 0;
 	unsigned amt;
 	struct page *page;
-	void *p;
 
 	do {
 		page = read_cache_page(mapping, index, gfs2_read_folio, NULL);
@@ -497,12 +496,10 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
 				continue;
 			return PTR_ERR(page);
 		}
-		p = kmap_local_page(page);
 		amt = size - copied;
 		if (offset + size > PAGE_SIZE)
 			amt = PAGE_SIZE - offset;
-		memcpy(buf + copied, p + offset, amt);
-		kunmap_local(p);
+		memcpy_from_page(buf + copied, page, offset, amt);
 		put_page(page);
 		copied += amt;
 		index++;
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 17641d90394b..251322b01631 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -697,14 +697,12 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 			lock_buffer(bd2->bd_bh);
 
 			if (buffer_escaped(bd2->bd_bh)) {
-				void *kaddr;
+				void *p;
+
 				page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
-				ptr = page_address(page);
-				kaddr = kmap_local_page(bd2->bd_bh->b_page);
-				memcpy(ptr, kaddr + bh_offset(bd2->bd_bh),
-				       bd2->bd_bh->b_size);
-				kunmap_local(kaddr);
-				*(__be32 *)ptr = 0;
+				p = page_address(page);
+				memcpy_from_page(p, page, bh_offset(bd2->bd_bh), bd2->bd_bh->b_size);
+				*(__be32 *)p = 0;
 				clear_buffer_escaped(bd2->bd_bh);
 				unlock_buffer(bd2->bd_bh);
 				brelse(bd2->bd_bh);
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 42a3f1e6b553..7765346e3617 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -712,7 +712,6 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
 	struct address_space *mapping = inode->i_mapping;
 	struct page *page;
 	struct buffer_head *bh;
-	void *kaddr;
 	u64 blk;
 	unsigned bsize = sdp->sd_sb.sb_bsize, bnum = 0, boff = 0;
 	unsigned to_write = bytes, pg_off = off;
@@ -764,9 +763,7 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
 	}
 
 	/* Write to the page, now that we have setup the buffer(s) */
-	kaddr = kmap_local_page(page);
-	memcpy(kaddr + off, buf, bytes);
-	kunmap_local(kaddr);
+	memcpy_to_page(page, off, buf, bytes);
 	flush_dcache_page(page);
 	unlock_page(page);
 	put_page(page);
-- 
2.40.0

