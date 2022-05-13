Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5D526BC8
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 22:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652474903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fKh6UkzmNAuxaHUgE9eKjCJXVJFDfYRQ2c9EhDeYuzY=;
	b=XCFWUe3BzsZzQdJP4I1jfTSgigG1OaQpCA7fXjN+D6rhp14geDKWaQlqB1IactJGfeFmc6
	ne9Sz0wvvaTB/afF2rjUZv1P/Zi0I9ubZN0Ets3wBcQZD+I0R1GZNDIoK6hZv1kSKW5TCf
	wYEa6wwnXkp49S9zm/vb+feSgsJ/BMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-y3e4wmImOqS8dYVvLue9Xw-1; Fri, 13 May 2022 16:48:20 -0400
X-MC-Unique: y3e4wmImOqS8dYVvLue9Xw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9E1985A5BC;
	Fri, 13 May 2022 20:48:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74F1A7C2A;
	Fri, 13 May 2022 20:48:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4AB771932239;
	Fri, 13 May 2022 20:48:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD9CD1932239 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 20:48:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D310D2024CBB; Fri, 13 May 2022 20:48:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B3092024CB7;
 Fri, 13 May 2022 20:48:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 May 2022 22:48:05 +0200
Message-Id: <20220513204810.4123139-3-agruenba@redhat.com>
In-Reply-To: <20220513204810.4123139-1-agruenba@redhat.com>
References: <20220513204810.4123139-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 2/7] gfs2: Variable rename
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Instead of counting the number of bytes read from the filesystem,
functions gfs2_file_direct_read and gfs2_file_read_iter count the number
of bytes written into the user buffer.  Conversely, functions
gfs2_file_direct_write and gfs2_file_buffered_write count the number of
bytes read from the user buffer.  This is nothing but confusing, so
change the read functions to count how many bytes they have read, and
the write functions to count how many bytes they have written.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 48f01323c37c..4d36c01727ad 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -807,7 +807,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 	struct file *file = iocb->ki_filp;
 	struct gfs2_inode *ip = GFS2_I(file->f_mapping->host);
 	size_t prev_count = 0, window_size = 0;
-	size_t written = 0;
+	size_t read = 0;
 	ssize_t ret;
 
 	/*
@@ -839,11 +839,11 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 	pagefault_disable();
 	to->nofault = true;
 	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
-			   IOMAP_DIO_PARTIAL, written);
+			   IOMAP_DIO_PARTIAL, read);
 	to->nofault = false;
 	pagefault_enable();
 	if (ret > 0)
-		written = ret;
+		read = ret;
 
 	if (should_fault_in_pages(ret, to, &prev_count, &window_size)) {
 		size_t leftover;
@@ -863,7 +863,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 	gfs2_holder_uninit(gh);
 	if (ret < 0)
 		return ret;
-	return written;
+	return read;
 }
 
 static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
@@ -873,7 +873,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	struct inode *inode = file->f_mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	size_t prev_count = 0, window_size = 0;
-	size_t read = 0;
+	size_t written = 0;
 	ssize_t ret;
 
 	/*
@@ -906,13 +906,13 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 
 	from->nofault = true;
 	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
-			   IOMAP_DIO_PARTIAL, read);
+			   IOMAP_DIO_PARTIAL, written);
 	from->nofault = false;
 
 	if (ret == -ENOTBLK)
 		ret = 0;
 	if (ret > 0)
-		read = ret;
+		written = ret;
 
 	if (should_fault_in_pages(ret, from, &prev_count, &window_size)) {
 		size_t leftover;
@@ -933,7 +933,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	gfs2_holder_uninit(gh);
 	if (ret < 0)
 		return ret;
-	return read;
+	return written;
 }
 
 static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
@@ -941,7 +941,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	struct gfs2_inode *ip;
 	struct gfs2_holder gh;
 	size_t prev_count = 0, window_size = 0;
-	size_t written = 0;
+	size_t read = 0;
 	ssize_t ret;
 
 	/*
@@ -962,7 +962,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	if (ret >= 0) {
 		if (!iov_iter_count(to))
 			return ret;
-		written = ret;
+		read = ret;
 	} else if (ret != -EFAULT) {
 		if (ret != -EAGAIN)
 			return ret;
@@ -980,7 +980,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	ret = generic_file_read_iter(iocb, to);
 	pagefault_enable();
 	if (ret > 0)
-		written += ret;
+		read += ret;
 
 	if (should_fault_in_pages(ret, to, &prev_count, &window_size)) {
 		size_t leftover;
@@ -998,7 +998,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		gfs2_glock_dq(&gh);
 out_uninit:
 	gfs2_holder_uninit(&gh);
-	return written ? written : ret;
+	return read ? read : ret;
 }
 
 static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
@@ -1012,7 +1012,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	struct gfs2_holder *statfs_gh = NULL;
 	size_t prev_count = 0, window_size = 0;
 	size_t orig_count = iov_iter_count(from);
-	size_t read = 0;
+	size_t written = 0;
 	ssize_t ret;
 
 	/*
@@ -1050,13 +1050,13 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	current->backing_dev_info = NULL;
 	if (ret > 0) {
 		iocb->ki_pos += ret;
-		read += ret;
+		written += ret;
 	}
 
 	if (inode == sdp->sd_rindex)
 		gfs2_glock_dq_uninit(statfs_gh);
 
-	from->count = orig_count - read;
+	from->count = orig_count - written;
 	if (should_fault_in_pages(ret, from, &prev_count, &window_size)) {
 		size_t leftover;
 
@@ -1077,8 +1077,8 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	gfs2_holder_uninit(gh);
 	if (statfs_gh)
 		kfree(statfs_gh);
-	from->count = orig_count - read;
-	return read ? read : ret;
+	from->count = orig_count - written;
+	return written ? written : ret;
 }
 
 /**
-- 
2.35.1

