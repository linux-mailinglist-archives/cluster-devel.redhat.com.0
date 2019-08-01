Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5CC7E392
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Aug 2019 21:53:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2383830C1340;
	Thu,  1 Aug 2019 19:53:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 713B260BEC;
	Thu,  1 Aug 2019 19:53:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9B3D264C9;
	Thu,  1 Aug 2019 19:53:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x71Jr52r017359 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Aug 2019 15:53:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA51660BEC; Thu,  1 Aug 2019 19:53:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDFFE60BE0;
	Thu,  1 Aug 2019 19:53:01 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu,  1 Aug 2019 21:52:58 +0200
Message-Id: <20190801195259.27274-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] Fix gfs2 cluster coherency bug
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 01 Aug 2019 19:53:35 +0000 (UTC)

Hi Linus,

could you please pull the following gfs2 bug fix?

Thanks,
Andreas


The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.3-rc2.fixes

for you to fetch changes up to 706cb5492c8c459199fa0ab3b5fd2ba54ee53b0c:

  gfs2: Inode dirtying fix (2019-07-31 18:51:50 +0200)

----------------------------------------------------------------
Fix gfs2 cluster coherency bug

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Inode dirtying fix

 fs/gfs2/bmap.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

