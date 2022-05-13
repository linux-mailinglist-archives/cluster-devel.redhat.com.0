Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5303526BD2
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 22:48:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652474923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iBNCahBcZc2MI0pM3YCqEzM3oWPCa3HDYwwvAzMn0Uo=;
	b=DrOeEVzkeFOp94O1ugdpZ5CyHvO06PIIEwGqIS4ax0P27rDS2LcNQg50iQMS3u5dC6zFIN
	xVcL4ssX6XnXvvDsHv4oP6FmfAiUFAzC9Cjql/MljFZJhRoNXnahmqyWgeJ2Ucw2MwyLEW
	KDGSE7Co5FNoK+JgVAPHNBdxV4EAYwI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-XKlFCtUOM8W3alB3yXTL0g-1; Fri, 13 May 2022 16:48:40 -0400
X-MC-Unique: XKlFCtUOM8W3alB3yXTL0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 058BF101A52C;
	Fri, 13 May 2022 20:48:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF42E15156E7;
	Fri, 13 May 2022 20:48:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7109E1932235;
	Fri, 13 May 2022 20:48:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E21F01932235 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 20:48:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C43A720296A7; Fri, 13 May 2022 20:48:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C04A20296A2;
 Fri, 13 May 2022 20:48:37 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 May 2022 22:48:10 +0200
Message-Id: <20220513204810.4123139-8-agruenba@redhat.com>
In-Reply-To: <20220513204810.4123139-1-agruenba@redhat.com>
References: <20220513204810.4123139-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 7/7] gfs2: Stop using glock holder
 auto-demotion for now
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

We're having unresolved issues with the glock holder auto-demotion mechanism
introduced in commit dc732906c245.  This mechanism was assumed to be essential
for avoiding frequent short reads and writes until commit 296abc0d91d8
("gfs2: No short reads or writes upon glock contention").  Since then,
when the inode glock is lost, it is simply re-acquired and the operation
is resumed.  This means that apart from the performance penalty, we
might as well drop the inode glock before faulting in pages, and
re-acquire it afterwards.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 46 ++++++++++++++--------------------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 5eda1bcc85e3..2556ae1f92ea 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -832,7 +832,6 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
-retry_under_glock:
 	pagefault_disable();
 	to->nofault = true;
 	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
@@ -845,14 +844,10 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 		read = ret;
 
 	if (should_fault_in_pages(to, iocb, &prev_count, &window_size)) {
-		gfs2_holder_allow_demote(gh);
+		gfs2_glock_dq(gh);
 		window_size -= fault_in_iov_iter_writeable(to, window_size);
-		gfs2_holder_disallow_demote(gh);
-		if (window_size) {
-			if (gfs2_holder_queued(gh))
-				goto retry_under_glock;
+		if (window_size)
 			goto retry;
-		}
 	}
 out_unlock:
 	if (gfs2_holder_queued(gh))
@@ -900,7 +895,6 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	/* Silently fall back to buffered I/O when writing beyond EOF */
 	if (iocb->ki_pos + iov_iter_count(from) > i_size_read(&ip->i_inode))
 		goto out_unlock;
-retry_under_glock:
 
 	from->nofault = true;
 	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
@@ -916,14 +910,10 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 		written = ret;
 
 	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
-		gfs2_holder_allow_demote(gh);
+		gfs2_glock_dq(gh);
 		window_size -= fault_in_iov_iter_readable(from, window_size);
-		gfs2_holder_disallow_demote(gh);
-		if (window_size) {
-			if (gfs2_holder_queued(gh))
-				goto retry_under_glock;
+		if (window_size)
 			goto retry;
-		}
 	}
 out_unlock:
 	if (gfs2_holder_queued(gh))
@@ -974,7 +964,6 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	ret = gfs2_glock_nq(&gh);
 	if (ret)
 		goto out_uninit;
-retry_under_glock:
 	pagefault_disable();
 	ret = generic_file_read_iter(iocb, to);
 	pagefault_enable();
@@ -984,14 +973,10 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		read += ret;
 
 	if (should_fault_in_pages(to, iocb, &prev_count, &window_size)) {
-		gfs2_holder_allow_demote(&gh);
+		gfs2_glock_dq(&gh);
 		window_size -= fault_in_iov_iter_writeable(to, window_size);
-		gfs2_holder_disallow_demote(&gh);
-		if (window_size) {
-			if (gfs2_holder_queued(&gh))
-				goto retry_under_glock;
+		if (window_size)
 			goto retry;
-		}
 	}
 out_unlock:
 	if (gfs2_holder_queued(&gh))
@@ -1030,22 +1015,17 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 
 	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, gh);
 retry:
-	ret = gfs2_glock_nq(gh);
-	if (ret)
-		goto out_uninit;
 	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
-retry_under_glock:
-		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_readable(from, window_size);
-		gfs2_holder_disallow_demote(gh);
 		if (!window_size) {
 			ret = -EFAULT;
-			goto out_unlock;
+			goto out_uninit;
 		}
-		if (!gfs2_holder_queued(gh))
-			goto retry;
 		from->count = min(from->count, window_size);
 	}
+	ret = gfs2_glock_nq(gh);
+	if (ret)
+		goto out_uninit;
 
 	if (inode == sdp->sd_rindex) {
 		struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
@@ -1073,8 +1053,10 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 		goto out_unlock;
 
 	from->count = orig_count - written;
-	if (should_fault_in_pages(from, iocb, &prev_count, &window_size))
-		goto retry_under_glock;
+	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
+		gfs2_glock_dq(gh);
+		goto retry;
+	}
 out_unlock:
 	if (gfs2_holder_queued(gh))
 		gfs2_glock_dq(gh);
-- 
2.35.1

