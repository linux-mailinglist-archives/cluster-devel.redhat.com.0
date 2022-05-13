Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D11526BCB
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 22:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652474906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=umoTzPNzCQV6W5WFJ9+xTiO4l7dQvC5ic2Mf2NeMWDw=;
	b=dxH5Bu4A7mmwhqpEbZiKU8Dbbe9J/SqZ+gGkxOZpHCUvVCQfjcMR0qtfZ7nVr5Nb7hGLa7
	PPn8EOxtjuj1rq48dSo/o8lkOkge3P/FM4PBhafuSqJB+QWQUS0zv1w3KHYJUFsMN+8RZL
	2XwvW7cxy3g9oE5YWk/KCJpLzJHj1aU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-HLJu6x-qPN-95CV2pJ5jYg-1; Fri, 13 May 2022 16:48:20 -0400
X-MC-Unique: HLJu6x-qPN-95CV2pJ5jYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CF53101A52C;
	Fri, 13 May 2022 20:48:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11C50C27E8A;
	Fri, 13 May 2022 20:48:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CD3FE1932235;
	Fri, 13 May 2022 20:48:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CDE8B1932232 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 20:48:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD04E2024CB9; Fri, 13 May 2022 20:48:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2367E2024CB7;
 Fri, 13 May 2022 20:48:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 May 2022 22:48:06 +0200
Message-Id: <20220513204810.4123139-4-agruenba@redhat.com>
In-Reply-To: <20220513204810.4123139-1-agruenba@redhat.com>
References: <20220513204810.4123139-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 3/7] gfs2: Clean up use of
 fault_in_iov_iter_{read, write}able
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

No need to store the return value of the fault_in functions in separate
variables.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 4d36c01727ad..acc0c1d41564 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -846,12 +846,10 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 		read = ret;
 
 	if (should_fault_in_pages(ret, to, &prev_count, &window_size)) {
-		size_t leftover;
-
 		gfs2_holder_allow_demote(gh);
-		leftover = fault_in_iov_iter_writeable(to, window_size);
+		window_size -= fault_in_iov_iter_writeable(to, window_size);
 		gfs2_holder_disallow_demote(gh);
-		if (leftover != window_size) {
+		if (window_size) {
 			if (gfs2_holder_queued(gh))
 				goto retry_under_glock;
 			goto retry;
@@ -915,12 +913,10 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 		written = ret;
 
 	if (should_fault_in_pages(ret, from, &prev_count, &window_size)) {
-		size_t leftover;
-
 		gfs2_holder_allow_demote(gh);
-		leftover = fault_in_iov_iter_readable(from, window_size);
+		window_size -= fault_in_iov_iter_readable(from, window_size);
 		gfs2_holder_disallow_demote(gh);
-		if (leftover != window_size) {
+		if (window_size) {
 			if (gfs2_holder_queued(gh))
 				goto retry_under_glock;
 			goto retry;
@@ -983,12 +979,10 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		read += ret;
 
 	if (should_fault_in_pages(ret, to, &prev_count, &window_size)) {
-		size_t leftover;
-
 		gfs2_holder_allow_demote(&gh);
-		leftover = fault_in_iov_iter_writeable(to, window_size);
+		window_size -= fault_in_iov_iter_writeable(to, window_size);
 		gfs2_holder_disallow_demote(&gh);
-		if (leftover != window_size) {
+		if (window_size) {
 			if (gfs2_holder_queued(&gh))
 				goto retry_under_glock;
 			goto retry;
@@ -1058,13 +1052,11 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 
 	from->count = orig_count - written;
 	if (should_fault_in_pages(ret, from, &prev_count, &window_size)) {
-		size_t leftover;
-
 		gfs2_holder_allow_demote(gh);
-		leftover = fault_in_iov_iter_readable(from, window_size);
+		window_size -= fault_in_iov_iter_readable(from, window_size);
 		gfs2_holder_disallow_demote(gh);
-		if (leftover != window_size) {
-			from->count = min(from->count, window_size - leftover);
+		if (window_size) {
+			from->count = min(from->count, window_size);
 			if (gfs2_holder_queued(gh))
 				goto retry_under_glock;
 			goto retry;
-- 
2.35.1

