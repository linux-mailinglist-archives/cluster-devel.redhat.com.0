Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E41FB21
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E47EE316D771;
	Wed, 15 May 2019 19:40:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D012460928;
	Wed, 15 May 2019 19:40:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6B325B424;
	Wed, 15 May 2019 19:40:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcKYZ028950 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D860B60BF7; Wed, 15 May 2019 19:38:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3D7260F9C
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:18 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:37:53 -0500
Message-Id: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 00/25] gfs2: misc recovery patch
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 15 May 2019 19:40:25 +0000 (UTC)

Here is version 4 of the patch set I posted on 23 April. It is revised
based on bugs I found testing with xfstests.

The first 8 are cleanups, the rest are bug fixes.

This is a collection of patches I've been using to address the myriad
of recovery problems I've found. There aren't many other dependencies
between patches, so many could be accepted or rejected individually.

Bob Peterson (25):
  gfs2: kthread and remount improvements
  gfs2: eliminate tr_num_revoke_rm
  gfs2: log which portion of the journal is replayed
  gfs2: Warn when a journal replay overwrites a rgrp with buffers
  gfs2: Change SDF_SHUTDOWN to SDF_WITHDRAWN
  gfs2: simplify gfs2_freeze by removing case
  gfs2: dump fsid when dumping glock problems
  gfs2: replace more printk with calls to fs_info and friends
  gfs2: Introduce concept of a pending withdraw
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
  gfs2: Add verbose option to check_journal_clean
  gfs2: Abort gfs2_freeze if io error is seen
  gfs2: Check if holding freeze glock when making fs ro
  gfs2: Issue revokes more intelligently
  gfs2: Prepare to withdraw as soon as an IO error occurs in log write
  gfs2: Check for log write errors before telling dlm to unlock

 fs/gfs2/aops.c       |   4 +-
 fs/gfs2/bmap.c       |   2 +-
 fs/gfs2/file.c       |   2 +-
 fs/gfs2/glock.c      | 110 ++++++++++++++++++-----
 fs/gfs2/glock.h      |  12 ++-
 fs/gfs2/glops.c      |  88 ++++++++++++++++--
 fs/gfs2/glops.h      |   3 +-
 fs/gfs2/incore.h     |  28 ++++--
 fs/gfs2/inode.c      |  14 ++-
 fs/gfs2/lock_dlm.c   |  50 +++++++++++
 fs/gfs2/log.c        | 108 +++++++++++-----------
 fs/gfs2/lops.c       |  28 +++++-
 fs/gfs2/meta_io.c    |   6 +-
 fs/gfs2/ops_fstype.c |  65 ++++----------
 fs/gfs2/quota.c      |  10 ++-
 fs/gfs2/recovery.c   |   8 +-
 fs/gfs2/rgrp.c       |  48 +++++-----
 fs/gfs2/rgrp.h       |   3 +-
 fs/gfs2/super.c      | 123 +++++++++++++++----------
 fs/gfs2/super.h      |   1 +
 fs/gfs2/sys.c        |  14 ++-
 fs/gfs2/trans.c      |   6 +-
 fs/gfs2/util.c       | 209 ++++++++++++++++++++++++++++++++++++++++---
 fs/gfs2/util.h       |  15 ++++
 24 files changed, 705 insertions(+), 252 deletions(-)

-- 
2.20.1

