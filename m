Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AE4B5266165
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Sep 2020 16:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599835380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LmL28GVKTvMdhkVQWzkIQqUgvIK2+JGBO49xTglLOTo=;
	b=SP2e0c1e5v1GPKP6ew2kfZnQdVU7O2PcfMi0o91il1voQOme+mCMKQEsAPTYng58Zz70a1
	D7lIki1sbjIfjvRylMkalo747jQPXcJHjtIvWgAl8+OYvnlwvuCFpOYknED8CLtPn/TlX/
	w5pv+jZbHGBa0JlGW1W9lbKTCX1lKD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-1kP6HJ9xMWq4smDSJxxdjQ-1; Fri, 11 Sep 2020 10:42:58 -0400
X-MC-Unique: 1kP6HJ9xMWq4smDSJxxdjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46FB108E8D8;
	Fri, 11 Sep 2020 14:42:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C372D821E4;
	Fri, 11 Sep 2020 14:42:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF67B18199F7;
	Fri, 11 Sep 2020 14:42:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BEgrTf003486 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 10:42:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F6F45D9F3; Fri, 11 Sep 2020 14:42:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6CEF5D9E8
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 14:42:52 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 11 Sep 2020 15:42:43 +0100
Message-Id: <20200911144243.667554-4-anprice@redhat.com>
In-Reply-To: <20200911144243.667554-1-anprice@redhat.com>
References: <20200911144243.667554-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/3] Describe the unit tests in README.tests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 doc/README.tests | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/doc/README.tests b/doc/README.tests
index 1b90a0c4..292d2ae7 100644
--- a/doc/README.tests
+++ b/doc/README.tests
@@ -23,8 +23,8 @@ tests can be re-run using make check TOPTS='--recheck' although it's better to
 re-run the entire suite after fixing tests as a fix for one test could break
 another.
 
-Writing tests
--------------
+Smoke/regression tests
+----------------------
 A number of GFS2-specific convenience macros have been defined in testsuite.at
 to make defining new tests quick and easy. Also, some variables have been
 defined in atlocal.in so that full paths to programs do not have to be included
@@ -55,6 +55,33 @@ be found in the autoconf manual at:
 
     http://www.gnu.org/software/autoconf/manual/index.html
 
+Unit tests
+----------
+A unit test framework for each of the main utils and libgfs2 is included in its
+source directory. These tests are based on the libcheck C unit test library and
+are built and run by 'make check'. Generally, there should be one check "Suite"
+defined for each source file of the util, named with a check_ prefix,
+containing one or more test cases defined for each externally-visible function.
+For example:
+
+  check_libgfs2 (main file: check_libgfs2.c)
+       |--------Suite: rgrp.c (in check_rgrp.c)
+       |              |---------- Test case: test_rbm_find_good
+       |              |-----------Test case: test_rbm_find_bad
+       |--------Suite: meta.c (in check_meta.c)
+       |              |-----------Test case: test_lgfs2_meta
+     etc.            etc.
+
+The build rules for the unit tests are separated into a checks.am file in each
+source directory. Documentation for writing libcheck unit tests can be found
+at:
+
+    https://libcheck.github.io/check/doc/check_html/index.html
+
+Autoconf's automatically generated test driver script only prints one line for
+each unit test executable run instead of one line per test case. To view
+details of unit test failures, see the generated .log and .trs files.
+
 Generating coverage reports
 ---------------------------
 Test coverage instrumentation can be enabled using the --enable-gcov option at
-- 
2.26.2

