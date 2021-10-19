Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22643377E
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Oct 2021 15:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634651090;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GMMEkGGRgFD/FgwggFSt2zozeSaxloIxf+v0cQoYfqo=;
	b=e/XKWC4Lkzdjem2TzXoHXWdIbPN97FV9t7yYqzAlvFgHcYaH8C8aza+VPUvjS50B+S6qnM
	PxcUMlWJkGXQM7N8OWUvPrrZJ2n7e+jEtUPGRczIfGI6/c8QF7QRCJ3THlP6LfUp5+FYMM
	1xvSKDY9oZU1dF+NSl5442kaL1mZOR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-jRGzHGVcN1ek96OlBbnOoQ-1; Tue, 19 Oct 2021 09:44:47 -0400
X-MC-Unique: jRGzHGVcN1ek96OlBbnOoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 405861808325;
	Tue, 19 Oct 2021 13:44:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 331E7102AE42;
	Tue, 19 Oct 2021 13:44:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72F934A702;
	Tue, 19 Oct 2021 13:44:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JDicJc025712 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 09:44:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 961B4102AE42; Tue, 19 Oct 2021 13:44:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A41DD10016FC;
	Tue, 19 Oct 2021 13:44:04 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 19 Oct 2021 15:42:00 +0200
Message-Id: <20211019134204.3382645-14-agruenba@redhat.com>
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
Subject: [Cluster-devel] [PATCH v8 13/17] iomap: Support partial direct I/O
	on user copy failures
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

In iomap_dio_rw, when iomap_apply returns an -EFAULT error and the
IOMAP_DIO_PARTIAL flag is set, complete the request synchronously and
return a partial result.  This allows the caller to deal with the page
fault and retry the remainder of the request.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/iomap/direct-io.c  | 6 ++++++
 include/linux/iomap.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index a2a368e824c0..a434fb7887b2 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -581,6 +581,12 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 	if (iov_iter_rw(iter) == READ && iomi.pos >= dio->i_size)
 		iov_iter_revert(iter, iomi.pos - dio->i_size);
 
+	if (ret == -EFAULT && dio->size && (dio_flags & IOMAP_DIO_PARTIAL)) {
+		if (!(iocb->ki_flags & IOCB_NOWAIT))
+			wait_for_completion = true;
+		ret = 0;
+	}
+
 	/* magic error code to fall back to buffered I/O */
 	if (ret == -ENOTBLK) {
 		wait_for_completion = true;
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 24f8489583ca..2a213b0d1e1f 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -330,6 +330,13 @@ struct iomap_dio_ops {
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

