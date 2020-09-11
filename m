Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 74759266164
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Sep 2020 16:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599835380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LaGT22EudFRLrbZmuM8Lzv9OYXjtNBA/C29BKNdXX7k=;
	b=hK7Y2hzlV1I2pAyTlPchX910XTen8YQ0jp1UmhOUHRgPRiaRaKjlmJ6CxrdzOlpKEb5/Nu
	Q9omJ2cpt2vq+hCfRXylaEfkc7YXbAKGPV9wcTWIdL2vWyoDcEE+9jJdjL+AEktcIQjSi9
	O4C3BjIPHucqsOpSvJ2NYUiBHDG1pJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-QK27Ems9NDK6xzy7pAqmWQ-1; Fri, 11 Sep 2020 10:42:58 -0400
X-MC-Unique: QK27Ems9NDK6xzy7pAqmWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118B3EF4E5;
	Fri, 11 Sep 2020 14:42:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 003D419C66;
	Fri, 11 Sep 2020 14:42:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E01239230C;
	Fri, 11 Sep 2020 14:42:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BEgqm3003478 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 10:42:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DDEF5D9F3; Fri, 11 Sep 2020 14:42:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75E545D9E8
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 14:42:51 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 11 Sep 2020 15:42:42 +0100
Message-Id: <20200911144243.667554-3-anprice@redhat.com>
In-Reply-To: <20200911144243.667554-1-anprice@redhat.com>
References: <20200911144243.667554-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/3] Stub out unit tests for the main
	gfs2-utils
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

Create stub unit test infrastructure for mkfs.gfs2, gfs2_edit,
gfs2_convert, tunegfs2, fsck.gfs2, gfs2_jadd and gfs2_grow.

The idea here is to make the effort needed to add unit tests when
writing new code minimal, although with some effort and imagination it
might be possible to make the existing code testable.

main() functions are currently #ifdef'd away when building unit tests as
they clash with the main() function of the unit tests, but a different
method could be used if we find it valuable to test the main() functions
themselves.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 .gitignore                   |  7 +++++++
 gfs2/convert/Makefile.am     |  4 ++++
 gfs2/convert/check_convert.c | 27 +++++++++++++++++++++++++++
 gfs2/convert/checks.am       |  7 +++++++
 gfs2/convert/gfs2_convert.c  |  2 ++
 gfs2/edit/Makefile.am        |  3 +++
 gfs2/edit/check_edit.c       | 27 +++++++++++++++++++++++++++
 gfs2/edit/checks.am          |  7 +++++++
 gfs2/edit/hexedit.c          |  2 ++
 gfs2/fsck/Makefile.am        |  4 ++++
 gfs2/fsck/check_fsck.c       | 27 +++++++++++++++++++++++++++
 gfs2/fsck/checks.am          |  7 +++++++
 gfs2/fsck/main.c             |  2 ++
 gfs2/mkfs/Makefile.am        |  3 +++
 gfs2/mkfs/check_grow.c       | 27 +++++++++++++++++++++++++++
 gfs2/mkfs/check_jadd.c       | 27 +++++++++++++++++++++++++++
 gfs2/mkfs/check_mkfs.c       | 27 +++++++++++++++++++++++++++
 gfs2/mkfs/checks.am          | 17 +++++++++++++++++
 gfs2/mkfs/main_grow.c        |  2 ++
 gfs2/mkfs/main_jadd.c        |  2 ++
 gfs2/mkfs/main_mkfs.c        |  2 ++
 gfs2/tune/Makefile.am        |  4 ++++
 gfs2/tune/check_tune.c       | 27 +++++++++++++++++++++++++++
 gfs2/tune/checks.am          |  7 +++++++
 gfs2/tune/main.c             |  2 ++
 25 files changed, 273 insertions(+)
 create mode 100644 gfs2/convert/check_convert.c
 create mode 100644 gfs2/convert/checks.am
 create mode 100644 gfs2/edit/check_edit.c
 create mode 100644 gfs2/edit/checks.am
 create mode 100644 gfs2/fsck/check_fsck.c
 create mode 100644 gfs2/fsck/checks.am
 create mode 100644 gfs2/mkfs/check_grow.c
 create mode 100644 gfs2/mkfs/check_jadd.c
 create mode 100644 gfs2/mkfs/check_mkfs.c
 create mode 100644 gfs2/mkfs/checks.am
 create mode 100644 gfs2/tune/check_tune.c
 create mode 100644 gfs2/tune/checks.am

