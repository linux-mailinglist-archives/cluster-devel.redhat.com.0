Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4BF38AC3F
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 13:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621510509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pTWORH2A5xp02G06k2YObioktTbonh6gKCCR67OYXGA=;
	b=TT2dzG9UjmwJgUqMVNz9V5njL03tVnpjy3mITB2txaSIP6PSnLLLU3fI26gt/hxDYNfGQm
	mqULnlbOVSLPcqyANbFiEi2G9uV9ChtBFwxSqWnNDcM+WD4wIUkmQJFLp92NDZGDQt0Sdx
	vV6/BxurPV6Ekfoq2W2Rhz/aaOk3Ye8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90--FBaizeCPIGHeZ_xxbSavQ-1; Thu, 20 May 2021 07:35:07 -0400
X-MC-Unique: -FBaizeCPIGHeZ_xxbSavQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0F89192377C;
	Thu, 20 May 2021 11:35:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B4265D740;
	Thu, 20 May 2021 11:35:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C6681800BBE;
	Thu, 20 May 2021 11:34:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KBY2dd026630 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 07:34:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5F4B5C5AE; Thu, 20 May 2021 11:34:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C91D5C276;
	Thu, 20 May 2021 11:33:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 20 May 2021 13:33:56 +0200
Message-Id: <20210520113356.1595160-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Clean up the error handling in
	gfs2_page_mkwrite
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

We're setting an error number so that block_page_mkwrite_return
translates it into the corresponding VM_FAULT_* code in several places,
but this is getting confusing, so Set the VM_FAULT_* codes directly
instead.  (No change in functionality.)

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 63 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 8a35a0196b6d..0eb235728098 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -427,22 +427,25 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	struct gfs2_alloc_parms ap = { .aflags = 0, };
 	u64 offset = page_offset(page);
 	unsigned int data_blocks, ind_blocks, rblocks;
+	vm_fault_t ret = VM_FAULT_LOCKED;
 	struct gfs2_holder gh;
 	unsigned int length;
 	loff_t size;
-	int ret;
+	int err;
 
 	sb_start_pagefault(inode->i_sb);
 
 	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
-	ret = gfs2_glock_nq(&gh);
-	if (ret)
+	err = gfs2_glock_nq(&gh);
+	if (err) {
+		ret = block_page_mkwrite_return(err);
 		goto out_uninit;
+	}
 
 	/* Check page index against inode size */
 	size = i_size_read(inode);
 	if (offset >= size) {
-		ret = -EINVAL;
+		ret = VM_FAULT_SIGBUS;
 		goto out_unlock;
 	}
 
@@ -469,24 +472,30 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	    !gfs2_write_alloc_required(ip, offset, length)) {
 		lock_page(page);
 		if (!PageUptodate(page) || page->mapping != inode->i_mapping) {
-			ret = -EAGAIN;
+			ret = VM_FAULT_NOPAGE;
 			unlock_page(page);
 		}
 		goto out_unlock;
 	}
 
-	ret = gfs2_rindex_update(sdp);
-	if (ret)
+	err = gfs2_rindex_update(sdp);
+	if (err) {
+		ret = block_page_mkwrite_return(err);
 		goto out_unlock;
+	}
 
 	gfs2_write_calc_reserv(ip, length, &data_blocks, &ind_blocks);
 	ap.target = data_blocks + ind_blocks;
-	ret = gfs2_quota_lock_check(ip, &ap);
-	if (ret)
+	err = gfs2_quota_lock_check(ip, &ap);
+	if (err) {
+		ret = block_page_mkwrite_return(err);
 		goto out_unlock;
-	ret = gfs2_inplace_reserve(ip, &ap);
-	if (ret)
+	}
+	err = gfs2_inplace_reserve(ip, &ap);
+	if (err) {
+		ret = block_page_mkwrite_return(err);
 		goto out_quota_unlock;
+	}
 
 	rblocks = RES_DINODE + ind_blocks;
 	if (gfs2_is_jdata(ip))
@@ -495,27 +504,35 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 		rblocks += RES_STATFS + RES_QUOTA;
 		rblocks += gfs2_rg_blocks(ip, data_blocks + ind_blocks);
 	}
-	ret = gfs2_trans_begin(sdp, rblocks, 0);
-	if (ret)
+	err = gfs2_trans_begin(sdp, rblocks, 0);
+	if (err) {
+		ret = block_page_mkwrite_return(err);
 		goto out_trans_fail;
+	}
 
 	lock_page(page);
-	ret = -EAGAIN;
 	/* If truncated, we must retry the operation, we may have raced
 	 * with the glock demotion code.
 	 */
-	if (!PageUptodate(page) || page->mapping != inode->i_mapping)
+	if (!PageUptodate(page) || page->mapping != inode->i_mapping) {
+		ret = VM_FAULT_NOPAGE;
 		goto out_trans_end;
+	}
 
 	/* Unstuff, if required, and allocate backing blocks for page */
-	ret = 0;
-	if (gfs2_is_stuffed(ip))
-		ret = gfs2_unstuff_dinode(ip, page);
-	if (ret == 0)
-		ret = gfs2_allocate_page_backing(page, length);
+	if (gfs2_is_stuffed(ip)) {
+		err = gfs2_unstuff_dinode(ip, page);
+		if (err) {
+			ret = block_page_mkwrite_return(err);
+			goto out_trans_end;
+		}
+	}
+	err = gfs2_allocate_page_backing(page, length);
+	if (err)
+		ret = block_page_mkwrite_return(err);
 
 out_trans_end:
-	if (ret)
+	if (ret != VM_FAULT_LOCKED)
 		unlock_page(page);
 	gfs2_trans_end(sdp);
 out_trans_fail:
@@ -526,12 +543,12 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	gfs2_glock_dq(&gh);
 out_uninit:
 	gfs2_holder_uninit(&gh);
-	if (ret == 0) {
+	if (ret == VM_FAULT_LOCKED) {
 		set_page_dirty(page);
 		wait_for_stable_page(page);
 	}
 	sb_end_pagefault(inode->i_sb);
-	return block_page_mkwrite_return(ret);
+	return ret;
 }
 
 static vm_fault_t gfs2_fault(struct vm_fault *vmf)
-- 
2.26.3

