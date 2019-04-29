Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FBBEC79
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 00:09:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33170756;
	Mon, 29 Apr 2019 22:09:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CB0B600C2;
	Mon, 29 Apr 2019 22:09:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 099F841F3D;
	Mon, 29 Apr 2019 22:09:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TM9gFs009893 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 18:09:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D627D7984; Mon, 29 Apr 2019 22:09:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA30517CCB;
	Mon, 29 Apr 2019 22:09:36 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Date: Tue, 30 Apr 2019 00:09:29 +0200
Message-Id: <20190429220934.10415-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
	Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org,
	Mark Syms <Mark.Syms@citrix.com>
Subject: [Cluster-devel] [PATCH v7 0/5] iomap and gfs2 fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 29 Apr 2019 22:09:49 +0000 (UTC)

Here's another update of this patch queue, hopefully with all wrinkles
ironed out now.

Darrick, I think Linus would be unhappy seeing the first four patches in
the gfs2 tree; could you put them into the xfs tree instead like we did
some time ago already?

Thanks,
Andreas

Andreas Gruenbacher (4):
  fs: Turn __generic_write_end into a void function
  iomap: Fix use-after-free error in page_done callback
  iomap: Add a page_prepare callback
  gfs2: Fix iomap write page reclaim deadlock

Christoph Hellwig (1):
  iomap: Clean up __generic_write_end calling

 fs/buffer.c           |   8 ++--
 fs/gfs2/aops.c        |  14 ++++--
 fs/gfs2/bmap.c        | 101 ++++++++++++++++++++++++------------------
 fs/internal.h         |   2 +-
 fs/iomap.c            |  55 ++++++++++++++---------
 include/linux/iomap.h |  22 ++++++---
 6 files changed, 124 insertions(+), 78 deletions(-)

-- 
2.20.1

