Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF471791E
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 09:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685519763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a5Lvr5nZsxWnI6T+V3CK7XOpJ+ONTwidG7DsWkZk2X0=;
	b=b4ZOy+UgNPGI/6Zv56vZ0Wca0kdULIkkeBs6B0dzd3XQvIE2vIExIJSaB5ul8+f6nmRVhC
	2RbmZQCCc8eEIFtKCs6Oq1xcPbUh7+fz1j4kVKPhwAzcLwasC8DszkUc8j6zD2FjtmcF71
	DluvpRGd0ehMe1/ETZLt4jLxJMHCMgQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-WmGnwQ6xPBmEQ5trEfv1yA-1; Wed, 31 May 2023 03:55:58 -0400
X-MC-Unique: WmGnwQ6xPBmEQ5trEfv1yA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 142318032FA;
	Wed, 31 May 2023 07:55:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 066762166B25;
	Wed, 31 May 2023 07:55:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 86EDD19465A8;
	Wed, 31 May 2023 07:55:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AADC01946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 07:50:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DF68140E963; Wed, 31 May 2023 07:50:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86A22140E962
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 07:50:55 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 470D5811E7C
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 07:50:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-9uGyDCe7NTijgVKUNyix6Q-1; Wed, 31 May 2023 03:50:53 -0400
X-MC-Unique: 9uGyDCe7NTijgVKUNyix6Q-1
Received: from [2001:4bb8:182:6d06:f5c3:53d7:b5aa:b6a7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4GbX-00GVrP-2h; Wed, 31 May 2023 07:50:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 31 May 2023 09:50:21 +0200
Message-Id: <20230531075026.480237-8-hch@lst.de>
In-Reply-To: <20230531075026.480237-1-hch@lst.de>
References: <20230531075026.480237-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 07/12] iomap: update ki_pos in
 iomap_file_buffered_write
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

All callers of iomap_file_buffered_write need to updated ki_pos, move it
into common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
---
 fs/gfs2/file.c         | 4 +---
 fs/iomap/buffered-io.c | 9 ++++++---
 fs/xfs/xfs_file.c      | 2 --
 fs/zonefs/file.c       | 4 +---
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 904a0d6ac1a1a9..c6a7555d5ad8bb 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1044,10 +1044,8 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	pagefault_disable();
 	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
 	pagefault_enable();
-	if (ret > 0) {
-		iocb->ki_pos += ret;
+	if (ret > 0)
 		written += ret;
-	}
 
 	if (inode == sdp->sd_rindex)
 		gfs2_glock_dq_uninit(statfs_gh);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 063133ec77f49e..550525a525c45c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -864,16 +864,19 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 		.len		= iov_iter_count(i),
 		.flags		= IOMAP_WRITE,
 	};
-	int ret;
+	ssize_t ret;
 
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		iter.flags |= IOMAP_NOWAIT;
 
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.processed = iomap_write_iter(&iter, i);
-	if (iter.pos == iocb->ki_pos)
+
+	if (unlikely(ret < 0))
 		return ret;
-	return iter.pos - iocb->ki_pos;
+	ret = iter.pos - iocb->ki_pos;
+	iocb->ki_pos += ret;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
 
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 431c3fd0e2b598..d57443db633637 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -720,8 +720,6 @@ xfs_file_buffered_write(
 	trace_xfs_file_buffered_write(iocb, from);
 	ret = iomap_file_buffered_write(iocb, from,
 			&xfs_buffered_write_iomap_ops);
-	if (likely(ret >= 0))
-		iocb->ki_pos += ret;
 
 	/*
 	 * If we hit a space limit, try to free up some lingering preallocated
diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 132f01d3461f14..e212d0636f848e 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -643,9 +643,7 @@ static ssize_t zonefs_file_buffered_write(struct kiocb *iocb,
 		goto inode_unlock;
 
 	ret = iomap_file_buffered_write(iocb, from, &zonefs_write_iomap_ops);
-	if (ret > 0)
-		iocb->ki_pos += ret;
-	else if (ret == -EIO)
+	if (ret == -EIO)
 		zonefs_io_error(inode, true);
 
 inode_unlock:
-- 
2.39.2

