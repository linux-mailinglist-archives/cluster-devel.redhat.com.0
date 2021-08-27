Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8FBC3F9CE1
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 18:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630083099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=My07z1Y3p4MapI2JxW+Vnbyo3VlenRO2PNVTehC852I=;
	b=hzoWBSn370fYXZHhYhYLdTeVepAS3mveNtkVyzDk6KNywn1+3E/qpkYCjJL4RJvY2Wycyz
	Tg8CT7NDbF+aLlXQGxt3T0UTYk1fdyzz8b4Wp4gqNoS3B+HHZQK1EFsAxrNXq1Lrq+BKf0
	b7O+UuzVQIkPyc7fU51pyx3VYF1Vwj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-fb-3GPx7NvqG7cXAhtYlmg-1; Fri, 27 Aug 2021 12:51:38 -0400
X-MC-Unique: fb-3GPx7NvqG7cXAhtYlmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86285C73A5;
	Fri, 27 Aug 2021 16:51:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 771AB60C9D;
	Fri, 27 Aug 2021 16:51:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6554D181A0F1;
	Fri, 27 Aug 2021 16:51:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RGpYIT006128 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 12:51:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFA5A60C81; Fri, 27 Aug 2021 16:51:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17BD660C82;
	Fri, 27 Aug 2021 16:51:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Fri, 27 Aug 2021 18:49:25 +0200
Message-Id: <20210827164926.1726765-19-agruenba@redhat.com>
In-Reply-To: <20210827164926.1726765-1-agruenba@redhat.com>
References: <20210827164926.1726765-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v7 18/19] iov_iter: Introduce nofault flag
	to disable page faults
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Introduce a new nofault flag to indicate to get_user_pages to use the
FOLL_NOFAULT flag.  This will cause get_user_pages to fail when it
would otherwise fault in a page.

Currently, the noio flag is only checked in iov_iter_get_pages and
iov_iter_get_pages_alloc.  This is enough for iomaop_dio_rw, but it
may make sense to check in other contexts as well.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 include/linux/uio.h |  1 +
 lib/iov_iter.c      | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index ffa431aeb067..ea35e511268f 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -29,6 +29,7 @@ enum iter_type {
 
 struct iov_iter {
 	u8 iter_type;
+	bool nofault;
 	bool data_source;
 	size_t iov_offset;
 	size_t count;
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 968f2d2595cd..22a82f272754 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -513,6 +513,7 @@ void iov_iter_init(struct iov_iter *i, unsigned int direction,
 	WARN_ON(direction & ~(READ | WRITE));
 	*i = (struct iov_iter) {
 		.iter_type = ITER_IOVEC,
+		.nofault = false,
 		.data_source = direction,
 		.iov = iov,
 		.nr_segs = nr_segs,
@@ -1523,13 +1524,17 @@ ssize_t iov_iter_get_pages(struct iov_iter *i,
 		return 0;
 
 	if (likely(iter_is_iovec(i))) {
+		unsigned int gup_flags = 0;
 		unsigned long addr;
 
+		if (iov_iter_rw(i) != WRITE)
+			gup_flags |= FOLL_WRITE;
+		if (i->nofault)
+			gup_flags |= FOLL_NOFAULT;
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
@@ -1645,15 +1650,20 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
 		return 0;
 
 	if (likely(iter_is_iovec(i))) {
+		unsigned int gup_flags = 0;
 		unsigned long addr;
 
+		if (iov_iter_rw(i) != WRITE)
+			gup_flags |= FOLL_WRITE;
+		if (i->nofault)
+			gup_flags |= FOLL_NOFAULT;
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
 			*pages = NULL;
-- 
2.26.3

