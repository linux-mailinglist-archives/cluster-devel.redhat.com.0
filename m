Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EB2DB219260
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 23:20:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-ROxXnySxO_-1B0xwB_YADQ-1; Wed, 08 Jul 2020 17:20:04 -0400
X-MC-Unique: ROxXnySxO_-1B0xwB_YADQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3F0CE918;
	Wed,  8 Jul 2020 21:20:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4F2E7F8A9;
	Wed,  8 Jul 2020 21:20:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FC0F93F80;
	Wed,  8 Jul 2020 21:20:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068LJwJp009715 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 17:19:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 148373324C; Wed,  8 Jul 2020 21:19:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EC403325A
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:19:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 436AE1859171
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:19:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-353-RbQznqTNNUeOJAsF73HGMg-1;
	Wed, 08 Jul 2020 17:19:54 -0400
X-MC-Unique: RbQznqTNNUeOJAsF73HGMg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A659EAC91;
	Wed,  8 Jul 2020 21:19:49 +0000 (UTC)
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: linux-btrfs@vger.kernel.org
Date: Wed,  8 Jul 2020 16:19:22 -0500
Message-Id: <20200708211926.7706-3-rgoldwyn@suse.de>
In-Reply-To: <20200708211926.7706-1-rgoldwyn@suse.de>
References: <20200708211926.7706-1-rgoldwyn@suse.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 068LJwJp009715
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, darrick.wong@oracle.com,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, hch@lst.de,
	Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: [Cluster-devel] [PATCH 2/6] iomap: IOMAP_DIO_RWF_NO_STALE_PAGECACHE
	return if page invalidation fails
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Goldwyn Rodrigues <rgoldwyn@suse.com>

For direct I/O, add the flag IOMAP_DIO_RWF_NO_STALE_PAGECACHE to indicate
that if the page invalidation fails, return back control to the
filesystem so it may fallback to buffered mode.

Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
---
 fs/iomap/direct-io.c  |  8 +++++++-
 include/linux/iomap.h | 14 ++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 2753b7022403..66becf935865 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -484,8 +484,14 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 	 */
 	ret = invalidate_inode_pages2_range(mapping,
 			pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
-	if (ret)
+	if (ret) {
+		if (dio_flags & IOMAP_DIO_RWF_NO_STALE_PAGECACHE) {
+			if (ret == -EBUSY)
+				ret = 0;
+			goto out_free_dio;
+		}
 		dio_warn_stale_pagecache(iocb->ki_filp);
+	}
 	ret = 0;
 
 	if (iov_iter_rw(iter) == WRITE && !wait_for_completion &&
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 80cd5f524124..a68705369a2c 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -262,7 +262,21 @@ struct iomap_dio_ops {
 /*
  * Wait for completion of DIO
  */
+
 #define IOMAP_DIO_RWF_SYNCIO			(1 << 0)
+/*
+ * Direct IO will attempt to keep the page cache coherent by
+ * invalidating the inode's page cache over the range of the DIO.
+ * That can fail if something else is actively using the page cache.
+ * If this happens and the DIO continues, the data in the page
+ * cache will become stale.
+ *
+ * Set this flag if you want the DIO to abort without issuing any IO
+ * or error if it fails to invalidate the page cache successfully.
+ * This allows the IO submitter to fallback to buffered IO to resubmit
+ * IO
+ */
+#define IOMAP_DIO_RWF_NO_STALE_PAGECACHE	(1 << 1)
 
 ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
-- 
2.26.2


