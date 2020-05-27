Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0A61E4053
	for <lists+cluster-devel@lfdr.de>; Wed, 27 May 2020 13:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590579766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lUF5gYKHCbSAq8u+hxXkfJ6TN4FdnSGAbPW2Du2Cv4c=;
	b=h1R0IzqfoMl1O13q8XYmi6XgjyVDbQU3eeoC4wLzOWOrigqr8wH4iKoRsM6aSpJ5F0SGpu
	qqUsU4mtr23vRYBqYl082g7hJ9XOmNaCiBeWOsggSTC/4wAgOZOLNBQlwtZ2JdCbbjeHfn
	TKJeHQxwrRtapfVHszWp79LzrgFUXVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-CM_vR40IPLSvUxivi-fdgA-1; Wed, 27 May 2020 07:42:44 -0400
X-MC-Unique: CM_vR40IPLSvUxivi-fdgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DB6418FE864;
	Wed, 27 May 2020 11:42:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C92875D9E8;
	Wed, 27 May 2020 11:42:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37B623E1E0;
	Wed, 27 May 2020 11:42:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RBgZLW003418 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 07:42:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A1615D9EF; Wed, 27 May 2020 11:42:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 807775D9E8
	for <cluster-devel@redhat.com>; Wed, 27 May 2020 11:42:31 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 May 2020 12:42:29 +0100
Message-Id: <20200527114229.1302836-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] mkfs.gfs2: Don't use i/o limits hints <4K
	for block size
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

Some devices report an optimal_io_size less than 4K. Currently mkfs.gfs2
uses the non-zero value to choose the block size, which is almost
certainly a bad choice when it's less than 4K. Update choose_blocksize()
to avoid using device topology hints for the block size choice when
they're less than the default block size (4K). Test case included.

Resolves: rhbz#1839219
Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 2 +-
 tests/mkfs.at         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 846b341f..412d4701 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -505,7 +505,7 @@ static unsigned choose_blocksize(struct mkfs_opts *opts)
 	}
 	if (!opts->got_bsize && got_topol) {
 		if (dev->optimal_io_size <= getpagesize() &&
-		    dev->optimal_io_size >= dev->minimum_io_size)
+		    dev->optimal_io_size >= GFS2_DEFAULT_BSIZE)
 			bsize = dev->optimal_io_size;
 		else if (dev->physical_sector_size <= getpagesize() &&
 		         dev->physical_sector_size >= GFS2_DEFAULT_BSIZE)
diff --git a/tests/mkfs.at b/tests/mkfs.at
index 57785a0d..4c8b2249 100644
--- a/tests/mkfs.at
+++ b/tests/mkfs.at
@@ -112,6 +112,8 @@ AT_CLEANUP
 AT_SETUP([Device i/o limits handling])
 AT_KEYWORDS(mkfs.gfs2 mkfs)
 AT_CHECK([$GFS_MKFS -p lock_nolock -o test_topology=0:0:0:0:0 $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o test_topology=0:512:512:512:512 $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([gfs2_edit -p sb field sb_bsize $GFS_TGT | tr -d '\n' ], 0, [4096], [ignore])
 AT_CHECK([$GFS_MKFS -p lock_nolock -o test_topology=7168:512:0:33553920:512 $GFS_TGT], 0, [ignore], [ignore])
 AT_CHECK([$GFS_MKFS -p lock_nolock -o test_topology=7168:512:8192:33553920:512 $GFS_TGT], 0, [ignore], [Warning: device is not properly aligned. This may harm performance.
 ])
-- 
2.26.2

