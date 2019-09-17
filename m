Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123EB5154
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Sep 2019 17:22:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D1EE308AA12;
	Tue, 17 Sep 2019 15:22:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5862F60BE1;
	Tue, 17 Sep 2019 15:22:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D6CD4EE6A;
	Tue, 17 Sep 2019 15:22:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HFLipb010162 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 11:21:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA5521001B22; Tue, 17 Sep 2019 15:21:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD7991001B05;
	Tue, 17 Sep 2019 15:21:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D922510CC1F6;
	Tue, 17 Sep 2019 15:21:40 +0000 (UTC)
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 53E1F2171F;
	Tue, 17 Sep 2019 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568733700;
	bh=wpzbNHazTaZFk4ufsoQVUeBGVtbQGktyi+fGFo9LDxA=;
	h=Date:From:To:Cc:Subject:From;
	b=qW9mDyWYB7KlMPnnl9SXmaxZt+brxj9yMmZlQ4Z/tI5Iu6ef8vDTZQ+ODciGSUjod
	KZ14r4+/i7BBWrf1z3Qj/stOyAgESheg3g3r5aUUc3Cp3t7myWQkxGXL9ic8ltszss
	6QRSa1d8z+PpJKaE6g40sTOzggjwYJYUzHbf5pvA=
Date: Tue, 17 Sep 2019 08:21:40 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190917152140.GU2229799@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Tue, 17 Sep 2019 15:21:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Tue, 17 Sep 2019 15:21:41 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'djwong@kernel.org' RCPT:''
X-RedHat-Spam-Score: -3.101  (BODY_QUOTE_MALF_MSGID, DKIMWL_WL_HIGH,
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: new code for 5.4
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 17 Sep 2019 15:22:05 +0000 (UTC)

Hi Linus,

Please pull this series containing all the new iomap code for 5.4.  The
biggest change here is porting some of XFS' writeback code to iomap so
that we can share it with other filesystems; and making some adjustments
to the iomap directio code in preparation for other filesystems starting
to use it.  In 5.5 we hope to finish converting XFS to iomap and to
start converting a few other filesystems.

The branch merges cleanly against this morning's HEAD and survived a
couple of weeks' worth of xfstests.  The merge was completely
straightforward, so please let me know if you run into anything weird.

--D

The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.4-merge-4

for you to fetch changes up to 68494b8e248fe8a7b6e9f88edd9a87661760ddb9:

  iomap: move the iomap_dio_rw ->end_io callback into a structure (2019-09-03 08:28:22 -0700)

----------------------------------------------------------------
New code for 5.4:
- Port the XFS writeback code to iomap with the eventual goal of
  converting XFS to use it.
- Clean up a few odds and ends in xfs writeback and convert the xfs
  ioend code to use list_pop and friends.
- Report both io errors and short io results to the directio endio
  handler.
- Allow directio callers to pass an ops structure to iomap_dio_rw.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      iomap: Fix trivial typo

Christoph Hellwig (9):
      list.h: add list_pop and list_pop_entry helpers
      iomap: copy the xfs writeback code to iomap.c
      iomap: add tracing for the address space operations
      iomap: warn on inline maps in iomap_writepage_map
      xfs: set IOMAP_F_NEW more carefully
      iomap: zero newly allocated mapped blocks
      xfs: initialize iomap->flags in xfs_bmbt_to_iomap
      xfs: refactor the ioend merging code
      iomap: move the iomap_dio_rw ->end_io callback into a structure

Matthew Bobrowski (1):
      iomap: split size and error for iomap_dio_rw ->end_io

Randy Dunlap (1):
      tracing: fix iomap.h build warnings

 fs/iomap/buffered-io.c       | 575 ++++++++++++++++++++++++++++++++++++++++++-
 fs/iomap/direct-io.c         |  24 +-
 fs/xfs/xfs_aops.c            |  70 +++---
 fs/xfs/xfs_file.c            |  14 +-
 fs/xfs/xfs_iomap.c           |  35 ++-
 fs/xfs/xfs_iomap.h           |   2 +-
 fs/xfs/xfs_pnfs.c            |   2 +-
 include/linux/iomap.h        |  53 +++-
 include/linux/list.h         |  33 +++
 include/trace/events/iomap.h |  87 +++++++
 10 files changed, 824 insertions(+), 71 deletions(-)
 create mode 100644 include/trace/events/iomap.h

