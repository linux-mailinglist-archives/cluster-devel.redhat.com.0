Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C39127D93
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5CC530ADC94;
	Thu, 23 May 2019 13:04:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAD825C69A;
	Thu, 23 May 2019 13:04:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1781E1806B13;
	Thu, 23 May 2019 13:04:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4OqB009870 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8903D6918D; Thu, 23 May 2019 13:04:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5499C6918C
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:03:55 -0500
Message-Id: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 00/26] gfs2: misc recovery patch
	collection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 23 May 2019 13:05:11 +0000 (UTC)

Here is version 6 of the patch set I posted on 23 April. It is revised
based on additional bugs I found testing with xfstests, and problems
found by Andreas.

The first 8 are cleanups, the rest are bug fixes.

This is a collection of patches I've been using to address the myriad
of recovery problems I've found. There aren't many other dependencies
between patches, so many could be accepted or rejected individually.


Bob Peterson (26):
  gfs2: kthread and remount improvements
  gfs2: eliminate tr_num_revoke_rm
  gfs2: log which portion of the journal is replayed
  gfs2: Warn when a journal replay overwrites a rgrp with buffers
  gfs2: Change SDF_SHUTDOWN to SDF_WITHDRAWN
  gfs2: simplify gfs2_freeze by removing case
  gfs2: dump fsid when dumping glock problems
  gfs2: replace more printk with calls to fs_info and friends
  gfs2: Introduce concept of a pending withdraw
  gfs2: fix infinite loop in gfs2_ail1_flush on io error
  gfs2: log error reform
  gfs2: Only complain the first time an io error occurs in quota or log
  gfs2: Stop ail1 wait loop when withdrawn
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

 fs/gfs2/aops.c       |   4 +-
 fs/gfs2/bmap.c       |   2 +-
 fs/gfs2/file.c       |   2 +-
 fs/gfs2/glock.c      | 121 +++++++++++++++++-----
 fs/gfs2/glock.h      |  12 ++-
 fs/gfs2/glops.c      | 108 ++++++++++++++++++--
 fs/gfs2/glops.h      |   3 +-
 fs/gfs2/incore.h     |  30 ++++--
 fs/gfs2/inode.c      |  14 ++-
 fs/gfs2/lock_dlm.c   |  52 ++++++++++
 fs/gfs2/log.c        | 113 ++++++++++----------
 fs/gfs2/lops.c       |  28 ++++-
 fs/gfs2/meta_io.c    |   6 +-
 fs/gfs2/ops_fstype.c |  65 +++---------
 fs/gfs2/quota.c      |  10 +-
 fs/gfs2/recovery.c   |   8 +-
 fs/gfs2/rgrp.c       |  48 +++++----
 fs/gfs2/rgrp.h       |   3 +-
 fs/gfs2/super.c      | 125 ++++++++++++++++-------
 fs/gfs2/super.h      |   1 +
 fs/gfs2/sys.c        |  14 ++-
 fs/gfs2/trans.c      |   6 +-
 fs/gfs2/util.c       | 238 +++++++++++++++++++++++++++++++++++++++++--
 fs/gfs2/util.h       |  15 +++
 24 files changed, 785 insertions(+), 243 deletions(-)

-- 
2.21.0

