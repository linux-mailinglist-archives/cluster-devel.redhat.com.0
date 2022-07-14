Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D6574D64
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Jul 2022 14:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657801462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YfwjQWcz9tnBhvAWn0DH+LdF918Yd95swwTILOkrvNo=;
	b=LgLthQpboCef3t15XqY/un4efN6iTssiQwPhYkQnKPkNQD5l9zFLVAmMCEwUZSih3NPO9C
	SGbK8cmbVxeZ9kKXUElNN44FCSLz/foFMpDj9oz/ekPgvBIFh788z5k2RvHyF5FDFVC1hh
	Xl/Cpvxc0tBZvEQX2IzP5ud0GDQr1Pg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-PN4U29b7N1y0mTEGvZASOw-1; Thu, 14 Jul 2022 08:24:11 -0400
X-MC-Unique: PN4U29b7N1y0mTEGvZASOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5039801231;
	Thu, 14 Jul 2022 12:24:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4316E1410F3C;
	Thu, 14 Jul 2022 12:24:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 492A91947073;
	Thu, 14 Jul 2022 12:24:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AA69B194706C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 14 Jul 2022 12:24:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 89DE7492CA2; Thu, 14 Jul 2022 12:24:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.36.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A7A3492C3B
 for <cluster-devel@redhat.com>; Thu, 14 Jul 2022 12:24:05 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 14 Jul 2022 13:24:03 +0100
Message-Id: <20220714122403.398987-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH] mkfs.gfs2: Add -U UUID option
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Allow the user to specify the filesystem UUID, similar to mkfs.ext4's -U
option.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/man/mkfs.gfs2.8  |  6 ++++++
 gfs2/mkfs/main_mkfs.c | 19 +++++++++++++++++--
 tests/mkfs.at         | 10 ++++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/gfs2/man/mkfs.gfs2.8 b/gfs2/man/mkfs.gfs2.8
index 58742dea..0ddc074e 100644
--- a/gfs2/man/mkfs.gfs2.8
+++ b/gfs2/man/mkfs.gfs2.8
@@ -123,6 +123,12 @@ unique file system name used to distinguish this gfs2 file system.  Valid
 \fIclustername\fRs and \fIlockspace\fRs may only contain alphanumeric
 characters, hyphens (-) and underscores (_).
 .TP
+\fB-U\fP \fIUUID\fR
+Specify the filesystem UUID. The argument must be string of hexadecimal digits
+separated by hyphens, of the form "1b4e28ba-2fa1-11d2-883f-b9a761bde3fb". If
+this option is omitted, the filesystem's UUID is randomly generated. Note that
+no attempt is made to prevent UUID clashes between filesystems on the system.
+.TP
 \fB-V\fP
 Print program version information, then exit.
 .TP
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 37ed5d08..f552f934 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -52,6 +52,7 @@ static void print_usage(const char *prog_name)
 	    "-q", NULL,          _("Don't print anything"),
 	    "-r", _("<size>"),   _("Size of resource groups, in megabytes"),
 	    "-t", _("<name>"),   _("Name of the lock table"),
+	    "-U", _("<UUID>"),   _("The UUID of the file system"),
 	    "-V", NULL,          _("Display program version information, then exit"),
 	    NULL, NULL, NULL /* Must be kept at the end */
 	};
@@ -121,6 +122,7 @@ struct mkfs_opts {
 	int journals;
 	const char *lockproto;
 	const char *locktable;
+	const char *uuid;
 	struct mkfs_dev dev;
 	unsigned discard:1;
 
@@ -137,6 +139,7 @@ struct mkfs_opts {
 	unsigned got_device:1;
 	unsigned got_topol:1;
 	unsigned got_format:1;
+	unsigned got_uuid:1;
 
 	unsigned override:1;
 	unsigned quiet:1;
@@ -352,7 +355,7 @@ static int opts_get(int argc, char *argv[], struct mkfs_opts *opts)
 	int ret;
 	int c;
 	while (1) {
-		c = getopt(argc, argv, "-b:c:DhJ:j:KOo:p:qr:t:V");
+		c = getopt(argc, argv, "-b:c:DhJ:j:KOo:p:qr:t:U:V");
 		if (c == -1)
 			break;
 
@@ -405,6 +408,10 @@ static int opts_get(int argc, char *argv[], struct mkfs_opts *opts)
 			if (ret != 0)
 				return ret;
 			break;
+		case 'U':
+			opts->uuid = optarg;
+			opts->got_uuid = 1;
+			break;
 		case 'V':
 			printf("mkfs.gfs2 %s (built %s %s)\n", VERSION,
 			       __DATE__, __TIME__);
@@ -1062,7 +1069,15 @@ static int sbd_init(struct lgfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsiz
 	sdp->sd_multihost_format = GFS2_FORMAT_MULTI;
 	sdp->sd_bsize = bsize;
 	sdp->sd_bsize_shift = ffs(bsize) - 1;
-	uuid_generate(sdp->sd_uuid);
+
+	if (opts->got_uuid) {
+		int err = uuid_parse(opts->uuid, sdp->sd_uuid);
+		if (err != 0) {
+			fprintf(stderr, _("Failed to parse UUID option."));
+			return -1;
+		}
+	} else
+		uuid_generate(sdp->sd_uuid);
 
 	if (lgfs2_compute_constants(sdp)) {
 		perror(_("Failed to compute file system constants"));
diff --git a/tests/mkfs.at b/tests/mkfs.at
index 09a3ed29..298daf3d 100644
--- a/tests/mkfs.at
+++ b/tests/mkfs.at
@@ -188,3 +188,13 @@ GFS_TGT_SIZE(64M)
 AT_CHECK([$GFS_MKFS -p lock_nolock -j2 $GFS_TGT], 0, [ignore], [ignore])
 AT_CHECK([fsck.gfs2 -n $GFS_TGT], 0, [ignore], [ignore])
 AT_CLEANUP
+
+AT_SETUP([UUID option])
+AT_KEYWORDS(mkfs.gfs2 mkfs)
+GFS_TGT_REGEN
+AT_CHECK([$GFS_MKFS -p lock_nolock $GFS_TGT -U], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -U 42 $GFS_TGT], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -U 1b4e28ba-2fa1-11d2-883f-b9a761bde3fb4 $GFS_TGT], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -U 1b4e28ba-2fa1-11d2-883f-b9a761bde3f $GFS_TGT], 255, [ignore], [ignore])
+GFS_FSCK_CHECK([$GFS_MKFS -p lock_nolock -U 1b4e28ba-2fa1-11d2-883f-b9a761bde3fb $GFS_TGT])
+AT_CLEANUP
-- 
2.36.1

