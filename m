Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30E48CBE3
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YAXI3BDUZEf+bCP81cEXuxiCL3iBaj5t7qnXBg9HOSo=;
	b=UoKXMVoNrrisvCCgh7M+n0GMxUFwvPLNvzAP8pB5WQSBu8Yr+P92C33ERNU6QXKT8mHfl/
	Hbb6wDOmRBsBmpp/8t6aiYW2UY4v41fcGc29e7EJGOmXyqTfBK7uIpCkiVmLzZ75uwoIp2
	yhRImDS7NnDLQQxSky3d9vviUJWVywQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-9MAlJDsbNKS6_Ix_nvNjDw-1; Wed, 12 Jan 2022 14:27:13 -0500
X-MC-Unique: 9MAlJDsbNKS6_Ix_nvNjDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7F0783DD23;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B85DE5D6B1;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB25D4BB7C;
	Wed, 12 Jan 2022 19:27:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJQw5l009248 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:26:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C605245D6D; Wed, 12 Jan 2022 19:26:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6C8345D67
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:26:52 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:32 +0000
Message-Id: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 00/18] gfs2-utils: Don't require an external
	print_it() in libgfs2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch set fixes a long-standing issue in libgfs2 where it requires apps linking to it to provide a print_it function, which it uses in lgfs2_(struct)_print() functions defined in libgfs2/ondisk.c. This was the main blocker to it becoming a library in a more meaningful sense.

The approach taken is to remove the responsibility of printing gfs2 structures from libgfs2 altogether. So the first challenge is to remove debugging output from libgfs2 and push it down into the utils, which in turn required returning more context from some libgfs2 functions, mainly the build_* functions in structures.c.

The overall result is more flexibility and control over the way the utils print on-disk structures and improved error/debug messages. Test code is also tidied up as we no longer have to define a print_it() in each of the tests.


Andrew Price (18):
  libgfs2: Move debugging printf out of build_master()
  libgfs2: Rework lgfs2_build_jindex()
  libgfs2: Move build_jindex() into fsck.gfs2
  libgfs2: Push down build_per_node() into the utils
  libgfs2: Return the inode from build_inum_range()
  libgfs2: Return the inode from build_statfs_change()
  libgfs2: Return the inode from build_quota_change()
  libgfs2: Return the inode from build_inum()
  libgfs2: Return the inode from build_statfs()
  libgfs2: Return the inode from build_rindex()
  libgfs2: Return the inode from build_quota()
  libgfs2: Move debugging printf out of build_root()
  libgfs2: Remove debugging printf from do_init_statfs()
  libgfs2: Move debugging output out of do_init_inum()
  libgfs2: Remove debugging printfs from fix_device_geometry()
  libgfs2: Remove config.[ch]
  libgfs2: Move struct printing functions out of libgfs2
  libgfs2: Remove print_it extern requirement

 gfs2/convert/gfs2_convert.c    |  80 +++++---
 gfs2/edit/Makefile.am          |   2 +
 gfs2/edit/extended.c           |  18 +-
 gfs2/edit/gfs2hex.c            | 156 +-------------
 gfs2/edit/hexedit.c            |  36 +---
 gfs2/edit/hexedit.h            |   4 +-
 gfs2/edit/struct_print.c       | 364 +++++++++++++++++++++++++++++++++
 gfs2/edit/struct_print.h       |  23 +++
 gfs2/fsck/fs_recovery.c        |  21 ++
 gfs2/fsck/fs_recovery.h        |   1 +
 gfs2/fsck/fsck.h               |   1 +
 gfs2/fsck/initialize.c         |  75 +++----
 gfs2/fsck/main.c               |  13 +-
 gfs2/fsck/pass1.c              |  86 +++++++-
 gfs2/fsck/pass2.c              |  37 +++-
 gfs2/glocktop/glocktop.c       |   3 +-
 gfs2/libgfs2/Makefile.am       |   2 -
 gfs2/libgfs2/check_libgfs2.c   |   3 -
 gfs2/libgfs2/checks.am         |   1 -
 gfs2/libgfs2/config.c          |   9 -
 gfs2/libgfs2/config.h          |   6 -
 gfs2/libgfs2/device_geometry.c |   7 -
 gfs2/libgfs2/gfs2l.c           |   3 -
 gfs2/libgfs2/libgfs2.h         |  40 +---
 gfs2/libgfs2/ondisk.c          | 199 ------------------
 gfs2/libgfs2/structures.c      | 226 ++++----------------
 gfs2/mkfs/Makefile.am          |   2 +
 gfs2/mkfs/gfs2_mkfs.h          |  11 -
 gfs2/mkfs/main_jadd.c          |   1 -
 gfs2/mkfs/main_mkfs.c          | 152 +++++++++++---
 gfs2/mkfs/struct_print.c       | 218 ++++++++++++++++++++
 gfs2/mkfs/struct_print.h       |  19 ++
 tests/nukerg.c                 |   3 -
 33 files changed, 1067 insertions(+), 755 deletions(-)
 create mode 100644 gfs2/edit/struct_print.c
 create mode 100644 gfs2/edit/struct_print.h
 delete mode 100644 gfs2/libgfs2/config.c
 delete mode 100644 gfs2/libgfs2/config.h
 create mode 100644 gfs2/mkfs/struct_print.c
 create mode 100644 gfs2/mkfs/struct_print.h

-- 
2.34.1

