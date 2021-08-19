Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59B663F20FF
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 21:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629402333;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KbLSMirlq5Y+iVmHzWlYIbw7fbWKCdO5EJW42CUPvac=;
	b=V2+LDUHxWTvz0jZpaYiDAk63UvAlQojPDYfURdM9i6d5/bJVUZt9vDMAiEjywNa40oDSVM
	mNHCqB6ITwSepnLdGaRAOcoc7elOZFO6BMeUeuDtjc8TadIOf0553eNXrLci3ZbeX9qasu
	2q5m4eNXxobp/pvEu3Gq0tbjiEqX6vQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-76mM5OkzMGuyhI4kZ_nA8w-1; Thu, 19 Aug 2021 15:45:32 -0400
X-MC-Unique: 76mM5OkzMGuyhI4kZ_nA8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DC5D802936;
	Thu, 19 Aug 2021 19:45:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F81460C04;
	Thu, 19 Aug 2021 19:45:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C95B181A0F8;
	Thu, 19 Aug 2021 19:45:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JJfBVF014602 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 15:41:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E47D01B5C0; Thu, 19 Aug 2021 19:41:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56EED1B46B;
	Thu, 19 Aug 2021 19:41:05 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>, Paul Mackerras <paulus@ozlabs.org>
Date: Thu, 19 Aug 2021 21:40:43 +0200
Message-Id: <20210819194102.1491495-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	kvm-ppc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v6 00/19] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi all,

here's another update on top of v5.14-rc6.  Changes:

 * Per request from Linus, change fault_in_{readable,writeable} to
   return the number of bytes *not* faulted in, like copy_to_user() and
   copy_from_user() does.  Convert fault_in_iov_iter_readable and
   fault_in_iov_iter_writeable to those same semantics.

 * Per suggestion from Linus, introduce a new FOLL_NOFAULT flag to
   prevent get_user_pages from faulting in pages.  This is similar to
   FOLL_FAST_ONLY, but less fragile and available on all architectures.
   Use that for turning off page faults during iov_iter_get_pages() and
   iov_iter_get_pages_alloc().

 * Introduce a new HIF_MAY_DEMOTE flag that allows a glock to be taken
   away from a holder when a conflicting locking request comes in.  This
   allows glock holders to hang on to glocks as long as no conflicting
   locking requests occur.  This avoids returning short reads and writes
   when pages need to be faulted in.

 * Limit the number of pages that are faulted in at once to a more
   sensible size instead of faulting in all pages at once.  When
   faulting in pages doesn't lead to success, fault in a single page
   in the next attempt.  When that still doesn't succeed, give up.
   This should prevent endless loops when fault_in_iov_iter_*() and
   bio_iov_iter_get_pages() disagree.

 * It turns out that taking the inode glock in gfs2_write_lock and
   releasing it in gfs2_write_unlock was entirely pointless, so move
   the locking into gfs2_file_buffered_write instead.  This then also
   allows to eliminate ip->i_gh.


This iteration fixes the issues with fstest generic/208.


For immediate consideration by Al Viro:

  iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value


For immediate consideration by Paul Mackerras:

  powerpc/kvm: Fix kvm_use_magic_page


Thanks,
Andreas

Andreas Gruenbacher (16):
  iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
  powerpc/kvm: Fix kvm_use_magic_page
  Turn fault_in_pages_{readable,writeable} into
    fault_in_{readable,writeable}
  Turn iov_iter_fault_in_readable into fault_in_iov_iter_readable
  iov_iter: Introduce fault_in_iov_iter_writeable
  gfs2: Add wrapper for iomap_file_buffered_write
  gfs2: Clean up function may_grant
  gfs2: Move the inode glock locking to gfs2_file_buffered_write
  gfs2: Fix mmap + page fault deadlocks for buffered I/O
  iomap: Fix iomap_dio_rw return value for user copies
  iomap: Support partial direct I/O on user copy failures
  iomap: Add done_before argument to iomap_dio_rw
  gup: Introduce FOLL_NOFAULT flag to disable page faults
  iov_iter: Introduce nofault flag to disable page faults
  gfs2: Fix mmap + page fault deadlocks for direct I/O
  gfs2: Eliminate ip->i_gh

Bob Peterson (3):
  gfs2: Eliminate vestigial HIF_FIRST
  gfs2: Remove redundant check from gfs2_glock_dq
  gfs2: Introduce flag for glock holder auto-demotion

 arch/powerpc/kernel/kvm.c           |   3 +-
 arch/powerpc/kernel/signal_32.c     |   4 +-
 arch/powerpc/kernel/signal_64.c     |   2 +-
 arch/x86/kernel/fpu/signal.c        |   7 +-
 drivers/gpu/drm/armada/armada_gem.c |   7 +-
 fs/btrfs/file.c                     |   7 +-
 fs/btrfs/ioctl.c                    |   5 +-
 fs/ext4/file.c                      |   5 +-
 fs/f2fs/file.c                      |   2 +-
 fs/fuse/file.c                      |   2 +-
 fs/gfs2/bmap.c                      |  60 +----
 fs/gfs2/file.c                      | 244 ++++++++++++++++++--
 fs/gfs2/glock.c                     | 340 +++++++++++++++++++++-------
 fs/gfs2/glock.h                     |  20 ++
 fs/gfs2/incore.h                    |   5 +-
 fs/iomap/buffered-io.c              |   2 +-
 fs/iomap/direct-io.c                |  21 +-
 fs/ntfs/file.c                      |   2 +-
 fs/xfs/xfs_file.c                   |   6 +-
 fs/zonefs/super.c                   |   4 +-
 include/linux/iomap.h               |  11 +-
 include/linux/mm.h                  |   3 +-
 include/linux/pagemap.h             |  58 +----
 include/linux/uio.h                 |   4 +-
 lib/iov_iter.c                      | 103 +++++++--
 mm/filemap.c                        |   4 +-
 mm/gup.c                            | 139 +++++++++++-
 27 files changed, 784 insertions(+), 286 deletions(-)

-- 
2.26.3

