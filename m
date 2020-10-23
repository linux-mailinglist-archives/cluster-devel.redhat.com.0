Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 89A752972C3
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Oct 2020 17:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603468021;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TX4XQedEN+Ywa9WiNtmyeg6X9eUbMHcgElC578+OtLs=;
	b=hXKriCqF2dSnAc81wNHGuyTxRwegMZ/b8qzdc03q/zWE+99ErPtjMznZx9fRhvlpxqWxRY
	6MaWHNmNOgsBt/u5xh3skhOzliIhwHGmpnnTkgtiiZLGh58D0+/KIv2xZzpi+aovUigf+j
	RXHqA4pLtMtui0VaigOSjRSsZpN0JAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-Z14WtfheMeyldKA_eTPbsg-1; Fri, 23 Oct 2020 11:46:59 -0400
X-MC-Unique: Z14WtfheMeyldKA_eTPbsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D3AD804B76;
	Fri, 23 Oct 2020 15:46:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 679A0277DA;
	Fri, 23 Oct 2020 15:46:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CB74181A050;
	Fri, 23 Oct 2020 15:46:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09NFkl8A017833 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 23 Oct 2020 11:46:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD2A426570; Fri, 23 Oct 2020 15:46:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC6BF277DF;
	Fri, 23 Oct 2020 15:46:43 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Oct 2020 17:46:41 +0200
Message-Id: <20201023154642.1309908-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 changes for 5.10
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

could you please pull the following gfs2 changes for 5.10?

Thanks a lot,
Andreas

The following changes since commit bbf5c979011a099af5dc76498918ed7df445635b:

  Linux 5.9 (2020-10-11 14:15:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.10

for you to fetch changes up to bedb0f056faa94e953e7b3da5a77d25e0008364b:

  gfs2: Recover statfs info in journal head (2020-10-23 15:47:38 +0200)

----------------------------------------------------------------
Changes in gfs2:
* Use iomap for non-journaled buffered I/O.  This largely eliminates buffer
  heads on filesystems where the block size matches the page size.  Many thanks
  to Christoph Hellwig for this patch!
* Fixes for some more journaled data filesystem bugs, found by running xfstests
  with data journaling on for all files (chattr +j $MNT) (Bob Peterson).
* gfs2_evict_inode refactoring (Bob Peterson).
* Use the statfs data in the journal during recovery instead of reading it in
  from the local statfs inodes (Abhi Das).
* Several other minor fixes by various people.

----------------------------------------------------------------
Abhi Das (3):
      gfs2: Add fields for statfs info in struct gfs2_log_header_host
      gfs2: lookup local statfs inodes prior to journal recovery
      gfs2: Recover statfs info in journal head

Anant Thazhemadam (1):
      gfs2: add validation checks for size of superblock

Andreas Gruenbacher (2):
      gfs2: Make sure we don't miss any delayed withdraws
      gfs2: Ignore subsequent errors after withdraw in rgrp_go_sync

Andrew Price (1):
      gfs2: Fix NULL pointer dereference in gfs2_rgrp_dump

Bob Peterson (20):
      gfs2: Fix bad comment for trans_drain
      gfs2: rename variable error to ret in gfs2_evict_inode
      gfs2: factor evict_unlinked_inode out of gfs2_evict_inode
      gfs2: further simplify gfs2_evict_inode with new func evict_should_delete
      gfs2: factor evict_linked_inode out of gfs2_evict_inode
      gfs2: simplify the logic in gfs2_evict_inode
      gfs2: call truncate_inode_pages_final for address space glocks
      gfs2: rename gfs2_write_full_page to gfs2_write_jdata_page, remove parm
      gfs2: add missing log_blocks trace points in gfs2_write_revokes
      gfs2: enhance log_blocks trace point to show log blocks free
      gfs2: Wipe jdata and ail1 in gfs2_journal_wipe, formerly gfs2_meta_wipe
      gfs2: make gfs2_ail1_empty_one return the count of active items
      gfs2: don't lock sd_ail_lock in gfs2_releasepage
      gfs2: Only set PageChecked if we have a transaction
      gfs2: simplify gfs2_block_map
      gfs2: Ignore journal log writes for jdata holes
      gfs2: eliminate GLF_QUEUED flag in favor of list_empty(gl_holders)
      gfs2: Fix comments to glock_hash_walk
      gfs2: Only access gl_delete for iopen glocks
      gfs2: Eliminate gl_vm

Christoph Hellwig (1):
      gfs2: use iomap for buffered I/O in ordered and writeback mode

Jamie Iles (1):
      gfs2: use-after-free in sysfs deregistration

Liu Shixin (1):
      gfs2: convert to use DEFINE_SEQ_ATTRIBUTE macro

 fs/gfs2/aops.c       |  68 ++++++++--------
 fs/gfs2/bmap.c       |  62 ++++++++++-----
 fs/gfs2/bmap.h       |   1 +
 fs/gfs2/glock.c      |  52 +++++-------
 fs/gfs2/glops.c      |  36 +++++----
 fs/gfs2/incore.h     |  29 ++++---
 fs/gfs2/log.c        |  89 ++++++++++++---------
 fs/gfs2/log.h        |   2 +-
 fs/gfs2/lops.c       |   2 +-
 fs/gfs2/lops.h       |   1 +
 fs/gfs2/meta_io.c    |  81 +++++++++++++++++--
 fs/gfs2/meta_io.h    |   2 +-
 fs/gfs2/ops_fstype.c | 173 ++++++++++++++++++++++++++--------------
 fs/gfs2/recovery.c   | 108 +++++++++++++++++++++++++
 fs/gfs2/rgrp.c       |  19 ++---
 fs/gfs2/rgrp.h       |   2 +-
 fs/gfs2/super.c      | 220 +++++++++++++++++++++++++++++++++++----------------
 fs/gfs2/super.h      |   5 ++
 fs/gfs2/sys.c        |   5 +-
 fs/gfs2/trace_gfs2.h |   7 +-
 fs/gfs2/util.c       |   2 +-
 fs/gfs2/util.h       |  10 +++
 22 files changed, 675 insertions(+), 301 deletions(-)

