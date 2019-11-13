Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B17CAFBABA
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+UqDXy5LzOY4PsLmPZec+WTMye8kTFmKqz0VbKvmKbw=;
	b=SCLbnw7OCS75WuXf2XgNrPIU0IlqURd2knH/ORK4LBjBl34kODVtYaKsV1g9MIoxsyzHdx
	36ObkAhuU8dS5v/IsEM4M5qlffGQwi2CAUXt5QweayUPOQX5PG6dPFI1TH7zOr/1lGzHLb
	ybjugj9ElIlnB14l1P/lI18N0XluK9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-qPjvTWOhMb20MidKinXQ0Q-1; Wed, 13 Nov 2019 16:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1072810A951B;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFBF381C1D;
	Wed, 13 Nov 2019 21:30:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E45418034E9;
	Wed, 13 Nov 2019 21:30:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUYmn005176 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5096D69739; Wed, 13 Nov 2019 21:30:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D0436A505
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:29:58 -0600
Message-Id: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 00/32] gfs2: misc recovery patch collection
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
X-MC-Unique: qPjvTWOhMb20MidKinXQ0Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

This is my latest collection of patches to address the myriad of gfs2
recovery problems I've found. I'm not convinced we need all of these
but I thought I'd send them anyway and get feedback

Some of these are just bugs and may be pushed separately.

Bob Peterson (32):
  gfs2: Introduce concept of a pending withdraw
  gfs2: clear ail1 list when gfs2 withdraws
  gfs2: Rework how rgrp buffer_heads are managed
  gfs2: fix infinite loop in gfs2_ail1_flush on io error
  gfs2: log error reform
  gfs2: Only complain the first time an io error occurs in quota or log
  gfs2: Ignore dlm recovery requests if gfs2 is withdrawn
  gfs2: move check_journal_clean to util.c for future use
  gfs2: Allow some glocks to be used during withdraw
  gfs2: Don't loop forever in gfs2_freeze if withdrawn
  gfs2: Make secondary withdrawers wait for first withdrawer
  gfs2: Don't write log headers after file system withdraw
  gfs2: Force withdraw to replay journals and wait for it to finish
  gfs2: fix infinite loop when checking ail item count before go_inval
  gfs2: Add verbose option to check_journal_clean
  gfs2: Abort gfs2_freeze if io error is seen
  gfs2: Issue revokes more intelligently
  gfs2: Prepare to withdraw as soon as an IO error occurs in log write
  gfs2: Check for log write errors before telling dlm to unlock
  gfs2: new slab for transactions
  gfs2: Close timing window with GLF_INVALIDATE_IN_PROGRESS
  gfs2: Do log_flush in gfs2_ail_empty_gl even if ail list is empty
  gfs2: Don't skip log flush if glock still has revokes
  gfs2: initialize tr_ail1_list when creating transactions
  gfs2: Withdraw in gfs2_ail1_flush if write_cache_pages returns error
  gfs2: drain the ail2 list after io errors
  gfs2: make gfs2_log_shutdown static
  gfs2: Eliminate GFS2_RDF_UPTODATE flag in favor of buffer existence
  gfs2: if finish_open returns error, clean up iopen glock mess
  gfs2: Don't demote a glock until its revokes are written
  gfs2: Do proper error checking for go_sync family of glops functions
  gfs2: fix glock reference problem in gfs2_trans_add_unrevoke

 fs/gfs2/aops.c       |   4 +-
 fs/gfs2/file.c       |   2 +-
 fs/gfs2/glock.c      | 140 ++++++++++++++++++++++----
 fs/gfs2/glops.c      | 153 ++++++++++++++++++++++------
 fs/gfs2/incore.h     |  21 ++--
 fs/gfs2/inode.c      |   6 ++
 fs/gfs2/lock_dlm.c   |  52 ++++++++++
 fs/gfs2/log.c        | 231 +++++++++++++++++++++++++++++-------------
 fs/gfs2/log.h        |   2 +-
 fs/gfs2/lops.c       |  12 ++-
 fs/gfs2/main.c       |  23 +++++
 fs/gfs2/meta_io.c    |   6 +-
 fs/gfs2/ops_fstype.c |  51 +---------
 fs/gfs2/quota.c      |  10 +-
 fs/gfs2/recovery.c   |   5 +
 fs/gfs2/rgrp.c       |  82 +++++++++------
 fs/gfs2/rgrp.h       |   1 -
 fs/gfs2/super.c      |  97 ++++++++++++------
 fs/gfs2/sys.c        |   2 +-
 fs/gfs2/trans.c      |  38 +++++--
 fs/gfs2/trans.h      |   1 +
 fs/gfs2/util.c       | 235 +++++++++++++++++++++++++++++++++++++++++--
 fs/gfs2/util.h       |  16 +++
 23 files changed, 924 insertions(+), 266 deletions(-)

--=20
2.23.0

