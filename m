Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E8591200563
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Jun 2020 11:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592559582;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=owa0qFAPsKpu74jXgvEbAGd5tDvX5jYwWR6WKxTC83E=;
	b=EOn+Tmp22530QpTrNj8v8cZ7KNgGNamu260gIJUygxV6zKOqNwbrkbRM9+nvGuWcvimakR
	q6zgtENQilXk5AwcYX46b4+S4CX/iK3sPxr9j2zGUMyVCXa3G+Ghy2iOKK+C2VgHWIvHdI
	NqoVIH9XnVZwBnTYpoEyCc2KKpXHx+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-3_FIjNPlPtarYVZo-iFs5Q-1; Fri, 19 Jun 2020 05:39:38 -0400
X-MC-Unique: 3_FIjNPlPtarYVZo-iFs5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D71E18FF662;
	Fri, 19 Jun 2020 09:39:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 488EE19D61;
	Fri, 19 Jun 2020 09:39:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 995671809547;
	Fri, 19 Jun 2020 09:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J9dQTe004687 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 05:39:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCD7A5D9EF; Fri, 19 Jun 2020 09:39:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E9A15D9E8;
	Fri, 19 Jun 2020 09:39:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Jun 2020 11:39:14 +0200
Message-Id: <20200619093916.1081129-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [RFC PATCH 0/2] gfs2 readahead regression in
	v5.8-rc1
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hello,

can the two patches in this set still be considered for v5.8?

Commit d4388340ae0b ("fs: convert mpage_readpages to mpage_readahead")
which converts gfs2 and other filesystems to use the new ->readahead
address space operation is leading to deadlocks between the inode glocks
and page locks: ->readahead is called with the pages to readahead
already locked.  When gfs2_readahead then tries to lock the associated
inode glock, another process already holding the inode glock may be
trying to lock the same pages.

We could work around this in gfs by using a LM_FLAG_TRY lock in
->readahead for now.  The real reason for this deadlock is that gfs2
shouldn't be taking the inode glock in ->readahead in the first place
though, so I'd prefer to fix this "properly" instead.  Unfortunately,
this depends on a new IOCB_CACHED flag for generic_file_read_iter.

A previous version was posted in November:

https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@redhat.com/

Thanks,
Andreas

Andreas Gruenbacher (2):
  fs: Add IOCB_CACHED flag for generic_file_read_iter
  gfs2: Rework read and page fault locking

 fs/gfs2/aops.c     | 27 ++------------------
 fs/gfs2/file.c     | 61 ++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/fs.h |  1 +
 mm/filemap.c       | 16 ++++++++++--
 4 files changed, 76 insertions(+), 29 deletions(-)


base-commit: af42d3466bdc8f39806b26f593604fdc54140bcb
-- 
2.26.2

