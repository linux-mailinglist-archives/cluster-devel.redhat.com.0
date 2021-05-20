Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 07D6138AE5A
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 14:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621514071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bm4G0D5fPgHkFz6Tq2cMmRepmQ5JO/RLPWPnNdJIAWg=;
	b=aaI73gPCky6WkX+71rJ2250Ws5sgU9zTp60YWKvqA1w2Htu0Y/BR+rQAUV2wEZ3WlLDtK7
	/0F+Icgm/cO6WziBkfOTlwqsMgQNHMOVzKx0iCzcczCfa6gp8/gXd+33nyaiVFZIVF+U9o
	6k8u7jbDjDOcEfhY7xNPLG8wOZb3Ik8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-yECxM2cMN8WYJl1awC9tBQ-1; Thu, 20 May 2021 08:34:29 -0400
X-MC-Unique: yECxM2cMN8WYJl1awC9tBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D8989F92B;
	Thu, 20 May 2021 12:34:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F98A60C04;
	Thu, 20 May 2021 12:34:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDD55180B463;
	Thu, 20 May 2021 12:34:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KCPhBb030467 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 08:25:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EBAB60C13; Thu, 20 May 2021 12:25:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 343FA60C4A;
	Thu, 20 May 2021 12:25:37 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, cluster-devel@redhat.com
Date: Thu, 20 May 2021 14:25:30 +0200
Message-Id: <20210520122536.1596602-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, Jan Kara <jack@suse.cz>
Subject: [Cluster-devel] [PATCH 0/6] gfs2: Handle page faults during read
	and write
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

Hello,

this is an update to my previous posting [1] on how to deal with
potential mmap + page fault deadlocks in gfs2.

What's happening is that a page fault triggers during a read or write
operation, while we're holding a glock (the cluster-wide gfs2 inode
lock), and the page fault requires another glock.  We can recognize and
handle the case when both glocks are the same, but when the page fault
requires another glock, there is a chance that taking that other glock
will deadlock.

The solution I've come up with for this is to turn locking requests into
locking attempts when we're in a potential recursive locking situation,
and to actively fault in pages and retry at the outer level when a
locking attempt fails.  Those kinds of conflicts should be relatively
rare.

Note that we need to fault in pages writable in ->read_iter, so this
patch set adds a new iov_iter_fault_in_writeable() helper hat mirrors
iov_iter_fault_in_readable().

In the initial prototype [1], I've added a restart_hack flag to struct
task_struct; this has now been moved to the lower two bits of
current->journal_info.

I've posted a new fstest [2] that triggers the self-recursion case so
that those kind of bugs will be caught early next time, with no feedback
in the last two weeks.

Those patches are currently on the gfs2 for-next branch [3].  If there
are no objections, I'll ask Linus to pull them from there.

Thanks,
Andreas

[1] [RFC] Trigger retry from fault vm operation,
https://lore.kernel.org/linux-fsdevel/20210511140113.1225981-1-agruenba@redhat.com/

[2] https://lore.kernel.org/fstests/20210520114218.1595735-1-agruenba@redhat.com/T/#u

[3] https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=for-next

Andreas Gruenbacher (6):
  gfs2: Fix mmap + page fault deadlocks (part 1)
  iov_iter: Add iov_iter_fault_in_writeable()
  gfs2: Add wrappers for accessing journal_info
  gfs2: Encode glock holding and retry flags in journal_info
  gfs2: Add LM_FLAG_OUTER glock holder flag
  gfs2: Fix mmap + page fault deadlocks (part 2)

 fs/gfs2/aops.c      |   6 +--
 fs/gfs2/bmap.c      |  31 +++++++-------
 fs/gfs2/file.c      | 102 +++++++++++++++++++++++++++++++++++++-------
 fs/gfs2/glock.c     |  12 ++++++
 fs/gfs2/glock.h     |  13 ++++--
 fs/gfs2/incore.h    |  41 ++++++++++++++++++
 fs/gfs2/inode.c     |   2 +-
 fs/gfs2/log.c       |   4 +-
 fs/gfs2/lops.c      |   2 +-
 fs/gfs2/meta_io.c   |   6 +--
 fs/gfs2/super.c     |   2 +-
 fs/gfs2/trans.c     |  16 +++----
 include/linux/uio.h |   1 +
 lib/iov_iter.c      |  20 ++++++++-
 14 files changed, 204 insertions(+), 54 deletions(-)

-- 
2.26.3

