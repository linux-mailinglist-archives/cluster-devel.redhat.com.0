Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8A6377E
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:09:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15A0E3086268;
	Tue,  9 Jul 2019 14:09:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFE945DD96;
	Tue,  9 Jul 2019 14:09:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F9F8206D2;
	Tue,  9 Jul 2019 14:08:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7NjR016084 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD037831D6; Tue,  9 Jul 2019 14:07:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7D12831B7;
	Tue,  9 Jul 2019 14:07:22 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:50 +0200
Message-Id: <20190709140657.19064-12-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>
Subject: [Cluster-devel] [GFS2 PATCH 11/18] gfs2: use page_offset in
	gfs2_page_mkwrite
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 09 Jul 2019 14:09:14 +0000 (UTC)

From: Christoph Hellwig <hch@lst.de>

Without casting page->index to a guaranteed 64-bit type, the value might be
treated as 32-bit on 32-bit platforms and thus get truncated.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 28bdbeb11030..5d61113b3f50 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -408,7 +408,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	struct gfs2_alloc_parms ap = { .aflags = 0, };
 	unsigned long last_index;
-	u64 pos = page->index << PAGE_SHIFT;
+	u64 pos = page_offset(page);
 	unsigned int data_blocks, ind_blocks, rblocks;
 	struct gfs2_holder gh;
 	loff_t size;
-- 
2.20.1

