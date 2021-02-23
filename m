Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEF4323180
	for <lists+cluster-devel@lfdr.de>; Tue, 23 Feb 2021 20:36:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614108970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xSXNjPrPxyU8r7SGW7Uz84R+t/dQp8t1lbvbHRPa4JI=;
	b=Xfg/UZiVVrfevpGI4CYiGpgHuMWADu44SaMQShq47kaWaJpmJKM4wRftnlwrVBr3dWP9sn
	QszSMHZq8bA0wXQ9a2LanPEX/gwd+f4IoR3c0zQI735LrT+FWQQFWn0gBsPH0R5Y432k3F
	PWwlOAUxZgjfabqx5JQM7yst94TUOZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-js-LilcANYKxcCfkl99jOg-1; Tue, 23 Feb 2021 14:36:08 -0500
X-MC-Unique: js-LilcANYKxcCfkl99jOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16ACE1020C51;
	Tue, 23 Feb 2021 19:34:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6B919D61;
	Tue, 23 Feb 2021 19:34:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CF8018095CA;
	Tue, 23 Feb 2021 19:34:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11NJYZOx023083 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 14:34:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C92757; Tue, 23 Feb 2021 19:34:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDBB667CC0;
	Tue, 23 Feb 2021 19:34:30 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Feb 2021 20:34:29 +0100
Message-Id: <20210223193429.873467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 changes for 5.12
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following gfs2 changes for 5.12.  My apologies for
the late request; we ended up getting stuck with two broken patches that have
now both been removed.

Thanks a lot,
Andreas

The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.12

for you to fetch changes up to 17d77684088510df84ff8285982d0eed52cd5890:

  gfs2: Don't get stuck with I/O plugged in gfs2_ail1_flush (2021-02-23 19:01:42 +0100)

----------------------------------------------------------------
Changes in gfs2:
* Log space and revoke accounting rework to fix some failed asserts.
* Local resource group glock sharing for better local performance.
* Add support for version 1802 filesystems: trusted xattr support and
  '-o rgrplvb' mounts by default.
* Actually synchronize on the inode glock's FREEING bit during withdraw
  ("gfs2: fix glock confusion in function signal_our_withdraw").
* Fix parallel recovery of multiple journals ("gfs2: keep bios separate
  for each journal").
* Various other bug fixes.

----------------------------------------------------------------
Andreas Gruenbacher (37):
      gfs2: Turn gfs2_rbm_incr into gfs2_rbm_add
      gfs2: Only use struct gfs2_rbm for bitmap manipulations
      gfs2: Get rid of unnecessary variable in gfs2_alloc_blocks
      gfs2: Minor gfs2_inplace_reserve cleanup
      Revert "gfs2: Don't reject a supposedly full bitmap if we have blocks reserved"
      gfs2: Don't clear GBF_FULL flags in rs_deltree
      gfs2: Set GBF_FULL flags when reading resource group
      gfs2: Un-obfuscate function jdesc_find_i
      gfs2: Simplify the buf_limit and databuf_limit definitions
      gfs2: Minor gfs2_write_revokes cleanups
      gfs2: Some documentation updates
      gfs2: Minor debugging improvement
      gfs2: Rename gfs2_{write => flush}_revokes
      gfs2: Clean up ail2_empty
      gfs2: Use sb_start_intwrite in gfs2_ail_empty_gl
      gfs2: Clean up on-stack transactions
      gfs2: Get rid of sd_reserving_log
      gfs2: Move lock flush locking to gfs2_trans_{begin,end}
      gfs2: Don't wait for journal flush in clean_journal
      gfs2: Clean up gfs2_log_reserve
      gfs2: Use a tighter bound in gfs2_trans_begin
      gfs2: Get rid of current_tail()
      gfs2: Move function gfs2_ail_empty_tr
      gfs2: Lock imbalance on error path in gfs2_recover_one
      gfs2: Add trusted xattr support
      gfs2: Recursive gfs2_quota_hold in gfs2_iomap_end
      gfs2: Also reflect single-block allocations in rgd->rd_extfail_pt
      gfs2: Only pass reservation down to gfs2_rbm_find
      gfs2: Don't search for unreserved space twice
      gfs2: Check for active reservation in gfs2_release
      gfs2: Rename rs_{free -> requested} and rd_{reserved -> requested}
      gfs2: Add per-reservation reserved block accounting
      gfs2: Add local resource group locking
      gfs2: Minor calc_reserved cleanup
      gfs2: Rework the log space allocation logic
      gfs2: Per-revoke accounting in transactions
      Merge branches 'rgrp-glock-sharing' and 'gfs2-revoke' from https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git

Andrew Price (2):
      gfs2: Fix invalid block size message
      gfs2: Enable rgrplvb for sb_fs_format 1802

Bob Peterson (10):
      gfs2: Add common helper for holding and releasing the freeze glock
      gfs2: move freeze glock outside the make_fs_rw and _ro functions
      gfs2: make gfs2_log_write_page static
      Revert "GFS2: Re-add a call to log_flush_wait when flushing the journal"
      gfs2: fix glock confusion in function signal_our_withdraw
      gfs2: keep bios separate for each journal
      gfs2: Don't skip dlm unlock if glock has an lvb
      gfs2: Allow node-wide exclusive glock sharing
      gfs2: Use resource group glock sharing
      gfs2: Don't get stuck with I/O plugged in gfs2_ail1_flush

Zhaoyang Huang (1):
      gfs2: amend SLAB_RECLAIM_ACCOUNT on gfs2 related slab cache

 fs/gfs2/bmap.c                   |  10 +-
 fs/gfs2/file.c                   |   8 +-
 fs/gfs2/glock.c                  |  22 +-
 fs/gfs2/glock.h                  |   6 +
 fs/gfs2/glops.c                  |  38 +--
 fs/gfs2/incore.h                 |  54 ++--
 fs/gfs2/inode.c                  |   6 +-
 fs/gfs2/lock_dlm.c               |   8 +-
 fs/gfs2/log.c                    | 525 ++++++++++++++++++++++-----------------
 fs/gfs2/log.h                    |  20 +-
 fs/gfs2/lops.c                   |  26 +-
 fs/gfs2/lops.h                   |  23 +-
 fs/gfs2/main.c                   |   4 +-
 fs/gfs2/ops_fstype.c             |  71 ++++--
 fs/gfs2/recovery.c               |  14 +-
 fs/gfs2/rgrp.c                   | 442 ++++++++++++++++++++------------
 fs/gfs2/rgrp.h                   |   6 +-
 fs/gfs2/super.c                  |  73 ++----
 fs/gfs2/super.h                  |   8 +-
 fs/gfs2/trace_gfs2.h             |  37 ++-
 fs/gfs2/trans.c                  | 102 +++++---
 fs/gfs2/trans.h                  |   5 +-
 fs/gfs2/util.c                   |  59 ++++-
 fs/gfs2/util.h                   |   3 +
 fs/gfs2/xattr.c                  |  54 +++-
 include/uapi/linux/gfs2_ondisk.h |   5 +-
 26 files changed, 967 insertions(+), 662 deletions(-)

