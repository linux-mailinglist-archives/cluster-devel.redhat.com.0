Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9370EEA2
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 08:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684911279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JJwCNovA8Hvn4E2j3I1EFqtVuzu7mduVb6MIKUgJaYA=;
	b=G5jP4BeY4gaeOzGkhRXZ4kT6fTWmSk9byg25F7oI+nyomMeD6RZuUzsqHcU5yBvyoQ2aFw
	D6R0QRfSOtbhgAycQyqtYz+j9dMDfVaqMl0ao4YKBODtvC/CC1icKoPyFNzB/D1iyz6e7U
	PLoSg6i5QkU/OHHt3oy8BMvf+qK1kiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-E7ZFC1bMObmvT1XI8XvMIg-1; Wed, 24 May 2023 02:54:30 -0400
X-MC-Unique: E7ZFC1bMObmvT1XI8XvMIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE16E185A78B;
	Wed, 24 May 2023 06:54:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF30D40C6CCC;
	Wed, 24 May 2023 06:54:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9CB5619465B3;
	Wed, 24 May 2023 06:54:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 132B419465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 06:54:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EABFD492B0C; Wed, 24 May 2023 06:54:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3290492B0A
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 06:54:27 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C92711C0171A
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 06:54:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-Js88AvxDOp6zf1-gg2JztA-1; Wed, 24 May 2023 02:54:25 -0400
X-MC-Unique: Js88AvxDOp6zf1-gg2JztA-1
Received: from [2001:4bb8:188:23b2:cbb8:fcea:a637:5089] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1i8f-00CVfQ-1M; Wed, 24 May 2023 06:38:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 24 May 2023 08:38:03 +0200
Message-Id: <20230524063810.1595778-5-hch@lst.de>
In-Reply-To: <20230524063810.1595778-1-hch@lst.de>
References: <20230524063810.1595778-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 04/11] filemap: add a kiocb_write_and_wait
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
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Factor out a helper that does filemap_write_and_wait_range for the range
covered by a read kiocb, or returns -EAGAIN if the kiocb is marked as
nowait and there would be pages to write.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Acked-by: Darrick J. Wong <djwong@kernel.org>
---
 block/fops.c            | 18 +++---------------
 include/linux/pagemap.h |  2 ++
 mm/filemap.c            | 30 ++++++++++++++++++------------
 3 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 58d0aebc7313a8..575171049c5d83 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -576,21 +576,9 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		goto reexpand; /* skip atime */
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
-		struct address_space *mapping = iocb->ki_filp->f_mapping;
-
-		if (iocb->ki_flags & IOCB_NOWAIT) {
-			if (filemap_range_needs_writeback(mapping, pos,
-							  pos + count - 1)) {
-				ret = -EAGAIN;
-				goto reexpand;
-			}
-		} else {
-			ret = filemap_write_and_wait_range(mapping, pos,
-							   pos + count - 1);
-			if (ret < 0)
-				goto reexpand;
-		}
-
+		ret = kiocb_write_and_wait(iocb, count);
+		if (ret < 0)
+			goto reexpand;
 		file_accessed(iocb->ki_filp);
 
 		ret = blkdev_direct_IO(iocb, to);
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index a56308a9d1a450..36fc2cea13ce20 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -30,6 +30,7 @@ static inline void invalidate_remote_inode(struct inode *inode)
 int invalidate_inode_pages2(struct address_space *mapping);
 int invalidate_inode_pages2_range(struct address_space *mapping,
 		pgoff_t start, pgoff_t end);
+
 int write_inode_now(struct inode *, int sync);
 int filemap_fdatawrite(struct address_space *);
 int filemap_flush(struct address_space *);
@@ -54,6 +55,7 @@ int filemap_check_errors(struct address_space *mapping);
 void __filemap_set_wb_err(struct address_space *mapping, int err);
 int filemap_fdatawrite_wbc(struct address_space *mapping,
 			   struct writeback_control *wbc);
+int kiocb_write_and_wait(struct kiocb *iocb, size_t count);
 
 static inline int filemap_write_and_wait(struct address_space *mapping)
 {
diff --git a/mm/filemap.c b/mm/filemap.c
index 15907af4a57ff5..5fcd5227f9cae2 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2762,6 +2762,21 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
 }
 EXPORT_SYMBOL_GPL(filemap_read);
 
+int kiocb_write_and_wait(struct kiocb *iocb, size_t count)
+{
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
+	loff_t pos = iocb->ki_pos;
+	loff_t end = pos + count - 1;
+
+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		if (filemap_range_needs_writeback(mapping, pos, end))
+			return -EAGAIN;
+		return 0;
+	}
+
+	return filemap_write_and_wait_range(mapping, pos, end);
+}
+
 /**
  * generic_file_read_iter - generic filesystem read routine
  * @iocb:	kernel I/O control block
@@ -2797,18 +2812,9 @@ generic_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 		struct address_space *mapping = file->f_mapping;
 		struct inode *inode = mapping->host;
 
-		if (iocb->ki_flags & IOCB_NOWAIT) {
-			if (filemap_range_needs_writeback(mapping, iocb->ki_pos,
-						iocb->ki_pos + count - 1))
-				return -EAGAIN;
-		} else {
-			retval = filemap_write_and_wait_range(mapping,
-						iocb->ki_pos,
-					        iocb->ki_pos + count - 1);
-			if (retval < 0)
-				return retval;
-		}
-
+		retval = kiocb_write_and_wait(iocb, count);
+		if (retval < 0)
+			return retval;
 		file_accessed(file);
 
 		retval = mapping->a_ops->direct_IO(iocb, iter);
-- 
2.39.2

