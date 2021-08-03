Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E46733DF578
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Aug 2021 21:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628018553;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NoMbSsZN/tNyp+zwu0JwzF1/xZWL1oDU01iWZBbKHSw=;
	b=ZVk0gsI80n2v0tp9XjynR/A9AraFfcVHw5xmcWOO9G+9KiEzhOMSSC0VrpqjPPoJwEpdbk
	7eQStgq5eEjtQXUmQtqkGdYtvy3QaqN2JfMh+bsICai1dzBvjQSBwVxEGjkkMeYoV9vWrM
	mnP/rEzeeCO8nev+vUA9VfTs1zN3jdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Eo39FdWkMOSnzzBIYY1OIg-1; Tue, 03 Aug 2021 15:22:32 -0400
X-MC-Unique: Eo39FdWkMOSnzzBIYY1OIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5046877494;
	Tue,  3 Aug 2021 19:22:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B31641036D04;
	Tue,  3 Aug 2021 19:22:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9934A4BB7C;
	Tue,  3 Aug 2021 19:22:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 173JIur7011509 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 15:18:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0CD860C5F; Tue,  3 Aug 2021 19:18:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B5A060C0F;
	Tue,  3 Aug 2021 19:18:54 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Tue,  3 Aug 2021 21:18:15 +0200
Message-Id: <20210803191818.993968-10-agruenba@redhat.com>
In-Reply-To: <20210803191818.993968-1-agruenba@redhat.com>
References: <20210803191818.993968-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v5 09/12] iomap: Support restarting direct
	I/O requests after user copy failures
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In iomap_dio_rw, when iomap_apply returns an -EFAULT error, complete the
request synchronously.  Either return a partial result (when the
IOMAP_DIO_FAULT_RETRY flag is set and the caller is thus prepared to handle
partial results), or reset the iterator to the start and fail to allow
restarting the request.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/direct-io.c  | 13 +++++++++++++
 include/linux/iomap.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 8054f5d6c273..35c3f2bae65a 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -561,6 +561,19 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		ret = iomap_apply(inode, pos, count, iomap_flags, ops, dio,
 				iomap_dio_actor);
 		if (ret <= 0) {
+			if (ret == -EFAULT) {
+				/*
+				 * Finish synchronously and revert the iterator
+				 * when failing the request to allow a retry.
+				 */
+				wait_for_completion = true;
+				if (dio->size &&
+				    (dio_flags & IOMAP_DIO_PARTIAL))
+					ret = 0;
+				else
+					iov_iter_revert(iter, dio->size);
+			}
+
 			/* magic error code to fall back to buffered I/O */
 			if (ret == -ENOTBLK) {
 				wait_for_completion = true;
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 479c1da3e221..bcae4814b8e3 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -267,6 +267,13 @@ struct iomap_dio_ops {
   */
 #define IOMAP_DIO_OVERWRITE_ONLY	(1 << 1)
 
+/*
+ * When a page fault occurs, return a partial synchronous result and allow
+ * the caller to retry the rest of the operation after dealing with the page
+ * fault.
+ */
+#define IOMAP_DIO_PARTIAL		(1 << 2)
+
 ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
 		unsigned int dio_flags);
-- 
2.26.3

