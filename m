Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 536CF3D41D7
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Jul 2021 22:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627073947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z5USnk4oWsRd3FH8wsMXQrumYbkYOqMoj1HmwKEKTOA=;
	b=Y9YkefVhYsMzhr/Ut12HCaYJ0C9/QVCV94MkTEMSb/xo1+MVJaKbrYoOqzWX+DDtCCBHmm
	Qz3cL8Ca3CgRZXCD7VkaqJ2GIzlvigYpLTmFiL5opVn1d6VeknUhGZRgwGahQlxBaN+qLi
	BSpP69CezsTyn+DEiyLetJDZp30JFj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-6-VjwzJTMZWtRQ6ivcFy-A-1; Fri, 23 Jul 2021 16:59:06 -0400
X-MC-Unique: 6-VjwzJTMZWtRQ6ivcFy-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E0EB8799EE;
	Fri, 23 Jul 2021 20:59:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B961970E;
	Fri, 23 Jul 2021 20:59:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD4C14BB7C;
	Fri, 23 Jul 2021 20:59:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16NKx27l026712 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 23 Jul 2021 16:59:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F46C100238C; Fri, 23 Jul 2021 20:59:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D4C610074FD;
	Fri, 23 Jul 2021 20:59:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Fri, 23 Jul 2021 22:58:38 +0200
Message-Id: <20210723205840.299280-6-agruenba@redhat.com>
In-Reply-To: <20210723205840.299280-1-agruenba@redhat.com>
References: <20210723205840.299280-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v3 5/7] iomap: Support restarting direct I/O
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In __iomap_dio_rw, when iomap_apply returns an -EFAULT error, complete the
request synchronously and reset the iterator to the start position.  This
allows callers to deal with the failure and retry the operation.

In gfs2, we need to disable page faults while we're holding glocks to prevent
deadlocks.  This patch is the minimum solution I could find to make
iomap_dio_rw work with page faults disabled.  It's still expensive because any
I/O that was carried out before hitting -EFAULT needs to be retried.

A possible improvement would be to add an IOMAP_DIO_FAULT_RETRY or similar flag
that would allow iomap_dio_rw to return a short result when hitting -EFAULT.
Callers could then retry only the rest of the request after dealing with the
page fault.

Asynchronous requests turn into synchronous requests up to the point of the
page fault in any case, but they could be retried asynchronously after dealing
with the page fault.  To make that work, the completion notification would have
to include the bytes read or written before the page fault(s) as well, and we'd
need an additional iomap_dio_rw argument for that.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/direct-io.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index cc0b4bc8861b..b0a494211bb4 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -561,6 +561,15 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		ret = iomap_apply(inode, pos, count, iomap_flags, ops, dio,
 				iomap_dio_actor);
 		if (ret <= 0) {
+			if (ret == -EFAULT) {
+				/*
+				 * To allow retrying the request, fail
+				 * synchronously and reset the iterator.
+				 */
+				wait_for_completion = true;
+				iov_iter_revert(dio->submit.iter, dio->size);
+			}
+
 			/* magic error code to fall back to buffered I/O */
 			if (ret == -ENOTBLK) {
 				wait_for_completion = true;
-- 
2.26.3

