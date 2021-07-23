Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 586A23D41CE
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Jul 2021 22:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627073939;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IDZUArZY1dra7Ek0zLRFlvkHO9ccWzy+fu4l97tf+bQ=;
	b=FpEVF05WPl/2Qa2CM8fiFO6YLKToYEeB3t1NWb2sqGYt8e5hS+5x4rxrBzS/JwavCELo8p
	RZyIA/VvT3aGLqBdR83tgDi1mK8bgT2shYgO3LlHDlA+TDNxzkEpeXEY0sqgQsBYSdfCqb
	LCI5w5Rw+FdJYpAPqF8kqGqueBaeO18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-i7Qg3l3PNCOu_Cbg3va0ag-1; Fri, 23 Jul 2021 16:58:58 -0400
X-MC-Unique: i7Qg3l3PNCOu_Cbg3va0ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48A8F1853024;
	Fri, 23 Jul 2021 20:58:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F9185D9D5;
	Fri, 23 Jul 2021 20:58:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 416394A7C8;
	Fri, 23 Jul 2021 20:58:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16NKwmBl026642 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 23 Jul 2021 16:58:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6B7710074FD; Fri, 23 Jul 2021 20:58:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB8C100238C;
	Fri, 23 Jul 2021 20:58:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Fri, 23 Jul 2021 22:58:33 +0200
Message-Id: <20210723205840.299280-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v3 0/7] gfs2: Fix mmap + page fault deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus et al.,

here's an update of my gfs2 mmap + page fault fixes (against -rc2).
>From my point of view,

  * these two are ready and need to be looked at by Al:

    iov_iter: Introduce fault_in_iov_iter helper
    iov_iter: Introduce noio flag to disable page faults

  * these two need to be reviewed by Christoph at least:

    iomap: Fix iomap_dio_rw return value for user copies
    iomap: Support restarting direct I/O requests after user copy failures

Thanks a lot,
Andreas

Andreas Gruenbacher (7):
  iov_iter: Introduce fault_in_iov_iter helper
  gfs2: Add wrapper for iomap_file_buffered_write
  gfs2: Fix mmap + page fault deadlocks for buffered I/O
  iomap: Fix iomap_dio_rw return value for user copies
  iomap: Support restarting direct I/O requests after user copy failures
  iov_iter: Introduce noio flag to disable page faults
  gfs2: Fix mmap + page fault deadlocks for direct I/O

 fs/gfs2/file.c       | 77 ++++++++++++++++++++++++++++++++++++++++----
 fs/iomap/direct-io.c | 13 ++++++--
 include/linux/mm.h   |  3 ++
 include/linux/uio.h  |  2 ++
 lib/iov_iter.c       | 62 ++++++++++++++++++++++++++++++++---
 mm/gup.c             | 68 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 211 insertions(+), 14 deletions(-)

-- 
2.26.3

