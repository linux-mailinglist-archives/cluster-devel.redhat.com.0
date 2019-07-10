Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7A64EAD
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Jul 2019 00:23:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 733313086228;
	Wed, 10 Jul 2019 22:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1209760BFB;
	Wed, 10 Jul 2019 22:23:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DCD018355D9;
	Wed, 10 Jul 2019 22:22:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6AMMZNV026628 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jul 2019 18:22:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BF5360C4E; Wed, 10 Jul 2019 22:22:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFB8E60C05;
	Wed, 10 Jul 2019 22:22:31 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 11 Jul 2019 00:22:27 +0200
Message-Id: <20190710222227.27623-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2: 5.3 merge
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 10 Jul 2019 22:23:04 +0000 (UTC)

Hi Linus,

please consider pulling the following changes for gfs2.

In addition, the following patch from Andy Price is going to come in via the
for-next branch of the vfs repository:

  gfs2: Convert gfs2 to fs_context

This patch has a trivial merge conflict with the following patch from
this pull request:

  gfs2: kthread and remount improvements

The conflict can be resolved by ignoring the changes in the latter patch
and dropping function gfs2_remount_fs.

Thank you very much,
Andreas

--

The following changes since commit 4b972a01a7da614b4796475f933094751a295a2f:

  Linux 5.2-rc6 (2019-06-22 16:01:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.3

for you to fetch changes up to bb4cb25dd319fa5630cc304c5bfa926266736935:

  gfs2: Remove unused gfs2_iomap_alloc argument (2019-07-04 17:24:25 +0200)

----------------------------------------------------------------
Some relatively minor changes for gfs2:

 - An initial batch of obvious cleanups and fixes from Bob's
   recovery patch queue.
 - Two iomap conversion patches and some cleanups from Christoph
   Hellwig.
 - A cosmetic cleanup from Kefeng Wang (Huawei).
 - Another minor fix and cleanup by me.

----------------------------------------------------------------
Andreas Gruenbacher (2):
      gfs2: Clean up freeing struct gfs2_sbd
      gfs2: Remove unused gfs2_iomap_alloc argument

Bob Peterson (8):
      gfs2: kthread and remount improvements
      gfs2: eliminate tr_num_revoke_rm
      gfs2: log which portion of the journal is replayed
      gfs2: Warn when a journal replay overwrites a rgrp with buffers
      gfs2: Rename SDF_SHUTDOWN to SDF_WITHDRAWN
      gfs2: simplify gfs2_freeze by removing case
      gfs2: dump fsid when dumping glock problems
      gfs2: replace more printk with calls to fs_info and friends

Christoph Hellwig (7):
      gfs2: use page_offset in gfs2_page_mkwrite
      gfs2: remove the unused gfs2_stuffed_write_end function
      gfs2: merge gfs2_writeback_aops and gfs2_ordered_aops
      gfs2: merge gfs2_writepage_common into gfs2_writepage
      gfs2: mark stuffed_readpage static
      gfs2: use iomap_bmap instead of generic_block_bmap
      gfs2: don't use buffer_heads in gfs2_allocate_page_backing

Kefeng Wang (1):
      gfs2: Use IS_ERR_OR_NULL

 fs/gfs2/aops.c       | 110 ++++++---------------------------------------------
 fs/gfs2/aops.h       |   4 --
 fs/gfs2/bmap.c       |  14 +++----
 fs/gfs2/dir.c        |   4 +-
 fs/gfs2/file.c       |  37 +++++++++--------
 fs/gfs2/glock.c      |  42 ++++++++++++--------
 fs/gfs2/glock.h      |  11 ++++--
 fs/gfs2/glops.c      |  12 ++++--
 fs/gfs2/incore.h     |   6 +--
 fs/gfs2/inode.c      |   2 +-
 fs/gfs2/log.c        |   3 +-
 fs/gfs2/lops.c       |  22 ++++++++++-
 fs/gfs2/meta_io.c    |   6 +--
 fs/gfs2/ops_fstype.c |  27 +++++++------
 fs/gfs2/quota.c      |   2 +-
 fs/gfs2/recovery.c   |   3 +-
 fs/gfs2/rgrp.c       |  48 ++++++++++++----------
 fs/gfs2/rgrp.h       |   3 +-
 fs/gfs2/super.c      |  43 ++++++++++----------
 fs/gfs2/super.h      |   2 +
 fs/gfs2/sys.c        |   5 +--
 fs/gfs2/trans.c      |   6 +--
 fs/gfs2/util.c       |   8 ++--
 23 files changed, 190 insertions(+), 230 deletions(-)

