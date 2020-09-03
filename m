Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C370525C78F
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Sep 2020 18:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599152207;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YAdtu4wMk+fDL1zMc9RkOIclCF2kveRlgVkmIcPTrJ4=;
	b=eBpEb3ldT1QG9ZokIWBloz7cpRCoJCNnRJVVIptXwW7PyXMPC1MDkcsFPG7BT+Ae++w12l
	UJke/qRcBuDVR8UOS5RjsQZQBG9Q1wjl45Fqz/3NEeXtTlu/ha5fSAYFHkxBuJ0IrBawk3
	hx/7L2O6Cd4QWrwHVOUUVqAADWQgu78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-U9bgiqeEMRScoKM8kEMAPA-1; Thu, 03 Sep 2020 12:56:46 -0400
X-MC-Unique: U9bgiqeEMRScoKM8kEMAPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E8B18999A0;
	Thu,  3 Sep 2020 16:56:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B215E5C22D;
	Thu,  3 Sep 2020 16:56:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8338D1826D2B;
	Thu,  3 Sep 2020 16:56:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083GudIO019175 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 12:56:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1655A1001B2B; Thu,  3 Sep 2020 16:56:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.194.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93C1410027A6;
	Thu,  3 Sep 2020 16:56:34 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <darrick.wong@oracle.com>
Date: Thu,  3 Sep 2020 18:56:32 +0200
Message-Id: <20200903165632.1338996-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] iomap: Fix direct I/O write consistency
	check
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

When a direct I/O write falls back to buffered I/O entirely, dio->size
will be 0 in iomap_dio_complete.  Function invalidate_inode_pages2_range
will try to invalidate the rest of the address space.  If there are any
dirty pages in that range, the write will fail and a "Page cache
invalidation failure on direct I/O" error will be logged.

On gfs2, this can be reproduced as follows:

  xfs_io \
    -c "open -ft foo" -c "pwrite 4k 4k" -c "close" \
    -c "open -d foo" -c "pwrite 0 4k"

Fix this by recognizing 0-length writes.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/direct-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index c1aafb2ab990..c9d6b4eecdb7 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -108,7 +108,7 @@ static ssize_t iomap_dio_complete(struct iomap_dio *dio)
 	 * ->end_io() when necessary, otherwise a racing buffer read would cache
 	 * zeros from unwritten extents.
 	 */
-	if (!dio->error &&
+	if (!dio->error && dio->size &&
 	    (dio->flags & IOMAP_DIO_WRITE) && inode->i_mapping->nrpages) {
 		int err;
 		err = invalidate_inode_pages2_range(inode->i_mapping,
-- 
2.26.2

