Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020371A368
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jun 2023 17:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685635022;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jbawnL+VYgZ1jYvLS7+9Ak42xWEPxAzs6GdcaAHW+Oo=;
	b=FqvClpKE+cym/9tSxtkeY+JdsrmkTZValEiBgzYKwfWJ61eT5vKnhCmk0BEX7lFNXNIr/A
	g6vALAYI7zwb68GcyUAASjN0j1F4aPih1/PdMJd+lK3SELWDzcerKgsZWr+HJZfgjgl4rw
	dz0M7KsZtRTxSzGA0tXCsDwwMoKP1To=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-ihiYR_F2OheUNUYVRjOfQQ-1; Thu, 01 Jun 2023 11:56:59 -0400
X-MC-Unique: ihiYR_F2OheUNUYVRjOfQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35FCA85A5B5;
	Thu,  1 Jun 2023 15:56:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0791540C6EC4;
	Thu,  1 Jun 2023 15:56:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C1EBD19465A2;
	Thu,  1 Jun 2023 15:56:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 06A6E194658C for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Jun 2023 15:56:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CD45114171BC; Thu,  1 Jun 2023 15:56:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5A5414171BB
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 15:56:55 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A701F185A78E
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 15:56:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-sEkCL1GpOAS33vTvhtow2Q-1; Thu, 01 Jun 2023 11:56:51 -0400
X-MC-Unique: sEkCL1GpOAS33vTvhtow2Q-1
Received: from [2001:4bb8:182:6d06:eacb:c751:971:73eb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4jm0-003w9a-1C; Thu, 01 Jun 2023 14:59:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Thu,  1 Jun 2023 16:59:02 +0200
Message-Id: <20230601145904.1385409-11-hch@lst.de>
In-Reply-To: <20230601145904.1385409-1-hch@lst.de>
References: <20230601145904.1385409-1-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 10/12] fuse: update ki_pos in
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Both callers of fuse_perform_write need to updated ki_pos, move it into
common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 fs/fuse/file.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 97d435874b14aa..d5902506cdcc65 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1329,7 +1329,10 @@ static ssize_t fuse_perform_write(struct kiocb *iocb,
 	fuse_write_update_attr(inode, pos, res);
 	clear_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
 
-	return res > 0 ? res : err;
+	if (!res)
+		return err;
+	iocb->ki_pos += res;
+	return res;
 }
 
 static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
@@ -1341,7 +1344,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	struct inode *inode = mapping->host;
 	ssize_t err;
 	struct fuse_conn *fc = get_fuse_conn(inode);
-	loff_t endbyte = 0;
 
 	if (fc->writeback_cache) {
 		/* Update size (EOF optimization) and mode (SUID clearing) */
@@ -1375,19 +1377,20 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		goto out;
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
-		loff_t pos = iocb->ki_pos;
+		loff_t pos, endbyte;
+
 		written = generic_file_direct_write(iocb, from);
 		if (written < 0 || !iov_iter_count(from))
 			goto out;
 
-		pos += written;
-
-		written_buffered = fuse_perform_write(iocb, mapping, from, pos);
+		written_buffered = fuse_perform_write(iocb, mapping, from,
+						      iocb->ki_pos);
 		if (written_buffered < 0) {
 			err = written_buffered;
 			goto out;
 		}
-		endbyte = pos + written_buffered - 1;
+		pos = iocb->ki_pos - written_buffered;
+		endbyte = iocb->ki_pos - 1;
 
 		err = filemap_write_and_wait_range(file->f_mapping, pos,
 						   endbyte);
@@ -1399,11 +1402,8 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 					 endbyte >> PAGE_SHIFT);
 
 		written += written_buffered;
-		iocb->ki_pos = pos + written_buffered;
 	} else {
 		written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
-		if (written >= 0)
-			iocb->ki_pos += written;
 	}
 out:
 	inode_unlock(inode);
-- 
2.39.2

