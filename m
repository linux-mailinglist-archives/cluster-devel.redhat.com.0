Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB1724024
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 12:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686048746;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A1B9eIdk0eVXNW4f6QstAYSSfTKWiYbDuRukkM6In2Y=;
	b=Lf11BDNmJSrPcODtCF1jdMcz3Jf39FvxMv9gzGWk+zwUfdAxUHwIuYYeZP9X5Tjvfl3nY6
	bOGezlYcHHkn+3TAk+KsdaGJBh6jTW0SjHI0uLeEmFC01FMGhJEu6fX6X2i9ZmRmwlBQqd
	MKTXGV/Zaiby4Fj/hrFfVV1NYiU4bNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-mEnjWM-POkaqxCNoAsIQeg-1; Tue, 06 Jun 2023 06:52:22 -0400
X-MC-Unique: mEnjWM-POkaqxCNoAsIQeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9CBF185A795;
	Tue,  6 Jun 2023 10:52:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E75872166B26;
	Tue,  6 Jun 2023 10:52:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 635DE19465BD;
	Tue,  6 Jun 2023 10:52:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F44D19465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 10:52:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3D57C492B00; Tue,  6 Jun 2023 10:52:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.39.195.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C620D40218C
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 10:52:17 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  6 Jun 2023 11:52:14 +0100
Message-Id: <20230606105214.50569-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [RFC PATCH] fsck.gfs2: Fail on LVM PV detection
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

If fsck.gfs2 is run against an LVM PV it will try its best to repair it
as a gfs2 fs. This is unlikely the best course of action as it's more
likely that the user executed fsck.gfs2 against the PV after stopping
the cluster (including the LVM activation resources).

In this situation other fscks try to look up backup superblocks before
failing but gfs2 does not keep backup superblocks so the safest thing to
do is fail with an operational error code when an LVM PV is detected.

A test is included that restores a PV signature to the test volume
before attempting to run fsck.gfs2 on it.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/Makefile.am  |  5 ++++-
 gfs2/fsck/initialize.c | 30 ++++++++++++++++++++++++++++++
 tests/Makefile.am      |  3 ++-
 tests/atlocal.in       |  1 +
 tests/fsck.at          |  7 +++++++
 tests/pv_sig.xxd       | 12 ++++++++++++
 6 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 tests/pv_sig.xxd

diff --git a/gfs2/fsck/Makefile.am b/gfs2/fsck/Makefile.am
index 405aabe1..543057b1 100644
--- a/gfs2/fsck/Makefile.am
+++ b/gfs2/fsck/Makefile.am
@@ -32,10 +32,13 @@ fsck_gfs2_SOURCES = \
 	util.c
 
 fsck_gfs2_CPPFLAGS = $(AM_CPPFLAGS)
-fsck_gfs2_CFLAGS = $(AM_CFLAGS)
+fsck_gfs2_CFLAGS = \
+	$(AM_CFLAGS) \
+	$(blkid_CFLAGS)
 fsck_gfs2_LDADD = \
 	$(top_builddir)/gfs2/libgfs2/libgfs2.la \
 	$(LTLIBINTL) \
+	$(blkid_LIBS) \
 	$(uuid_LIBS)
 
 if HAVE_CHECK
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 62fb6107..8679dee9 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -12,6 +12,7 @@
 #include <libintl.h>
 #include <errno.h>
 #include <time.h>
+#include <blkid.h>
 
 #define _(String) gettext(String)
 
@@ -1555,6 +1556,33 @@ static int init_rindex(struct fsck_cx *cx)
 	return 0;
 }
 