diff --git a/.gitignore b/.gitignore
index 133e8071..74b14b9f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -34,7 +34,9 @@ cscope.out
 *.trs
 *.log
 gfs2/convert/gfs2_convert
+gfs2/convert/check_convert
 gfs2/edit/gfs2_edit
+gfs2/edit/check_edit
 gfs2/libgfs2/gfs2l
 gfs2/libgfs2/parser.c
 gfs2/libgfs2/parser.h
@@ -42,12 +44,17 @@ gfs2/libgfs2/lexer.c
 gfs2/libgfs2/lexer.h
 gfs2/libgfs2/check_libgfs2
 gfs2/fsck/fsck.gfs2
+gfs2/fsck/check_fsck
 gfs2/glocktop/glocktop
 gfs2/mkfs/mkfs.gfs2
 gfs2/mkfs/gfs2_grow
 gfs2/mkfs/gfs2_jadd
+gfs2/mkfs/check_grow
+gfs2/mkfs/check_jadd
+gfs2/mkfs/check_mkfs
 gfs2/scripts/82-gfs2-withdraw.rules
 gfs2/tune/tunegfs2
+gfs2/tune/check_tune
 test-driver
 tests/nukerg
 tests/testvol
diff --git a/gfs2/convert/Makefile.am b/gfs2/convert/Makefile.am
index 2d61af74..2f545909 100644
--- a/gfs2/convert/Makefile.am
+++ b/gfs2/convert/Makefile.am
@@ -10,3 +10,7 @@ gfs2_convert_CPPFLAGS = \
 gfs2_convert_LDADD = \
 	$(top_builddir)/gfs2/libgfs2/libgfs2.la \
 	$(uuid_LIBS)
+
+if HAVE_CHECK
+include checks.am
+endif
diff --git a/gfs2/convert/check_convert.c b/gfs2/convert/check_convert.c
new file mode 100644
index 00000000..230b9e37
--- /dev/null
+++ b/gfs2/convert/check_convert.c
@@ -0,0 +1,27 @@
+#include <check.h>
+
+START_TEST(test_convert_stub)
+{
+	ck_assert(1);
+}
+END_TEST
+
+static Suite *suite_convert(void)
+{
+	Suite *s = suite_create("gfs2_convert.c");
+	TCase *tc_convert = tcase_create("gfs2_convert");
+	tcase_add_test(tc_convert, test_convert_stub);
+	suite_add_tcase(s, tc_convert);
+	return s;
+}
+
+int main(void)
+{
+	int failures;
+
+	SRunner *runner = srunner_create(suite_convert());
+	srunner_run_all(runner, CK_ENV);
+	failures = srunner_ntests_failed(runner);
+	srunner_free(runner);
+	return failures ? 1 : 0;
+}
diff --git a/gfs2/convert/checks.am b/gfs2/convert/checks.am
new file mode 100644
index 00000000..06a7e3b5
--- /dev/null
+++ b/gfs2/convert/checks.am
@@ -0,0 +1,7 @@
+TESTS = check_convert
+check_PROGRAMS = $(TESTS)
+
+check_convert_SOURCES = $(gfs2_convert_SOURCES) check_convert.c
+check_convert_CPPFLAGS = $(gfs2_convert_CPPFLAGS) -DUNITTESTS
+check_convert_CFLAGS = $(gfs2_convert_CFLAGS) $(check_CFLAGS) -Wno-unused-function
+check_convert_LDADD = $(gfs2_convert_LDADD) $(check_LIBS)
diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 99a9fad8..dd945032 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2160,6 +2160,7 @@ static int gfs2_query(struct gfs2_options *opts, const char *dev)
 	return res;
 }
 
