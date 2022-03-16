Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E60544DB33B
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Mar 2022 15:27:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647440859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QR1dLTqdNtbRnNWyygTCXqlqVGqWq3x8rpjNYqPgeN8=;
	b=fFQRaBCDZIa9uejBaELaqdQsADTBlwBsz94E4Zpnusl5KhKpiNyjomNBRDu9wlBNyog+lk
	F7YT+yNJ3SKma3rl1/fcUgWsLPoYM71T4ob0bznh7K1ywAoGwrrywl0+apWoZoFHlrEScr
	CPS9QsN01TvQLYiaPfhTmZrrFW0VoXo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-K6J-alQgNyCOvvAghBs6dw-1; Wed, 16 Mar 2022 10:27:35 -0400
X-MC-Unique: K6J-alQgNyCOvvAghBs6dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC46D29DD9A4;
	Wed, 16 Mar 2022 14:27:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFC7A40D2820;
	Wed, 16 Mar 2022 14:27:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F9511940356;
	Wed, 16 Mar 2022 14:27:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA7111949761 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 16 Mar 2022 14:24:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8BBCE401E7C; Wed, 16 Mar 2022 14:24:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF78B401E76;
 Wed, 16 Mar 2022 14:24:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 16 Mar 2022 15:24:37 +0100
Message-Id: <20220316142437.1858274-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH] gfs2: Fix should_fault_in_pages() logic
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fix the fault-in window size logic:
* Use a maximum window size of 1 MiB instead of BIO_MAX_VECS * PAGE_SIZE.
  The previous window size was always one page because the pages variable
  was accidentally being redefined in should_fault_in_pages().
* Account for page overlap (unaligned iterators).
* The nr_dirtied heuristic for guessing when there might be memory
  pressure often results in very window sizes.  Don't let nr_dirtied
  drop below 8 pages (as btrfs does).
* Compute the window size in units of bytes, not pages.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index a743a9eb602f..ac0665a70d46 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -775,8 +775,7 @@ static inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
 					 size_t *window_size)
 {
 	size_t count = iov_iter_count(i);
-	char __user *p;
-	int pages = 1;
+	size_t size, offs;
 
 	if (likely(!count))
 		return false;
@@ -785,18 +784,20 @@ static inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
 	if (!iter_is_iovec(i))
 		return false;
 
+	size = PAGE_SIZE;
+	offs = offset_in_page(i->iov[0].iov_base + i->iov_offset);
 	if (*prev_count != count || !*window_size) {
-		int pages, nr_dirtied;
+		int nr_dirtied;
 
-		pages = min_t(int, BIO_MAX_VECS, DIV_ROUND_UP(count, PAGE_SIZE));
+		size = ALIGN(offs + count, PAGE_SIZE);
+		size = min_t(size_t, size, SZ_1M);
 		nr_dirtied = max(current->nr_dirtied_pause -
-				 current->nr_dirtied, 1);
-		pages = min(pages, nr_dirtied);
+				 current->nr_dirtied, 8);
+		size = min(size, nr_dirtied << PAGE_SHIFT);
 	}
 
 	*prev_count = count;
-	p = i->iov[0].iov_base + i->iov_offset;
-	*window_size = (size_t)PAGE_SIZE * pages - offset_in_page(p);
+	*window_size = size - offs;
 	return true;
 }
 
-- 
2.33.1

