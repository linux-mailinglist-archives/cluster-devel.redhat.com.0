Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5898B396647
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 19:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622480496;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2rXwqWiwPAMtRoSLYa6LfN5KZenzYvsl7oRz3iny7h0=;
	b=bfx76ScMkq9utPC3xBxDCCK8p45R9+X+9+hT4AK9SLyXSFXzzDf+UXi+MRbf/b83I4jeqi
	x1/LwoJ3NjBwbLRmHNRPs4RTtJlJt2omxiSZ2qSkil3gJRA3jsnUbxbeT+A6W4quaK4Nb2
	HCUdE5S8ey06DxWmTaxcx5kS9zN9HSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-8TI55apmNDGNb3mzoiGSGg-1; Mon, 31 May 2021 13:01:34 -0400
X-MC-Unique: 8TI55apmNDGNb3mzoiGSGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DF22107ACCA;
	Mon, 31 May 2021 17:01:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 011E4687DB;
	Mon, 31 May 2021 17:01:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2FFB55346;
	Mon, 31 May 2021 17:01:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VH1UT2019055 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 13:01:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 143612BFDE; Mon, 31 May 2021 17:01:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F8EA59460;
	Mon, 31 May 2021 17:01:25 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 19:01:14 +0200
Message-Id: <20210531170123.243771-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [RFC 0/9] gfs2: handle page faults during read and
	write
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

here's a set of fixes for how gfs2 handles page faults during read and
write syscalls.  The patch queue is ready for merging except for two
open issues.  May I ask you to shed some light or ask the right person
to help us out?

Right now, the filesystem can end up trying to take a lock it's already
holding, which causes it to BUG.  We can recognize and mostly deal with
that simple case, but more complex scenarios exist which involve
multiple locks and / or incompatible locking modes.  To handle those, we
switch to trylocks where necessary.

The patches appear to be working as itended, with the following
remaining questions:

(1) Jan Kara has pointed out [*] that returning VM_FAULT_SIGBUS from the
.fault / .page_mkwrite ops will raise SIGBUS, which would be visible to
user space.  This hasn't been observed in our testing; instead, accesses
to the mmapped memory via call chains like:

  iov_iter_fault_in_readable -> fault_in_pages_readable -> __get_user

would simply fail with -EFAULT, as we're expecting.

>From looking at do_user_addr_fault and do_sigbus in arch/x86/mm/fault.c,
my impression is that VM_FAULT_SIGBUS will not cause SIGBUS to be raised
in kernel mode, and that we can rely on the -EFAULT behavior for
triggering the retries at the filesystem level.

(2) The patch queue introduces the same kind of trylock behavior for
both .fault (gfs2_fault) and .page_mkwrite (gfs2_page_mkwrite).  I'm not
aware of any situation in which we can actually end up in .page_mkwrite
during a .read_iter or .write_iter operation, so the trylock behavior in
.page_mkwrite might be harmless but unnecessary.


Thank you very much,
Andreas


[*] https://listman.redhat.com/archives/cluster-devel/2021-May/msg00080.html

Previous posting of this patch queue:

https://listman.redhat.com/archives/cluster-devel/2021-May/msg00073.html

New xfstest for mmap + page faults during read / write:
 
https://lore.kernel.org/fstests/20210531152604.240462-1-agruenba@redhat.com/

Andreas Gruenbacher (9):
  gfs2: Clean up the error handling in gfs2_page_mkwrite
  gfs2: Add wrapper for iomap_file_buffered_write
  gfs2: Add gfs2_holder_is_compatible helper
  gfs2: Fix mmap + page fault deadlocks (part 1)
  iov_iter: Add iov_iter_fault_in_writeable()
  gfs2: Add wrappers for accessing journal_info
  gfs2: Encode glock holding and retry flags in journal_info
  gfs2: Add LM_FLAG_OUTER glock holder flag
  gfs2: Fix mmap + page fault deadlocks (part 2)

 fs/gfs2/aops.c      |   6 +-
 fs/gfs2/bmap.c      |  31 ++++----
 fs/gfs2/file.c      | 175 +++++++++++++++++++++++++++++++++-----------
 fs/gfs2/glock.c     |  12 +++
 fs/gfs2/glock.h     |  27 ++++++-
 fs/gfs2/incore.h    |  41 +++++++++++
 fs/gfs2/inode.c     |   2 +-
 fs/gfs2/log.c       |   4 +-
 fs/gfs2/lops.c      |   2 +-
 fs/gfs2/meta_io.c   |   6 +-
 fs/gfs2/super.c     |   2 +-
 fs/gfs2/trans.c     |  16 ++--
 include/linux/uio.h |   1 +
 lib/iov_iter.c      |  20 ++++-
 14 files changed, 265 insertions(+), 80 deletions(-)

-- 
2.26.3

