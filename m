Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 66B8E3CCB63
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 00:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626648013;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KCnSLNP7riR8LfALdj37STeKckvJ3hnzBxN8+ybrwAA=;
	b=SksXK2KjgjalpYwlWT/XOlzqOtGwEYo/5XZD1NzlurBNlanUql39U5YceSzCz2KlSuB1+8
	05XxA2zcJqsdBQm5fVPJQbWzc+AIz+dcNvMOEIG2AghTxSt5iglrAu+BrXIfMgzpNzpjOM
	GD4AjeptByZGHj8Ui3JjbQYnx8Vo6Fc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-zUmcP0AcMIO99bLFR8EYfg-1; Sun, 18 Jul 2021 18:40:12 -0400
X-MC-Unique: zUmcP0AcMIO99bLFR8EYfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D7B802C87;
	Sun, 18 Jul 2021 22:40:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F6B83AA2;
	Sun, 18 Jul 2021 22:40:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26CE01809C97;
	Sun, 18 Jul 2021 22:40:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16IMe9oE013763 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 18 Jul 2021 18:40:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38A8860C9D; Sun, 18 Jul 2021 22:40:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D5A560C0F;
	Sun, 18 Jul 2021 22:40:02 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Jul 2021 00:39:32 +0200
Message-Id: <20210718223932.2703330-7-agruenba@redhat.com>
In-Reply-To: <20210718223932.2703330-1-agruenba@redhat.com>
References: <20210718223932.2703330-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v2 6/6] gfs2: Fix mmap + page fault
	deadlocks for direct I/O
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

Direct I/O differs from buffered I/O in that it uses bio_iov_iter_get_pages for
grabbing page references and for manually faulting in pages instead of
triggering actual page faults.  For disabling these manual page faults, it's
not enough to call pagefault_disable(); instead, we use the new
ITER_FLAG_FAST_ONLY flag for telling iomap_dio_rw to stop faulting pages in for
us.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 99df7934b4d8..6feb857a8a1c 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -763,21 +763,42 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 	struct file *file = iocb->ki_filp;
 	struct gfs2_inode *ip = GFS2_I(file->f_mapping->host);
 	size_t count = iov_iter_count(to);
+	size_t written = 0;
 	ssize_t ret;
 
+	/*
+	 * In this function, we disable page faults when whe're holding the
+	 * inode glock while doing I/O.  If a page fault occurs, we drop the
+	 * inode glock, fault in the pages manually, and then we retry.  Other
+	 * than in gfs2_file_read_iter, iomap_dio_rw can trigger implicit as
+	 * well as manual page faults, and we need to disable both kinds
+	 * separately.
+	 */
+
 	if (!count)
 		return 0; /* skip atime */
 
 	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
+retry:
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
 
+	pagefault_disable();
+	to->type |= ITER_FLAG_FAST_ONLY;
 	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL, 0);
+	to->type &= ~ITER_FLAG_FAST_ONLY;
+	pagefault_enable();
+
 	gfs2_glock_dq(gh);
+	if (ret > 0)
+		written += ret;
+	if (unlikely(iov_iter_count(to) && (ret > 0 || ret == -EFAULT)) &&
+	    fault_in_iov_iter(to))
+		goto retry;
 out_uninit:
 	gfs2_holder_uninit(gh);
-	return ret;
+	return written ? written : ret;
 }
 
 static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
@@ -790,6 +811,12 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	loff_t offset = iocb->ki_pos;
 	ssize_t ret;
 
+	/*
+	 * In this function, we disable page faults when whe're holding the
+	 * inode glock while doing I/O.  If a page fault occurs, we drop the
+	 * inode glock, fault in the pages manually, and then we retry.
+	 */
+
 	/*
 	 * Deferred lock, even if its a write, since we do no allocation on
 	 * this path. All we need to change is the atime, and this lock mode
@@ -799,6 +826,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	 * VFS does.
 	 */
 	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
+retry:
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
@@ -807,11 +835,16 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	if (offset + len > i_size_read(&ip->i_inode))
 		goto out;
 
+	from->type |= ITER_FLAG_FAST_ONLY;
 	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL, 0);
+	from->type &= ~ITER_FLAG_FAST_ONLY;
+
 	if (ret == -ENOTBLK)
 		ret = 0;
 out:
 	gfs2_glock_dq(gh);
+	if (unlikely(ret == -EFAULT) && fault_in_iov_iter(from))
+		goto retry;
 out_uninit:
 	gfs2_holder_uninit(gh);
 	return ret;
-- 
2.26.3

