Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D9526BD3
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 22:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652474925;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nv/4SEcK7HQkf0TSxtsjT6FuP9GF9eMv/RpR7mZM2YI=;
	b=QmOOZohAVkM+mkr4oezDv+XzRnmVbQpjskz9SfjxgQ+VfqpNw0Ogye9DNYsVzG/fueFUTR
	g4N8WU5m9aLigUb1zq6dyTkJWnut8j3YZBN408IWfEcu4RjCipjchC8eWP79eUdYvH1Dj2
	inMX2LUKsuZm53c2EYcV/Ss3oUxx0nQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-GD9HRwJCOIObVftJtwR5uw-1; Fri, 13 May 2022 16:48:38 -0400
X-MC-Unique: GD9HRwJCOIObVftJtwR5uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18AFA185A79C;
	Fri, 13 May 2022 20:48:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E537111F3B6;
	Fri, 13 May 2022 20:48:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E30271932237;
	Fri, 13 May 2022 20:48:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 15B90194975B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 20:48:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EAD6520296A7; Fri, 13 May 2022 20:48:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61BFC2024CBC;
 Fri, 13 May 2022 20:48:24 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 May 2022 22:48:09 +0200
Message-Id: <20220513204810.4123139-7-agruenba@redhat.com>
In-Reply-To: <20220513204810.4123139-1-agruenba@redhat.com>
References: <20220513204810.4123139-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 6/7] gfs2: buffered write prefaulting
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In gfs2_file_buffered_write, to increase the likelihood that all the
user memory we're trying to write will be resident in memory, carry out
the write in chunks and fault in each chunk of user memory before trying
to write it.  Otherwise, some workloads will trigger frequent short
"internal" writes, causing filesystem blocks to be allocated and then
partially deallocated again when writing into holes, which is wasteful
and breaks reservations.

Neither the chunked writes nor any of the short "internal" writes are
user visible.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 11c46407d4a8..5eda1bcc85e3 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -778,7 +778,7 @@ static inline bool should_fault_in_pages(struct iov_iter *i,
 	size_t count = iov_iter_count(i);
 	size_t size, offs;
 
-	if (likely(!count))
+	if (!count)
 		return false;
 	if (!iter_is_iovec(i))
 		return false;
@@ -1033,7 +1033,20 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
+	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
 retry_under_glock:
+		gfs2_holder_allow_demote(gh);
+		window_size -= fault_in_iov_iter_readable(from, window_size);
+		gfs2_holder_disallow_demote(gh);
+		if (!window_size) {
+			ret = -EFAULT;
+			goto out_unlock;
+		}
+		if (!gfs2_holder_queued(gh))
+			goto retry;
+		from->count = min(from->count, window_size);
+	}
+
 	if (inode == sdp->sd_rindex) {
 		struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
 
@@ -1060,17 +1073,8 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 		goto out_unlock;
 
 	from->count = orig_count - written;
-	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
-		gfs2_holder_allow_demote(gh);
-		window_size -= fault_in_iov_iter_readable(from, window_size);
-		gfs2_holder_disallow_demote(gh);
-		if (window_size) {
-			from->count = min(from->count, window_size);
-			if (gfs2_holder_queued(gh))
-				goto retry_under_glock;
-			goto retry;
-		}
-	}
+	if (should_fault_in_pages(from, iocb, &prev_count, &window_size))
+		goto retry_under_glock;
 out_unlock:
 	if (gfs2_holder_queued(gh))
 		gfs2_glock_dq(gh);
-- 
2.35.1

