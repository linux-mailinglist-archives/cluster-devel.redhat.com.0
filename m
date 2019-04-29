Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233DEC7E
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 00:09:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25E3F3082AED;
	Mon, 29 Apr 2019 22:09:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 116C21908C;
	Mon, 29 Apr 2019 22:09:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E050241F3D;
	Mon, 29 Apr 2019 22:09:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TM9qoG009925 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 18:09:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A86B57AA; Mon, 29 Apr 2019 22:09:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7467717CCB;
	Mon, 29 Apr 2019 22:09:49 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Date: Tue, 30 Apr 2019 00:09:32 +0200
Message-Id: <20190429220934.10415-4-agruenba@redhat.com>
In-Reply-To: <20190429220934.10415-1-agruenba@redhat.com>
References: <20190429220934.10415-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
	Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org,
	Mark Syms <Mark.Syms@citrix.com>
Subject: [Cluster-devel] [PATCH v7 3/5] iomap: Fix use-after-free error in
	page_done callback
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 29 Apr 2019 22:09:54 +0000 (UTC)

In iomap_write_end, we're not holding a page reference anymore when
calling the page_done callback, but the callback needs that reference to
access the page.  To fix that, move the put_page call in
__generic_write_end into the callers of __generic_write_end.  Then, in
iomap_write_end, put the page after calling the page_done callback.

Reported-by: Jan Kara <jack@suse.cz>
Fixes: 63899c6f8851 ("iomap: add a page_done callback")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c | 2 +-
 fs/iomap.c  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index e0d4c6a5e2d2..0faa41fb4c88 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2104,7 +2104,6 @@ void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
 	}
 
 	unlock_page(page);
-	put_page(page);
 
 	if (old_size < pos)
 		pagecache_isize_extended(inode, old_size, pos);
@@ -2160,6 +2159,7 @@ int generic_write_end(struct file *file, struct address_space *mapping,
 {
 	copied = block_write_end(file, mapping, pos, len, copied, page, fsdata);
 	__generic_write_end(mapping->host, pos, copied, page);
+	put_page(page);
 	return copied;
 }
 EXPORT_SYMBOL(generic_write_end);
diff --git a/fs/iomap.c b/fs/iomap.c
index f8c9722d1a97..62e3461704ce 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -780,6 +780,7 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
 	__generic_write_end(inode, pos, ret, page);
 	if (iomap->page_done)
 		iomap->page_done(inode, pos, copied, page, iomap);
+	put_page(page);
 
 	if (ret < len)
 		iomap_write_failed(inode, pos, len);
-- 
2.20.1

