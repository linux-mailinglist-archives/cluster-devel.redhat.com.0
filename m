Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C06E8A7
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Jul 2019 18:22:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38C3330C34DE;
	Fri, 19 Jul 2019 16:22:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE602619BB;
	Fri, 19 Jul 2019 16:22:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53FFC4E590;
	Fri, 19 Jul 2019 16:22:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6JGMQM3004778 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 12:22:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 980261001B14; Fri, 19 Jul 2019 16:22:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5438B1001B33;
	Fri, 19 Jul 2019 16:22:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2568A30821C0;
	Fri, 19 Jul 2019 16:22:22 +0000 (UTC)
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9490A21872;
	Fri, 19 Jul 2019 16:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563553341;
	bh=ToqDnWrzKDf8scCUPMiKsBcInlWhLezxA4/NkXNmy6k=;
	h=Date:From:To:Cc:Subject:From;
	b=pSwIfwW4L2MkuF9bTjuPLeJp21+1X1lYJC+rcDxzPI+Kl7EYPVdxjoweiKGglut88
	xj6kksnmPTgsmGuOMlMV8pvCbPDHG23LAgCfrRVAAgm8qOdwpxAtN22uxL6DaCXoGA
	9eHaj4KDy2pN1mtZMW+VulcK8aRKauP2ZYbuet2g=
Date: Fri, 19 Jul 2019 09:22:21 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190719162221.GF7093@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 19 Jul 2019 16:22:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 19 Jul 2019 16:22:22 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'djwong@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: cleanups for 5.3 (part 2)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 19 Jul 2019 16:22:35 +0000 (UTC)

Hi Linus,

As promised, here's the second part of the iomap merge for 5.3, in which
we break up iomap.c into smaller files grouped by functional area so
that it'll be easier in the long run to maintain cohesiveness of code
units and to review incoming patches.  There are no functional changes
and fs/iomap.c split cleanly.

Note that this refactoring series has been lurking in for-next during
the merge window, but I rebased the series a couple of days ago to pick
up all the fs/iomap.c changes that came in earlier in the merge window
from other trees, and now you don't have to pick up the pieces of a
somewhat messy merge collision. :)

The branch merges cleanly against this morning's HEAD (3bfe1fc46794) and
survived an overnight run of xfstests.  The merge was completely
straightforward, so please let me know if you run into anything weird.

The only weirdness I've seen so far is that the new kernel header
compile test (CONFIG_KERNEL_HEADER_TEST) tries to test-compile iomap.h
even when CONFIG_BLOCK=n and fails, but that combination wouldn't work
even in regular kernel code because iomap is a support library for
filesystems that use block devices.  Masahiro Yamada sent a patch
earlier today to disable the header compile test for now while he
reconsiders its strategy.

--D

The following changes since commit fec88ab0af9706b2201e5daf377c5031c62d11f7:

  Merge tag 'for-linus-hmm' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma (2019-07-14 19:42:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.3-merge-4

for you to fetch changes up to 5d907307adc14cd5148b07629c2b4535acd06062:

  iomap: move internal declarations into fs/iomap/ (2019-07-17 07:21:02 -0700)

----------------------------------------------------------------
Also new for 5.3:
- Regroup the fs/iomap.c code by major functional area so that we can
  start development for 5.4 from a more stable base.

----------------------------------------------------------------
Darrick J. Wong (8):
      iomap: start moving code to fs/iomap/
      iomap: move the swapfile code into a separate file
      iomap: move the file mapping reporting code into a separate file
      iomap: move the SEEK_HOLE code into a separate file
      iomap: move the direct IO code into a separate file
      iomap: move the buffered IO code into a separate file
      iomap: move the main iteration code into a separate file
      iomap: move internal declarations into fs/iomap/

 MAINTAINERS            |    1 +
 fs/Makefile            |    2 +-
 fs/dax.c               |    1 -
 fs/internal.h          |   10 -
 fs/iomap.c             | 2205 ------------------------------------------------
 fs/iomap/Makefile      |   15 +
 fs/iomap/apply.c       |   74 ++
 fs/iomap/buffered-io.c | 1073 +++++++++++++++++++++++
 fs/iomap/direct-io.c   |  562 ++++++++++++
 fs/iomap/fiemap.c      |  144 ++++
 fs/iomap/seek.c        |  212 +++++
 fs/iomap/swapfile.c    |  178 ++++
 include/linux/iomap.h  |   17 +
 13 files changed, 2277 insertions(+), 2217 deletions(-)
 delete mode 100644 fs/iomap.c
 create mode 100644 fs/iomap/Makefile
 create mode 100644 fs/iomap/apply.c
 create mode 100644 fs/iomap/buffered-io.c
 create mode 100644 fs/iomap/direct-io.c
 create mode 100644 fs/iomap/fiemap.c
 create mode 100644 fs/iomap/seek.c
 create mode 100644 fs/iomap/swapfile.c

