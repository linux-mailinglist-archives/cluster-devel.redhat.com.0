Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D651D26A408
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 13:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600168844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5LHmJG0RxHhmAEamdJsTKoz8Ejmvofq1J4SQhEazLDo=;
	b=Wn5xgp+h/JX75wBUhDJRtDAhj1FaCaO5Bl5qavOVDwuAhPhz6boAS0T4EHq11yokviwzyd
	7DcS3rJoksj1bZDkCqBkShK7gzRNz9jR0G6II7Z99t8jDmCm1egLNpBgzTSDFD/m/CScSV
	jV/IdZVGfBTGq+h9mgMR6jnTeonbdz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-m0fdKH1PPhK2lSLd5Qrp9w-1; Tue, 15 Sep 2020 07:20:42 -0400
X-MC-Unique: m0fdKH1PPhK2lSLd5Qrp9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 833F61008542;
	Tue, 15 Sep 2020 11:20:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E3A619C59;
	Tue, 15 Sep 2020 11:20:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7099D44A51;
	Tue, 15 Sep 2020 11:20:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FBKYZV010308 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 07:20:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0C9D10002A6; Tue, 15 Sep 2020 11:20:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E87CA1002D57
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 11:20:29 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 15 Sep 2020 12:20:27 +0100
Message-Id: <20200915112027.890246-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] mkfs.gfs2: Make sure the last rg_skip is 0
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

The rg_skip field of the last resource group is meant to be zero. Ensure
that gfs2_grow and mkfs.gfs2 set it that way once the resource groups
have been written, using a new lgfs2_rgrps_write_final() function that
is called once we know that there are no more resource groups to write.

Tests included, which required adding code to create temporary sparse
files for unit tests to use.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/check_rgrp.c | 70 ++++++++++++++++++++++++++++++++-------
 gfs2/libgfs2/libgfs2.h    |  1 +
 gfs2/libgfs2/rgrp.c       | 19 ++++++++++-
 gfs2/mkfs/main_grow.c     |  4 +++
 gfs2/mkfs/main_mkfs.c     |  5 ++-
 tests/rgskipcheck.sh      |  9 ++++-
 6 files changed, 93 insertions(+), 15 deletions(-)

diff --git a/gfs2/libgfs2/check_rgrp.c b/gfs2/libgfs2/check_rgrp.c
index 4cf01754..98650e24 100644
--- a/gfs2/libgfs2/check_rgrp.c
+++ b/gfs2/libgfs2/check_rgrp.c
@@ -1,6 +1,13 @@
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/types.h>
 #include <check.h>
 #include "libgfs2.h"
-#include "rgrp.h" /* Private header libgfs2/rgrp.h for convenience */
+#include "rgrp.h"
+
+/* Keep this size small enough to run on most build machines and large enough
+   that we can create several resource groups. */
+#define MOCK_DEV_SIZE (1 << 30)
 
 Suite *suite_rgrp(void);
 
@@ -13,14 +20,20 @@ static void mockup_rgrps(void)
 	uint64_t addr;
 	struct gfs2_rindex ri = {0};
 	lgfs2_rgrp_t rg;
-	uint32_t rgsize = (1024 << 20) / 4096;
+	uint32_t rgsize = (100 << 20) / 4096;
+	char tmpnam[] = "mockdev-XXXXXX";
 	int ret;
 
 	sdp = calloc(1, sizeof(*sdp));
 	ck_assert(sdp != NULL);
 
-	sdp->device.length = rgsize + 20;
-	sdp->device_fd = -1;
+	sdp->device.length = MOCK_DEV_SIZE / 4096;
+
+	sdp->device_fd = mkstemp(tmpnam);
+	ck_assert(sdp->device_fd >= 0);
+	ck_assert(unlink(tmpnam) == 0);
+	ck_assert(ftruncate(sdp->device_fd, MOCK_DEV_SIZE) == 0);
+
 	sdp->bsize = sdp->sd_sb.sb_bsize = 4096;
 	compute_constants(sdp);
 
