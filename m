Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4A044526E
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Nov 2021 12:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636026331;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D6ZpvostCAbNH5qwfRHYGK1x9hfpTV75lp4JCSG4yWo=;
	b=OeZ+mvHFOHXoC9M/BrBvgDdxW5488KoHKW1vecR2YqmGhwPvEmjF3vuNxwsEgzpRYYtlqN
	O1Wf7S7pOanK7a4EDfsMEKwIxNsrFE+raOM8rE3e5lYr7MHb2GvNMHtueXtYUOV0xchIrE
	z7jRvKjZIsYHr8riG89/bSUGCQkeVhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-_tw4OTuoP7SoxFhabNvgaQ-1; Thu, 04 Nov 2021 07:45:28 -0400
X-MC-Unique: _tw4OTuoP7SoxFhabNvgaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D34768066F9;
	Thu,  4 Nov 2021 11:45:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0297E57CD2;
	Thu,  4 Nov 2021 11:45:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5629A1806D03;
	Thu,  4 Nov 2021 11:45:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A4Bg4ks030408 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 07:42:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F6D460C17; Thu,  4 Nov 2021 11:42:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86FE560C13
	for <cluster-devel@redhat.com>; Thu,  4 Nov 2021 11:41:44 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  4 Nov 2021 11:41:42 +0000
Message-Id: <20211104114142.858624-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] tunegfs2: Use O_EXCL when opening the
	device rw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use O_RDONLY when listing and O_RDWR|O_EXCL when modifying.

Also don't print the tunegfs2 version with -l output, improve open()
error reporting and add some more basic tunegfs2 tests.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/tune/main.c | 12 ++++++------
 tests/tune.at    | 30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/gfs2/tune/main.c b/gfs2/tune/main.c
index fe137803..f72bdc3c 100644
--- a/gfs2/tune/main.c
+++ b/gfs2/tune/main.c
@@ -65,6 +65,7 @@ static void version(void)
 int main(int argc, char **argv)
 {
 	int c, status;
+	int flags = O_RDWR | O_EXCL;
 
 	memset(tfs, 0, sizeof(struct tunegfs2));
 	while((c = getopt(argc, argv, "hL:U:lo:Vr:")) != -1) {
@@ -82,6 +83,7 @@ int main(int argc, char **argv)
 			break;
 		case 'l':
 			tfs->opt_list = 1;
+			flags = O_RDONLY;
 			break;
 		case 'o':
 			parse_mount_options(optarg);
@@ -113,11 +115,11 @@ int main(int argc, char **argv)
 	}
 
 	tfs->devicename = argv[optind];
-	tfs->fd = open(tfs->devicename, O_RDWR); 
+	tfs->fd = open(tfs->devicename, flags);
 
 	if (tfs->fd < 0) {
-		fprintf(stderr, _("Unable to open device %s\n"),
-				tfs->devicename);
+		fprintf(stderr, _("Unable to open device %s: %s\n"),
+				tfs->devicename, strerror(errno));
 		return EX_IOERR;
 	}
 
@@ -160,10 +162,8 @@ int main(int argc, char **argv)
 			goto out;
 	}
 
-	if (tfs->opt_list) {
-		version();
+	if (tfs->opt_list)
 		print_super(tfs);
-	}
 
 	close(tfs->fd);
 out:
diff --git a/tests/tune.at b/tests/tune.at
index b0158034..43ce34ce 100644
--- a/tests/tune.at
+++ b/tests/tune.at
@@ -15,3 +15,33 @@ AT_CHECK([$GFS_MKFS -p lock_nolock -o format=1801 $GFS_TGT], 0, [ignore], [ignor
 AT_CHECK([tunegfs2 -r 1802 $GFS_TGT], 0, [ignore], [ignore])
 AT_CHECK([fsck.gfs2 -n $GFS_TGT], 0, [ignore], [ignore])
 AT_CLEANUP
+
+AT_SETUP([Handle bad fs])
+AT_KEYWORDS(tunegfs2 tune)
+AT_CHECK([tunegfs2 -l /dev/null], 74, [ignore], [Device does not contain a GFS or GFS2 file system
+])
+AT_CHECK([tunegfs2 -l /dev/zero], 74, [ignore], [Device does not contain a GFS or GFS2 file system
+])
+AT_CLEANUP
+
+AT_SETUP([Expected output])
+AT_KEYWORDS(tunegfs2 tune)
+AT_CHECK([echo -n "File system volume name: cluster:fsname
+File system UUID: e90815fc-087b-460c-b8a5-8edc8a2ed691
+File system magic number: 0x1161970
+File system format version: 1802
+Block size: 4096
+Block shift: 12
+Root inode: 16709
+Master inode: 16437
+Lock protocol: lock_nolock
+Lock table: cluster:fsname
+" > expout], 0, [ignore], [ignore])
+# Create the fs without alignment so that we can predict the root inode address
+AT_CHECK([$GFS_MKFS -p lock_nolock -t cluster:fsname -o align=0 $GFS_TGT], 0, [ignore], [ignore])
+# Set a known UUID to ease comparison
+AT_CHECK([tunegfs2 -U e90815fc-087b-460c-b8a5-8edc8a2ed691 $GFS_TGT], 0, [ignore], [ignore])
+# Check tunegfs2 set the UUID correctly with gfs2_edit
+AT_CHECK([gfs2_edit -p sb field sb_uuid $GFS_TGT | tr -d '\n'], 0, [e90815fc-087b-460c-b8a5-8edc8a2ed691], [ignore])
+AT_CHECK([tunegfs2 -l $GFS_TGT], 0, [expout], [stderr])
+AT_CLEANUP
-- 
2.31.1

