Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 70A3A1E3BF3
	for <lists+cluster-devel@lfdr.de>; Wed, 27 May 2020 10:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590568214;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jxvnzf7Pm6v54IRwxa2VOfNeWyQtRR5NHXvZvEDRUDU=;
	b=TL24Oi+faki04eRUPjKSsk5pl1pWlqUogODgXYXF8L4wnx6TpR/LyOQWJcvrike0TJM77v
	aBihfOrr8TfljCVSCNOd2Z8n8FORfVc30w1/CmS4UckeKGe6EA3XzF+C+nwUIkGrC2OjjC
	9HkOTCxQ5MI7eN086tiNZirLNJsPihA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-7dHXyhs1M5eBEcR-6lunBg-1; Wed, 27 May 2020 04:30:12 -0400
X-MC-Unique: 7dHXyhs1M5eBEcR-6lunBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3A7180180A;
	Wed, 27 May 2020 08:30:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EEF49A274;
	Wed, 27 May 2020 08:30:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B66466B499;
	Wed, 27 May 2020 08:30:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R8U1Zb023307 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 04:30:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 741A52AF4D; Wed, 27 May 2020 08:30:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E68EF610AF
	for <cluster-devel@redhat.com>; Wed, 27 May 2020 08:29:57 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 May 2020 09:29:54 +0100
Message-Id: <20200527082954.1235228-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] mkfs.gfs2: Don't use optimal_io_size when
	equal to minimum
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Some devices report an optimal_io_size of 512 instead of 0 when it's not
larger than the minimum_io_size. Currently mkfs.gfs2 uses the non-zero
value to choose the block size, which is almost certainly not what we
want when it's 512. Update the suitability check for optimal_io_size to
avoid using it when it's the same as minimum_io_size.  The effect is
that we fall back to using the default block size, 4096.

Resolves: rhbz#1839219
Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 846b341f..8b97f3d2 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -505,7 +505,7 @@ static unsigned choose_blocksize(struct mkfs_opts *opts)
 	}
 	if (!opts->got_bsize && got_topol) {
 		if (dev->optimal_io_size <= getpagesize() &&
-		    dev->optimal_io_size >= dev->minimum_io_size)
+		    dev->optimal_io_size > dev->minimum_io_size)
 			bsize = dev->optimal_io_size;
 		else if (dev->physical_sector_size <= getpagesize() &&
 		         dev->physical_sector_size >= GFS2_DEFAULT_BSIZE)
-- 
2.26.2