+#ifndef UNITTESTS
 int main(int argc, char **argv)
 {
 	int error;
@@ -2370,3 +2371,4 @@ int main(int argc, char **argv)
 		free(sd_jindex);
 	exit(0);
 }
+#endif /* UNITTESTS */
diff --git a/gfs2/edit/Makefile.am b/gfs2/edit/Makefile.am
index 53a7dea6..cee327a9 100644
--- a/gfs2/edit/Makefile.am
+++ b/gfs2/edit/Makefile.am
@@ -33,3 +33,6 @@ gfs2_edit_LDADD = \
 	$(bzip2_LIBS) \
 	$(uuid_LIBS)
 
+if HAVE_CHECK
+include checks.am
+endif
diff --git a/gfs2/edit/check_edit.c b/gfs2/edit/check_edit.c
new file mode 100644
index 00000000..1aa7009b
--- /dev/null
+++ b/gfs2/edit/check_edit.c
@@ -0,0 +1,27 @@
+#include <check.h>
+
+START_TEST(test_edit_stub)
+{
+	ck_assert(1);
+}
+END_TEST
+
+static Suite *suite_edit(void)
+{
+	Suite *s = suite_create("hexedit.c");
+	TCase *tc_edit = tcase_create("gfs2_edit");
+	tcase_add_test(tc_edit, test_edit_stub);
+	suite_add_tcase(s, tc_edit);
+	return s;
+}
+
+int main(void)
+{
+	int failures;
+
+	SRunner *runner = srunner_create(suite_edit());
+	srunner_run_all(runner, CK_ENV);
+	failures = srunner_ntests_failed(runner);
+	srunner_free(runner);
+	return failures ? 1 : 0;
+}
diff --git a/gfs2/edit/checks.am b/gfs2/edit/checks.am
new file mode 100644
index 00000000..6d9282a3
--- /dev/null
+++ b/gfs2/edit/checks.am
@@ -0,0 +1,7 @@
+TESTS = check_edit
+check_PROGRAMS = $(TESTS)
+
+check_edit_SOURCES = $(gfs2_edit_SOURCES) check_edit.c
+check_edit_CPPFLAGS = $(gfs2_edit_CPPFLAGS) -DUNITTESTS
+check_edit_CFLAGS = $(gfs2_edit_CFLAGS) $(check_CFLAGS) -Wno-unused-function
+check_edit_LDADD = $(gfs2_edit_LDADD) $(check_LIBS)
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index f8b6f67c..91313e81 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -2570,6 +2570,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 	} /* for */
 }/* process_parameters */
 
+#ifndef UNITTESTS
 int main(int argc, char *argv[])
 {
 	int i, j, fd;
@@ -2650,3 +2651,4 @@ int main(int argc, char *argv[])
 	gfs2_rgrp_free(&sbd, &sbd.rgtree);
  	exit(EXIT_SUCCESS);
 }
+#endif /* UNITTESTS */
diff --git a/gfs2/fsck/Makefile.am b/gfs2/fsck/Makefile.am
index 1c528051..9f0e2035 100644
--- a/gfs2/fsck/Makefile.am
+++ b/gfs2/fsck/Makefile.am
@@ -38,3 +38,7 @@ fsck_gfs2_CPPFLAGS = \
 fsck_gfs2_LDADD = \
 	$(top_builddir)/gfs2/libgfs2/libgfs2.la \
 	$(uuid_LIBS)
