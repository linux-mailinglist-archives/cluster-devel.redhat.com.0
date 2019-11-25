Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E46C8109420
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Nov 2019 20:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574709546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jQzFr20SPEKi7rsmBHnjKAhtu8//zoP5Zwjl8mJOzBE=;
	b=WwDI7mEQzWNMT0i4uD0zQSmEpKo6XBAUC40+NDKdXw4SOXSAtHRlvECCAtz41at3p6ra1X
	CDu1EDOMQacwQOV5oZhjO62wOiFVR2mCPPZFrndcS9OGcQPO5SJYBLN6vFxECbFNy1zHCh
	ryMRwyXLV85S3CX6giiFwouVd8atxAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-6JYUxdhWPcGjKIs_n_Xhvw-1; Mon, 25 Nov 2019 14:19:05 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 766EF80268E;
	Mon, 25 Nov 2019 19:19:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 603C75C1D8;
	Mon, 25 Nov 2019 19:19:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DB4A4BB5C;
	Mon, 25 Nov 2019 19:18:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPJIrQN029714 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 14:18:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D3259117C1D; Mon, 25 Nov 2019 19:18:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE74A117C2A
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 19:18:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E8B21023F8A
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 19:18:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-387-vGlJzFctOXmlNirrYvu8lA-1;
	Mon, 25 Nov 2019 14:18:48 -0500
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 84FC12071E;
	Mon, 25 Nov 2019 19:09:08 +0000 (UTC)
Date: Mon, 25 Nov 2019 11:09:07 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191125190907.GN6219@magnolia>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MC-Unique: vGlJzFctOXmlNirrYvu8lA-1
X-MC-Unique: 6JYUxdhWPcGjKIs_n_Xhvw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAPJIrQN029714
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4 <linux-ext4@vger.kernel.org>, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: new code for 5.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Linus,

Please pull this series containing all the new iomap code for 5.5.  In
this release, we hoisted as much of XFS' writeback code into iomap as
was practicable, refactored the unshare file data function, added the
ability to perform buffered io copy on write, and tweaked various parts
of the directio implementation as needed to port ext4's directio code
(that will be a separate pull).

The branch merges cleanly against this morning's HEAD and survived a few
days' worth of xfstests.  The merge was completely straightforward, so
please let me know if you run into anything weird.  I think there'll be
a second pull request in a week with a few more small cleanups that have
trickled in.

--D

The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675=
:

  Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.5-merge-11

for you to fetch changes up to 419e9c38aa075ed0cd3c13d47e15954b686bcdb6:

  iomap: Fix pipe page leakage during splicing (2019-11-22 08:36:02 -0800)

----------------------------------------------------------------
New code for 5.5:
- Make iomap_dio_rw callers explicitly tell us if they want us to wait
- Port the xfs writeback code to iomap to complete the buffered io
  library functions
- Refactor the unshare code to share common pieces
- Add support for performing copy on write with buffered writes
- Other minor fixes
- Fix unchecked return in iomap_bmap
- Fix a type casting bug in a ternary statement in iomap_dio_bio_actor
- Improve tracepoints for easier diagnostic ability
- Fix pipe page leakage in directio reads

----------------------------------------------------------------
Andreas Gruenbacher (1):
      iomap: Fix overflow in iomap_page_mkwrite

Christoph Hellwig (20):
      xfs: initialize iomap->flags in xfs_bmbt_to_iomap
      xfs: set IOMAP_F_NEW more carefully
      xfs: use a struct iomap in xfs_writepage_ctx
      xfs: refactor the ioend merging code
      xfs: turn io_append_trans into an io_private void pointer
      xfs: remove the fork fields in the writepage_ctx and ioend
      iomap: zero newly allocated mapped blocks
      iomap: lift common tracing code from xfs to iomap
      iomap: lift the xfs writeback code to iomap
      iomap: warn on inline maps in iomap_writepage_map
      iomap: move struct iomap_page out of iomap.h
      iomap: cleanup iomap_ioend_compare
      iomap: pass a struct page to iomap_finish_page_writeback
      iomap: better document the IOMAP_F_* flags
      iomap: remove the unused iomap argument to __iomap_write_end
      iomap: always use AOP_FLAG_NOFS in iomap_write_begin
      iomap: ignore non-shared or non-data blocks in xfs_file_dirty
      iomap: move the zeroing case out of iomap_read_page_sync
      iomap: use write_begin to read pages to unshare
      iomap: renumber IOMAP_HOLE to 0

Darrick J. Wong (3):
      iomap: enhance writeback error message
      iomap: iomap_bmap should check iomap_apply return value
      iomap: trace iomap_appply results

Dave Chinner (1):
      iomap: iomap that extends beyond EOF should be marked dirty

Goldwyn Rodrigues (1):
      iomap: use a srcmap for a read-modify-write I/O

Jan Kara (3):
      iomap: Allow forcing of waiting for running DIO in iomap_dio_rw()
      xfs: Use iomap_dio_rw to wait for unaligned direct IO
      iomap: Fix pipe page leakage during splicing

Jan Stancek (1):
      iomap: fix return value of iomap_dio_bio_actor on 32bit systems

Joseph Qi (1):
      fs/iomap: remove redundant check in iomap_dio_rw()

 fs/dax.c                 |  13 +-
 fs/ext2/inode.c          |   2 +-
 fs/ext4/inode.c          |   2 +-
 fs/gfs2/bmap.c           |   3 +-
 fs/gfs2/file.c           |   6 +-
 fs/iomap/Makefile        |  16 +-
 fs/iomap/apply.c         |  32 +-
 fs/iomap/buffered-io.c   | 756 +++++++++++++++++++++++++++++++++++++++++--=
----
 fs/iomap/direct-io.c     |  24 +-
 fs/iomap/fiemap.c        |  10 +-
 fs/iomap/seek.c          |   4 +-
 fs/iomap/swapfile.c      |   3 +-
 fs/iomap/trace.c         |  12 +
 fs/iomap/trace.h         | 191 ++++++++++++
 fs/xfs/libxfs/xfs_bmap.c |  14 +-
 fs/xfs/libxfs/xfs_bmap.h |   3 +-
 fs/xfs/xfs_aops.c        | 754 ++++++++-----------------------------------=
---
 fs/xfs/xfs_aops.h        |  17 --
 fs/xfs/xfs_file.c        |  13 +-
 fs/xfs/xfs_iomap.c       |  51 +++-
 fs/xfs/xfs_iomap.h       |   2 +-
 fs/xfs/xfs_pnfs.c        |   2 +-
 fs/xfs/xfs_reflink.c     |   2 +-
 fs/xfs/xfs_super.c       |  11 +-
 fs/xfs/xfs_trace.h       |  65 ----
 include/linux/iomap.h    | 129 +++++---
 26 files changed, 1215 insertions(+), 922 deletions(-)
 create mode 100644 fs/iomap/trace.c
 create mode 100644 fs/iomap/trace.h


