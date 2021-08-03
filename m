Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F1ECB3DF56A
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Aug 2021 21:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628018398;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eHAPyz9FQE5Ee8AyZmG2GtC2H3b8hfWmrC+ZK8I1sOc=;
	b=McmXKrh1Be4Eo7Y9vy5w+55zF5RUUQfC9V1B07Mt7gm5iZM5b3DYTUjbJ89lkQkWmwyrF4
	XLeOlh3GJOeXJrsfAxKQ3F5TTFcOQ25v1wry8AGNCXa4VpXDRbserITBDB9FT31mjOsKkW
	1odWPYwuAmUOPDOIiUmrEZ2G8PCsrWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-VjanUd1xOoGnrASjX4w0Eg-1; Tue, 03 Aug 2021 15:19:56 -0400
X-MC-Unique: VjanUd1xOoGnrASjX4w0Eg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26D171006C83;
	Tue,  3 Aug 2021 19:19:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDAB619C46;
	Tue,  3 Aug 2021 19:19:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF83D4BB7B;
	Tue,  3 Aug 2021 19:19:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 173JIUOF011424 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 15:18:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8BB8A60CA0; Tue,  3 Aug 2021 19:18:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24BAA60C0F;
	Tue,  3 Aug 2021 19:18:27 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Tue,  3 Aug 2021 21:18:07 +0200
Message-Id: <20210803191818.993968-2-agruenba@redhat.com>
In-Reply-To: <20210803191818.993968-1-agruenba@redhat.com>
References: <20210803191818.993968-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v5 01/12] iov_iter: Fix iov_iter_get_pages{,
	_alloc} page fault return value
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

Both iov_iter_get_pages and iov_iter_get_pages_alloc return the number of bytes
of the iovec they could get the pages for.  When they cannot get any pages,
they're supposed to return 0, but when the start of the iovec isn't page
aligned, the calculation goes wrong and they return a negative value.  Fix both
functions.

In addition, change iov_iter_get_pages_alloc to return NULL in that case to
prevent resource leaks.

It seems that the cifs and nfs filesystems don't handle the zero case very
well.  Could the maintainers please have a look?

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 lib/iov_iter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index e23123ae3a13..25dfc48536d7 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1484,7 +1484,7 @@ ssize_t iov_iter_get_pages(struct iov_iter *i,
 		res = get_user_pages_fast(addr, n,
 				iov_iter_rw(i) != WRITE ?  FOLL_WRITE : 0,
 				pages);
-		if (unlikely(res < 0))
+		if (unlikely(res <= 0))
 			return res;
 		return (res == n ? len : res * PAGE_SIZE) - *start;
 	}
@@ -1608,8 +1608,9 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
 			return -ENOMEM;
 		res = get_user_pages_fast(addr, n,
 				iov_iter_rw(i) != WRITE ?  FOLL_WRITE : 0, p);
-		if (unlikely(res < 0)) {
+		if (unlikely(res <= 0)) {
 			kvfree(p);
+			*pages = NULL;
 			return res;
 		}
 		*pages = p;
-- 
2.26.3

