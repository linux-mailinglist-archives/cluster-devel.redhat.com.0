Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6192A69D4
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Nov 2020 17:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604507544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uzSskhR6DdzWaw2kAHp1owwqyMkhUlfdlzOpeEI/Ncg=;
	b=Km6A0lPcMQvH6Ep1i4VDnyJcl5UoWmjVIoJORVNpoxL79pen+AG6l+sABYGSNl9uvSfCy6
	38/xNeu+gr8NgECh8pvJ6Wt074Q2HAThLBmnEYtbJ4o7D07k8FaNpAK2QwbfT4QRaFZ4my
	QRmApbPJ8fNLrtVSTMNrJGjo7MuWVYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-M0hHi1TsOE-JYaHdboKnlA-1; Wed, 04 Nov 2020 11:32:22 -0500
X-MC-Unique: M0hHi1TsOE-JYaHdboKnlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2699664151;
	Wed,  4 Nov 2020 16:32:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0D0710013C1;
	Wed,  4 Nov 2020 16:32:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C253A8C7B0;
	Wed,  4 Nov 2020 16:32:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A4GTLWq029577 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 11:29:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D92641992D; Wed,  4 Nov 2020 16:29:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2A6A19C4F
	for <cluster-devel@redhat.com>; Wed,  4 Nov 2020 16:29:17 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  4 Nov 2020 16:29:15 +0000
Message-Id: <20201104162915.241765-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] Documentation: Update
	filesystems/gfs2.rst
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Remove an obsolete URL and generally bring the doc up-to-date

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 Documentation/filesystems/gfs2.rst | 37 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/Documentation/filesystems/gfs2.rst b/Documentation/filesystems/gfs2.rst
index 8d1ab589ce18..1bc48a13430c 100644
--- a/Documentation/filesystems/gfs2.rst
+++ b/Documentation/filesystems/gfs2.rst
@@ -1,53 +1,52 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-==================
-Global File System
-==================
+====================
+Global File System 2
+====================
 
-https://fedorahosted.org/cluster/wiki/HomePage
-
-GFS is a cluster file system. It allows a cluster of computers to
+GFS2 is a cluster file system. It allows a cluster of computers to
 simultaneously use a block device that is shared between them (with FC,
-iSCSI, NBD, etc).  GFS reads and writes to the block device like a local
+iSCSI, NBD, etc).  GFS2 reads and writes to the block device like a local
 file system, but also uses a lock module to allow the computers coordinate
 their I/O so file system consistency is maintained.  One of the nifty
-features of GFS is perfect consistency -- changes made to the file system
+features of GFS2 is perfect consistency -- changes made to the file system
 on one machine show up immediately on all other machines in the cluster.
 
-GFS uses interchangeable inter-node locking mechanisms, the currently
+GFS2 uses interchangeable inter-node locking mechanisms, the currently
 supported mechanisms are:
 
   lock_nolock
-    - allows gfs to be used as a local file system
+    - allows GFS2 to be used as a local file system
 
   lock_dlm
-    - uses a distributed lock manager (dlm) for inter-node locking.
+    - uses the distributed lock manager (dlm) for inter-node locking.
       The dlm is found at linux/fs/dlm/
 
-Lock_dlm depends on user space cluster management systems found
+lock_dlm depends on user space cluster management systems found
 at the URL above.
 
-To use gfs as a local file system, no external clustering systems are
+To use GFS2 as a local file system, no external clustering systems are
 needed, simply::
 
   $ mkfs -t gfs2 -p lock_nolock -j 1 /dev/block_device
   $ mount -t gfs2 /dev/block_device /dir
 
-If you are using Fedora, you need to install the gfs2-utils package
-and, for lock_dlm, you will also need to install the cman package
-and write a cluster.conf as per the documentation. For F17 and above
-cman has been replaced by the dlm package.
+The gfs2-utils package is required on all cluster nodes and, for lock_dlm, you
+will also need the dlm and corosync user space utilities configured as per the
+documentation.
+
+gfs2-utils can be found at https://pagure.io/gfs2-utils
 
 GFS2 is not on-disk compatible with previous versions of GFS, but it
 is pretty close.
 
-The following man pages can be found at the URL above:
+The following man pages are available from gfs2-utils:
 
   ============		=============================================
   fsck.gfs2		to repair a filesystem
   gfs2_grow		to expand a filesystem online
   gfs2_jadd		to add journals to a filesystem online
   tunegfs2		to manipulate, examine and tune a filesystem
-  gfs2_convert		to convert a gfs filesystem to gfs2 in-place
+  gfs2_convert		to convert a gfs filesystem to GFS2 in-place
   mkfs.gfs2		to make a filesystem
   ============		=============================================
-- 
2.28.0