+static int is_lvm_member(struct fsck_cx *cx)
+{
+	char lvm_member[] = "LVM2_member";
+	char *filter[] = {lvm_member, NULL};
+	int fd = cx->sdp->device_fd;
+	int ret;
+
+	blkid_probe pr = blkid_new_probe();
+	if (pr == NULL || blkid_probe_set_device(pr, fd, 0, 0) != 0
+	               || blkid_probe_filter_superblocks_type(pr,
+	                               BLKID_FLTR_ONLYIN, filter)) {
+		log_err(_("Failed to create probe for %s\n"), cx->opts->device);
+		return -1;
+	}
+	ret = blkid_do_fullprobe(pr);
+	blkid_free_probe(pr);
+	if (ret == -1) {
+		log_err(_("Failed to probe device %s\n"), cx->opts->device);
+		return -1;
+	}
+	if (ret == 1)
+		return 0;
+	log_err(_("%s looks like an LVM physical volume.\n"), cx->opts->device);
+	log_err(_("fsck.gfs2 cannot check this device.\n"));
+	return 1;
+}
+
 /**
  * initialize - initialize superblock pointer
  *
@@ -1602,6 +1630,8 @@ int initialize(struct fsck_cx *cx, int *all_clean)
 		   from themselves. */
 		was_mounted_ro = 1;
 	}
+	if (is_lvm_member(cx)) /* True or error */
+		return FSCK_ERROR;
 
 	if (lgfs2_get_dev_info(sdp->device_fd, &sdp->dinfo)) {
 		perror(cx->opts->device);
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 27a643a2..f8538942 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -8,7 +8,8 @@ EXTRA_DIST = \
 	$(TESTSCRIPTS) \
 	package.m4 \
 	gfs2-utils.spec.in \
-	atlocal.in
+	atlocal.in \
+	pv_sig.xxd
 
 DISTCLEANFILES = \
 	atlocal \
diff --git a/tests/atlocal.in b/tests/atlocal.in
index eed58b10..769b43cb 100644
--- a/tests/atlocal.in
+++ b/tests/atlocal.in
@@ -1,3 +1,4 @@
+GFS_TESTS_DIR="${abs_top_builddir}/tests"
 GFS_TGT="@testvol@"
 GFS_TGT_SZ=20
 GFS_MKFS="mkfs.gfs2 -O -D"
diff --git a/tests/fsck.at b/tests/fsck.at
index 538d41ad..bc8a6d1c 100644
--- a/tests/fsck.at
+++ b/tests/fsck.at
@@ -89,3 +89,10 @@ AT_CHECK([fsck.gfs2 -n $GFS_TGT], 0, [ignore], [ignore])
 AT_CHECK([mkfs.gfs2 -O -p lock_nolock -o format=1802 ${GFS_TGT}], 0, [ignore], [ignore])
 AT_CHECK([fsck.gfs2 -n $GFS_TGT], 0, [ignore], [ignore])
 AT_CLEANUP
+
+AT_SETUP([Detect LVM PV])
+AT_KEYWORDS(fsck.gfs2 fsck)
+GFS_TGT_REGEN
+AT_CHECK([xxd -r ${GFS_TESTS_DIR}/pv_sig.xxd ${GFS_TGT}], 0, [ignore], [ignore])
+AT_CHECK([fsck.gfs2 -y ${GFS_TGT}], 8, [ignore], [ignore])
+AT_CLEANUP
diff --git a/tests/pv_sig.xxd b/tests/pv_sig.xxd
new file mode 100644
index 00000000..dc00faed
--- /dev/null
+++ b/tests/pv_sig.xxd
@@ -0,0 +1,12 @@
+00000200: 4c41 4245 4c4f 4e45 0100 0000 0000 0000  LABELONE........
+00000210: 22fb 8643 2000 0000 4c56 4d32 2030 3031  "..C ...LVM2 001
+00000220: 5061 6e73 586a 5632 6847 3641 7679 3854  PansXjV2hG6Avy8T
+00000230: 5739 3236 786e 516a 5956 4154 5258 734d  W926xnQjYVATRXsM
+00000240: 0000 0040 0100 0000 0000 1000 0000 0000  ...@............
+00000250: 0000 0000 0000 0000 0000 0000 0000 0000  ................
+00000260: 0000 0000 0000 0000 0010 0000 0000 0000  ................
+00000270: 00f0 0f00 0000 0000 0000 0000 0000 0000  ................
+00000280: 0000 0000 0000 0000 0200 0000 0000 0000  ................
+00000290: 0000 0000 0000 0000 0000 0000 0000 0000  ................
+*
+000003f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
-- 
2.40.1

