Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4C03CCB6B
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 00:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626648152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xw04fnowKtYXTdFS14xZoGGNfz6dHcqSTKXhXZyTGCQ=;
	b=T/ZjWRnBl/oBS4Dw9hg5pPxxtiqgwamTmXYoRJHGgG7//qXVpK7Xqp+fdnPmluqnFzTDTG
	i0toWXcmh28RO/dRekFCEFt8YodwWig4t/LXhY8qIWnN3y7Z1KWFHucdObO5j0SwZWoj7H
	jhJib1FstYzeKz2FBXHWLovwYRFSvyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-_qTVdiRcPgmM35wTN0Iy9w-1; Sun, 18 Jul 2021 18:42:31 -0400
X-MC-Unique: _qTVdiRcPgmM35wTN0Iy9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98DF6804301;
	Sun, 18 Jul 2021 22:42:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6565C1C5;
	Sun, 18 Jul 2021 22:42:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70FF61809C9A;
	Sun, 18 Jul 2021 22:42:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16IMdeLt013660 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 18 Jul 2021 18:39:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C8E960C9D; Sun, 18 Jul 2021 22:39:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8BC460C0F;
	Sun, 18 Jul 2021 22:39:34 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Jul 2021 00:39:26 +0200
Message-Id: <20210718223932.2703330-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v2 0/6] gfs2: Fix mmap + page fault deadlocks
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

Hi Linus et al.,

here's an update to the gfs2 mmap + page faults fix that implements
Linus's suggestion of disabling page faults while we're holding the
inode glock.

This passes fstests except for test generic/095, which fails due to an
independent bug in the iov_iter code.  I'm currently trying to get
initial feedback from Al and Christoph on that.

Any feedback would be welcome.

Thanks a lot,
Andreas

Andreas Gruenbacher (6):
  iov_iter: Introduce fault_in_iov_iter helper
  iomap: Fix iomap_dio_rw return value for page faults
  gfs2: Add wrapper for iomap_file_buffered_write
  gfs2: Fix mmap + page fault deadlocks for buffered I/O
  iov_iter: Introduce ITER_FLAG_FAST_ONLY flag
  gfs2: Fix mmap + page fault deadlocks for direct I/O

 fs/gfs2/file.c       | 79 ++++++++++++++++++++++++++++++++++++++++----
 fs/iomap/direct-io.c |  2 ++
 include/linux/mm.h   |  3 ++
 include/linux/uio.h  | 16 +++++++--
 lib/iov_iter.c       | 62 +++++++++++++++++++++++++++++++---
 mm/gup.c             | 68 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 215 insertions(+), 15 deletions(-)

-- 
2.26.3