+
+if HAVE_CHECK
+include checks.am
+endif
diff --git a/gfs2/fsck/check_fsck.c b/gfs2/fsck/check_fsck.c
new file mode 100644
index 00000000..08aaee2c
--- /dev/null
+++ b/gfs2/fsck/check_fsck.c
@@ -0,0 +1,27 @@
+#include <check.h>
+
+START_TEST(test_fsck_stub)
+{
+	ck_assert(1);
+}
+END_TEST
+
+static Suite *suite_fsck(void)
+{
+	Suite *s = suite_create("main.c");
+	TCase *tc_fsck = tcase_create("fsck.gfs2");
+	tcase_add_test(tc_fsck, test_fsck_stub);
+	suite_add_tcase(s, tc_fsck);
+	return s;
+}
+
+int main(void)
+{
+	int failures;
+
+	SRunner *runner = srunner_create(suite_fsck());
+	srunner_run_all(runner, CK_ENV);
+	failures = srunner_ntests_failed(runner);
+	srunner_free(runner);
+	return failures ? 1 : 0;
+}
diff --git a/gfs2/fsck/checks.am b/gfs2/fsck/checks.am
new file mode 100644
index 00000000..4e968587
--- /dev/null
+++ b/gfs2/fsck/checks.am
@@ -0,0 +1,7 @@
+TESTS = check_fsck
+check_PROGRAMS = $(TESTS)
+
+check_fsck_SOURCES = $(fsck_gfs2_SOURCES) check_fsck.c
+check_fsck_CPPFLAGS = $(fsck_gfs2_CPPFLAGS) -DUNITTESTS -Wno-unused-const-variable
+check_fsck_CFLAGS = $(fsck_gfs2_CFLAGS) $(check_CFLAGS) -Wno-unused-function
+check_fsck_LDADD = $(fsck_gfs2_LDADD) $(check_LIBS)
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index 14cb7d9b..a860f6eb 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -306,6 +306,7 @@ static void startlog(int argc, char **argv)
 	free(cmd);
 }
 
+#ifndef UNITTESTS
 int main(int argc, char **argv)
 {
 	struct gfs2_sbd sb;
@@ -383,3 +384,4 @@ int main(int argc, char **argv)
 	}
 	exit(error);
 }
+#endif /* UNITTESTS */
diff --git a/gfs2/mkfs/Makefile.am b/gfs2/mkfs/Makefile.am
index fd7145b8..fd00fdd5 100644
--- a/gfs2/mkfs/Makefile.am
+++ b/gfs2/mkfs/Makefile.am
@@ -50,3 +50,6 @@ gfs2_jadd_LDADD = \
 	$(top_builddir)/gfs2/libgfs2/libgfs2.la \
 	$(uuid_LIBS)
 
