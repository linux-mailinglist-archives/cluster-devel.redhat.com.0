Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7583F9CD0
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 18:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630082992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qzk7xHxXOvrpJjyOc9WnxUmMVaQgghawUTASMZZwVjA=;
	b=c2+IIqxvkom+0y4iA/S+mJ+HI5qChYtq2jxFekqz2VQS+6O8ysM09OPxXQ1n+kY6WJR1s0
	w6WAswp5qoSJ2EwZFxVIQwBQMec8utLzgCseeQtt0WkB+GCJeXMeTcRu3ziln6qEuD/ik7
	zc38vZAiF3fnxfU4MnCitOWdo5Cl5Ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-4mjwqT1oMjGQ4WhEOsb20w-1; Fri, 27 Aug 2021 12:49:51 -0400
X-MC-Unique: 4mjwqT1oMjGQ4WhEOsb20w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11654101C8A9;
	Fri, 27 Aug 2021 16:49:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E3F660938;
	Fri, 27 Aug 2021 16:49:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88F4C4BB7C;
	Fri, 27 Aug 2021 16:49:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RGncdB005752 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 12:49:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D4C760C04; Fri, 27 Aug 2021 16:49:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 285BF60C81;
	Fri, 27 Aug 2021 16:49:27 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>, Paul Mackerras <paulus@ozlabs.org>
Date: Fri, 27 Aug 2021 18:49:07 +0200
Message-Id: <20210827164926.1726765-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	kvm-ppc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v7 00/19] gfs2: Fix mmap + page fault
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi all,

here's another update on top of v5.14-rc7.  Changes:

 * Some of the patch descriptions have been improved.

 * Patch "gfs2: Eliminate ip->i_gh" has been moved further to the front.

At this point, I'm not aware of anything that still needs fixing, 


The first two patches are independent of the core of this patch queue
and I've asked the respective maintainers to have a look, but I've not
heard back from them.  The first patch should just go into Al's tree;
it's a relatively straight-forward fix.  The second patch really needs
to be looked at; it might break things:

  iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
  powerpc/kvm: Fix kvm_use_magic_page


Al and Linus seem to have a disagreement about the error reporting
semantics that functions fault_in_{readable,writeable} and
fault_in_iov_iter_{readable,writeable} should have.  I've implemented
Linus's suggestion of returning the number of bytes not faulted in and I
think that being able to tell if "nothing", "something" or "everything"
could be faulted in does help, but I'll live with anything that allows
us to make progress.


The iomap changes should ideally be reviewed by Christoph; I've not
heard from him about those.


Thanks,
Andreas

Andreas Gruenbacher (16):
  iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
  powerpc/kvm: Fix kvm_use_magic_page
  gup: Turn fault_in_pages_{readable,writeable} into
    fault_in_{readable,writeable}
  iov_iter: Turn iov_iter_fault_in_readable into
    fault_in_iov_iter_readable
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
 fs/gfs2/file.c                      | 245 ++++++++++++++++++--
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
 27 files changed, 785 insertions(+), 286 deletions(-)

-- 
2.26.3

