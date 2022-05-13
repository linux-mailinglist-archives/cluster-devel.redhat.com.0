Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DAA526BC9
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 22:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652474905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o4h5Q680Gh6VbldsAm712sJUP8xOD6SSv6u+htKqa0E=;
	b=I+QikngLMrHmik5iQ1WbqpFo+vLEDLdqLmdJIQmbA+9iIKxjwZF6Msca752lQIlRIw5E0I
	5nbwFv2KNvMci4RMXkzaZflA6zdKb3/gxyO/cqZGJqjTX76I+LZBpYg0u79mBACZ52yrev
	qPlHGO8fUGGKS7xKJqsfPW2RbKmQzSU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-pEpS6cS8OtKDAXylN9xFFw-1; Fri, 13 May 2022 16:48:22 -0400
X-MC-Unique: pEpS6cS8OtKDAXylN9xFFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 972AF380390D;
	Fri, 13 May 2022 20:48:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B16740CFD00;
	Fri, 13 May 2022 20:48:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 557301932235;
	Fri, 13 May 2022 20:48:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8AF0194975B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 20:48:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 992022024CBD; Fri, 13 May 2022 20:48:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0564A2024CB7;
 Fri, 13 May 2022 20:48:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 May 2022 22:48:07 +0200
Message-Id: <20220513204810.4123139-5-agruenba@redhat.com>
In-Reply-To: <20220513204810.4123139-1-agruenba@redhat.com>
References: <20220513204810.4123139-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 4/7] gfs2: Pull return value test out of
 should_fault_in_pages
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Pull the return value test of the previous read or write operation out
of should_fault_in_pages().  In a following patch, we'll fault in pages
before the I/O and there will be no return value to check.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index acc0c1d41564..ea87bef7314d 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -770,7 +770,7 @@ static int gfs2_fsync(struct file *file, loff_t start, loff_t end,
 	return ret ? ret : ret1;
 }
 
-static inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
+static inline bool should_fault_in_pages(struct iov_iter *i,
 					 size_t *prev_count,
 					 size_t *window_size)
 {
@@ -779,8 +779,6 @@ static inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
 
 	if (likely(!count))
 		return false;
-	if (ret <= 0 && ret != -EFAULT)
-		return false;
 	if (!iter_is_iovec(i))
 		return false;
 
@@ -842,10 +840,12 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 			   IOMAP_DIO_PARTIAL, read);
 	to->nofault = false;
 	pagefault_enable();
+	if (ret <= 0 && ret != -EFAULT)
+		goto out_unlock;
 	if (ret > 0)
 		read = ret;
 
-	if (should_fault_in_pages(ret, to, &prev_count, &window_size)) {
+	if (should_fault_in_pages(to, &prev_count, &window_size)) {
 		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_writeable(to, window_size);
 		gfs2_holder_disallow_demote(gh);
@@ -855,6 +855,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 			goto retry;
 		}
 	}
+out_unlock:
 	if (gfs2_holder_queued(gh))
 		gfs2_glock_dq(gh);
 out_uninit:
@@ -899,20 +900,23 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 		goto out_uninit;
 	/* Silently fall back to buffered I/O when writing beyond EOF */
 	if (iocb->ki_pos + iov_iter_count(from) > i_size_read(&ip->i_inode))
-		goto out;
+		goto out_unlock;
 retry_under_glock:
 
 	from->nofault = true;
 	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
 			   IOMAP_DIO_PARTIAL, written);
 	from->nofault = false;
-
-	if (ret == -ENOTBLK)
-		ret = 0;
+	if (ret <= 0) {
+		if (ret == -ENOTBLK)
+			ret = 0;
+		if (ret != -EFAULT)
+			goto out_unlock;
+	}
 	if (ret > 0)
 		written = ret;
 
-	if (should_fault_in_pages(ret, from, &prev_count, &window_size)) {
+	if (should_fault_in_pages(from, &prev_count, &window_size)) {
 		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_readable(from, window_size);
 		gfs2_holder_disallow_demote(gh);
@@ -922,7 +926,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 			goto retry;
 		}
 	}
-out:
+out_unlock:
 	if (gfs2_holder_queued(gh))
 		gfs2_glock_dq(gh);
 out_uninit:
@@ -975,10 +979,12 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	pagefault_disable();
 	ret = generic_file_read_iter(iocb, to);
 	pagefault_enable();
+	if (ret <= 0 && ret != -EFAULT)
+		goto out_unlock;
 	if (ret > 0)
 		read += ret;
 
-	if (should_fault_in_pages(ret, to, &prev_count, &window_size)) {
+	if (should_fault_in_pages(to, &prev_count, &window_size)) {
 		gfs2_holder_allow_demote(&gh);
 		window_size -= fault_in_iov_iter_writeable(to, window_size);
 		gfs2_holder_disallow_demote(&gh);
@@ -988,6 +994,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			goto retry;
 		}
 	}
+out_unlock:
 	if (gfs2_holder_queued(&gh))
 		gfs2_glock_dq(&gh);
 out_uninit:
@@ -1050,8 +1057,11 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	if (inode == sdp->sd_rindex)
 		gfs2_glock_dq_uninit(statfs_gh);
 
+	if (ret <= 0 && ret != -EFAULT)
+		goto out_unlock;
+
 	from->count = orig_count - written;
-	if (should_fault_in_pages(ret, from, &prev_count, &window_size)) {
+	if (should_fault_in_pages(from, &prev_count, &window_size)) {
 		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_readable(from, window_size);
 		gfs2_holder_disallow_demote(gh);
-- 
2.35.1

