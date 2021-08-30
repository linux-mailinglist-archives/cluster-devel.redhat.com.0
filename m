Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB59E3FBDF6
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Aug 2021 23:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630357848;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WHA3d8nwpZi2BxeKNZ2Ew6q2P/W2+26A7H/gSGc9/d4=;
	b=Q8Mf2jECFjFESTO7gqtIcVLELhUbXxO5WmW+i9CBgFa+LVCmYo1iHHukZUbPSaROgYexFq
	C+8YZ0eE0FZ+puuipDeuDRijmKo5t1txe2o4UErpxUnObU3T30ng8DCCQ16zfMRHE3zI1d
	9t7A62rLZt2WeLG667CAAOByECJrKsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-Yw2el3R4NgyqzD54R2NQMQ-1; Mon, 30 Aug 2021 17:10:47 -0400
X-MC-Unique: Yw2el3R4NgyqzD54R2NQMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BD75875057;
	Mon, 30 Aug 2021 21:10:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D627F60D31;
	Mon, 30 Aug 2021 21:10:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F32D4BB7C;
	Mon, 30 Aug 2021 21:10:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ULAapW006560 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Aug 2021 17:10:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6FA810023B5; Mon, 30 Aug 2021 21:10:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B71F21000186;
	Mon, 30 Aug 2021 21:10:35 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Aug 2021 23:10:33 +0200
Message-Id: <20210830211033.1825127-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for 5.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following gfs2 fixes for 5.15, which are all
unrelated to the deadlock avoidance patch queue we've been discussing.

Thanks,
Andreas

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.14-rc2-fixes

for you to fetch changes up to 08d736667185dca2751cf47eabb0830cecdeb160:

  gfs2: Remove redundant check from gfs2_glock_dq (2021-08-20 09:03:46 -0500)

----------------------------------------------------------------
Changes in gfs2:
* Various withdraw related fixes (freeze glock recursion, thread
  initialization / destruction order, journal recovery, glock cleanup,
  withdraw under journal lock).
* Some error message improvements.
* Various minor cleanups.

----------------------------------------------------------------
Bob Peterson (14):
      gfs2: Fix glock recursion in freeze_go_xmote_bh
      gfs2: be more verbose replaying invalid rgrp blocks
      gfs2: trivial clean up of gfs2_ail_error
      gfs2: tiny cleanup in gfs2_log_reserve
      gfs2: init system threads before freeze lock
      gfs2: Don't release and reacquire local statfs bh
      gfs2: Make recovery error more readable
      gfs2: Eliminate vestigial HIF_FIRST
      gfs2: nit: gfs2_drop_inode shouldn't return bool
      gfs2: Mark journal inodes as "don't cache"
      gfs2: don't stop reads while withdraw in progress
      gfs2: Don't call dlm after protocol is unmounted
      gfs2: Delay withdraw from atomic context
      gfs2: Remove redundant check from gfs2_glock_dq

Colin Ian King (1):
      gfs2: Fix memory leak of object lsi on error return path

 fs/gfs2/aops.c       |   9 +----
 fs/gfs2/glock.c      |  13 +++----
 fs/gfs2/glops.c      |  27 +++++++------
 fs/gfs2/incore.h     |   2 +-
 fs/gfs2/lock_dlm.c   |   5 +++
 fs/gfs2/log.c        |   2 +-
 fs/gfs2/lops.c       |  44 +++++++++++++--------
 fs/gfs2/meta_io.c    |   7 ++--
 fs/gfs2/ops_fstype.c |  53 +++++++++++++++++++++++++
 fs/gfs2/super.c      | 107 +++++++++------------------------------------------
 fs/gfs2/super.h      |   3 +-
 fs/gfs2/util.c       |   3 +-
 fs/gfs2/util.h       |   5 +++
 13 files changed, 139 insertions(+), 141 deletions(-)

