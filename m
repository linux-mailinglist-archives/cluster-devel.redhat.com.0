Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A7442FB9
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 15:02:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635861760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZIml53bo0PEw+1GPldGqxvXRU9sgyca3MuCiU7dOmOM=;
	b=bUZPQSiUk4lycrlAi2IJvY3eKv/OoPVWya6Uh2XjhzhJhNK8+1o8+Rw46rvrhti9KkoaES
	R4610IKBTAhhVA4kn0TEb9CvW9ajdrMzfSeoPvdLgaGa5R3oYluI/E+YnwRconI4ENlwqA
	l+3E137GYrT5o6JgYNEwdjrdLJhYViU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-zaVl480lMCWwcWw5NWj3ag-1; Tue, 02 Nov 2021 10:02:37 -0400
X-MC-Unique: zaVl480lMCWwcWw5NWj3ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5BEE19251AB;
	Tue,  2 Nov 2021 14:02:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 057F860D30;
	Tue,  2 Nov 2021 14:02:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 826704A704;
	Tue,  2 Nov 2021 14:02:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2DsaWq021374 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 09:54:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39D9C100751A; Tue,  2 Nov 2021 13:54:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBD771017CF5;
	Tue,  2 Nov 2021 13:54:23 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue,  2 Nov 2021 14:54:22 +0100
Message-Id: <20211102135422.121093-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [GIT PULL] gfs2: Fix mmap + page fault deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling these fixes for the gfs2 memory map + page fault
deadlocks.

Stephen Rothwell has pointed out the following merge conflict between
commit:

  bb523b406c84 ("gup: Turn fault_in_pages_{readable,writeable} into fault_in_{readable,writeable}")

from this patch set and the following two commits in your tree:

  fcfb7163329c ("x86/fpu/signal: Move xstate clearing out of copy_fpregs_to_sigframe()")
  a2a8fd9a3efd ("x86/fpu/signal: Change return code of restore_fpregs_from_user() to boolean")

This is due to the fault_in_{pages_ =>}readable rename, and commit
fcfb7163329c eliminating the call to fault_in_pages_writeable() from
copy_fpstate_to_sigframe().  Stephen's conflict notification can be
found here:

https://lore.kernel.org/linux-next/20211015150420.617125bd@canb.auug.org.au/

Thanks,
Andreas


The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:

  Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.15-rc5-mmap-fault

for you to fetch changes up to b01b2d72da25c000aeb124bc78daf3fb998be2b6:

  gfs2: Fix mmap + page fault deadlocks for direct I/O (2021-10-25 08:42:14 +0200)

----------------------------------------------------------------
gfs2: Fix mmap + page fault deadlocks

Functions gfs2_file_read_iter and gfs2_file_write_iter are both
accessing the user buffer to write to or read from while holding the
inode glock.  In the most basic scenario, that buffer will not be
resident and it will be mapped to the same file.  Accessing the buffer
will trigger a page fault, and gfs2 will deadlock trying to take the
same inode glock again while trying to handle that fault.

Fix that and similar, more complex scenarios by disabling page faults
while accessing user buffers.  To make this work, introduce a small
amount of new infrastructure and fix some bugs that didn't trigger so
far, with page faults enabled.

----------------------------------------------------------------
Andreas Gruenbacher (16):
      iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
      powerpc/kvm: Fix kvm_use_magic_page
      gup: Turn fault_in_pages_{readable,writeable} into fault_in_{readable,writeable}
      iov_iter: Turn iov_iter_fault_in_readable into fault_in_iov_iter_readable
      iov_iter: Introduce fault_in_iov_iter_writeable
      gfs2: Add wrapper for iomap_file_buffered_write
      gfs2: Clean up function may_grant
      gfs2: Move the inode glock locking to gfs2_file_buffered_write
      gfs2: Eliminate ip->i_gh
      gfs2: Fix mmap + page fault deadlocks for buffered I/O
      iomap: Fix iomap_dio_rw return value for user copies
      iomap: Support partial direct I/O on user copy failures
      iomap: Add done_before argument to iomap_dio_rw
      gup: Introduce FOLL_NOFAULT flag to disable page faults
      iov_iter: Introduce nofault flag to disable page faults
      gfs2: Fix mmap + page fault deadlocks for direct I/O

Bob Peterson (1):
      gfs2: Introduce flag for glock holder auto-demotion

 arch/powerpc/kernel/kvm.c           |   3 +-
 arch/powerpc/kernel/signal_32.c     |   4 +-
 arch/powerpc/kernel/signal_64.c     |   2 +-
 arch/x86/kernel/fpu/signal.c        |   7 +-
 drivers/gpu/drm/armada/armada_gem.c |   7 +-
 fs/btrfs/file.c                     |   7 +-
 fs/btrfs/ioctl.c                    |   5 +-
 fs/erofs/data.c                     |   2 +-
 fs/ext4/file.c                      |   5 +-
 fs/f2fs/file.c                      |   2 +-
 fs/fuse/file.c                      |   2 +-
 fs/gfs2/bmap.c                      |  60 +------
 fs/gfs2/file.c                      | 252 ++++++++++++++++++++++++---
 fs/gfs2/glock.c                     | 330 +++++++++++++++++++++++++++---------
 fs/gfs2/glock.h                     |  20 +++
 fs/gfs2/incore.h                    |   4 +-
 fs/iomap/buffered-io.c              |   2 +-
 fs/iomap/direct-io.c                |  29 +++-
 fs/ntfs/file.c                      |   2 +-
 fs/ntfs3/file.c                     |   2 +-
 fs/xfs/xfs_file.c                   |   6 +-
 fs/zonefs/super.c                   |   4 +-
 include/linux/iomap.h               |  11 +-
 include/linux/mm.h                  |   3 +-
 include/linux/pagemap.h             |  58 +------
 include/linux/uio.h                 |   4 +-
 lib/iov_iter.c                      | 103 ++++++++---
 mm/filemap.c                        |   4 +-
 mm/gup.c                            | 139 ++++++++++++++-
 29 files changed, 793 insertions(+), 286 deletions(-)

