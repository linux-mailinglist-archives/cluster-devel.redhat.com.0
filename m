Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EF526BCD
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 22:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652474917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VdSBUPUVawM7wC5y5qGFJnchqV1h9s31wz+l/x5EypU=;
	b=DFeFeiWGOTIdJEx6GCzblGYnys4OCIcCKFoLGyuDI75COy0yFhed3z0/edNuVOgwERbFbN
	xljUT1Q5iHOG77a7Q2iP9LQ3QSiGJimAtV8FZ0B0v6yWmVBGhDqe4VEZY61Gq89c+bSgST
	15eaNZKSwrIpV3q0WZBbyhWUyqLK25g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-rCTFmJv1OT6Qj7IL7AgvcA-1; Fri, 13 May 2022 16:48:26 -0400
X-MC-Unique: rCTFmJv1OT6Qj7IL7AgvcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3FF285A5BC;
	Fri, 13 May 2022 20:48:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A929240CFD00;
	Fri, 13 May 2022 20:48:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 608B61932235;
	Fri, 13 May 2022 20:48:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 030C4194975B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 20:48:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA4D12024CBB; Fri, 13 May 2022 20:48:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E3E62026987;
 Fri, 13 May 2022 20:48:19 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 May 2022 22:48:08 +0200
Message-Id: <20220513204810.4123139-6-agruenba@redhat.com>
In-Reply-To: <20220513204810.4123139-1-agruenba@redhat.com>
References: <20220513204810.4123139-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 5/7] gfs2: Align read and write chunks to
 the page cache
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

Align the chunks that reads and writes are carried out in to the page
cache rather than the user buffers.  This will be more efficient in
general, especially for allocating writes.  Optimizing the case that the
user buffer is gfs2 backed isn't very useful; we only need to make sure
we won't deadlock.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index ea87bef7314d..11c46407d4a8 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -771,6 +771,7 @@ static int gfs2_fsync(struct file *file, loff_t start, loff_t end,
 }
 
 static inline bool should_fault_in_pages(struct iov_iter *i,
+					 struct kiocb *iocb,
 					 size_t *prev_count,
 					 size_t *window_size)
 {
@@ -783,15 +784,13 @@ static inline bool should_fault_in_pages(struct iov_iter *i,
 		return false;
 
 	size = PAGE_SIZE;
-	offs = offset_in_page(i->iov[0].iov_base + i->iov_offset);
+	offs = offset_in_page(iocb->ki_pos);
 	if (*prev_count != count || !*window_size) {
 		size_t nr_dirtied;
 
-		size = ALIGN(offs + count, PAGE_SIZE);
-		size = min_t(size_t, size, SZ_1M);
 		nr_dirtied = max(current->nr_dirtied_pause -
 				 current->nr_dirtied, 8);
-		size = min(size, nr_dirtied << PAGE_SHIFT);
+		size = min_t(size_t, SZ_1M, nr_dirtied << PAGE_SHIFT);
 	}
 
 	*prev_count = count;
@@ -845,7 +844,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 	if (ret > 0)
 		read = ret;
 
-	if (should_fault_in_pages(to, &prev_count, &window_size)) {
+	if (should_fault_in_pages(to, iocb, &prev_count, &window_size)) {
 		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_writeable(to, window_size);
 		gfs2_holder_disallow_demote(gh);
@@ -916,7 +915,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	if (ret > 0)
 		written = ret;
 
-	if (should_fault_in_pages(from, &prev_count, &window_size)) {
+	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
 		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_readable(from, window_size);
 		gfs2_holder_disallow_demote(gh);
@@ -984,7 +983,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	if (ret > 0)
 		read += ret;
 
-	if (should_fault_in_pages(to, &prev_count, &window_size)) {
+	if (should_fault_in_pages(to, iocb, &prev_count, &window_size)) {
 		gfs2_holder_allow_demote(&gh);
 		window_size -= fault_in_iov_iter_writeable(to, window_size);
 		gfs2_holder_disallow_demote(&gh);
@@ -1061,7 +1060,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 		goto out_unlock;
 
 	from->count = orig_count - written;
-	if (should_fault_in_pages(from, &prev_count, &window_size)) {
+	if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
 		gfs2_holder_allow_demote(gh);
 		window_size -= fault_in_iov_iter_readable(from, window_size);
 		gfs2_holder_disallow_demote(gh);
-- 
2.35.1

