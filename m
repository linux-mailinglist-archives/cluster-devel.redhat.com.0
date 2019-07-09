Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB86376E
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20E37A3B65;
	Tue,  9 Jul 2019 14:08:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8D1A196F6;
	Tue,  9 Jul 2019 14:07:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3582F206D1;
	Tue,  9 Jul 2019 14:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E73cM015964 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B938F831B7; Tue,  9 Jul 2019 14:07:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEF8C831CE;
	Tue,  9 Jul 2019 14:07:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:39 +0200
Message-Id: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 00/18] Pre-pull patch posting (merge
	window)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 09 Jul 2019 14:08:26 +0000 (UTC)

Hello,

for this merge window, we have the following changes:

  * An initial batch of obvious cleanups and fixes from Bob's recovery
    patch queue.

  * Two iomap conversion patches and a few cleanups from Christoph
    Hellwig.

  * A minor cleanup by Kefeng Wang from Huawei.

  * A minor fix and cleanup by me.


In addition, the following patch from Andy Price is coming in via the
vfs for-next branch:

  gfs2: Convert gfs2 to fs_context

  This patch has a trivial merge conflict with the following patch:

    gfs2: kthread and remount improvements

  which can be resolved by ignoring the changes in the latter patch.


Also, the following three patches from Christoph and me are coming in
via the xfs iomap-5.3-merge branch:

  iomap: don't mark the inode dirty in iomap_write_end
  fs: fold __generic_write_end back into generic_write_end
  iomap: fix page_done callback for short writes


Thanks,
Andreas

--

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

 fs/gfs2/aops.c       | 110 +++++--------------------------------------
 fs/gfs2/aops.h       |   4 --
 fs/gfs2/bmap.c       |  14 +++---
 fs/gfs2/dir.c        |   4 +-
 fs/gfs2/file.c       |  37 +++++++--------
 fs/gfs2/glock.c      |  42 ++++++++++-------
 fs/gfs2/glock.h      |  11 +++--
 fs/gfs2/glops.c      |  12 +++--
 fs/gfs2/incore.h     |   6 +--
 fs/gfs2/inode.c      |   2 +-
 fs/gfs2/log.c        |   3 +-
 fs/gfs2/lops.c       |  22 ++++++++-
 fs/gfs2/meta_io.c    |   6 +--
 fs/gfs2/ops_fstype.c |  27 ++++++-----
 fs/gfs2/quota.c      |   2 +-
 fs/gfs2/recovery.c   |   3 +-
 fs/gfs2/rgrp.c       |  48 +++++++++++--------
 fs/gfs2/rgrp.h       |   3 +-
 fs/gfs2/super.c      |  43 ++++++++---------
 fs/gfs2/super.h      |   2 +
 fs/gfs2/sys.c        |   5 +-
 fs/gfs2/trans.c      |   6 +--
 fs/gfs2/util.c       |   8 ++--
 23 files changed, 190 insertions(+), 230 deletions(-)

-- 
2.20.1

