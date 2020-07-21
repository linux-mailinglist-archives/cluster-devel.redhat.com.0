Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ABF6F228899
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 20:55:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338--OxxNWU9OmW6sKIa_M0QUQ-1; Tue, 21 Jul 2020 14:55:31 -0400
X-MC-Unique: -OxxNWU9OmW6sKIa_M0QUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A76100AA23;
	Tue, 21 Jul 2020 18:55:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD4F75D9CA;
	Tue, 21 Jul 2020 18:55:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 276DE730C3;
	Tue, 21 Jul 2020 18:55:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LItKPN022261 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 14:55:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 500C52157F23; Tue, 21 Jul 2020 18:55:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BBB82166B28
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 18:55:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7696783B7F9
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 18:55:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-281-wRsGFwTDPQOBpJszd08Osg-1; Tue, 21 Jul 2020 14:55:15 -0400
X-MC-Unique: wRsGFwTDPQOBpJszd08Osg-1
Received: from [2001:4bb8:18c:2acc:5b1c:6483:bd6d:e406] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxx3Y-00062O-Pa; Tue, 21 Jul 2020 18:32:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>, Goldwyn Rodrigues <rgoldwyn@suse.de>
Date: Tue, 21 Jul 2020 20:31:55 +0200
Message-Id: <20200721183157.202276-2-hch@lst.de>
In-Reply-To: <20200721183157.202276-1-hch@lst.de>
References: <20200721183157.202276-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 1/3] xfs: use ENOTBLK for direct I/O to
	buffered I/O fallback
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This is what the classic fs/direct-io.c implementation and thuse other
file systems use.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/xfs_file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 00db81eac80d6c..a6ef90457abf97 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -505,7 +505,7 @@ xfs_file_dio_aio_write(
 		 */
 		if (xfs_is_cow_inode(ip)) {
 			trace_xfs_reflink_bounce_dio_write(ip, iocb->ki_pos, count);
-			return -EREMCHG;
+			return -ENOTBLK;
 		}
 		iolock = XFS_IOLOCK_EXCL;
 	} else {
@@ -714,7 +714,7 @@ xfs_file_write_iter(
 		 * allow an operation to fall back to buffered mode.
 		 */
 		ret = xfs_file_dio_aio_write(iocb, from);
-		if (ret != -EREMCHG)
+		if (ret != -ENOTBLK)
 			return ret;
 	}
 
-- 
2.27.0

