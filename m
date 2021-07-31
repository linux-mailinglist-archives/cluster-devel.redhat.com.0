Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA873DC831
	for <lists+cluster-devel@lfdr.de>; Sat, 31 Jul 2021 22:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627763996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CRFwqEDAu52J44IfioQefnkvmvbWLlTol83QZ0TqyMw=;
	b=hNtyhCAJw56EST+hl43cNBCSWTftD/v44dZ2iSCYvjnn2d3zk9D5tCXlpaBTtvvX6cLjPt
	39q+W10foFhATry4CVZySBG2SkYYLp+ujJpcUZCvRiSZXGmXR/QgawXNPCm4YAm6aST1ji
	Rq5w0TJcC8RHNfjn7WdGN/rb9BYgPNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-62sO3tDROI-c0COr6c7Z8g-1; Sat, 31 Jul 2021 16:39:55 -0400
X-MC-Unique: 62sO3tDROI-c0COr6c7Z8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F586180FCBB;
	Sat, 31 Jul 2021 20:39:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52BDC781E8;
	Sat, 31 Jul 2021 20:39:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9405F180BAB1;
	Sat, 31 Jul 2021 20:39:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16VKdiUO031899 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 31 Jul 2021 16:39:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CA11781EB; Sat, 31 Jul 2021 20:39:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B363608BA;
	Sat, 31 Jul 2021 20:39:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 31 Jul 2021 22:39:37 +0200
Message-Id: <20210731203937.798935-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: iomap inline data handling cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When reporting an IOMAP_INLINE extent, always report the maximum
possible size for the inline data.  Previously, we've been reporting the
file size for reads and the maximum size for writes, but this was
unnecessary as the iomap code will happily handle the end-of-file case
for us.

Also, slightly tidy up the error handling.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index ed8b67b21718..84ad0fe787ea 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -866,12 +866,11 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 	mp->mp_bh[0] = dibh;
 
 	if (gfs2_is_stuffed(ip)) {
-		if (flags & IOMAP_WRITE) {
-			loff_t max_size = gfs2_max_stuffed_size(ip);
+		loff_t max_size = gfs2_max_stuffed_size(ip);
 
+		if (flags & IOMAP_WRITE) {
 			if (pos + length > max_size)
 				goto unstuff;
-			iomap->length = max_size;
 		} else {
 			if (pos >= size) {
 				if (flags & IOMAP_REPORT) {
@@ -883,10 +882,10 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 					goto hole_found;
 				}
 			}
-			iomap->length = size;
 		}
 		iomap->addr = (ip->i_no_addr << inode->i_blkbits) +
 			      sizeof(struct gfs2_dinode);
+		iomap->length = max_size;
 		iomap->type = IOMAP_INLINE;
 		iomap->inline_data = dibh->b_data + sizeof(struct gfs2_dinode);
 		goto out;
@@ -935,9 +934,11 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 
 do_alloc:
 	if (flags & IOMAP_REPORT) {
-		if (pos >= size)
+		if (pos >= size) {
 			ret = -ENOENT;
-		else if (height == ip->i_height)
+			goto unlock;
+		}
+		if (height == ip->i_height)
 			ret = gfs2_hole_size(inode, lblock, len, mp, iomap);
 		else
 			iomap->length = size - pos;
-- 
2.26.3

