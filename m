Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8A333D49A2
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 21:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627155409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=68SOusRsRxqdSvo7E5qry5oQaFdTx1qIpjpB5XBw6qk=;
	b=SVuXLv++uUcdnYMOWQfsBooeM03B381IpGtwZrSHg9jrivtCd292gv4QDxbcwvXG4gxOPw
	/dBiNiPNIswJONd/hixx/z1PKSVoKNNHalj6x2HznBiim2RvcnO8jCOGfZbLU5IDfjJ/GP
	odql83c/ip0CJvY8ENDLuiQv5J1c31A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-Pa2rCprxN06NBnvSI9lVPA-1; Sat, 24 Jul 2021 15:36:43 -0400
X-MC-Unique: Pa2rCprxN06NBnvSI9lVPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CA19107466C;
	Sat, 24 Jul 2021 19:36:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E1805C1D5;
	Sat, 24 Jul 2021 19:36:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4ABED4BB7C;
	Sat, 24 Jul 2021 19:36:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OJZMeu017032 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 15:35:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F9E518432; Sat, 24 Jul 2021 19:35:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DF7069320;
	Sat, 24 Jul 2021 19:35:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Sat, 24 Jul 2021 21:34:48 +0200
Message-Id: <20210724193449.361667-8-agruenba@redhat.com>
In-Reply-To: <20210724193449.361667-1-agruenba@redhat.com>
References: <20210724193449.361667-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v4 7/8] iov_iter: Introduce noio flag to
	disable page faults
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Introduce a new noio flag to indicate to get_user_pages to use the
FOLL_FAST_ONLY flag.  This will cause get_user_pages to fail when it
would otherwise fault in a page.

Currently, the noio flag is only checked in iov_iter_get_pages and
iov_iter_get_pages_alloc.  This is enough for iomaop_dio_rw, but it
may make sense to check for this flag in other contexts as well.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 include/linux/uio.h |  1 +
 lib/iov_iter.c      | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index 8e469b8b862f..83cc33465295 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -29,6 +29,7 @@ enum iter_type {
 
 struct iov_iter {
 	u8 iter_type;
+	bool noio;
 	bool data_source;
 	size_t iov_offset;
 	size_t count;
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index ccf1ee8d4edf..f0fa1b89fe9b 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -507,6 +507,7 @@ void iov_iter_init(struct iov_iter *i, unsigned int direction,
 	WARN_ON(direction & ~(READ | WRITE));
 	*i = (struct iov_iter) {
 		.iter_type = ITER_IOVEC,
+		.noio = false,
 		.data_source = direction,
 		.iov = iov,
 		.nr_segs = nr_segs,
@@ -1517,13 +1518,17 @@ ssize_t iov_iter_get_pages(struct iov_iter *i,
 		return 0;
 
 	if (likely(iter_is_iovec(i))) {
+		unsigned int gup_flags = 0;
 		unsigned long addr;
 
+		if (iov_iter_rw(i) != WRITE)
+			gup_flags |= FOLL_WRITE;
+		if (i->noio)
+			gup_flags |= FOLL_FAST_ONLY;
+
 		addr = first_iovec_segment(i, &len, start, maxsize, maxpages);
 		n = DIV_ROUND_UP(len, PAGE_SIZE);
-		res = get_user_pages_fast(addr, n,
-				iov_iter_rw(i) != WRITE ?  FOLL_WRITE : 0,
-				pages);
+		res = get_user_pages_fast(addr, n, gup_flags, pages);
 		if (unlikely(res <= 0))
 			return res;
 		return (res == n ? len : res * PAGE_SIZE) - *start;
@@ -1639,15 +1644,20 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
 		return 0;
 
 	if (likely(iter_is_iovec(i))) {
+		unsigned int gup_flags = 0;
 		unsigned long addr;
 
+		if (iov_iter_rw(i) != WRITE)
+			gup_flags |= FOLL_WRITE;
+		if (i->noio)
+			gup_flags |= FOLL_FAST_ONLY;
+
 		addr = first_iovec_segment(i, &len, start, maxsize, ~0U);
 		n = DIV_ROUND_UP(len, PAGE_SIZE);
 		p = get_pages_array(n);
 		if (!p)
 			return -ENOMEM;
-		res = get_user_pages_fast(addr, n,
-				iov_iter_rw(i) != WRITE ?  FOLL_WRITE : 0, p);
+		res = get_user_pages_fast(addr, n, gup_flags, p);
 		if (unlikely(res <= 0)) {
 			kvfree(p);
 			*pages = ZERO_SIZE_PTR;
-- 
2.26.3

