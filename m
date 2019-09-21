Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52DB9EE7
	for <lists+cluster-devel@lfdr.de>; Sat, 21 Sep 2019 18:51:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DB873084045;
	Sat, 21 Sep 2019 16:51:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D84391001B12;
	Sat, 21 Sep 2019 16:51:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26DE44E58B;
	Sat, 21 Sep 2019 16:51:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8LGpX5c023329 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 21 Sep 2019 12:51:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C679608A5; Sat, 21 Sep 2019 16:51:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-227.brq.redhat.com [10.40.204.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4883E60A35;
	Sat, 21 Sep 2019 16:51:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 21 Sep 2019 18:51:26 +0200
Message-Id: <20190921165126.4443-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [GIT PULL] gfs2 changes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sat, 21 Sep 2019 16:51:48 +0000 (UTC)

Hi Linus,

please consider pulling the following changes for gfs2.  The changes
should merge without any conflicts.

Thank you very much,
Andreas

The following changes since commit e21a712a9685488f5ce80495b37b9fdbe96c230d:

  Linux 5.3-rc3 (2019-08-04 18:40:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.4

for you to fetch changes up to f0b444b349e33ae0d3dd93e25ca365482a5d17d4:

  gfs2: clear buf_in_tr when ending a transaction in sweep_bh_for_rgrps (2019-09-17 16:50:50 +0200)

----------------------------------------------------------------
Changes for gfs2:

 - Use asynchronous glocks and timeouts to recover from deadlocks during rename
   and exchange: the lock ordering constraints the vfs uses are not sufficient
   to prevent deadlocks across multiple nodes.
 - Add support for IOMAP_ZERO and use iomap_zero_range to replace gfs2 specific
   code.
 - Various other minor fixes and cleanups.

----------------------------------------------------------------
Andreas Gruenbacher (9):
      gfs2: gfs2_walk_metadata fix
      gfs2: gfs2_iomap_begin cleanup
      gfs2: Add support for IOMAP_ZERO
      gfs2: Minor gfs2_alloc_inode cleanup
      gfs2: Always mark inode dirty in fallocate
      gfs2: Fix recovery slot bumping
      gfs2: Minor PAGE_SIZE arithmetic cleanups
      gfs2: create function gfs2_glock_update_hold_time
      gfs2: Improve mmap write vs. truncate consistency

Bob Peterson (5):
      gfs2: untangle the logic in gfs2_drevalidate
      gfs2: Fix possible fs name overflows
      gfs2: separate holder for rgrps in gfs2_rename
      gfs2: Use async glocks for rename
      gfs2: clear buf_in_tr when ending a transaction in sweep_bh_for_rgrps

Christoph Hellwig (1):
      gfs2: implement gfs2_block_zero_range using iomap_zero_range

Markus Elfring (1):
      gfs2: Delete an unnecessary check before brelse()

 fs/gfs2/aops.c       |   4 +-
 fs/gfs2/bmap.c       | 357 +++++++++++++++++++++++++--------------------------
 fs/gfs2/dentry.c     |  45 ++-----
 fs/gfs2/dir.c        |   3 +-
 fs/gfs2/dir.h        |   3 +-
 fs/gfs2/file.c       |   9 +-
 fs/gfs2/glock.c      | 115 +++++++++++++++--
 fs/gfs2/glock.h      |   6 +
 fs/gfs2/incore.h     |   1 +
 fs/gfs2/inode.c      |  63 ++++++---
 fs/gfs2/lock_dlm.c   |   8 +-
 fs/gfs2/ops_fstype.c |   1 +
 fs/gfs2/quota.c      |   2 +-
 fs/gfs2/rgrp.c       |   2 +-
 fs/gfs2/super.c      |  14 +-
 fs/gfs2/util.c       |   2 +-
 16 files changed, 365 insertions(+), 270 deletions(-)

