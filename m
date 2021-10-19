Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED84337AF
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Oct 2021 15:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634651290;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+L1c98C1OCDIXwKiM8i7GJUzBN6j+vYrvBMnNDDevUE=;
	b=ERsd0RvDy8eb7ih6LsxhxxP3hHnAKmuF5uOyLA4rei4C0RZfzvUovyVVSOL8bWB8rBykvN
	BtrX8gH9NozroRaxTSQaUxtbEgoXbV4ULUCcvRmg5IKZ4P+Rn8hpv5S//Baa2ETRHYFPmr
	OPtLJddtHvpEwfgV9aV7ELEBOUulJJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-9CaWZiMoPGmUzcyRVU_c0g-1; Tue, 19 Oct 2021 09:48:06 -0400
X-MC-Unique: 9CaWZiMoPGmUzcyRVU_c0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A8591006AB3;
	Tue, 19 Oct 2021 13:48:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE56770951;
	Tue, 19 Oct 2021 13:48:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77350181A1D0;
	Tue, 19 Oct 2021 13:48:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JDjwjC026629 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 09:45:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2DA410246E8; Tue, 19 Oct 2021 13:45:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4110110016FC;
	Tue, 19 Oct 2021 13:45:35 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 19 Oct 2021 15:42:03 +0200
Message-Id: <20211019134204.3382645-17-agruenba@redhat.com>
In-Reply-To: <20211019134204.3382645-1-agruenba@redhat.com>
References: <20211019134204.3382645-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v8 16/17] iov_iter: Introduce nofault flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Introduce a new nofault flag to indicate to iov_iter_get_pages not to
fault in user pages.

This is implemented by passing the FOLL_NOFAULT flag to get_user_pages,
which causes get_user_pages to fail when it would otherwise fault in a
page. We'll use the ->nofault flag to prevent iomap_dio_rw from faulting
in pages when page faults are not allowed.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 include/linux/uio.h |  1 +
 lib/iov_iter.c      | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index 25d1c24fd829..6350354f97e9 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -35,6 +35,7 @@ struct iov_iter_state {
 
 struct iov_iter {
 	u8 iter_type;
+	bool nofault;
 	bool data_source;
 	size_t iov_offset;
 	size_t count;
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index ac9a87e727a3..66a740e6e153 100644
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
@@ -1527,13 +1528,17 @@ ssize_t iov_iter_get_pages(struct iov_iter *i,
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
@@ -1649,15 +1654,20 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
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

