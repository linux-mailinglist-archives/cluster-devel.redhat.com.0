Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4E33CD228
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 12:47:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Q1OF97_AOa6STx8x4WF8Pw-1; Mon, 19 Jul 2021 06:47:17 -0400
X-MC-Unique: Q1OF97_AOa6STx8x4WF8Pw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 323A11800D41;
	Mon, 19 Jul 2021 10:47:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23DD25C1C5;
	Mon, 19 Jul 2021 10:47:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AB481809C99;
	Mon, 19 Jul 2021 10:47:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JAlC5c007418 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 06:47:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C51F3200C0F4; Mon, 19 Jul 2021 10:47:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C103E200D8D9
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 10:47:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA49418A6585
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 10:47:12 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-11-rrPAzGLNNkqoXpRr7Isgsg-1; Mon, 19 Jul 2021 06:47:10 -0400
X-MC-Unique: rrPAzGLNNkqoXpRr7Isgsg-1
Received: from [2001:4bb8:193:7660:d2a4:8d57:2e55:21d0] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5QjN-006kuz-0s; Mon, 19 Jul 2021 10:42:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 19 Jul 2021 12:35:01 +0200
Message-Id: <20210719103520.495450-9-hch@lst.de>
In-Reply-To: <20210719103520.495450-1-hch@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 08/27] iomap: add the new iomap_iter model
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

The iomap_iter struct provides a convenient way to package up and
maintain all the arguments to the various mapping and operation
functions.  It is operated on using the iomap_iter() function that
is called in loop until the whole range has been processed.  Compared
to the existing iomap_apply() function this avoid an indirect call
for each iteration.

For now iomap_iter() calls back into the existing ->iomap_begin and
->iomap_end methods, but in the future this could be further optimized
to avoid indirect calls entirely.

Based on an earlier patch from Matthew Wilcox <willy@infradead.org>.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/Makefile     |  1 +
 fs/iomap/iter.c       | 74 +++++++++++++++++++++++++++++++++++++++++++
 fs/iomap/trace.h      | 37 +++++++++++++++++++++-
 include/linux/iomap.h | 56 ++++++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 fs/iomap/iter.c

diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
index eef2722d93a183..85034deb5a2f19 100644
--- a/fs/iomap/Makefile
+++ b/fs/iomap/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_FS_IOMAP)		+= iomap.o
 
 iomap-y				+= trace.o \
 				   apply.o \
+				   iter.o \
 				   buffered-io.o \
 				   direct-io.o \
 				   fiemap.o \
diff --git a/fs/iomap/iter.c b/fs/iomap/iter.c
new file mode 100644
index 00000000000000..b21e2489700b7c
--- /dev/null
+++ b/fs/iomap/iter.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Christoph Hellwig.
+ */
+#include <linux/fs.h>
+#include <linux/iomap.h>
+#include "trace.h"
+
+static inline int iomap_iter_advance(struct iomap_iter *iter)
+{
+	/* handle the previous iteration (if any) */
+	if (iter->iomap.length) {
+		if (iter->processed <= 0)
+			return iter->processed;
+		WARN_ON_ONCE(iter->processed > iomap_length(iter));
+		iter->pos += iter->processed;
+		iter->len -= iter->processed;
+		if (!iter->len)
+			return 0;
+	}
+
+	/* clear the state for the next iteration */
+	iter->processed = 0;
+	memset(&iter->iomap, 0, sizeof(iter->iomap));
+	memset(&iter->srcmap, 0, sizeof(iter->srcmap));
+	return 1;
+}
+
+static inline void iomap_iter_done(struct iomap_iter *iter)
+{
+	WARN_ON_ONCE(iter->iomap.offset > iter->pos);
+	WARN_ON_ONCE(iter->iomap.length == 0);
+	WARN_ON_ONCE(iter->iomap.offset + iter->iomap.length <= iter->pos);
+
+	trace_iomap_iter_dstmap(iter->inode, &iter->iomap);
+	if (iter->srcmap.type != IOMAP_HOLE)
+		trace_iomap_iter_srcmap(iter->inode, &iter->srcmap);
+}
+
+/**
+ * iomap_iter - iterate over a ranges in a file
+ * @iter: iteration structue
+ * @ops: iomap ops provided by the file system
+ *
+ * Iterate over file system provided contiguous ranges of blocks with the same
+ * state.  Should be called in a loop that continues as long as this function
+ * returns a positive value.  If 0 or a negative value is returned the caller
+ * should break out of the loop - a negative value is an error either from the
+ * file system or from the last iteration stored in @iter.copied.
+ */
+int iomap_iter(struct iomap_iter *iter, const struct iomap_ops *ops)
+{
+	int ret;
+
+	if (iter->iomap.length && ops->iomap_end) {
+		ret = ops->iomap_end(iter->inode, iter->pos, iomap_length(iter),
+				iter->processed > 0 ? iter->processed : 0,
+				iter->flags, &iter->iomap);
+		if (ret < 0 && !iter->processed)
+			return ret;
+	}
+
+	trace_iomap_iter(iter, ops, _RET_IP_);
+	ret = iomap_iter_advance(iter);
+	if (ret <= 0)
+		return ret;
+
+	ret = ops->iomap_begin(iter->inode, iter->pos, iter->len, iter->flags,
+			       &iter->iomap, &iter->srcmap);
+	if (ret < 0)
+		return ret;
+	iomap_iter_done(iter);
+	return 1;
+}
diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
index e9cd5cc0d6ba40..1012d7af6b689b 100644
--- a/fs/iomap/trace.h
+++ b/fs/iomap/trace.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2009-2019 Christoph Hellwig
+ * Copyright (c) 2009-2021 Christoph Hellwig
  *
  * NOTE: none of these tracepoints shall be considered a stable kernel ABI
  * as they can change at any time.
