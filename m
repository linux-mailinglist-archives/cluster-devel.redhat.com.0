Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BECD46D658
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Dec 2021 16:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638975727;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/CGgT4L8cgR3gFaVIPMbvcc7z8lSnnFfcJOwRmTyB/I=;
	b=QfENnnvdbPSEAPct2l3jGFfQqsr96BCUhECd1lwCN3I6BEKuzGIVm6KO/MroSO7Ht6eRqg
	+YpkBNlXkMfROpMU2CzGbfJBB3ADErLHr1I/e4dU0tmiErMvOOk3V4KRg1B0zZFgjZ/8b2
	LDOq7C8C3yhxWukdaVYf3eo0nrEAdP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-j25-9QN4PA2uEEmeF6OqHw-1; Wed, 08 Dec 2021 10:02:06 -0500
X-MC-Unique: j25-9QN4PA2uEEmeF6OqHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F2EC1B18BC6;
	Wed,  8 Dec 2021 15:02:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ABFA5ED29;
	Wed,  8 Dec 2021 15:02:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAC821809CB9;
	Wed,  8 Dec 2021 15:01:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8ElwEA023936 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 09:47:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E1E2E5DF4F; Wed,  8 Dec 2021 14:47:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F1F05E26C
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 14:47:39 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  8 Dec 2021 14:47:37 +0000
Message-Id: <20211208144737.218724-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2_grow.8: Man page improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

- Restructure sentences to make gfs2_grow the subject instead of "you"
- Use more consistent formatting
- Remove some unnecessary technical details
- Move a sentence relating to the -T option to the options section
- List the lack of shrink support as a note instead of a bug

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/man/gfs2_grow.8 | 53 +++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 33 deletions(-)

diff --git a/gfs2/man/gfs2_grow.8 b/gfs2/man/gfs2_grow.8
index 8bef1a47..f1ba5e4e 100644
--- a/gfs2/man/gfs2_grow.8
+++ b/gfs2/man/gfs2_grow.8
@@ -8,39 +8,25 @@ gfs2_grow - Expand a GFS2 filesystem
 [\fIOPTION\fR]... <\fIDEVICE\fR|\fIMOUNTPOINT\fR>...
 
 .SH DESCRIPTION
-gfs2_grow is used to expand a GFS2 filesystem after the device
-upon which the filesystem resides has also been expanded.  By
-running gfs2_grow on a GFS2 filesystem, you are requesting that
-any spare space between the current end of the filesystem and
-the end of the device is filled with a newly initialized GFS2
-filesystem extension.  When this operation is complete, the resource
-group index for the filesystem is updated so that all nodes in the
+\fBgfs2_grow\fP expands a GFS2 filesystem after the device upon which the
+filesystem resides has also been expanded. \fBgfs2_grow\fP expands the GFS2
+filesystem to utilize any unused space between the current end of the
+filesystem and the end of the block device.  When this operation is complete,
+the resource group index for the filesystem is updated so that all nodes in the
 cluster can use the extra storage space that has been added.
 
 See \fBlvmlockd(8)\fP for the procedure to extend and refresh the logical
-volume prior to running gfs2_grow.
+volume prior to running \fBgfs2_grow\fP.
 
-You may only run gfs2_grow on a mounted filesystem; expansion of 
-unmounted filesystems is not supported.  You only need to
-run gfs2_grow on one node in the cluster.  All the other nodes will
-see the expansion has occurred and automatically start to use the
-newly available space.
+The \fIDEVICE\fR or \fIMOUNTPOINT\fR arguments must be paths to mounted
+filesystems; expansion of unmounted filesystems is not supported.
+\fBgfs2_grow\fP need only be run on one node in the cluster.  The other nodes
+will see the expansion has occurred and automatically start to use the newly
+available space.
 
-You must be superuser to execute \fBgfs2_grow\fP.  The gfs2_grow
-tool tries to prevent you from corrupting your filesystem by checking as
-many of the likely problems as it can.  When expanding a filesystem,
-only the last step of updating the resource index affects the currently
-mounted filesystem and so failure part way through the expansion process
-should leave your filesystem in its original unexpanded state.
-
-You can run gfs2_grow with the \fB-T\fP flag to get a display
-of the current state of a mounted GFS2 filesystem.
-
-The gfs2_grow tool uses the resource group (RG) size that was originally
-calculated when mkfs.gfs2 was done.  This allows tools like fsck.gfs2
-to better ensure the integrity of the file system.  Since the new free
-space often does not lie on even boundaries based on that RG size,
-there may be some unused space on the device after gfs2_grow is run.
+\fBgfs2_grow\fP must be run as the superuser. When the filesystem cannot be
+resized due to detected errors, \fBgfs2_grow\fP will leave the filesystem in a
+consistent state.
 .SH OPTIONS
 .TP
 \fB-D\fP
@@ -53,16 +39,17 @@ Prints out a short usage message and exits.
 Be quiet.  Don't print anything.
 .TP
 \fB-T\fP
-Test. Do all calculations, but do not write any data to the disk and do
-not expand the filesystem. This is used to discover what the tool would
-have done were it run without this flag.
+Test. Do all calculations, but do not write any data to the disk and do not
+expand the filesystem. This is used to discover what the tool would have done
+were it run without this flag. This option can be used to display the current
+state of a mounted GFS2 filesystem.
 .TP
 \fB-V\fP
 Version. Print out version information, then exit.
 
-.SH BUGS
+.SH NOTES
 
-There is no way to shrink a GFS2 filesystem.
+Shrinking GFS2 filesystems is currently unsupported.
 
 .SH SEE ALSO
 .BR mkfs.gfs2(8)
-- 
2.33.1

