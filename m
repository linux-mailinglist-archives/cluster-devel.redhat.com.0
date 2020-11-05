Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6273A2A7BB2
	for <lists+cluster-devel@lfdr.de>; Thu,  5 Nov 2020 11:27:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604572071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TPYmvw+3BxudAZtmmFx1cRunq0cjnCfZYd5exiTXfPE=;
	b=PdMgWSrlEkCSrMEjbrvvh6Ebmgzbl/m/vX1gi9VrioKyZRX7x9huPu2xVKHons9p6DqAm2
	ehK+xql1J4yoLSMYhzNOZJk1TPztGUr7LUj/YR401q7xh3A2SRSW6Bxa8EhHw8bNfOBuip
	wosMX17ATLE5E/QyNkoYHdFi/7pOeS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-tjQzLx9BOVy38sVhtv6Vzw-1; Thu, 05 Nov 2020 05:27:49 -0500
X-MC-Unique: tjQzLx9BOVy38sVhtv6Vzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC3A6107ACF6;
	Thu,  5 Nov 2020 10:27:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 935F219C4F;
	Thu,  5 Nov 2020 10:27:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8538183D022;
	Thu,  5 Nov 2020 10:27:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A5ARbrd029906 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 5 Nov 2020 05:27:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C76605B4AE; Thu,  5 Nov 2020 10:27:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0407E5B4DC;
	Thu,  5 Nov 2020 10:27:32 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu,  5 Nov 2020 11:27:31 +0100
Message-Id: <20201105102731.1832011-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 fixes for 5.10-rc1
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following gfs2 fixes on top of 5.10-rc1 (ish).

Thank you very much,
Andreas

The following changes since commit 4525c8781ec0701ce824e8bd379ae1b129e26568:

  scsi: qla2xxx: remove incorrect sparse #ifdef (2020-10-26 15:45:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.10-rc1-fixes

for you to fetch changes up to da7d554f7c62d0c17c1ac3cc2586473c2d99f0bd:

  gfs2: Wake up when sd_glock_disposal becomes zero (2020-11-03 14:39:11 +0100)

----------------------------------------------------------------
Various gfs2 fixes

----------------------------------------------------------------
Alexander Aring (1):
      gfs2: Wake up when sd_glock_disposal becomes zero

Andreas Gruenbacher (1):
      gfs2: Don't call cancel_delayed_work_sync from within delete work function

Bob Peterson (6):
      gfs2: Free rd_bits later in gfs2_clear_rgrpd to fix use-after-free
      gfs2: Add missing truncate_inode_pages_final for sd_aspace
      gfs2: init_journal's undo directive should also undo the statfs inodes
      gfs2: Split up gfs2_meta_sync into inode and rgrp versions
      gfs2: don't initialize statfs_change inodes in spectator mode
      gfs2: check for live vs. read-only file system in gfs2_fitrim

 fs/gfs2/glock.c      |  3 ++-
 fs/gfs2/glops.c      | 56 +++++++++++++++++++++++++++++++++++++++++-----------
 fs/gfs2/glops.h      |  1 +
 fs/gfs2/inode.c      |  3 ++-
 fs/gfs2/lops.c       | 31 +++++------------------------
 fs/gfs2/lops.h       |  2 --
 fs/gfs2/ops_fstype.c | 14 ++++++++-----
 fs/gfs2/recovery.c   |  2 +-
 fs/gfs2/rgrp.c       |  5 ++++-
 fs/gfs2/super.c      |  1 +
 10 files changed, 70 insertions(+), 48 deletions(-)

