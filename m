Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E6216C2A
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 22:26:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C823F81224;
	Tue,  7 May 2019 20:26:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98DA13AA8;
	Tue,  7 May 2019 20:26:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C0A218089CB;
	Tue,  7 May 2019 20:26:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47KQRaY017490 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 16:26:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 300E92D1C6; Tue,  7 May 2019 20:26:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F50D2FC41;
	Tue,  7 May 2019 20:26:23 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 22:26:09 +0200
Message-Id: <20190507202621.25623-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 00/12] Pre-pull patch posting (merge
	window)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 07 May 2019 20:26:35 +0000 (UTC)

Hello,

for this merge window, we've got the following patches:

"gfs2: Fix loop in gfs2_rbm_find (v2)"

  A rework of a fix we ended up reverting in the 5.0 kernel because of
  an iozone performance regression.

"gfs2: read journal in large chunks" and
"gfs2: fix race between gfs2_freeze_func and unmount"

  An improved version of a commit we also ended up reverting in the 5.0
  kernel because of a regression in xfstest generic/311.  It turns out
  that the journal changes were mostly innocent and that unfreeze didn't
  wait for the freeze to complete, which caused the filesystem to be
  unmounted before it was actually idle.

"gfs2: Fix occasional glock use-after-free"
"gfs2: Fix iomap write page reclaim deadlock"
"gfs2: Fix lru_count going negative"

  Fixes for various problems reported and partially fixed by Citrix
  engineers.  Thank you very much.

"gfs2: clean_journal improperly set sd_log_flush_head"

  Another fix from Bob.

A few other minor cleanups.

Regards,
Andreas 

--

Abhi Das (2):
  gfs2: fix race between gfs2_freeze_func and unmount
  gfs2: read journal in large chunks

Andreas Gruenbacher (7):
  gfs2: Fix loop in gfs2_rbm_find (v2)
  gfs2: Fix occasional glock use-after-free
  gfs2: Remove misleading comments in gfs2_evict_inode
  gfs2: Remove unnecessary extern declarations
  gfs2: Rename sd_log_le_{revoke,ordered}
  gfs2: Rename gfs2_trans_{add_unrevoke => remove_revoke}
  gfs2: Fix iomap write page reclaim deadlock

Bob Peterson (2):
  gfs2: clean_journal improperly set sd_log_flush_head
  gfs2: Replace gl_revokes with a GLF flag

Ross Lagerwall (1):
  gfs2: Fix lru_count going negative

-- 
2.20.1

