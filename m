Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B57471C2
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Jul 2023 14:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688475080;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PZk500Vjo2zHZFB6Duq7QLOSIloUgOYsIqbl08CJolY=;
	b=OKDvB6E4NqDPdGLIwgFm7UZgD4eNQYIezZtrUFA05SokJImw5FvSt7xSyQVv0aTBoEYFuS
	kT/UkdcwZbfbIoL6ZZdRacrg99VRWwbTtsf1vnvW9X6WfBHo9jOJlJUSNn7rCaVdpi6+Bw
	sctxa6zroLfutIUc0z7NfRm1v2KYlCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-Ny0TWNsZPNeRbrCqqnAqlg-1; Tue, 04 Jul 2023 08:51:17 -0400
X-MC-Unique: Ny0TWNsZPNeRbrCqqnAqlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D05B185A7A8;
	Tue,  4 Jul 2023 12:51:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8907540C2063;
	Tue,  4 Jul 2023 12:51:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 58FC7194658D;
	Tue,  4 Jul 2023 12:51:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 780391946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Jul 2023 12:51:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1EC1D4CD0C9; Tue,  4 Jul 2023 12:51:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55EED492C13;
 Tue,  4 Jul 2023 12:51:12 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue,  4 Jul 2023 14:51:11 +0200
Message-Id: <20230704125111.3148799-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fixes.

Thanks a lot,
Andreas

The following changes since commit 0bdd0f0bf17c5aac16f348ee4b1ebf23d1ec1649:

  Merge tag 'gfs2-v6.4-rc4-fix' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2023-06-06 05:49:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.4-rc5-fixes

for you to fetch changes up to 432928c9377959684c748a9bc6553ed2d3c2ea4f:

  gfs2: Add quota_change type (2023-07-03 22:30:48 +0200)

----------------------------------------------------------------
gfs2 fixes

- Move the freeze/thaw logic from glock callback context to process /
  worker thread context to prevent deadlocks.

- Fix a quota reference couting bug in do_qc().

- Carry on deallocating inodes even when gfs2_rindex_update() fails.

- Retry filesystem-internal reads when they are interruped by a signal.

- Eliminate kmap_atomic() in favor of kmap_local_page() /
  memcpy_{from,to}_page().

- Get rid of noop_direct_IO.

- And a few more minor fixes and cleanups.

----------------------------------------------------------------
Andreas Gruenbacher (12):
      gfs2: retry interrupted internal reads
      gfs2: Rename remaining "transaction" glock references
      gfs2: Rename the {freeze,thaw}_super callbacks
      gfs2: Rename gfs2_freeze_lock{ => _shared }
      gfs2: Reconfiguring frozen filesystem already rejected
      gfs2: Rename SDF_{FS_FROZEN => FREEZE_INITIATOR}
      gfs2: Rework freeze / thaw logic
      gfs2: Replace sd_freeze_state with SDF_FROZEN flag
      gfs2: gfs2_freeze_lock_shared cleanup
      gfs: Get rid of unnucessary locking in inode_go_dump
      gfs2: Convert remaining kmap_atomic calls to kmap_local_page
      gfs2: Use memcpy_{from,to}_page where appropriate

Bob Peterson (8):
      gfs2: simplify gdlm_put_lock with out_free label
      gfs2: fix minor comment typos
      gfs2: ignore rindex_update failure in dinode_dealloc
      gfs2: Fix gfs2_qa_get imbalance in gfs2_quota_hold
      gfs2: Update rl_unlinked before releasing rgrp lock
      gfs2: Don't remember delete unless it's successful
      gfs2: Fix duplicate should_fault_in_pages() call
      gfs2: Add quota_change type

Christoph Hellwig (1):
      gfs2: set FMODE_CAN_ODIRECT instead of a dummy direct_IO method

Deepak R Varma (1):
      gfs2: Replace deprecated kmap_atomic with kmap_local_page

Tuo Li (1):
      gfs2: Fix possible data races in gfs2_show_options()

 fs/gfs2/aops.c       |  19 +++--
 fs/gfs2/bmap.c       |   4 +-
 fs/gfs2/file.c       |   5 +-
 fs/gfs2/glock.c      |   4 +-
 fs/gfs2/glops.c      |  69 ++++++-----------
 fs/gfs2/incore.h     |  12 +--
 fs/gfs2/lock_dlm.c   |  23 +++---
 fs/gfs2/log.c        |  11 +--
 fs/gfs2/lops.c       |  21 +++--
 fs/gfs2/ops_fstype.c |  15 +---
 fs/gfs2/quota.c      |  26 ++++---
 fs/gfs2/recovery.c   |  28 +++----
 fs/gfs2/rgrp.c       |   2 +-
 fs/gfs2/super.c      | 215 ++++++++++++++++++++++++++++++++++++---------------
 fs/gfs2/super.h      |   1 +
 fs/gfs2/sys.c        |   4 +-
 fs/gfs2/trans.c      |   3 +-
 fs/gfs2/util.c       |  49 ++++--------
 fs/gfs2/util.h       |   3 +-
 19 files changed, 277 insertions(+), 237 deletions(-)

