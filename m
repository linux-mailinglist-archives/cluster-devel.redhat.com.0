Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABFE44B094
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Nov 2021 16:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636472638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bGgkbdGL5moYzJcLd+Plh3kWtGdV+Cd6MGQ7d/s7Oiw=;
	b=aUs7c7fu7ZO9R0fBd2YubopO4PABnyeVF0SOip7Y7qwAooSc2QXEFCsqJXm15Cb19amgAF
	KGnsxPD5Bnhah7eL/4x9vPJZgrCt+Oo6lK17DHdaxpmIpgmRGtPccVg/rPo9ZHuYxU5Z7w
	hgQqyr8hIQpmemIfrZnljo6yC5EMFEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-Dkf5O2zFMxec6uC6Rcswxg-1; Tue, 09 Nov 2021 10:43:55 -0500
X-MC-Unique: Dkf5O2zFMxec6uC6Rcswxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 331298799ED;
	Tue,  9 Nov 2021 15:43:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9638D19739;
	Tue,  9 Nov 2021 15:43:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF551181A1CF;
	Tue,  9 Nov 2021 15:43:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A9FfaOT017693 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 10:41:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A46CB19739; Tue,  9 Nov 2021 15:41:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91E3196F2
	for <cluster-devel@redhat.com>; Tue,  9 Nov 2021 15:41:27 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Nov 2021 15:41:24 +0000
Message-Id: <20211109154124.1213577-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2-utils] tests: Increase the size of the
	sparse file used by tests
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Bump the size of the 'testvol' sparse file that the tests use to 20G.
The actual disk space used is more like 200M which should be fine for
build environments. The increased size allows more resource groups to be
created in tests that use a larger resource group size.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 tests/atlocal.in | 2 +-
 tests/edit.at    | 4 ++--
 tests/tune.at    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/atlocal.in b/tests/atlocal.in
index b021b132..b0f22f10 100644
--- a/tests/atlocal.in
+++ b/tests/atlocal.in
@@ -1,5 +1,5 @@
 GFS_TGT="$abs_builddir/testvol"
-GFS_TGT_SZ=10
+GFS_TGT_SZ=20
 GFS_MKFS="mkfs.gfs2 -O -D"
 
 gfs_max_blocks()
diff --git a/tests/edit.at b/tests/edit.at
index d70d012e..d6795218 100644
--- a/tests/edit.at
+++ b/tests/edit.at
@@ -6,8 +6,8 @@ AT_KEYWORDS(gfs2_edit edit)
 GFS_TGT_REGEN
 AT_CHECK([$GFS_MKFS -p lock_nolock $GFS_TGT $(($(gfs_max_blocks 4096)/2))], 0, [ignore], [ignore])
 AT_CHECK([gfs2_edit savemeta $GFS_TGT test.meta > savemeta.log], 0, [ignore], [ignore])
-AT_CHECK([head -2 savemeta.log], 0, [There are 1310716 blocks of 4096 bytes in the filesystem.
-Filesystem size: 5.00GB
+AT_CHECK([head -2 savemeta.log], 0, [There are 2621439 blocks of 4096 bytes in the filesystem.
+Filesystem size: 10.00GB
 ], [ignore])
 GFS_TGT_REGEN
 AT_CHECK([gfs2_edit restoremeta test.meta $GFS_TGT], 0, [ignore], [ignore])
diff --git a/tests/tune.at b/tests/tune.at
index 43ce34ce..4f0ecd79 100644
--- a/tests/tune.at
+++ b/tests/tune.at
@@ -32,8 +32,8 @@ File system magic number: 0x1161970
 File system format version: 1802
 Block size: 4096
 Block shift: 12
-Root inode: 16709
-Master inode: 16437
+Root inode: 33127
+Master inode: 32854
 Lock protocol: lock_nolock
 Lock table: cluster:fsname
 " > expout], 0, [ignore], [ignore])
-- 
2.31.1

