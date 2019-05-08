Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F96178C9
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 13:49:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A06C301EA82;
	Wed,  8 May 2019 11:49:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D919C600D4;
	Wed,  8 May 2019 11:49:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F31A33FB11;
	Wed,  8 May 2019 11:49:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48BnCWM024918 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 07:49:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03F9060C93; Wed,  8 May 2019 11:49:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F199D60C6C
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 11:49:08 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 807AB89C36
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 11:49:08 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id g80so1369492otg.12
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 04:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=UiE/dtL+DxzJlyZjaLoLZA2ogaq5/eux+wRF3qdxndo=;
	b=qD/B8bnGZB+rJdbZZs0JsdbmGUvS5PKaYpWmELbNlFwDfNSNuUItAohIF5KGvo7g+w
	hbyweC2kNqKZ/w4cZ5950NdpHqdyPAOuaMC1Jx3Ri5kz+ix0gYYG5mRyYpnJ6yKd2/Dp
	yz2S4MpAeCWywNvyzoBF/87zXvhdsgwy3kNHG2F1QsG0bjVupiVJgwXXItElhoa8SAK4
	LBouug4EH/25m6V3JNiFp3mjHuE7gJuJez+xFSBtZfHZuUf0XdW+HJUVD7lNhFMzCy/U
	P+A6hj4Kg+eHUErzNmTcHr2+IIFh0sCUiUw41lw2rLytnO43jAZwvDhW49eVh/LexcfM
	BX0w==
X-Gm-Message-State: APjAAAW5AVQ8DJ7chHAj6dBB3DjBR9boCt7DOXRtKJnWh1uzdyzBwZZK
	vsJYoDgLNXfiNu3lOiMZkc8jxB3sTXAjMXpPyRb8eisy9RCwD+MmHcW1asxthdjEdriBS1FUCft
	+qmqWkSniweYhxDk8p/ITqDY5Ir/shRXZ4cv6gQ==
X-Received: by 2002:a54:4f02:: with SMTP id e2mr1834389oiy.10.1557316147420;
	Wed, 08 May 2019 04:49:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxluCoCeUr0XTO0miGV4Vy0BPUjHo8v1sjoZvLpTNp1hAZYGq6eM2jOpvAoF/P55Rr+c9MuiQ/KP2SrGhcbsNk=
X-Received: by 2002:a54:4f02:: with SMTP id e2mr1834383oiy.10.1557316147176;
	Wed, 08 May 2019 04:49:07 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 8 May 2019 13:48:56 +0200
Message-ID: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [Cluster-devel] GFS2: Pull Request
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 08 May 2019 11:49:29 +0000 (UTC)

Hi Linus,

please consider pulling the following changes for the GFS2 file system.

There was a conflict with commit 2b070cfe582b ("block: remove the i
argument to bio_for_each_segment_all") on Jens's block layer changes
which you've already merged. I've resolved that by merging those block
layer changes; please let me know if you want this done differently.

Thanks,
Andreas

The following changes since commit b4b52b881cf08e13d110eac811d4becc0775abbf:

  Merge tag 'Wimplicit-fallthrough-5.2-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux
(2019-05-07 12:48:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
tags/gfs2-for-5.2

for you to fetch changes up to dd665ce42728aa985ec4c7002ffe8690cde74c54:

  Merge tag 'for-5.2/block-20190507' of
git://git.kernel.dk/linux-block (2019-05-08 10:30:57 +0200)

----------------------------------------------------------------
We've got the following patches ready for this merge window:

"gfs2: Fix loop in gfs2_rbm_find (v2)"

  A rework of a fix we ended up reverting in 5.0 because of an iozone
  performance regression.

"gfs2: read journal in large chunks" and
"gfs2: fix race between gfs2_freeze_func and unmount"

  An improved version of a commit we also ended up reverting in 5.0
  because of a regression in xfstest generic/311.  It turns out that the
  journal changes were mostly innocent and that unfreeze didn't wait for
  the freeze to complete, which caused the filesystem to be unmounted
  before it was actually idle.

"gfs2: Fix occasional glock use-after-free"
"gfs2: Fix iomap write page reclaim deadlock"
"gfs2: Fix lru_count going negative"

  Fixes for various problems reported and partially fixed by Citrix
  engineers.  Thank you very much.

"gfs2: clean_journal improperly set sd_log_flush_head"

  Another fix from Bob.

A few other minor cleanups.

----------------------------------------------------------------
Abhi Das (2):
      gfs2: fix race between gfs2_freeze_func and unmount
      gfs2: read journal in large chunks

Andreas Gruenbacher (8):
      gfs2: Fix loop in gfs2_rbm_find (v2)
      gfs2: Fix occasional glock use-after-free
      gfs2: Remove misleading comments in gfs2_evict_inode
      gfs2: Remove unnecessary extern declarations
      gfs2: Rename sd_log_le_{revoke,ordered}
      gfs2: Rename gfs2_trans_{add_unrevoke => remove_revoke}
      gfs2: Fix iomap write page reclaim deadlock
      Merge tag 'for-5.2/block-20190507' of git://git.kernel.dk/linux-block

Bob Peterson (2):
      gfs2: clean_journal improperly set sd_log_flush_head
      gfs2: Replace gl_revokes with a GLF flag

Ross Lagerwall (1):
      gfs2: Fix lru_count going negative

 fs/gfs2/aops.c       |  14 ++-
 fs/gfs2/bmap.c       | 118 ++++++++++++++---------
 fs/gfs2/bmap.h       |   1 +
 fs/gfs2/dir.c        |   2 +-
 fs/gfs2/glock.c      |  25 +++--
 fs/gfs2/glops.c      |   3 +-
 fs/gfs2/incore.h     |   9 +-
 fs/gfs2/log.c        |  47 ++++++----
 fs/gfs2/log.h        |   5 +-
 fs/gfs2/lops.c       | 260 ++++++++++++++++++++++++++++++++++++++++++++++-----
 fs/gfs2/lops.h       |  11 +--
 fs/gfs2/main.c       |   1 -
 fs/gfs2/ops_fstype.c |   7 +-
 fs/gfs2/recovery.c   | 135 ++------------------------
 fs/gfs2/recovery.h   |   4 +-
 fs/gfs2/rgrp.c       |  56 ++++++-----
 fs/gfs2/super.c      |  20 ++--
 fs/gfs2/trans.c      |   4 +-
 fs/gfs2/trans.h      |   2 +-
 fs/gfs2/xattr.c      |   6 +-
 20 files changed, 437 insertions(+), 293 deletions(-)

