Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A2560711
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656522708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9NNFFK/KiNiqmPv0p/RIkSbyx7FoObpmoJ7WW8fbPng=;
	b=aBzA2DlhrLuyIWn/e624lqJdJO6s3UB0quX8EwZ2AM9PvZNl/JJL6RrXw/1rOP0ICI3E3s
	GZMOnAFNaPKxAO+SE/OhldxtUQ7cKv7iEUy6TAuGKpL2ZV2Tr1uofCLWKVns90FyXgdf7w
	7CISggjxmuRWeU5qKVvR0tuiNSYPL88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-nfquUvrlOlOPv8A5GUMQ6g-1; Wed, 29 Jun 2022 13:11:45 -0400
X-MC-Unique: nfquUvrlOlOPv8A5GUMQ6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DE8719705A9;
	Wed, 29 Jun 2022 17:11:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57052C2811E;
	Wed, 29 Jun 2022 17:11:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 040351947067;
	Wed, 29 Jun 2022 17:11:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F9FA1947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7059D492CA4; Wed, 29 Jun 2022 16:37:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0D2D492C3B;
 Wed, 29 Jun 2022 16:37:19 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:11 +0200
Message-Id: <20220629163711.732931-10-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 9/9] Revert "gfs2: Stop using glock holder
 auto-demotion for now"
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

With the glock holder auto-demotion in do_promote fixed, we can
re-enable this feature.

This reverts commit e1fa9ea85ce89207d2ac0316da35a4a7736801f9.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 46 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 2cceb193dcd8..fee69467f11e 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -832,6 +832,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
+retry_under_glock:
 	pagefault_disable();
 	to->nofault = true;
 	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
@@ -845,10 +846,14 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 		read = ret;
 
 	if (should_fault_in_pages(to, iocb, &prev_count, &window_size)) {
-		gfs2_glock_dq(gh);
+		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_writeable(to, window_size);
-		if (window_size)
+		gfs2_holder_disallow_demote(gh);
+		if (window_size) {
+			if (gfs2_holder_queued(gh))
+				goto retry_under_glock;
 			goto retry;
+		}
 	}
 out_unlock:
 	if (gfs2_holder_queued(gh))
@@ -897,6 +902,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	/* Silently fall back to buffered I/O when writing beyond EOF */
 	if (iocb->ki_pos + iov_iter_count(from) > i_size_read(&ip->i_inode))
 		goto out_unlock;
+retry_under_glock:
 
 	from->nofault = true;
 	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
@@ -913,10 +919,14 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 		written = ret;
 
 	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
-		gfs2_glock_dq(gh);
+		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_readable(from, window_size);
-		if (window_size)
+		gfs2_holder_disallow_demote(gh);
+		if (window_size) {
+			if (gfs2_holder_queued(gh))
+				goto retry_under_glock;
 			goto retry;
+		}
 	}
 out_unlock:
 	if (gfs2_holder_queued(gh))
@@ -968,6 +978,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	ret = gfs2_glock_nq(&gh);
 	if (ret)
 		goto out_uninit;
+retry_under_glock:
 	pagefault_disable();
 	ret = generic_file_read_iter(iocb, to);
 	pagefault_enable();
@@ -977,10 +988,14 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		read += ret;
 
 	if (should_fault_in_pages(to, iocb, &prev_count, &window_size)) {
-		gfs2_glock_dq(&gh);
+		gfs2_holder_allow_demote(&gh);
 		window_size -= fault_in_iov_iter_writeable(to, window_size);
-		if (window_size)
+		gfs2_holder_disallow_demote(&gh);
+		if (window_size) {
+			if (gfs2_holder_queued(&gh))
+				goto retry_under_glock;
 			goto retry;
+		}
 	}
 out_unlock:
 	if (gfs2_holder_queued(&gh))
@@ -1019,17 +1034,22 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 
 	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, gh);
 retry:
+	ret = gfs2_glock_nq(gh);
+	if (ret)
+		goto out_uninit;
 	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
+retry_under_glock:
+		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_readable(from, window_size);
+		gfs2_holder_disallow_demote(gh);
 		if (!window_size) {
 			ret = -EFAULT;
-			goto out_uninit;
+			goto out_unlock;
 		}
+		if (!gfs2_holder_queued(gh))
+			goto retry;
 		from->count = min(from->count, window_size);
 	}
-	ret = gfs2_glock_nq(gh);
-	if (ret)
-		goto out_uninit;
 
 	if (inode == sdp->sd_rindex) {
 		struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
@@ -1057,10 +1077,8 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 		goto out_unlock;
 
 	from->count = orig_count - written;
-	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
-		gfs2_glock_dq(gh);
-		goto retry;
-	}
+	if (should_fault_in_pages(from, iocb, &prev_count, &window_size))
+		goto retry_under_glock;
 out_unlock:
 	if (gfs2_holder_queued(gh))
 		gfs2_glock_dq(gh);
-- 
2.35.1

