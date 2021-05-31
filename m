Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC7F39664B
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 19:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622480505;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JcuatMd87L9fCdp8lwImF5akoS3qK1D+UhqbImbeNZA=;
	b=ed2Yo75vAOU7LtPtIgve0oyGO2yzcKyo3rnLrKUeTe2bgywz3ETH9I/nexFuj5IJCmf1ag
	f0dtSlH9i2TJG0SgEYxMeVMkNMXNIg80+4gTh0000rgsiP++r7f8r101V0b/Vk2CIpfYtj
	L3+Eh91o5DMhuWZIJcTtZsHY/ZL+Wh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-y07Ova_1OQqot34at215JA-1; Mon, 31 May 2021 13:01:44 -0400
X-MC-Unique: y07Ova_1OQqot34at215JA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1358918BA280;
	Mon, 31 May 2021 17:01:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 026F219C71;
	Mon, 31 May 2021 17:01:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5B3A55347;
	Mon, 31 May 2021 17:01:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VH1eNe019101 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 13:01:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB85C2BFDE; Mon, 31 May 2021 17:01:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A33E5B4A0;
	Mon, 31 May 2021 17:01:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 19:01:18 +0200
Message-Id: <20210531170123.243771-5-agruenba@redhat.com>
In-Reply-To: <20210531170123.243771-1-agruenba@redhat.com>
References: <20210531170123.243771-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [RFC 4/9] gfs2: Fix mmap + page fault deadlocks
	(part 1)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When the buffer passed to a read or write system call is memory mapped
to the same file, a page fault can occur in filemap_fault.  In that
case, the task will already be holding the inode glock, and trying to
take the same lock again will result in a BUG in add_to_queue().

Fix that by recognizing the self-recursion case.  Either skip the lock
taking (when the glock is held in a compatible way), or fail the
operation.

Likewise, a request to un-share a copy-on-write page can *probably*
happen in similar situations, so treat the locking in gfs2_page_mkwrite
in the same way.

A future patch will handle these case more gracefully by retrying
operations instead of failing them, along with addressing more complex
deadlock scenarios.

Reported-by: Jan Kara <jack@suse.cz>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 6d77743f11a4..7d88abb4629b 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -423,6 +423,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	struct page *page = vmf->page;
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_holder *outer_gh = gfs2_glock_is_locked_by_me(ip->i_gl);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	struct gfs2_alloc_parms ap = { .aflags = 0, };
 	u64 offset = page_offset(page);
@@ -436,10 +437,18 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	sb_start_pagefault(inode->i_sb);
 
 	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
-	err = gfs2_glock_nq(&gh);
-	if (err) {
-		ret = block_page_mkwrite_return(err);
-		goto out_uninit;
+	if (likely(!outer_gh)) {
+		err = gfs2_glock_nq(&gh);
+		if (err) {
+			ret = block_page_mkwrite_return(err);
+			goto out_uninit;
+		}
+	} else {
+		if (!gfs2_holder_is_compatible(outer_gh, LM_ST_EXCLUSIVE)) {
+			/* We could try to upgrade outer_gh here. */
+			ret = VM_FAULT_SIGBUS;
+			goto out_uninit;
+		}
 	}
 
 	/* Check page index against inode size */
@@ -540,7 +549,8 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 out_quota_unlock:
 	gfs2_quota_unlock(ip);
 out_unlock:
-	gfs2_glock_dq(&gh);
+	if (likely(!outer_gh))
+		gfs2_glock_dq(&gh);
 out_uninit:
 	gfs2_holder_uninit(&gh);
 	if (ret == VM_FAULT_LOCKED) {
@@ -555,6 +565,7 @@ static vm_fault_t gfs2_fault(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_holder *outer_gh = gfs2_glock_is_locked_by_me(ip->i_gl);
 	struct gfs2_holder gh;
 	vm_fault_t ret;
 	u16 state;
@@ -562,13 +573,22 @@ static vm_fault_t gfs2_fault(struct vm_fault *vmf)
 
 	state = (vmf->flags & FAULT_FLAG_WRITE) ? LM_ST_EXCLUSIVE : LM_ST_SHARED;
 	gfs2_holder_init(ip->i_gl, state, 0, &gh);
-	err = gfs2_glock_nq(&gh);
-	if (err) {
-		ret = block_page_mkwrite_return(err);
-		goto out_uninit;
+	if (likely(!outer_gh)) {
+		err = gfs2_glock_nq(&gh);
+		if (err) {
+			ret = block_page_mkwrite_return(err);
+			goto out_uninit;
+		}
+	} else {
+		if (!gfs2_holder_is_compatible(outer_gh, state)) {
+			/* We could try to upgrade outer_gh here. */
+			ret = VM_FAULT_SIGBUS;
+			goto out_uninit;
+		}
 	}
 	ret = filemap_fault(vmf);
-	gfs2_glock_dq(&gh);
+	if (likely(!outer_gh))
+		gfs2_glock_dq(&gh);
 out_uninit:
 	gfs2_holder_uninit(&gh);
 	return ret;
-- 
2.26.3

