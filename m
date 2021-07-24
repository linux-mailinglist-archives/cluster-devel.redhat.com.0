Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 98F0F3D499D
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 21:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627155404;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wcLLNDQSOBcbp/tt+rpcsxdrkB5OSjz/1oBaIfc7jQM=;
	b=KI9j5bkgFcVZFrfA4eL6dL6QkkoK7kVjss/TEonUAytpA/Jb0r+GiJHJULQ19ZZdfDikef
	gMQY1MeB1AFcIGhgb8xpkVbmRlssEu+5GdNUWL5u0+hf86oPMzQwkcnJIEgY5x6CArR3cT
	q7AAx1WG1mkn6gSobTA97A/gI5XBCPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-ZUhrCEHlO6y5z89v_2f55Q-1; Sat, 24 Jul 2021 15:36:43 -0400
X-MC-Unique: ZUhrCEHlO6y5z89v_2f55Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA3110066E7;
	Sat, 24 Jul 2021 19:36:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DB0569320;
	Sat, 24 Jul 2021 19:36:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E9E14A7C8;
	Sat, 24 Jul 2021 19:36:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OJYw3e016945 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 15:34:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DAC71AC18; Sat, 24 Jul 2021 19:34:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCE7418432;
	Sat, 24 Jul 2021 19:34:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Sat, 24 Jul 2021 21:34:41 +0200
Message-Id: <20210724193449.361667-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v4 0/8] gfs2: Fix mmap + page fault deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus et al.,

here's another update of this patch queue:

 * Finally fix the typos Linus has pointed out twice already.

 * Turn the previous fault_in_iov_iter helper that was used for reads
   and writes into iov_iter_fault_in_writeable per Al's suggestion.
   Use the existing iov_iter_fault_in_readable for writes.

 * Add a done_before argument and an IOMAP_DIO_FAULT_RETRY flag to
   iomap_dio_rw to allow iomap_dio_rw to return partial results and
   resume with the rest of a request.  This allows iomap_dio_rw to be
   used with page faults disabled without having to repeat any I/O.

 * Adjust the gfs2 patches accordingly.

With that, the two iov_ter patches and the three iomap patches should
hopefully be ready for mainline.

There's one remaining issue on the gfs2 side: during read requests, when
a writer now comes in in the middle of a read request, the read request
can currently return a result that never existed on disk.  So we need
to ensure that we only resume read requests when we know that no writer
got in the way, and retry the entire request otherwise.  It should be
relatively easy to add a mechanism to detect when a glock is "lost";
this won't affect the vfs or iomap patches.

Thanks a lot,
Andreas

Andreas Gruenbacher (8):
  iov_iter: Introduce iov_iter_fault_in_writeable helper
  gfs2: Add wrapper for iomap_file_buffered_write
  gfs2: Fix mmap + page fault deadlocks for buffered I/O
  iomap: Fix iomap_dio_rw return value for user copies
  iomap: Add done_before argument to iomap_dio_rw
  iomap: Support restarting direct I/O requests after user copy failures
  iov_iter: Introduce noio flag to disable page faults
  gfs2: Fix mmap + page fault deadlocks for direct I/O

 fs/btrfs/file.c       |  5 ++-
 fs/ext4/file.c        |  5 ++-
 fs/gfs2/file.c        | 95 +++++++++++++++++++++++++++++++++++++++----
 fs/iomap/direct-io.c  | 29 ++++++++++---
 fs/xfs/xfs_file.c     |  6 +--
 fs/zonefs/super.c     |  4 +-
 include/linux/iomap.h | 11 ++++-
 include/linux/mm.h    |  3 ++
 include/linux/uio.h   |  2 +
 lib/iov_iter.c        | 60 ++++++++++++++++++++++++---
 mm/gup.c              | 57 ++++++++++++++++++++++++++
 11 files changed, 246 insertions(+), 31 deletions(-)

-- 
2.26.3

