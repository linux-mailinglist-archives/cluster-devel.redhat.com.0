Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C24430D2
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 15:51:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635864690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NpnrKdth6t/i7OBtenBa8wX2/jD9oWEoj5+i+Mvx6MA=;
	b=MJ3An+TGdJB+GmwooIA1hmmLDJufsDagjbFdfXKHERqSU3Atvi6eglSKbfCt14IHqwRRQV
	jfuHLH6cKym5EFrLyD5yYZ3x5fQUgCARzs1cpquBfplJKDwOx/KwAakq0Tj5dDMAntlpa9
	EQXfA14GeQBYKfXYH5XINVFbCbjJipk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-8Ts-gY_6NXqec60VwaFT8g-1; Tue, 02 Nov 2021 10:51:27 -0400
X-MC-Unique: 8Ts-gY_6NXqec60VwaFT8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AE5F18C0F20;
	Tue,  2 Nov 2021 14:51:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F045B781B1;
	Tue,  2 Nov 2021 14:51:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1ED214EA2A;
	Tue,  2 Nov 2021 14:51:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2EpISh027083 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 10:51:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE7FD5DF35; Tue,  2 Nov 2021 14:51:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC2125D9D3;
	Tue,  2 Nov 2021 14:51:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue,  2 Nov 2021 15:51:16 +0100
Message-Id: <20211102145116.123072-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for 5.16
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

Hi Linus,

please consider pulling the following gfs2 fixes for 5.16.  These are on
top of the memory map + page fault fixes from my first pull request
earlier today.

Thanks,
Andreas

The following changes since commit b01b2d72da25c000aeb124bc78daf3fb998be2b6:

  gfs2: Fix mmap + page fault deadlocks for direct I/O (2021-10-25 08:42:14 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.15-rc5-fixes

for you to fetch changes up to e34e6f8133b8c783a44c235b843e9046e55adbf0:

  gfs2: Fix unused value warning in do_gfs2_set_flags() (2021-10-25 08:42:20 +0200)

----------------------------------------------------------------
Changes in gfs2:

* Fix a locking order inversion between the inode and iopen glocks in
  gfs2_inode_lookup.

* Implement proper queuing of glock holders for glocks that require
  instantiation (like reading an inode or bitmap blocks from disk).
  Before, multiple glock holders could race with each other and
  half-initialized objects could be exposed; the GL_SKIP flag further
  exacerbated this problem.

* Fix a rare deadlock between inode lookup / creation and remote delete
  work.

* Fix a rare scheduling-while-atomic bug in dlm during glock hash table
  walks.

* Various other minor fixes and cleanups.

----------------------------------------------------------------
Alexander Aring (1):
      gfs2: check context in gfs2_glock_put

Andreas Gruenbacher (4):
      gfs2: Save ip from gfs2_glock_nq_init
      gfs2: Remove 'first' trace_gfs2_promote argument
      gfs2: Cancel remote delete work asynchronously
      gfs2: Fix glock_hash_walk bugs

Bob Peterson (15):
      gfs2: remove redundant check in gfs2_rgrp_go_lock
      gfs2: Add GL_SKIP holder flag to dump_holder
      gfs2: move GL_SKIP check from glops to do_promote
      gfs2: Switch some BUG_ON to GLOCK_BUG_ON for debug
      gfs2: Allow append and immutable bits to coexist
      gfs2: dequeue iopen holder in gfs2_inode_lookup error
      gfs2: dump glocks from gfs2_consist_OBJ_i
      gfs2: change go_lock to go_instantiate
      gfs2: re-factor function do_promote
      gfs2: further simplify do_promote
      gfs2: split glock instantiation off from do_promote
      gfs2: fix GL_SKIP node_scope problems
      gfs2: Eliminate GIF_INVALID flag
      gfs2: remove RDF_UPTODATE flag
      gfs2: set glock object after nq

Tim Gardner (1):
      gfs2: Fix unused value warning in do_gfs2_set_flags()

 fs/gfs2/file.c       |  11 +---
 fs/gfs2/glock.c      | 163 +++++++++++++++++++++++++++++++++++----------------
 fs/gfs2/glock.h      |  14 ++++-
 fs/gfs2/glops.c      |  29 ++++-----
 fs/gfs2/incore.h     |   6 +-
 fs/gfs2/inode.c      |  12 ++--
 fs/gfs2/rgrp.c       |  70 ++++++++++------------
 fs/gfs2/rgrp.h       |   2 +-
 fs/gfs2/super.c      |   4 +-
 fs/gfs2/trace_gfs2.h |   9 +--
 fs/gfs2/util.c       |   2 +
 11 files changed, 186 insertions(+), 136 deletions(-)

