Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3270945A
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 12:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684490470;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jBsLbOyW4gxJfboFsPaM/jr4wcWxBT1Mri8F0Ud0gD8=;
	b=fQ6IM1z2jFzvgXdVc2kcbPVwhP9v4fW3B7g8WwlnLE9unCBP5+65MOyV7bTWKfY0crnfPO
	nYp2GZuDvq6RjB9JaVeSxfFoY78mOYTFRpwLAyED9LWyhfz0UQftw4IXCkGpmhfkLpU4kg
	F+QGWNp7i5QJTqHfEYZnCO7/y4/AEa4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-NgUddaUONPu5E-h2Pjf3VA-1; Fri, 19 May 2023 06:01:02 -0400
X-MC-Unique: NgUddaUONPu5E-h2Pjf3VA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 953553801F6E;
	Fri, 19 May 2023 10:01:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8509A40CFD45;
	Fri, 19 May 2023 10:01:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 511C719465B7;
	Fri, 19 May 2023 10:00:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A009519465A4 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 10:00:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5050340D1B64; Fri, 19 May 2023 10:00:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4986040D1B62
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 10:00:57 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D4261C0905E
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 10:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-_1n-h-fCNYyMgKWPgygHSA-1; Fri, 19 May 2023 06:00:55 -0400
X-MC-Unique: _1n-h-fCNYyMgKWPgygHSA-1
Received: from [2001:4bb8:188:3dd5:e8d0:68bb:e5be:210a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzwWW-00Fjfv-2R; Fri, 19 May 2023 09:35:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Fri, 19 May 2023 11:35:15 +0200
Message-Id: <20230519093521.133226-8-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 07/13] iomap: update ki_pos in
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

All callers of iomap_file_buffered_write need to updated ki_pos, move it
into common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/file.c         | 4 +---
 fs/iomap/buffered-io.c | 9 ++++++---
 fs/xfs/xfs_file.c      | 2 --
 fs/zonefs/file.c       | 4 +---
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 300844f50dcd28..499ef174dec138 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1046,10 +1046,8 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
 	pagefault_enable();
 	current->backing_dev_info = NULL;
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
index aede746541f8ae..bfba10e0b0f3c2 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -723,8 +723,6 @@ xfs_file_buffered_write(
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

