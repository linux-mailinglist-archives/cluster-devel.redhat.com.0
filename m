Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970771797F
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 10:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685520276;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oeUDNAIuBGOOZ56XkyqMnjDXKnQawdRHpRl2i305rtg=;
	b=VixT7a3Kzu8ySD6w/zIAOUoOT4yu197i6/QI6Gmv2FKmF0kO93eYd9SnzLWmHPgjJi3qIR
	qWgGPVUrCmV0eiEbR8WvSLOO2EHYykvQkKAEetBSR6YLV0Rj5dHBbrwGVVzsM5jQoXeRUc
	oaLl3OH4+FQopTYScpscAw/k28nuTcE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467--rZIVusxM7CzEDlj2vwSbg-1; Wed, 31 May 2023 04:04:32 -0400
X-MC-Unique: -rZIVusxM7CzEDlj2vwSbg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39F06800159;
	Wed, 31 May 2023 08:04:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D196492B00;
	Wed, 31 May 2023 08:04:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E324919465B3;
	Wed, 31 May 2023 08:04:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6FA741946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 07:51:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C1EF2166B26; Wed, 31 May 2023 07:51:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42D412166B25
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 07:51:57 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2774F1C01505
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 07:51:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-gVgX_PaKM-aZrg56-DF4qg-1; Wed, 31 May 2023 03:51:55 -0400
X-MC-Unique: gVgX_PaKM-aZrg56-DF4qg-1
Received: from [2001:4bb8:182:6d06:f5c3:53d7:b5aa:b6a7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4G86-00GPis-28; Wed, 31 May 2023 07:20:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 31 May 2023 09:20:03 +0200
Message-Id: <20230531072006.476386-6-hch@lst.de>
In-Reply-To: <20230531072006.476386-1-hch@lst.de>
References: <20230531072006.476386-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH 5/8] filemap: add a kiocb_invalidate_pages
 helper
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Factor out a helper that calls filemap_write_and_wait_range and
invalidate_inode_pages2_range for the range covered by a write kiocb or
returns -EAGAIN if the kiocb is marked as nowait and there would be pages
to write or invalidate.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Darrick J. Wong <djwong@kernel.org>
---
 include/linux/pagemap.h |  1 +
 mm/filemap.c            | 48 ++++++++++++++++++++++++-----------------
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 36fc2cea13ce20..6e4c9ee40baa99 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -30,6 +30,7 @@ static inline void invalidate_remote_inode(struct inode *inode)
 int invalidate_inode_pages2(struct address_space *mapping);
 int invalidate_inode_pages2_range(struct address_space *mapping,
 		pgoff_t start, pgoff_t end);
+int kiocb_invalidate_pages(struct kiocb *iocb, size_t count);
 
 int write_inode_now(struct inode *, int sync);
 int filemap_fdatawrite(struct address_space *);
diff --git a/mm/filemap.c b/mm/filemap.c
index 5fcd5227f9cae2..a1cb01a4b8046a 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2777,6 +2777,33 @@ int kiocb_write_and_wait(struct kiocb *iocb, size_t count)
 	return filemap_write_and_wait_range(mapping, pos, end);
 }
 
+int kiocb_invalidate_pages(struct kiocb *iocb, size_t count)
+{
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
+	loff_t pos = iocb->ki_pos;
+	loff_t end = pos + count - 1;
+	int ret;
+
+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		/* we could block if there are any pages in the range */
+		if (filemap_range_has_page(mapping, pos, end))
+			return -EAGAIN;
+	} else {
+		ret = filemap_write_and_wait_range(mapping, pos, end);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * After a write we want buffered reads to be sure to go to disk to get
+	 * the new data.  We invalidate clean cached page from the region we're
+	 * about to write.  We do this *before* the write so that we can return
+	 * without clobbering -EIOCBQUEUED from ->direct_IO().
+	 */
+	return invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
+					     end >> PAGE_SHIFT);
+}
+
 /**
  * generic_file_read_iter - generic filesystem read routine
  * @iocb:	kernel I/O control block
@@ -3820,30 +3847,11 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	write_len = iov_iter_count(from);
 	end = (pos + write_len - 1) >> PAGE_SHIFT;
 
-	if (iocb->ki_flags & IOCB_NOWAIT) {
-		/* If there are pages to writeback, return */
-		if (filemap_range_has_page(file->f_mapping, pos,
-					   pos + write_len - 1))
-			return -EAGAIN;
-	} else {
-		written = filemap_write_and_wait_range(mapping, pos,
-							pos + write_len - 1);
-		if (written)
-			goto out;
-	}
-
-	/*
-	 * After a write we want buffered reads to be sure to go to disk to get
-	 * the new data.  We invalidate clean cached page from the region we're
-	 * about to write.  We do this *before* the write so that we can return
-	 * without clobbering -EIOCBQUEUED from ->direct_IO().
-	 */
-	written = invalidate_inode_pages2_range(mapping,
-					pos >> PAGE_SHIFT, end);
 	/*
 	 * If a page can not be invalidated, return 0 to fall back
 	 * to buffered write.
 	 */
+	written = kiocb_invalidate_pages(iocb, write_len);
 	if (written) {
 		if (written == -EBUSY)
 			return 0;
-- 
2.39.2

