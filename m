Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0F73FD12
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jun 2023 15:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687873552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q/+AfwVGF6+6gNZg/wcMowXgLKIor+hEPnQnG6E66K0=;
	b=KTzJ2PTl8CeDrfuaFlYwZG0uKe7ee6K/37umcF8XQn3cLh29bsqJ6lM9tc32ugoxRGHWlC
	5FVYlAe8wOZ/EzstoDAFibgay1tA76qpkHI3YsfyRRYerCizXryHGPTBVp2mCgFAsmCo7d
	l6v2Z1GJ/dovwT1WLyUJTpw6ucu7Hm8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-jooPkO5RNm-syB21YCZX2g-1; Tue, 27 Jun 2023 09:45:49 -0400
X-MC-Unique: jooPkO5RNm-syB21YCZX2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F219101A54E;
	Tue, 27 Jun 2023 13:45:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4350914682FA;
	Tue, 27 Jun 2023 13:45:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 13959194658C;
	Tue, 27 Jun 2023 13:45:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EAAD31946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 27 Jun 2023 13:45:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CCF42C478C7; Tue, 27 Jun 2023 13:45:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.226.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC03C00049;
 Tue, 27 Jun 2023 13:45:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 27 Jun 2023 15:45:44 +0200
Message-Id: <20230627134545.2626053-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 1/2] gfs2: Convert remaining kmap_atomic
 calls to kmap_local_page
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

Replace the remaining instances of kmap_atomic() ... kunmap_atomic()
with kmap_local_page() ... kunmap_local().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lops.c  | 13 +++++++------
 fs/gfs2/quota.c |  4 ++--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 1902413d5d12..17641d90394b 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -427,10 +427,11 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
 {
 	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
 	struct gfs2_log_header_host lh;
-	void *kaddr = kmap_atomic(page);
+	void *kaddr;
 	unsigned int offset;
 	bool ret = false;
 
+	kaddr = kmap_local_page(page);
 	for (offset = 0; offset < PAGE_SIZE; offset += sdp->sd_sb.sb_bsize) {
 		if (!__get_log_header(sdp, kaddr + offset, 0, &lh)) {
 			if (lh.lh_sequence >= head->lh_sequence)
@@ -441,7 +442,7 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
 			}
 		}
 	}
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	return ret;
 }
 
@@ -626,11 +627,11 @@ static void gfs2_check_magic(struct buffer_head *bh)
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
@@ -699,10 +700,10 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
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
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 386ca770ce2e..42a3f1e6b553 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -764,10 +764,10 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
 	}
 
 	/* Write to the page, now that we have setup the buffer(s) */
-	kaddr = kmap_atomic(page);
+	kaddr = kmap_local_page(page);
 	memcpy(kaddr + off, buf, bytes);
+	kunmap_local(kaddr);
 	flush_dcache_page(page);
-	kunmap_atomic(kaddr);
 	unlock_page(page);
 	put_page(page);
 
-- 
2.40.0