@@ -140,6 +140,8 @@ DEFINE_EVENT(iomap_class, name,	\
 	TP_ARGS(inode, iomap))
 DEFINE_IOMAP_EVENT(iomap_apply_dstmap);
 DEFINE_IOMAP_EVENT(iomap_apply_srcmap);
+DEFINE_IOMAP_EVENT(iomap_iter_dstmap);
+DEFINE_IOMAP_EVENT(iomap_iter_srcmap);
 
 TRACE_EVENT(iomap_apply,
 	TP_PROTO(struct inode *inode, loff_t pos, loff_t length,
@@ -179,6 +181,39 @@ TRACE_EVENT(iomap_apply,
 		   __entry->actor)
 );
 
+TRACE_EVENT(iomap_iter,
+	TP_PROTO(struct iomap_iter *iter, const void *ops,
+		 unsigned long caller),
+	TP_ARGS(iter, ops, caller),
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(u64, ino)
+		__field(loff_t, pos)
+		__field(loff_t, length)
+		__field(unsigned int, flags)
+		__field(const void *, ops)
+		__field(unsigned long, caller)
+	),
+	TP_fast_assign(
+		__entry->dev = iter->inode->i_sb->s_dev;
+		__entry->ino = iter->inode->i_ino;
+		__entry->pos = iter->pos;
+		__entry->length = iomap_length(iter);
+		__entry->flags = iter->flags;
+		__entry->ops = ops;
+		__entry->caller = caller;
+	),
+	TP_printk("dev %d:%d ino 0x%llx pos %lld length %lld flags %s (0x%x) ops %ps caller %pS",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+		   __entry->ino,
+		   __entry->pos,
+		   __entry->length,
+		   __print_flags(__entry->flags, "|", IOMAP_FLAGS_STRINGS),
+		   __entry->flags,
+		   __entry->ops,
+		   (void *)__entry->caller)
+);
+
 #endif /* _IOMAP_TRACE_H */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index f9c36df6a3061b..a9f3f736017989 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -143,6 +143,62 @@ struct iomap_ops {
 			ssize_t written, unsigned flags, struct iomap *iomap);
 };
 
+/**
+ * struct iomap_iter - Iterate through a range of a file
+ * @inode: Set at the start of the iteration and should not change.
+ * @pos: The current file position we are operating on.  It is updated by
+ *	calls to iomap_iter().  Treat as read-only in the body.
+ * @len: The remaining length of the file segment we're operating on.
+ *	It is updated at the same time as @pos.
+ * @processed: The number of bytes processed by the body in the most recent
+ *	iteration, or a negative errno. 0 causes the iteration to stop.
+ * @flags: Zero or more of the iomap_begin flags above.
+ * @iomap: Map describing the I/O iteration
+ * @srcmap: Source map for COW operations
+ */
+struct iomap_iter {
+	struct inode *inode;
+	loff_t pos;
+	u64 len;
+	ssize_t processed;
+	unsigned flags;
+	struct iomap iomap;
+	struct iomap srcmap;
+};
+
+int iomap_iter(struct iomap_iter *iter, const struct iomap_ops *ops);
+
+/**
+ * iomap_length - length of the current iomap iteration
+ * @iter: iteration structure
+ *
+ * Returns the length that the operation applies to for the current iteration.
+ */
+static inline u64 iomap_length(const struct iomap_iter *iter)
+{
+	u64 end = iter->iomap.offset + iter->iomap.length;
+
+	if (iter->srcmap.type != IOMAP_HOLE)
+		end = min(end, iter->srcmap.offset + iter->srcmap.length);
+	return min(iter->len, end - iter->pos);
+}
+
+/**
+ * iomap_iter_srcmap - return the source map for the current iomap iteration
+ * @i: iteration structure
+ *
+ * Write operations on file systems with reflink support might require a
+ * source and a destination map.  This function retourns the source map
+ * for a given operation, which may or may no be identical to the destination
+ * map in &i->iomap.
+ */
+static inline struct iomap *iomap_iter_srcmap(struct iomap_iter *i)
+{
+	if (i->srcmap.type != IOMAP_HOLE)
+		return &i->srcmap;
+	return &i->iomap;
+}
+
 /*
  * Main iomap iterator function.
  */
-- 
2.30.2

