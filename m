Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91151792556
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Sep 2023 18:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693930374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Izwd6VG11/eR+WdhWkmn/0JiAPOIwvSrL5xnlgkpZ4M=;
	b=URwzoI1lUrVt0hpch/xZ34CcGkq3SHPGoamRu++fVgpwuzJnV3XTYVa8vlYWYoNUDUHgZw
	qcqBmibF+HU6mJ1C96JmZrOMFM+FT16DiHx4OMaxMqL5+ac7WijMOXOnQLOUldehJoZLIj
	NmFFFXB4o2VknG3FI8lv4WqyswKTXUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-ksihfSTYOaWs8GQUyPiNKA-1; Tue, 05 Sep 2023 12:12:51 -0400
X-MC-Unique: ksihfSTYOaWs8GQUyPiNKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C090C928E62;
	Tue,  5 Sep 2023 16:12:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5976A40C84A7;
	Tue,  5 Sep 2023 16:12:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 271E11946597;
	Tue,  5 Sep 2023 16:12:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26CD81946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  5 Sep 2023 16:12:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1789540C105A; Tue,  5 Sep 2023 16:12:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0298740C6CCC;
 Tue,  5 Sep 2023 16:12:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue,  5 Sep 2023 18:12:46 +0200
Message-Id: <20230905161246.2042842-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fixes (*) into the current merge window.

(*) Technically, this updates the address of the shared gfs2 and dlm mailing list
    so this affects dlm as well; I've coordinated this change with David Teigland.

Thanks,
Andreas

The following changes since commit 02aee814d37c563e24b73bcd0f9cb608fbd403d4:

  Merge tag 'gfs2-v6.4-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2023-08-08 09:27:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.5-rc5-fixes

for you to fetch changes up to 2938fd750e8b73a6dac4d9339fb6f7f1cd624a2d:

  MAINTAINERS: Update dlm mailing list (2023-09-05 17:43:07 +0200)

----------------------------------------------------------------
gfs2 fixes

- Fix a glock state (non-)transition bug when a dlm request times out
  and is canceled, and we have locking requests that can now be granted
  immediately.

- Various fixes and cleanups in how the logd and quotad daemons are
  woken up and terminated.

- Fix several bugs in the quota data reference counting and shrinking.
  Free quota data objects synchronously in put_super() instead of
  letting call_rcu() run wild.

- Make sure not to deallocate quota data during a withdraw; rather, defer
  quota data deallocation to put_super().  Withdraws can happen in
  contexts in which callers on the stack are holding quota data references.

- Many minor quota fixes and cleanups by Bob.

- Update the the mailing list address for gfs2 and dlm.  (It's the same
  list for both and we are moving it to gfs2@lists.linux.dev.)

- Various other minor cleanups.

----------------------------------------------------------------
Andreas Gruenbacher (24):
      gfs2: Use mapping->gfp_mask for metadata inodes
      gfs: Don't use GFP_NOFS in gfs2_unstuff_dinode
      gfs2: do_promote cleanup
      gfs2: Remove LM_FLAG_PRIORITY flag
      gfs2: Switch to wait_event in gfs2_logd
      gfs2: low-memory forced flush fixes
      gfs2: Fix logd wakeup on I/O error
      gfs2: journal flush threshold fixes and cleanup
      gfs2: Rename sd_{ glock => kill }_wait
      gfs2: Rename SDF_DEACTIVATING to SDF_KILL
      gfs2: Fix wrong quota shrinker return value
      gfs2: Use gfs2_qd_dispose in gfs2_quota_cleanup
      gfs2: Factor out duplicate quota data disposal code
      gfs2: No more quota complaints after withdraw
      gfs2: Fix initial quota data refcount
      gfs2: Free quota data objects synchronously
      gfs2: Stop using gfs2_make_fs_ro for withdraw
      gfs2: Fix asynchronous thread destruction
      gfs2: Switch to wait_event in gfs2_quotad
      gfs2: Sanitize kthread stopping
      gfs2: Fix withdraw race
      gfs2: Rename "gfs_recovery" workqueue to "gfs2_recovery"
      gfs2: Rename "freeze_workqueue" to "gfs2_freeze"
      gfs2: Add device name to gfs2_logd and gfs2_quotad

Andrew Price (2):
      MAINTAINERS: Update gfs2 mailing list
      MAINTAINERS: Update dlm mailing list

Bob Peterson (24):
      gfs2: conversion deadlock do_promote bypass
      gfs2: Use qd_sbd more consequently
      gfs2: Introduce new quota=quiet mount option
      gfs2: remove dead code for quota writes
      gfs2: Pass sdp to gfs2_adjust_quota
      gfs2: pass sdp in to gfs2_write_disk_quota
      gfs2: pass sdp to gfs2_write_buf_to_page
      gfs2: remove unneeded variable done
      gfs2: remove unneeded pg_oflow variable
      gfs2: Simplify function need_sync
      gfs2: Don't try to sync non-changes
      gfs2: improvements to sysfs status
      gfs2: move qdsb_put and reduce redundancy
      gfs2: Small gfs2_quota_lock cleanup
      gfs2: Remove useless err set
      gfs2: Set qd_sync_gen in do_sync
      gfs2: use constant for array size
      gfs2: Remove quota allocation info from quota file
      gfs2: introduce qd_bh_get_or_undo
      gfs2: Simplify qd2offset
      gfs2: simplify slot_get
      gfs2: Remove useless assignment
      gfs2: check for no eligible quota changes
      gfs2: change qd_slot_count to qd_slot_ref

Minjie Du (1):
      gfs2: increase usage of folio_next_index() helper

 Documentation/filesystems/gfs2-glocks.rst |   3 +-
 MAINTAINERS                               |   4 +-
 fs/gfs2/aops.c                            |   7 +-
 fs/gfs2/bmap.c                            |   2 +-
 fs/gfs2/glock.c                           |  47 ++--
 fs/gfs2/glock.h                           |   9 -
 fs/gfs2/glops.c                           |   2 +-
 fs/gfs2/incore.h                          |   7 +-
 fs/gfs2/inode.c                           |  14 +-
 fs/gfs2/lock_dlm.c                        |   5 -
 fs/gfs2/log.c                             |  69 +++---
 fs/gfs2/lops.c                            |   7 +-
 fs/gfs2/main.c                            |  10 +-
 fs/gfs2/ops_fstype.c                      |  42 ++--
 fs/gfs2/quota.c                           | 368 ++++++++++++++++--------------
 fs/gfs2/recovery.c                        |   4 +-
 fs/gfs2/recovery.h                        |   2 +-
 fs/gfs2/super.c                           |  28 +--
 fs/gfs2/super.h                           |   1 +
 fs/gfs2/sys.c                             |  12 +-
 fs/gfs2/util.c                            |  34 +--
 21 files changed, 347 insertions(+), 330 deletions(-)

