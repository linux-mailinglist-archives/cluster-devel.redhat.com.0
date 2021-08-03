Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACDC73DF569
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Aug 2021 21:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628018397;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DFWNnmq4Fr86FBlSANVnWR2moKkcBcoaXFNT4Ed8iZI=;
	b=KxMkNUj41qgV7/FLdxMLHbsA6g2mWiiJwKcbKN/V2ShuEokNM0a/UHdA3YbMjFVxrofKfc
	okUD8Zs4VQuxuIk97oiVL6WoHR9qm0bKRwP9NQ2NbBucXz3zbtRVCnX8kAov5OS9Bb6GOm
	1whntOe0cY2seQh8jJXG9SxTV9Ffnfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532--1wxGur8MLy63qO0ptatPw-1; Tue, 03 Aug 2021 15:19:56 -0400
X-MC-Unique: -1wxGur8MLy63qO0ptatPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC4BB800489;
	Tue,  3 Aug 2021 19:19:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEC2C5C25A;
	Tue,  3 Aug 2021 19:19:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 549984A7C9;
	Tue,  3 Aug 2021 19:19:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 173JIRRc011419 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 15:18:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2D6560C5F; Tue,  3 Aug 2021 19:18:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC59860C0F;
	Tue,  3 Aug 2021 19:18:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>, Paul Mackerras <paulus@ozlabs.org>
Date: Tue,  3 Aug 2021 21:18:06 +0200
Message-Id: <20210803191818.993968-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	kvm-ppc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v5 00/12] gfs2: Fix mmap + page fault
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi all,

here's another update on top of v5.14-rc4.  There seems to be a bug in
get_user_pages_fast when called with FOLL_FAST_ONLY; please see below.

Changes:

 * Change fault_in_pages_{readable,writeable} to return the number of
   bytes that should be accessible instead of failing outright when
   part of the requested region cannot be faulted in.  Change
   iov_iter_fault_in_readable to those same semantics.

 * Add fault_in_iov_iter_writeable for safely faulting in pages for
   writing without modifying the pages.


With this patch queue, fstest generic/208 (aio-dio-invalidate-failure.c)
endlessly spins in gfs2_file_direct_write.  It looks as if there's a bug
in get_user_pages_fast when called with FOLL_FAST_ONLY:

 (1) The test case performs an aio write into a 32 MB buffer.

 (2) The buffer is initially not in memory, so when iomap_dio_rw() ->
     ... -> bio_iov_iter_get_pages() is called with the iter->noio flag
     set, we get to get_user_pages_fast() with FOLL_FAST_ONLY set.
     get_user_pages_fast() returns 0, which causes
     bio_iov_iter_get_pages to return -EFAULT.

 (3) Then gfs2_file_direct_write faults in the entire buffer with
     fault_in_iov_iter_readable(), which succeeds.

 (4) With the buffer in memory, we retry the iomap_dio_rw() ->
     ... -> bio_iov_iter_get_pages() -> ... -> get_user_pages_fast().
     This should succeed now, but get_user_pages_fast() still returns 0.

 (5) Thus we end up in step (3) again.

The buffered writes generic/208 performs are unrelated to this hang.


Apart from the generic/208 hang, gfs2 still needs a better strategy for
faulting in more reasonable chunks of memory at a time and for resuming
requests after faulting in pages.  We've got some of the pieces in place
for safely allowing that, but more work remains to be done.


For immediate consideration by Al Viro:

  iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value


For immediate consideration by Paul Mackerras:

  powerpc/kvm: Fix kvm_use_magic_page


Thanks,
Andreas


Andreas Gruenbacher (12):
  iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
  powerpc/kvm: Fix kvm_use_magic_page
  Turn fault_in_pages_{readable,writeable} into
    fault_in_{readable,writeable}
  Turn iov_iter_fault_in_readable into fault_in_iov_iter_readable
  iov_iter: Introduce fault_in_iov_iter_writeable
  gfs2: Add wrapper for iomap_file_buffered_write
  gfs2: Fix mmap + page fault deadlocks for buffered I/O
  iomap: Fix iomap_dio_rw return value for user copies
  iomap: Support restarting direct I/O requests after user copy failures
  iomap: Add done_before argument to iomap_dio_rw
  iov_iter: Introduce noio flag to disable page faults
  gfs2: Fix mmap + page fault deadlocks for direct I/O

 arch/powerpc/kernel/kvm.c           |   3 +-
 arch/powerpc/kernel/signal_32.c     |   4 +-
 arch/powerpc/kernel/signal_64.c     |   2 +-
 arch/x86/kernel/fpu/signal.c        |   8 +-
 drivers/gpu/drm/armada/armada_gem.c |   7 +-
 fs/btrfs/file.c                     |   8 +-
 fs/btrfs/ioctl.c                    |   7 +-
 fs/ext4/file.c                      |   5 +-
 fs/f2fs/file.c                      |   6 +-
 fs/fuse/file.c                      |   2 +-
 fs/gfs2/file.c                      |  95 ++++++++++++++++++++---
 fs/iomap/buffered-io.c              |   2 +-
 fs/iomap/direct-io.c                |  28 +++++--
 fs/ntfs/file.c                      |   2 +-
 fs/xfs/xfs_file.c                   |   6 +-
 fs/zonefs/super.c                   |   4 +-
 include/linux/iomap.h               |  11 ++-
 include/linux/pagemap.h             |  58 +-------------
 include/linux/uio.h                 |   4 +-
 lib/iov_iter.c                      | 107 ++++++++++++++++++++------
 mm/filemap.c                        |   4 +-
 mm/gup.c                            | 113 ++++++++++++++++++++++++++++
 22 files changed, 360 insertions(+), 126 deletions(-)

-- 
2.26.3

