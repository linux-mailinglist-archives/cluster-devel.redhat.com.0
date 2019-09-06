Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 31746AC165
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Sep 2019 22:28:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A00B300DA3A;
	Fri,  6 Sep 2019 20:28:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A11E600C8;
	Fri,  6 Sep 2019 20:28:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C96C180B536;
	Fri,  6 Sep 2019 20:28:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x86KSHeV029400 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Sep 2019 16:28:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83FFB60C5E; Fri,  6 Sep 2019 20:28:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-227.brq.redhat.com [10.40.204.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B848E60BF7;
	Fri,  6 Sep 2019 20:28:12 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  6 Sep 2019 22:28:10 +0200
Message-Id: <20190906202810.1854-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Improve mmap write vs. truncate
	consistency
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 06 Sep 2019 20:28:47 +0000 (UTC)

On filesystems with a block size smaller than PAGE_SIZE, page_mkwrite is
called for each memory-mapped page before that page can be written to.
When such a memory-mapped file is truncated down to size x which is not
a multiple of the page size and then back to a larger size, the page
straddling size x can end up with a partial block mapping.  In that
case, make sure to mark that page read-only so that page_mkwrite will be
called before the page can be written to the next time.

(There is no point in marking the page straddling size x read-only when
truncating down as writing to memory beyond the end of the file will
result in SIGBUS instead of growing the file.)

Fixes xfstests generic/029, generic/030 on filesystems with a block size
smaller than PAGE_SIZE.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 2043a728f281..9ef543dd38e2 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2139,7 +2139,7 @@ static int do_grow(struct inode *inode, u64 size)
 	if (error)
 		goto do_end_trans;
 
-	i_size_write(inode, size);
+	truncate_setsize(inode, size);
 	ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
 	gfs2_trans_add_meta(ip->i_gl, dibh);
 	gfs2_dinode_out(ip, dibh->b_data);
-- 
2.20.1

