Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 107CE1F1D68
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591634037;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CETIjDgGDpjjFlSZ8hriJ5JQ/wPNDNhmAqik9r4TPeA=;
	b=ab5HiRAZfetQ2amATJXBlbjzYtYPI3eRNHLD79kpNaUaFyX19+cjR0CW0zWPKfEBkNrQJl
	Ctmn5/5hw1cXb8bikU9FqZEkObni8fcQ9+9Y4+mMmZAtID5KTATF6HxYYHpc9CHDwo4eSr
	0WGdqhbL3/gQCDHV/tWdP5bEN93BZ4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-IWD_wsZhOZqZvRySB3yBbA-1; Mon, 08 Jun 2020 12:33:55 -0400
X-MC-Unique: IWD_wsZhOZqZvRySB3yBbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5D3C93F89;
	Mon,  8 Jun 2020 16:32:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9300C89261;
	Mon,  8 Jun 2020 16:32:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 045BAADA98;
	Mon,  8 Jun 2020 16:32:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058GWtLO017588 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:32:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C694D5D9EF; Mon,  8 Jun 2020 16:32:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD6865D9C9;
	Mon,  8 Jun 2020 16:32:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon,  8 Jun 2020 18:32:50 +0200
Message-Id: <20200608163250.550547-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 changes for 5.8
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi Linus,

please consider pulling the following gfs2 changes for 5.8.

Thanks a lot,
Andreas

The following changes since commit 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162:

  Linux 5.7 (2020-05-31 16:49:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.8

for you to fetch changes up to 300e549b6e53025ea69550f009451f7a13bfc3eb:

  Merge branch 'gfs2-iopen' into for-next (2020-06-05 21:25:36 +0200)

----------------------------------------------------------------
Changes in gfs2:

- An iopen glock locking scheme rework that speeds up deletes of
  inodes accessed from multiple nodes.
- Various bug fixes and debugging improvements.
- Convert gfs2-glocks.txt to ReST.

----------------------------------------------------------------
Andreas Gruenbacher (10):
      gfs2: Keep track of deleted inode generations in LVBs
      gfs2: Turn gl_delete into a delayed work
      gfs2: Give up the iopen glock on contention
      gfs2: Try harder to delete inodes locally
      gfs2: Minor gfs2_lookup_by_inum cleanup
      gfs2: Move inode generation number check into gfs2_inode_lookup
      gfs2: Check inode generation number in delete_work_func
      gfs2: Wake up when setting GLF_DEMOTE
      gfs2: Smarter iopen glock waiting
      Merge branch 'gfs2-iopen' into for-next

Bob Peterson (10):
      gfs2: Don't ignore inode write errors during inode_go_sync
      gfs2: Allow lock_nolock mount to specify jid=X
      gfs2: Only do glock put in gfs2_create_inode for free inodes
      gfs2: print mapping->nrpages in glock dump for address space glocks
      gfs2: introduce new gfs2_glock_assert_withdraw
      gfs2: instrumentation wrt log_flush stuck
      gfs2: Allow ASPACE glocks to also have an lvb
      gfs2: initialize transaction tr_ailX_lists earlier
      gfs2: new slab for transactions
      gfs2: fix use-after-free on transaction ail lists

Mauro Carvalho Chehab (1):
      docs: filesystems: convert gfs2-glocks.txt to ReST

 .../{gfs2-glocks.txt => gfs2-glocks.rst}           | 149 ++++++++-------
 Documentation/filesystems/index.rst                |   1 +
 MAINTAINERS                                        |   2 +-
 fs/gfs2/export.c                                   |   4 +-
 fs/gfs2/glock.c                                    | 208 ++++++++++++++++++---
 fs/gfs2/glock.h                                    |  16 ++
 fs/gfs2/glops.c                                    |  21 ++-
 fs/gfs2/incore.h                                   |   9 +-
 fs/gfs2/inode.c                                    |  47 +++--
 fs/gfs2/inode.h                                    |   2 +-
 fs/gfs2/log.c                                      |  56 ++++--
 fs/gfs2/main.c                                     |   9 +
 fs/gfs2/ops_fstype.c                               |   2 +-
 fs/gfs2/rgrp.c                                     |   2 +-
 fs/gfs2/super.c                                    |  72 ++++++-
 fs/gfs2/trans.c                                    |  21 ++-
 fs/gfs2/trans.h                                    |   1 +
 fs/gfs2/util.c                                     |   1 +
 fs/gfs2/util.h                                     |   1 +
 include/uapi/linux/gfs2_ondisk.h                   |   6 +
 20 files changed, 489 insertions(+), 141 deletions(-)
 rename Documentation/filesystems/{gfs2-glocks.txt => gfs2-glocks.rst} (63%)

