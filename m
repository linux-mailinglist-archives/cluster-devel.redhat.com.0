Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D91EA60E30
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jul 2019 01:56:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D9D6C057F2E;
	Fri,  5 Jul 2019 23:56:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D3A7646B9;
	Fri,  5 Jul 2019 23:56:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94CBF41F53;
	Fri,  5 Jul 2019 23:56:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x65NuS9G016772 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jul 2019 19:56:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D14449CD0; Fri,  5 Jul 2019 23:56:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9ADAC806BB;
	Fri,  5 Jul 2019 23:56:25 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Sat,  6 Jul 2019 01:56:20 +0200
Message-Id: <20190705235622.22368-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] Make "gfs2: implement gfs2_block_zero_range using
	iomap_zero_range" work properly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 05 Jul 2019 23:56:42 +0000 (UTC)

Hi Christoph,

these two patches should make your iomap_zero_range cleanup work as
intended.  I've pushed that here:

git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next.cleanups2

For further testing, I'll rebase "gfs2: use iomap for buffered I/O in
ordered and writeback mode" on top of that.

Thanks,
Andreas

Andreas Gruenbacher (2):
  gfs2: gfs2_iomap_begin cleanup
  gfs2: Add support for IOMAP_ZERO

 fs/gfs2/bmap.c | 64 ++++++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 28 deletions(-)

-- 
2.20.1

