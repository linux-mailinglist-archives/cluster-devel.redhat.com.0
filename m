Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C742269F3DD
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Feb 2023 13:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677067330;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=++GzkLA+HCfYOivpamIxJEw6V9D0JZbB6YQWY7JbZ1Y=;
	b=g8YXoKoXVm4Ma5GOWyxReYx5ugO5j820Wk2y+keSy8ghueEOnR1wP96/lVsU3E+bAyP20t
	KqGbu+tHk87TdW/av3TluWsF7jxgcgS13mUdHhbTWseOMMnTgQ7oeebHOirbcTT0NnGudA
	81aOhRykF378KPYYme9HqRrSqprlXGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-byuaVLfmNsaPushg-d17Ug-1; Wed, 22 Feb 2023 07:02:07 -0500
X-MC-Unique: byuaVLfmNsaPushg-d17Ug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7548C1991C42;
	Wed, 22 Feb 2023 12:02:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25F1A492B00;
	Wed, 22 Feb 2023 12:02:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E624A194658F;
	Wed, 22 Feb 2023 12:02:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 046CE1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 22 Feb 2023 12:01:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDA042166B29; Wed, 22 Feb 2023 12:01:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C72F62166B26;
 Wed, 22 Feb 2023 12:01:07 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Feb 2023 13:01:06 +0100
Message-Id: <20230222120106.144326-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fixes.

These fixes are based on the latest iomap-for-next branch, for which
Darrick has sent a pull request earlier today:

https://lore.kernel.org/linux-fsdevel/167703901677.1909640.1798642413122202835.stg-ugh@magnolia/

Thanks,
Andreas


The following changes since commit 63510d9f2f6e6337960499a3d72d5a457b19c287:

  Merge branch 'iomap-for-next' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git (2023-01-24 12:51:39 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.2-rc5-fixes

for you to fetch changes up to c1b0c3cfcbad25d2c412863c27638c933f1d911b:

  gfs2: Convert gfs2_page_add_databufs to folios (2023-02-22 12:06:20 +0100)

----------------------------------------------------------------
gfs2 fixes

- Fix a race when disassociating inodes from their glocks after
  iget_failed().

- On filesystems with a block size smaller than the page size, make
  sure that ->writepages() writes out all buffers of journaled inodes.

- Various improvements to the way the delete workqueue is drained to
  speed up unmount and prevent leftover inodes.  At unmount time, evict
  deleted inodes cooperatively across the cluster to avoid unnecessary
  timeouts.

- Various minor cleanups and fixes.

----------------------------------------------------------------
Andreas Gruenbacher (12):
      gfs2: gl_object races fix
      gfs2: Improve gfs2_upgrade_iopen_glock comment
      gfs2: Clean up gfs2_scan_glock_lru
      gfs2: Make glock lru list scanning safer
      gfs2: Get rid of GLF_PENDING_DELETE flag
      gfs2: Move delete workqueue into super block
      gfs2: Split the two kinds of glock "delete" work
      gfs2: Flush delete work before shrinking inode cache
      gfs2: Evict inodes cooperatively
      gfs2: Improve gfs2_make_fs_rw error handling
      gfs2: jdata writepage fix
      gfs2: Convert gfs2_page_add_databufs to folios

Bob Peterson (4):
      gfs2: check gl_object in rgrp glops
      gfs2: Add SDF_DEACTIVATING super block flag
      gfs2: Cease delete work during unmount
      Revert "GFS2: free disk inode which is deleted by remote node -V2"

 fs/gfs2/aops.c       |   9 ++--
 fs/gfs2/aops.h       |   4 +-
 fs/gfs2/bmap.c       |   4 +-
 fs/gfs2/dentry.c     |  18 --------
 fs/gfs2/glock.c      | 128 +++++++++++++++++++++++++--------------------------
 fs/gfs2/glock.h      |   4 +-
 fs/gfs2/glops.c      |  21 ++++-----
 fs/gfs2/incore.h     |  11 ++++-
 fs/gfs2/inode.c      |   8 ++++
 fs/gfs2/ops_fstype.c |  71 +++++++++++++++++++++++++++-
 fs/gfs2/rgrp.c       |   2 +-
 fs/gfs2/super.c      |  49 ++++++++++++++------
 fs/gfs2/sys.c        |   2 +
 13 files changed, 204 insertions(+), 127 deletions(-)

