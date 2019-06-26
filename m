Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96956A54
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 15:23:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EA8230821AE;
	Wed, 26 Jun 2019 13:23:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7595060852;
	Wed, 26 Jun 2019 13:23:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4853B206D1;
	Wed, 26 Jun 2019 13:23:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QDNn7U016856 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 09:23:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B09091001DE3; Wed, 26 Jun 2019 13:23:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95A741001B0E;
	Wed, 26 Jun 2019 13:23:43 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org
Date: Wed, 26 Jun 2019 15:23:35 +0200
Message-Id: <20190626132335.14809-3-agruenba@redhat.com>
In-Reply-To: <20190626132335.14809-1-agruenba@redhat.com>
References: <20190626132335.14809-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-xfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v2 3/3] iomap: fix page_done callback for
	short writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 26 Jun 2019 13:23:57 +0000 (UTC)

When we truncate a short write to have it retried, pass the truncated
length to the page_done callback instead of the full length.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iomap.c b/fs/iomap.c
index 97569064faaa..9a9d016b2782 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -803,7 +803,7 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
 	if (old_size < pos)
 		pagecache_isize_extended(inode, old_size, pos);
 	if (page_ops && page_ops->page_done)
-		page_ops->page_done(inode, pos, copied, page, iomap);
+		page_ops->page_done(inode, pos, ret, page, iomap);
 	put_page(page);
 
 	if (ret < len)
-- 
2.20.1

