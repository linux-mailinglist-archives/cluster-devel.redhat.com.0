Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9D32CC882
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Dec 2020 22:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606942823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+vREiEPZRIjTwsNkTSi1a+k2IWXR/FPdIg8I6gi4lcI=;
	b=NkN+E/tLQuQuts/3T985h0TEspf0bQ5KbDVPUaagHl197nW66L8a/N7sZtGR5xIfGZ/6vN
	dRqLZnOmJp3a+Z91DpY5mKObRUWf3F+m46wt9aBBWU5Jx+2XJ4u+Kv014HxlbBE36GxVlg
	wIxEPu0epAu1vcFs6UDimYOt6PEdf6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-_Qh9At1wM3eRXSSjamy0Eg-1; Wed, 02 Dec 2020 16:00:20 -0500
X-MC-Unique: _Qh9At1wM3eRXSSjamy0Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8648B10151EC;
	Wed,  2 Dec 2020 21:00:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 424E75D72E;
	Wed,  2 Dec 2020 21:00:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C85BD5002D;
	Wed,  2 Dec 2020 21:00:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B2Kwg0g003635 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 15:58:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61C113A3; Wed,  2 Dec 2020 20:58:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AEDF19D7C;
	Wed,  2 Dec 2020 20:58:41 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed,  2 Dec 2020 21:58:39 +0100
Message-Id: <20201202205839.843476-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for 5.10-rc5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following additional gfs2 fixes.

Thanks,
Andreas

The following changes since commit 418baf2c28f3473039f2f7377760bd8f6897ae18:

  Linux 5.10-rc5 (2020-11-22 15:36:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.10-rc5-fixes

for you to fetch changes up to dd0ecf544125639e54056d851e4887dbb94b6d2f:

  gfs2: Fix deadlock between gfs2_{create_inode,inode_lookup} and delete_work_func (2020-12-01 00:21:10 +0100)

----------------------------------------------------------------
Various gfs2 fixes

----------------------------------------------------------------
Alexander Aring (2):
      gfs2: Fix deadlock dumping resource group glocks
      gfs2: set lockdep subclass for iopen glocks

Andreas Gruenbacher (2):
      gfs2: Upgrade shared glocks for atime updates
      gfs2: Fix deadlock between gfs2_{create_inode,inode_lookup} and delete_work_func

Bob Peterson (2):
      gfs2: check for empty rgrp tree in gfs2_ri_update
      gfs2: Don't freeze the file system during unmount

 fs/gfs2/glock.c  |  1 +
 fs/gfs2/glops.c  |  6 ++++--
 fs/gfs2/incore.h |  1 +
 fs/gfs2/inode.c  | 42 ++++++++++++++++++++++++++++++++----------
 fs/gfs2/rgrp.c   |  4 ++++
 5 files changed, 42 insertions(+), 12 deletions(-)

