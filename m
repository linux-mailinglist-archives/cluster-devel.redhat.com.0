Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6523675656
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Jan 2023 15:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674223689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0WmQPaBTKIkZhLmotwBGjh1SdCvjYqkEkNdY2Fchh2k=;
	b=SXMYDcWDvu657uFRddpCgnz2QFK+oMQl8wnApzZtRfF7wFUBBdreXY+8VMF6TTG15kGJ2q
	ttd/6z5Sja1Ued/rhka8sy++gj9wtSZY2iWd5TeTRbtobaBxtQ5pxYJTz2ANuYZQJgpdON
	56TA1A8LhbC8lwTFaMpjrifnsGFfxKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-XaajlWgHP7ebKJWAc4Bvbw-1; Fri, 20 Jan 2023 09:08:05 -0500
X-MC-Unique: XaajlWgHP7ebKJWAc4Bvbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEAA5185A794;
	Fri, 20 Jan 2023 14:08:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CEC8C15BAD;
	Fri, 20 Jan 2023 14:08:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E0BC1946A6E;
	Fri, 20 Jan 2023 14:07:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 692A51946588 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:07:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3FF461415113; Fri, 20 Jan 2023 14:07:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.36.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B63131415108
 for <cluster-devel@redhat.com>; Fri, 20 Jan 2023 14:07:44 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 20 Jan 2023 14:07:42 +0000
Message-Id: <20230120140742.273446-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH] mkfs.gfs2: Add a root_inherit_jdata
 extended option
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add an extended option to allow the GFS2_DIF_INHERIT_JDATA flag to be
set on the root dinode at mkfs time.

This option is only to be used for testing so it is not documented.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 27 +++++++++++++++++++++++++++
 tests/mkfs.at         | 16 ++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 7d5b8c25..c9c7a1fb 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -128,6 +128,7 @@ struct mkfs_opts {
 	const char *uuid;
 	struct mkfs_dev dev;
 	unsigned discard:1;
+	unsigned root_inherit_jd:1;
 
 	unsigned got_bsize:1;
 	unsigned got_qcsize:1;
@@ -312,6 +313,25 @@ static int parse_format(struct mkfs_opts *opts, char *str)
 	return 0;
 }
 
+static int parse_root_inherit_jd(struct mkfs_opts *opts, const char *str)
+{
+	unsigned long n = 0;
+
+	if (str == NULL) { /* -o root_inherit_jdata */
+		opts->root_inherit_jd = 1;
+		return 0;
+	}
+	/* -o root_inherit_jdata=N */
+	if (parse_ulong(opts, "root_inherit_jdata", str, &n) != 0)
+		return -1;
+	if (n > 1) {
+		fprintf(stderr, _("Invalid root_inherit_jdata argument '%s'. Must be 0 or 1\n"), str);
+		return -1;
+	}
+	opts->root_inherit_jd = (unsigned)n;
+	return 0;
+}
+
 static int opt_parse_extended(char *str, struct mkfs_opts *opts)
 {
 	char *opt;
@@ -341,6 +361,9 @@ static int opt_parse_extended(char *str, struct mkfs_opts *opts)
 		} else if (strcmp("format", key) == 0) {
 			if (parse_format(opts, val) != 0)
 				return -1;
+		} else if (strcmp("root_inherit_jdata", key) == 0) {
+			if (parse_root_inherit_jd(opts, val) != 0)
+				return -1;
 		} else if (strcmp("help", key) == 0) {
 			print_ext_opts();
 			return 1;
@@ -1364,6 +1387,10 @@ int main(int argc, char *argv[])
 		printf("%s", _("Done\n"));
 
 	lgfs2_build_root(&sbd);
+	if (opts.root_inherit_jd) {
+		sbd.md.rooti->i_flags |= GFS2_DIF_INHERIT_JDATA;
+		lgfs2_dinode_out(sbd.md.rooti, sbd.md.rooti->i_bh->b_data);
+	}
 	if (opts.debug) {
 		printf("\nRoot directory:\n");
 		dinode_print(sbd.md.rooti->i_bh->b_data);
diff --git a/tests/mkfs.at b/tests/mkfs.at
index 298daf3d..7064a9e2 100644
--- a/tests/mkfs.at
+++ b/tests/mkfs.at
@@ -198,3 +198,19 @@ AT_CHECK([$GFS_MKFS -p lock_nolock -U 1b4e28ba-2fa1-11d2-883f-b9a761bde3fb4 $GFS
 AT_CHECK([$GFS_MKFS -p lock_nolock -U 1b4e28ba-2fa1-11d2-883f-b9a761bde3f $GFS_TGT], 255, [ignore], [ignore])
 GFS_FSCK_CHECK([$GFS_MKFS -p lock_nolock -U 1b4e28ba-2fa1-11d2-883f-b9a761bde3fb $GFS_TGT])
 AT_CLEANUP
+
+AT_SETUP([Root jdata inheritance])
+AT_KEYWORDS(mkfs.gfs2 mkfs)
+GFS_TGT_REGEN
+AT_CHECK([$GFS_MKFS -p lock_nolock -o root_inherit_jdata= $GFS_TGT], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o root_inherit_jdata=42 $GFS_TGT], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o root_inherit_jdata=X $GFS_TGT], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o root_inherit_jdata $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([gfs2_edit -x -p root field di_flags $GFS_TGT | tr -d '\n'], 0, [80000001], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o root_inherit_jdata=1 $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([gfs2_edit -x -p root field di_flags $GFS_TGT | tr -d '\n'], 0, [80000001], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o root_inherit_jdata=0 $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([gfs2_edit -x -p root field di_flags $GFS_TGT | tr -d '\n'], 0, [1], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([gfs2_edit -x -p root field di_flags $GFS_TGT | tr -d '\n'], 0, [1], [ignore])
+AT_CLEANUP
-- 
2.39.0