+if HAVE_CHECK
+include checks.am
+endif
diff --git a/gfs2/mkfs/check_grow.c b/gfs2/mkfs/check_grow.c
new file mode 100644
index 00000000..d90da2c7
--- /dev/null
+++ b/gfs2/mkfs/check_grow.c
@@ -0,0 +1,27 @@
+#include <check.h>
+
+START_TEST(test_grow_stub)
+{
+	ck_assert(1);
+}
+END_TEST
+
+static Suite *suite_grow(void)
+{
+	Suite *s = suite_create("main_grow.c");
+	TCase *tc_grow = tcase_create("grow.gfs2");
+	tcase_add_test(tc_grow, test_grow_stub);
+	suite_add_tcase(s, tc_grow);
+	return s;
+}
+
+int main(void)
+{
+	int failures;
+
+	SRunner *runner = srunner_create(suite_grow());
+	srunner_run_all(runner, CK_ENV);
+	failures = srunner_ntests_failed(runner);
+	srunner_free(runner);
+	return failures ? 1 : 0;
+}
diff --git a/gfs2/mkfs/check_jadd.c b/gfs2/mkfs/check_jadd.c
new file mode 100644
index 00000000..b692b5a1
--- /dev/null
+++ b/gfs2/mkfs/check_jadd.c
@@ -0,0 +1,27 @@
+#include <check.h>
+
+START_TEST(test_jadd_stub)
+{
+	ck_assert(1);
+}
+END_TEST
+
+static Suite *suite_jadd(void)
+{
+	Suite *s = suite_create("main_jadd.c");
+	TCase *tc_jadd = tcase_create("jadd.gfs2");
+	tcase_add_test(tc_jadd, test_jadd_stub);
+	suite_add_tcase(s, tc_jadd);
+	return s;
+}
+
+int main(void)
+{
+	int failures;
+
+	SRunner *runner = srunner_create(suite_jadd());
+	srunner_run_all(runner, CK_ENV);
+	failures = srunner_ntests_failed(runner);
+	srunner_free(runner);
+	return failures ? 1 : 0;
+}
diff --git a/gfs2/mkfs/check_mkfs.c b/gfs2/mkfs/check_mkfs.c
new file mode 100644
index 00000000..81d91b88
--- /dev/null
+++ b/gfs2/mkfs/check_mkfs.c
@@ -0,0 +1,27 @@
+#include <check.h>
+
+START_TEST(test_mkfs_stub)
+{
+	ck_assert(1);
+}
+END_TEST
+
+static Suite *suite_mkfs(void)
+{
+	Suite *s = suite_create("main_mkfs.c");
+	TCase *tc_mkfs = tcase_create("mkfs.gfs2");
+	tcase_add_test(tc_mkfs, test_mkfs_stub);
+	suite_add_tcase(s, tc_mkfs);
+	return s;
+}
+
+int main(void)
+{
+	int failures;
+
+	SRunner *runner = srunner_create(suite_mkfs());
+	srunner_run_all(runner, CK_ENV);
+	failures = srunner_ntests_failed(runner);
+	srunner_free(runner);
+	return failures ? 1 : 0;
+}
diff --git a/gfs2/mkfs/checks.am b/gfs2/mkfs/checks.am
new file mode 100644
index 00000000..beb03a9b
--- /dev/null
+++ b/gfs2/mkfs/checks.am
@@ -0,0 +1,17 @@
+TESTS = check_grow check_jadd check_mkfs
+check_PROGRAMS = $(TESTS)
+
+check_grow_SOURCES = $(gfs2_grow_SOURCES) check_grow.c
+check_grow_CPPFLAGS = $(gfs2_grow_CPPFLAGS) -DUNITTESTS
+check_grow_CFLAGS = $(gfs2_grow_CFLAGS) $(check_CFLAGS) -Wno-unused-function
+check_grow_LDADD = $(gfs2_grow_LDADD) $(check_LIBS)
+
+check_jadd_SOURCES = $(gfs2_jadd_SOURCES) check_jadd.c
+check_jadd_CPPFLAGS = $(gfs2_jadd_CPPFLAGS) -DUNITTESTS
+check_jadd_CFLAGS = $(gfs2_jadd_CFLAGS) $(check_CFLAGS) -Wno-unused-function
+check_jadd_LDADD = $(gfs2_jadd_LDADD) $(check_LIBS)
+
+check_mkfs_SOURCES = $(mkfs_gfs2_SOURCES) check_mkfs.c
+check_mkfs_CPPFLAGS = $(mkfs_gfs2_CPPFLAGS) -DUNITTESTS
+check_mkfs_CFLAGS = $(mkfs_gfs2_CFLAGS) $(check_CFLAGS) -Wno-unused-function
+check_mkfs_LDADD = $(mkfs_gfs2_LDADD) $(check_LIBS)
diff --git a/gfs2/mkfs/main_grow.c b/gfs2/mkfs/main_grow.c
index 8882ecd3..f527cc82 100644
--- a/gfs2/mkfs/main_grow.c
+++ b/gfs2/mkfs/main_grow.c
@@ -349,6 +349,7 @@ static int open_rindex(char *metafs_path, int mode)
 	return fd;
 }
 
