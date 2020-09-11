Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 40F38266163
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Sep 2020 16:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599835380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=skge88NKSJfCxLBUUyCIzDmGsBXGlsFZQvR5FYN4zmY=;
	b=ZtkM8zT+34jS5mMpn6TLJshXcbu42lqK5J2ZGB7G5DvFH12bc9Vmsbw89r7vnUGSxXQjCC
	l1OUrjr35FIJX56WCNUVa//KuyRq0eVoekMjoODEsOiS5h8Q+deTlKd1o9Hz7yoveCUE3E
	sOV68V4nVFKOqK5TctqT7O1naO6w4D4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-V6MvSHV6PJG1w2Pl0Bxk1A-1; Fri, 11 Sep 2020 10:42:58 -0400
X-MC-Unique: V6MvSHV6PJG1w2Pl0Bxk1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3CDC85B67D;
	Fri, 11 Sep 2020 14:42:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 651617C83D;
	Fri, 11 Sep 2020 14:42:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1413A180B65D;
	Fri, 11 Sep 2020 14:42:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BEgnN9003454 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 10:42:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BBB95D9F3; Fri, 11 Sep 2020 14:42:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFE995D9F7
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 14:42:45 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 11 Sep 2020 15:42:40 +0100
Message-Id: <20200911144243.667554-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/3] gfs2-utils: Unit test framework
	improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

To date we haven't accumulated many unit tests. That's partly because the older code was never written with testability in mind and partly because the unit test infrastructure is poorly organised in the project.

This patch set aims to lower the effort needed to write new unit tests by stubbing out all of the infrastructure required and by moving the unit tests into the directories of the code they're testing. Doing that also means that the main testsuite script is no longer dependent on the unit tests and can more easily be used outside of the source directory, e.g. for CI.

Andrew Price (3):
  Reorganise unit tests
  Stub out unit tests for the main gfs2-utils
  Describe the unit tests in README.tests

 .gitignore                           | 14 ++++--
 doc/README.tests                     | 31 ++++++++++++-
 gfs2/convert/Makefile.am             |  4 ++
 gfs2/convert/check_convert.c         | 27 +++++++++++
 gfs2/convert/checks.am               |  7 +++
 gfs2/convert/gfs2_convert.c          |  2 +
 gfs2/edit/Makefile.am                |  3 ++
 gfs2/edit/check_edit.c               | 27 +++++++++++
 gfs2/edit/checks.am                  |  7 +++
 gfs2/edit/hexedit.c                  |  2 +
 gfs2/fsck/Makefile.am                |  4 ++
 gfs2/fsck/check_fsck.c               | 27 +++++++++++
 gfs2/fsck/checks.am                  |  7 +++
 gfs2/fsck/main.c                     |  2 +
 gfs2/libgfs2/Makefile.am             | 21 +++++----
 gfs2/libgfs2/check_libgfs2.c         | 21 +++++++++
 gfs2/libgfs2/check_meta.c            | 21 +++++++++
 {tests => gfs2/libgfs2}/check_rgrp.c | 67 ++++++++++++----------------
 gfs2/libgfs2/checks.am               | 32 +++++++++++++
 gfs2/mkfs/Makefile.am                |  3 ++
 gfs2/mkfs/check_grow.c               | 27 +++++++++++
 gfs2/mkfs/check_jadd.c               | 27 +++++++++++
 gfs2/mkfs/check_mkfs.c               | 27 +++++++++++
 gfs2/mkfs/checks.am                  | 17 +++++++
 gfs2/mkfs/main_grow.c                |  2 +
 gfs2/mkfs/main_jadd.c                |  2 +
 gfs2/mkfs/main_mkfs.c                |  2 +
 gfs2/tune/Makefile.am                |  4 ++
 gfs2/tune/check_tune.c               | 27 +++++++++++
 gfs2/tune/checks.am                  |  7 +++
 gfs2/tune/main.c                     |  2 +
 tests/Makefile.am                    | 53 ++--------------------
 tests/check_meta.c                   | 33 --------------
 tests/libgfs2.at                     |  9 ----
 tests/testsuite.at                   |  1 -
 35 files changed, 421 insertions(+), 148 deletions(-)
 create mode 100644 gfs2/convert/check_convert.c
 create mode 100644 gfs2/convert/checks.am
 create mode 100644 gfs2/edit/check_edit.c
 create mode 100644 gfs2/edit/checks.am
 create mode 100644 gfs2/fsck/check_fsck.c
 create mode 100644 gfs2/fsck/checks.am
 create mode 100644 gfs2/libgfs2/check_libgfs2.c
 create mode 100644 gfs2/libgfs2/check_meta.c
 rename {tests => gfs2/libgfs2}/check_rgrp.c (62%)
 create mode 100644 gfs2/libgfs2/checks.am
 create mode 100644 gfs2/mkfs/check_grow.c
 create mode 100644 gfs2/mkfs/check_jadd.c
 create mode 100644 gfs2/mkfs/check_mkfs.c
 create mode 100644 gfs2/mkfs/checks.am
 create mode 100644 gfs2/tune/check_tune.c
 create mode 100644 gfs2/tune/checks.am
 delete mode 100644 tests/check_meta.c
 delete mode 100644 tests/libgfs2.at

-- 
2.26.2

