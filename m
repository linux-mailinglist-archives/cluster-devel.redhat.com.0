Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B1170943C
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 11:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684490204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6ol1bWODvCYTDT1JUgKKn9Fh7sNo8e9dyRg15aWfO9s=;
	b=J92prbur5SUTSoQWfH8Q4MDxs3meIHHQzdYkkhtMmXirODI+ewddK/GvF20ixZWZr1ZOLj
	mf1UmKJgR+jjjW+GpyFXoNZC6uOjWMY5ECuGrCQ9gTz8lKj1FAm9mu9tNcJl6ybnyty+cK
	ZigaGm4Di8Zn9Yr9CNudKzuURVq+v5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-GAuQKJ1NN426OxGqKNO4fw-1; Fri, 19 May 2023 05:56:38 -0400
X-MC-Unique: GAuQKJ1NN426OxGqKNO4fw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C3E3800962;
	Fri, 19 May 2023 09:56:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F87C40CFD46;
	Fri, 19 May 2023 09:56:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DEC2E19465B7;
	Fri, 19 May 2023 09:56:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58A1F19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 09:56:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A6591121315; Fri, 19 May 2023 09:56:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 327191121314
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 09:56:35 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (unknown [170.10.128.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 138FF28EA6E1
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 09:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-tw2spTjwMsidsadziw93Vw-1; Fri, 19 May 2023 05:56:33 -0400
X-MC-Unique: tw2spTjwMsidsadziw93Vw-1
Received: from [2001:4bb8:188:3dd5:e8d0:68bb:e5be:210a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzwWL-00FjdO-2V; Fri, 19 May 2023 09:35:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Fri, 19 May 2023 11:35:11 +0200
Message-Id: <20230519093521.133226-4-hch@lst.de>
In-Reply-To: <20230519093521.133226-1-hch@lst.de>
References: <20230519093521.133226-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 03/13] filemap: assign
 current->backing_dev_info in generic_perform_write
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
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Move the assignment to current->backing_dev_info from the callers into
generic_perform_write to reduce boiler plate code and reduce the scope
to just around the page dirtying loop.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ceph/file.c | 4 ----
 fs/ext4/file.c | 3 ---
 fs/f2fs/file.c | 2 --
 fs/nfs/file.c  | 5 +----
 mm/filemap.c   | 2 ++
 5 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index feeb9882ef635a..767f4dfe7def64 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -1791,9 +1791,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	else
 		ceph_start_io_write(inode);
 
-	/* We can write back this queue in page reclaim */
-	current->backing_dev_info = inode_to_bdi(inode);
-
 	if (iocb->ki_flags & IOCB_APPEND) {
 		err = ceph_do_getattr(inode, CEPH_STAT_CAP_SIZE, false);
 		if (err < 0)
@@ -1938,7 +1935,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ceph_end_io_write(inode);
 out_unlocked:
 	ceph_free_cap_flush(prealloc_cf);
-	current->backing_dev_info = NULL;
 	return written ? written : err;
 }
 
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 50824831d31def..3cb83a3e2e4a2a 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -29,7 +29,6 @@
 #include <linux/pagevec.h>
 #include <linux/uio.h>
 #include <linux/mman.h>
-#include <linux/backing-dev.h>
 #include "ext4.h"
 #include "ext4_jbd2.h"
 #include "xattr.h"
@@ -285,9 +284,7 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
 	if (ret <= 0)
 		goto out;
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	ret = generic_perform_write(iocb, from);
-	current->backing_dev_info = NULL;
 
 out:
 	inode_unlock(inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9e3855e43a7a63..7134fe8bd008cb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4517,9 +4517,7 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		return -EOPNOTSUPP;
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	ret = generic_perform_write(iocb, from);
-	current->backing_dev_info = NULL;
 
 	if (ret > 0) {
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 3cc87ae8473356..e8bb4c48a3210a 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -648,11 +648,8 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
 	since = filemap_sample_wb_err(file->f_mapping);
 	nfs_start_io_write(inode);
 	result = generic_write_checks(iocb, from);
-	if (result > 0) {
-		current->backing_dev_info = inode_to_bdi(inode);
+	if (result > 0)
 		result = generic_perform_write(iocb, from);
-		current->backing_dev_info = NULL;
-	}
 	nfs_end_io_write(inode);
 	if (result <= 0)
 		goto out;
diff --git a/mm/filemap.c b/mm/filemap.c
index 4d0ec2fa1c7070..bf693ad1da1ece 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3892,6 +3892,7 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
 	long status = 0;
 	ssize_t written = 0;
 
+	current->backing_dev_info = inode_to_bdi(mapping->host);
 	do {
 		struct page *page;
 		unsigned long offset;	/* Offset into pagecache page */
@@ -3956,6 +3957,7 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
 
 		balance_dirty_pages_ratelimited(mapping);
 	} while (iov_iter_count(i));
+	current->backing_dev_info = NULL;
 
 	if (!written)
 		return status;
-- 
2.39.2

