Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD94180CB
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 22:03:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E174D3082B40;
	Wed,  8 May 2019 20:03:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B64919C77;
	Wed,  8 May 2019 20:03:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7160141F58;
	Wed,  8 May 2019 20:02:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48K2f9I026080 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 16:02:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A24B810027C1; Wed,  8 May 2019 20:02:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A8021001E6C
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 20:02:39 +0000 (UTC)
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDD9A30018C0
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 20:02:37 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id l7so6001791ite.2
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 13:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=NX1dhmAYw30JeP7gm7UfQTk75TfutWH9BZfCbRAaVks=;
	b=dd3UCrpxoIJgvYKNH642z/OFG2Z9mx9sdXDY2HN6ohQS1e8J1aSaiUvqCxCscn/d54
	3p2wKXXUvANJAU6Pmn51j5JgGQeoVTqcpAaLlvR5WgaLj++Ni/SzN5LcWiATgMagY5L1
	86HiKI1Og7CQFfqDTAxhiqcDY34yUXC7R6LPs1Bryb58DcEktWRXY92s1bsWkwR+hfZ+
	ZpfpYVSo29m9KKN/C0moExlmg2RYxwXdeIMMBBFFC1Z0Ij/fyr1JPULjlZI+C5auZE3h
	ubcKrDZajN9se5HTxfLmopjZIWbWymbpnPjJSHEp646ZkzZ9kAViTm/J1zTWYVZd4nIm
	DYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=NX1dhmAYw30JeP7gm7UfQTk75TfutWH9BZfCbRAaVks=;
	b=l58PHKEwyHAvSC2OLAqp4ycC0DXzvU/e0qYhyaiiPm8ZbAeXBxPcIkA7MUO/4+RooE
	OKcRRGs9kle9oSBj0WY62tCCeRjSP4yntjT+5TPRM9z3DuZRBUCqGbh1l41VjEMEECc4
	r1pGqCqfNfUNaiC+bN/FtM5z2cEe2QDQ28bOjN86i3t2Jn58nicr0lakdx5k6jdn0XmQ
	YujkDdWu//OHOhXV/o17teFYlmdqtxG1lc3otdpuK0VmgqKwdV/rHZrhP9/KvXQlPS6K
	nHUmtr3hCbe//zo869rG1C13HN8T2iFPQXqjTUKDCQJwHaSEmLO0/P9Zjujn9gJ/71vO
	TMsQ==
X-Gm-Message-State: APjAAAUlr06IUJCH0Gmx1vAtfEKUiD+bfSFPSjm+SwaqUm0d3nFL0L4c
	SwbMA4xqA5K3Bq1aDwKSfKyjUGeUKBO7i4PEh9wpOYEl
X-Google-Smtp-Source: APXvYqxzeos0igmyj3/52y+62Y7QjVSyBc5Ju0CKx7tiwlhAPYGINm+HW4BRekg3OVqT8qLrIqXxu886Z3hIF2T8vHE=
X-Received: by 2002:a24:4ace:: with SMTP id k197mr5252888itb.46.1557345757167; 
	Wed, 08 May 2019 13:02:37 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 8 May 2019 22:02:26 +0200
Message-ID: <CAHpGcMKxSTuA9vcPXqBCxo2w7aisPM=ZvZ=Yqgcoq+j1MbqBDQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 08 May 2019 20:02:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 08 May 2019 20:02:38 +0000 (UTC) for IP:'209.85.166.174'
	DOMAIN:'mail-it1-f174.google.com' HELO:'mail-it1-f174.google.com'
	FROM:'andreas.gruenbacher@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.166.174 mail-it1-f174.google.com 209.85.166.174
	mail-it1-f174.google.com <andreas.gruenbacher@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [Cluster-devel] GFS2: Pull Request (2nd attempt)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 08 May 2019 20:03:06 +0000 (UTC)

Hi Linus,

please consider pulling the following changes for the GFS2 file
system, now without resolving the merge conflict Stephen Rothwell has
pointed out between commit

  2b070cfe582b ("block: remove the i argument to bio_for_each_segment_all")

which is already merged, interacting with commit

  e21e191994af ("gfs2: read journal in large chunks")

which is part of this pull request. Stephen's suggested resolution of
the conflict can be found at
https://lore.kernel.org/lkml/20190506150707.618f013d@canb.auug.org.au/.

Thanks,
Andreas

The following changes since commit b4b52b881cf08e13d110eac811d4becc0775abbf:

  Merge tag 'Wimplicit-fallthrough-5.2-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux
(2019-05-07 12:48:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
tags/gfs2-for-5.2

for you to fetch changes up to f4686c26ecc34e8e458b8235f0af5198c9b13bfd:

  gfs2: read journal in large chunks (2019-05-07 23:39:15 +0200)

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

Andreas Gruenbacher (7):
      gfs2: Fix loop in gfs2_rbm_find (v2)
      gfs2: Fix occasional glock use-after-free
      gfs2: Remove misleading comments in gfs2_evict_inode
      gfs2: Remove unnecessary extern declarations
      gfs2: Rename sd_log_le_{revoke,ordered}
      gfs2: Rename gfs2_trans_{add_unrevoke => remove_revoke}
      gfs2: Fix iomap write page reclaim deadlock

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
 fs/gfs2/lops.c       | 261 ++++++++++++++++++++++++++++++++++++++++++++++-----
 fs/gfs2/lops.h       |  11 +--
 fs/gfs2/main.c       |   1 -
 fs/gfs2/ops_fstype.c |   7 +-
 fs/gfs2/recovery.c   | 135 ++------------------------
 fs/gfs2/recovery.h   |   4 +-
 fs/gfs2/rgrp.c       |  56 +++++------
 fs/gfs2/super.c      |  20 ++--
 fs/gfs2/trans.c      |   4 +-
 fs/gfs2/trans.h      |   2 +-
 fs/gfs2/xattr.c      |   6 +-
 20 files changed, 438 insertions(+), 293 deletions(-)

