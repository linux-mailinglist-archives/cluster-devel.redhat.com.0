Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0E644C6BB
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Nov 2021 19:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636568283;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K07Q8rwAX3IRBngdLxQhQNyC0s9/0MqmOKb12SkJZuI=;
	b=X3XzFjE8IIWzWeb1Mhzhfnq6tFr9YbHY1I7t2ITxjaNn6nzRKbK+C77ho2DTQVadJA6C2t
	5DXbBGk1yvbsonXe0Kv85Nz2Umg5/DTPO8pgqxKb7EjEr89Moal+AdTDypVHS24hv/wnMR
	S269jdGigy4WGE5l8uAMb3sbVC181cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-3unmJlaOOQu38KhDjcfTVg-1; Wed, 10 Nov 2021 13:17:59 -0500
X-MC-Unique: 3unmJlaOOQu38KhDjcfTVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F03C1006AA3;
	Wed, 10 Nov 2021 18:17:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72C5667843;
	Wed, 10 Nov 2021 18:17:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F313C1818480;
	Wed, 10 Nov 2021 18:17:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AAHxHvS032296 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 12:59:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4AB81BC880; Wed, 10 Nov 2021 17:59:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 841F9608BA;
	Wed, 10 Nov 2021 17:59:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 10 Nov 2021 18:59:11 +0100
Message-Id: <20211110175915.534759-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/5] gfs2: Only dereference i->iov when
	iter_is_iovec(i)
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Only dereference i->iov after establishing that i is of type ITER_IOVEC.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index adafaaf7d24d..c486b702e00f 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -773,8 +773,8 @@ static inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
 					 size_t *prev_count,
 					 size_t *window_size)
 {
-	char __user *p = i->iov[0].iov_base + i->iov_offset;
 	size_t count = iov_iter_count(i);
+	char __user *p;
 	int pages = 1;
 
 	if (likely(!count))
@@ -787,14 +787,14 @@ static inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
 	if (*prev_count != count || !*window_size) {
 		int pages, nr_dirtied;
 
-		pages = min_t(int, BIO_MAX_VECS,
-			      DIV_ROUND_UP(iov_iter_count(i), PAGE_SIZE));
+		pages = min_t(int, BIO_MAX_VECS, DIV_ROUND_UP(count, PAGE_SIZE));
 		nr_dirtied = max(current->nr_dirtied_pause -
 				 current->nr_dirtied, 1);
 		pages = min(pages, nr_dirtied);
 	}
 
 	*prev_count = count;
+	p = i->iov[0].iov_base + i->iov_offset;
 	*window_size = (size_t)PAGE_SIZE * pages - offset_in_page(p);
 	return true;
 }
-- 
2.31.1

