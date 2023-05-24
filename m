Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD68870EE96
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 08:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684911251;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I7nRLrC53ZpahuFKynf6W2iN4n5J8f6yAz18mg2al/A=;
	b=d+/LZ9f9Zk6sw4sxb94vMQ3rTw3/wU+jMeBOxiepjs39b1N01NRqmMgFhvpNJ7nAZw6bZY
	3KDqnlFhk9LyP7+OShOhSaKcX1Innscprj4RUMc0gzk1h8kOMH1AfDwrrbFx1AqU5DC3DV
	n2kGX6DPPgBKTxlorudy4l9RFd1fZik=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-UCN8iDdgOUqfgthW7MV1nw-1; Wed, 24 May 2023 02:54:08 -0400
X-MC-Unique: UCN8iDdgOUqfgthW7MV1nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEDA03801FF0;
	Wed, 24 May 2023 06:54:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3B2820296C6;
	Wed, 24 May 2023 06:54:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6538119465B6;
	Wed, 24 May 2023 06:54:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C960E19465B3 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 06:54:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DCC9840C6CCC; Wed, 24 May 2023 06:54:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D534440C6EC4
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 06:54:02 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAF15800888
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 06:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-0E_RcoI0MDySMjI-IiRLVw-1; Wed, 24 May 2023 02:54:00 -0400
X-MC-Unique: 0E_RcoI0MDySMjI-IiRLVw-1
Received: from [2001:4bb8:188:23b2:cbb8:fcea:a637:5089] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1i8y-00CVkq-1K; Wed, 24 May 2023 06:38:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 24 May 2023 08:38:10 +0200
Message-Id: <20230524063810.1595778-12-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 11/11] fuse: drop redundant arguments to
 fuse_perform_write
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pos is always equal to iocb->ki_pos, and mapping is always equal to
iocb->ki_filp->f_mapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 fs/fuse/file.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 90d587a7bdf813..bf48aae49daf56 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1280,13 +1280,13 @@ static inline unsigned int fuse_wr_pages(loff_t pos, size_t len,
 		     max_pages);
 }
 
-static ssize_t fuse_perform_write(struct kiocb *iocb,
-				  struct address_space *mapping,
-				  struct iov_iter *ii, loff_t pos)
+static ssize_t fuse_perform_write(struct kiocb *iocb, struct iov_iter *ii)
 {
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
 	struct inode *inode = mapping->host;
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_inode *fi = get_fuse_inode(inode);
+	loff_t pos = iocb->ki_pos;
 	int err = 0;
 	ssize_t res = 0;
 
@@ -1382,8 +1382,7 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		if (written < 0 || !iov_iter_count(from))
 			goto out;
 
-		written_buffered = fuse_perform_write(iocb, mapping, from,
-						      iocb->ki_pos);
+		written_buffered = fuse_perform_write(iocb, from);
 		if (written_buffered < 0) {
 			err = written_buffered;
 			goto out;
@@ -1403,7 +1402,7 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		written += written_buffered;
 		iocb->ki_pos += written_buffered;
 	} else {
-		written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
+		written = fuse_perform_write(iocb, from);
 	}
 out:
 	inode_unlock(inode);
-- 
2.39.2