+#ifndef UNITTESTS
 int main(int argc, char *argv[])
 {
 	struct gfs2_sbd sbd, *sdp = &sbd;
@@ -483,3 +484,4 @@ int main(int argc, char *argv[])
 	log_notice( _("gfs2_grow complete.\n"));
 	return error;
 }
+#endif /* UNITTESTS */
diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index b7e9a644..b8f1ad90 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -589,6 +589,7 @@ static int check_fit(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 	return 0;
 }
 
+#ifndef UNITTESTS
 int main(int argc, char *argv[])
 {
 	struct jadd_opts opts = {0};
@@ -682,3 +683,4 @@ out:
 
 	return ret;
 }
+#endif /* UNITTESTS */
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index bb9a96d6..0b779593 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1038,6 +1038,7 @@ static void open_dev(struct mkfs_dev *dev, int withprobe)
 		exit(1);
 }
 
+#ifndef UNITTESTS
 int main(int argc, char *argv[])
 {
 	struct gfs2_sbd sbd;
@@ -1201,3 +1202,4 @@ int main(int argc, char *argv[])
 	}
 	return 0;
 }
+#endif /* UNITTESTS */
diff --git a/gfs2/tune/Makefile.am b/gfs2/tune/Makefile.am
index 171377d0..b03f609a 100644
--- a/gfs2/tune/Makefile.am
+++ b/gfs2/tune/Makefile.am
@@ -15,3 +15,7 @@ tunegfs2_CFLAGS = \
 	$(uuid_CFLAGS)
 tunegfs2_LDADD = \
 	$(uuid_LIBS)
+
+if HAVE_CHECK
+include checks.am
+endif
diff --git a/gfs2/tune/check_tune.c b/gfs2/tune/check_tune.c
new file mode 100644
index 00000000..5bbe5da6
--- /dev/null
+++ b/gfs2/tune/check_tune.c
@@ -0,0 +1,27 @@
+#include <check.h>
+
+START_TEST(test_tune_stub)
+{
+	ck_assert(1);
+}
+END_TEST
+
+static Suite *suite_tune(void)
+{
+	Suite *s = suite_create("main.c");
+	TCase *tc_tune = tcase_create("tunegfs2");
+	tcase_add_test(tc_tune, test_tune_stub);
+	suite_add_tcase(s, tc_tune);
+	return s;
+}
+
+int main(void)
+{
+	int failures;
+
+	SRunner *runner = srunner_create(suite_tune());
+	srunner_run_all(runner, CK_ENV);
+	failures = srunner_ntests_failed(runner);
+	srunner_free(runner);
+	return failures ? 1 : 0;
+}
diff --git a/gfs2/tune/checks.am b/gfs2/tune/checks.am
new file mode 100644
index 00000000..bb644e82
--- /dev/null
+++ b/gfs2/tune/checks.am
@@ -0,0 +1,7 @@
+TESTS = check_tune
+check_PROGRAMS = $(TESTS)
+
+check_tune_SOURCES = $(tunegfs2_SOURCES) check_tune.c
+check_tune_CPPFLAGS = $(tunegfs2_CPPFLAGS) -DUNITTESTS
+check_tune_CFLAGS = $(tunegfs2_CFLAGS) $(check_CFLAGS) -Wno-unused-function
+check_tune_LDADD = $(tunegfs2_LDADD) $(check_LIBS)
diff --git a/gfs2/tune/main.c b/gfs2/tune/main.c
index c1be8bd4..93f0f60c 100644
--- a/gfs2/tune/main.c
+++ b/gfs2/tune/main.c
@@ -62,6 +62,7 @@ static void version(void)
 	printf("tunegfs2 (%s %s)\n", __DATE__, __TIME__);
 }
 
+#ifndef UNITTESTS
 int main(int argc, char **argv)
 {
 	int c, status;
@@ -161,3 +162,4 @@ int main(int argc, char **argv)
 out:
 	return status;
 }
+#endif /* UNITTESTS */
-- 
2.26.2