@@ -44,6 +57,7 @@ static void mockup_rgrps(void)
 
 static void teardown_rgrps(void)
 {
+	close(tc_rgrps->sdp->device_fd);
 	free(tc_rgrps->sdp);
 	lgfs2_rgrp_bitbuf_free(lgfs2_rgrp_first(tc_rgrps));
 	lgfs2_rgrps_free(&tc_rgrps);
@@ -115,18 +129,50 @@ START_TEST(test_rbm_find_lastblock)
 }
 END_TEST
 
+START_TEST(test_rgrps_write_final)
+{
+	lgfs2_rgrp_t rg = lgfs2_rgrp_last(tc_rgrps);
+	uint64_t addr = lgfs2_rgrp_index(rg)->ri_addr;
+	struct gfs2_sbd *sdp = tc_rgrps->sdp;
+	struct gfs2_rgrp rgrp;
+	char *buf;
+
+	buf = malloc(4096);
+	ck_assert(buf != NULL);
+	memset(buf, 0xff, sizeof(rgrp));
+	ck_assert(pwrite(sdp->device_fd, buf, 4096, addr * 4096) == 4096);
+
+	ck_assert(lgfs2_rgrps_write_final(sdp->device_fd, tc_rgrps) == 0);
+	ck_assert(pread(sdp->device_fd, buf, 4096, addr * 4096) == 4096);
+	gfs2_rgrp_in(&rgrp, buf);
+	free(buf);
+
+	ck_assert(rgrp.rg_header.mh_magic == GFS2_MAGIC);
+	ck_assert(rgrp.rg_header.mh_type == GFS2_METATYPE_RG);
+	ck_assert(rgrp.rg_skip == 0);
+
+	ck_assert(lgfs2_rgrps_write_final(-1, tc_rgrps) == -1);
+}
+END_TEST
+
 Suite *suite_rgrp(void)
 {
 
 	Suite *s = suite_create("rgrp.c");
-
-	TCase *tc_rbm_find = tcase_create("rbm_find");
-	tcase_add_checked_fixture(tc_rbm_find, mockup_rgrps, teardown_rgrps);
-	tcase_add_test(tc_rbm_find, test_rbm_find_good);
-	tcase_add_test(tc_rbm_find, test_rbm_find_bad);
-	tcase_add_test(tc_rbm_find, test_rbm_find_lastblock);
-	tcase_set_timeout(tc_rbm_find, 0);
-	suite_add_tcase(s, tc_rbm_find);
+	TCase *tc;
+
+	tc = tcase_create("rbm_find");
+	tcase_add_checked_fixture(tc, mockup_rgrps, teardown_rgrps);
+	tcase_add_test(tc, test_rbm_find_good);
+	tcase_add_test(tc, test_rbm_find_bad);
+	tcase_add_test(tc, test_rbm_find_lastblock);
+	tcase_set_timeout(tc, 0);
+	suite_add_tcase(s, tc);
+
+	tc = tcase_create("lgfs2_rgrps_write_final");
+	tcase_add_checked_fixture(tc, mockup_rgrps, teardown_rgrps);
+	tcase_add_test(tc, test_rgrps_write_final);
+	suite_add_tcase(s, tc);
 
 	return s;
 }
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 54c70093..e815b5d7 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -201,6 +201,7 @@ extern lgfs2_rgrp_t lgfs2_rgrps_append(lgfs2_rgrps_t rgs, struct gfs2_rindex *en
 extern int lgfs2_rgrp_bitbuf_alloc(lgfs2_rgrp_t rg);
 extern void lgfs2_rgrp_bitbuf_free(lgfs2_rgrp_t rg);
 extern int lgfs2_rgrp_write(int fd, lgfs2_rgrp_t rg);
+extern int lgfs2_rgrps_write_final(int fd, lgfs2_rgrps_t rgs);
 extern const struct gfs2_rindex *lgfs2_rgrp_index(lgfs2_rgrp_t rg);
 extern const struct gfs2_rgrp *lgfs2_rgrp_rgrp(lgfs2_rgrp_t rg);
 extern lgfs2_rgrp_t lgfs2_rgrp_first(lgfs2_rgrps_t rgs);
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 7f7f83fd..a985e1c8 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -692,7 +692,7 @@ int lgfs2_rgrp_write(int fd, const lgfs2_rgrp_t rg)
 	if (rg->rgrps->align > 0)
 		len = ROUND_UP(len, rg->rgrps->align * sdp->bsize);
 
-	ret = pwrite(sdp->device_fd, rg->bits[0].bi_data, len, rg->ri.ri_addr * sdp->bsize);
+	ret = pwrite(fd, rg->bits[0].bi_data, len, rg->ri.ri_addr * sdp->bsize);
 
 	if (freebufs)
 		lgfs2_rgrp_bitbuf_free(rg);
@@ -700,6 +700,23 @@ int lgfs2_rgrp_write(int fd, const lgfs2_rgrp_t rg)
 	return ret == len ? 0 : -1;
 }
 
