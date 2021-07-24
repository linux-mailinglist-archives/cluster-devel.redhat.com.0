Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6468E3D49A1
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 21:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627155405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FlV78agUrABREXpDwHnFobASjjrmkrmXAkGCJNUidbE=;
	b=SfyXeQbeq4LcyZNJRI8b+EJA26G4YbckyZSFHkIPPVxq5QarbCudpoDgSa6bXX0rOsRmSo
	30tYqRuk+ka2kYXkYfacJsmKdsHS3+i90Oz5pAPOLGY/GoxARXwEUUapU5viNl2xdpCcr6
	K0XNe8TKW2gN8SiwpgKmb7puvxsz3sQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-MYj2AmAqM2ea28LIEByn9w-1; Sat, 24 Jul 2021 15:36:44 -0400
X-MC-Unique: MYj2AmAqM2ea28LIEByn9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C16E0107466E;
	Sat, 24 Jul 2021 19:36:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B38A860C9D;
	Sat, 24 Jul 2021 19:36:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A229E180BAB3;
	Sat, 24 Jul 2021 19:36:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OJZJEw017023 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 15:35:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD0B41ABD1; Sat, 24 Jul 2021 19:35:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78D92544F1;
	Sat, 24 Jul 2021 19:35:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Sat, 24 Jul 2021 21:34:47 +0200
Message-Id: <20210724193449.361667-7-agruenba@redhat.com>
In-Reply-To: <20210724193449.361667-1-agruenba@redhat.com>
References: <20210724193449.361667-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v4 6/8] iomap: Support restarting direct I/O
	requests after user copy failures
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

In iomap_dio_rw, when iomap_apply returns an -EFAULT error, complete the
request synchronously.  Either return a partial result (when the
IOMAP_DIO_FAULT_RETRY flag is set and the caller is thus prepared to handle
partial results), or reset the iterator to the start to allow a restart.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/direct-io.c  | 13 +++++++++++++
 include/linux/iomap.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 51831ce93f6e..1ba825bab08b 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -565,6 +565,19 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
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
+				    (dio_flags & IOMAP_DIO_FAULT_RETRY))
+					ret = 0;
+				else
+					iov_iter_revert(iter, dio->size);
+			}
+
 			/* magic error code to fall back to buffered I/O */
 			if (ret == -ENOTBLK) {
 				wait_for_completion = true;
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 8aea35f1a003..9dbba9f7c945 100644
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
+#define IOMAP_DIO_FAULT_RETRY		(1 << 2)
+
 ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
 		unsigned int dio_flags, size_t done_before);
-- 
2.26.3

