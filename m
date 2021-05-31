Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5A539664C
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 19:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622480507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=87JowEd1S3/KydoKdPj22y1RTGzOJZZsVj9TKC1DTWI=;
	b=Koa4Vj1tdir1viGTc2XKMGWRLmw1o5GgzOxvKoWtnuz9DKvFB0YgmpHQoeepyF1fVBFWDm
	dBq7b12csBi4pdMiBtr3p9MfB3fnAeSIppSMuyfkZ4jusHp6P8QS6mqLBY7tRBvGYcgdeg
	kbioYNvtd/lb6We/yjsNuPOLK2nKDKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-wXEl3bkeM8ey8zXz1UnhBw-1; Mon, 31 May 2021 13:01:45 -0400
X-MC-Unique: wXEl3bkeM8ey8zXz1UnhBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0014107ACFE;
	Mon, 31 May 2021 17:01:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C061A5D9D0;
	Mon, 31 May 2021 17:01:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A786A1801029;
	Mon, 31 May 2021 17:01:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VH1g1i019111 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 13:01:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFC3F59460; Mon, 31 May 2021 17:01:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E3BB2DAD0;
	Mon, 31 May 2021 17:01:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 19:01:19 +0200
Message-Id: <20210531170123.243771-6-agruenba@redhat.com>
In-Reply-To: <20210531170123.243771-1-agruenba@redhat.com>
References: <20210531170123.243771-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [RFC 5/9] iov_iter: Add
	iov_iter_fault_in_writeable()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add the equivalent of iov_iter_fault_in_readable(), but for pages that
will be written to.

While at it, fix an indentation error in iov_iter_fault_in_readable().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 include/linux/uio.h |  1 +
 lib/iov_iter.c      | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index d3ec87706d75..6811eb6ac6e3 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -124,6 +124,7 @@ size_t iov_iter_copy_from_user_atomic(struct page *page,
 void iov_iter_advance(struct iov_iter *i, size_t bytes);
 void iov_iter_revert(struct iov_iter *i, size_t bytes);
 int iov_iter_fault_in_readable(struct iov_iter *i, size_t bytes);
+int iov_iter_fault_in_writeable(struct iov_iter *i, size_t bytes);
 size_t iov_iter_single_seg_count(const struct iov_iter *i);
 size_t copy_page_to_iter(struct page *page, size_t offset, size_t bytes,
 			 struct iov_iter *i);
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index c701b7a187f2..317c94eac907 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -480,13 +480,31 @@ int iov_iter_fault_in_readable(struct iov_iter *i, size_t bytes)
 		iterate_iovec(i, bytes, v, iov, skip, ({
 			err = fault_in_pages_readable(v.iov_base, v.iov_len);
 			if (unlikely(err))
-			return err;
+				return err;
 		0;}))
 	}
 	return 0;
 }
 EXPORT_SYMBOL(iov_iter_fault_in_readable);
 
+int iov_iter_fault_in_writeable(struct iov_iter *i, size_t bytes)
+{
+	size_t skip = i->iov_offset;
+	const struct iovec *iov;
+	int err;
+	struct iovec v;
+
+	if (!(i->type & (ITER_BVEC|ITER_KVEC))) {
+		iterate_iovec(i, bytes, v, iov, skip, ({
+			err = fault_in_pages_writeable(v.iov_base, v.iov_len);
+			if (unlikely(err))
+				return err;
+		0;}))
+	}
+	return 0;
+}
+EXPORT_SYMBOL(iov_iter_fault_in_writeable);
+
 void iov_iter_init(struct iov_iter *i, unsigned int direction,
 			const struct iovec *iov, unsigned long nr_segs,
 			size_t count)
-- 
2.26.3