+/**
+ * Write the final resource group with rg_skip == 0.
+ * If there is no bitmap data attached to the rg then the block after the
+ * header will be zeroed.
+ * fd: The file descriptor to write to
+ * rgs: The set of resource groups
+ */
+int lgfs2_rgrps_write_final(int fd, lgfs2_rgrps_t rgs)
+{
+	lgfs2_rgrp_t rg = lgfs2_rgrp_last(rgs);
+
+	rg->rg.rg_skip = 0;
+	if (lgfs2_rgrp_write(fd, rg) != 0)
+		return -1;
+	return 0;
+}
+
 lgfs2_rgrp_t lgfs2_rgrp_first(lgfs2_rgrps_t rgs)
 {
 	return (lgfs2_rgrp_t)osi_first(&rgs->root);
diff --git a/gfs2/mkfs/main_grow.c b/gfs2/mkfs/main_grow.c
index f527cc82..e1a6d70b 100644
--- a/gfs2/mkfs/main_grow.c
+++ b/gfs2/mkfs/main_grow.c
@@ -234,6 +234,10 @@ static unsigned initialize_new_portion(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs)
 		}
 		rgcount++;
 	}
+	if (lgfs2_rgrps_write_final(sdp->device_fd, rgs) != 0) {
+		perror(_("Failed to write final resource group"));
+		return 0;
+	}
 	fsync(sdp->device_fd);
 	return rgcount;
 }
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 0b779593..325d5345 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -859,9 +859,12 @@ static int place_rgrps(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, uint64_t *rgaddr
 			fprintf(stderr, _("Failed to build resource groups\n"));
 			return result;
 		}
-
 		gfs2_progress_update(&progress, (sdp->rgrps));
 	}
+	if (lgfs2_rgrps_write_final(sdp->device_fd, rgs) != 0) {
+		perror(_("Failed to write final resource group"));
+		return 0;
+	}
 	gfs2_progress_close(&progress, _("Done\n"));
 	posix_fadvise(sdp->device_fd, 0, sdp->fssize * sdp->bsize, POSIX_FADV_DONTNEED);
 
diff --git a/tests/rgskipcheck.sh b/tests/rgskipcheck.sh
index 4a8f93fe..e8b56c78 100755
--- a/tests/rgskipcheck.sh
+++ b/tests/rgskipcheck.sh
@@ -4,7 +4,14 @@ dev=$1
 rgcount=$(gfs2_edit -p rgcount $dev | cut -f1 -d' ')
 prevaddr=$(gfs2_edit -p rg 0 $dev | grep ^RG | awk '{print $5}')
 prevskip=0
-for i in `seq 0 $(($rgcount - 1))`; do
+for i in `seq 0 $(($rgcount))`; do
+	if [ $i -eq $rgcount ]; then
+		if [ $prevskip -ne 0 ]; then
+			echo "Last rg_skip is not 0 ($prevskip)" >&2
+			exit 1
+		fi
+		exit 0
+	fi
 	addr=$(gfs2_edit -p rg $i $dev | grep ^RG | awk '{print $5}')
 	expected=$(($addr - $prevaddr))
 
-- 
2.26.2

