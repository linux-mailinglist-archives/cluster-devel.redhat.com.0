Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 57ECE1CF7F4
	for <lists+cluster-devel@lfdr.de>; Tue, 12 May 2020 16:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589295310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ayS808bLgmNMdF8Jk/2gP5FgQYDM/m50c1GF+CBCNaA=;
	b=QtIuaAvRQBEdalCRMhbEe7XKcD2CQfpM0/XO2KOVseAvtAocdS2GZ5wnJmI/CW3Ot/hLXV
	h3onikL2FRIavgtNJeyw3nMpsOMJ1Mg+XTQ/qVqyqWzbNmrQUt9nB9DTxUVNFYID/x7c3j
	HpPN7zCUDLOXo58oEzCRK5j+qHbTQ7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-H5hIpwwmM6eAe53MxySe3A-1; Tue, 12 May 2020 10:55:08 -0400
X-MC-Unique: H5hIpwwmM6eAe53MxySe3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C99211015DB5;
	Tue, 12 May 2020 14:54:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 028C85C1B5;
	Tue, 12 May 2020 14:54:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0E224E984;
	Tue, 12 May 2020 14:54:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04CEscrj021082 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 10:54:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 289075D9E8; Tue, 12 May 2020 14:54:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5E205D9DD;
	Tue, 12 May 2020 14:54:36 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 12 May 2020 16:54:34 +0200
Message-Id: <20200512145434.160164-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 fixes for 5.7
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi Linus,

could you please pull the following fixes for gfs2?

Thanks a lot,
Andreas

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.7-rc1.fixes

for you to fetch changes up to b14c94908b1b884276a6608dea3d0b1b510338b7:

  Revert "gfs2: Don't demote a glock until its revokes are written" (2020-05-08 15:01:25 -0500)

----------------------------------------------------------------
Various gfs2 fixes

Fixes for bugs prior to v5.7-rc1:
- Fix random block reads when reading fragmented journals (v5.2).
- Fix a possible random memory access in gfs2_walk_metadata (v5.3).

Fixes for v5.7-rc1:
- Fix several overlooked gfs2_qa_get / gfs2_qa_put imbalances.
- Fix several bugs in the new filesystem withdraw logic.

----------------------------------------------------------------
Andreas Gruenbacher (3):
      gfs2: Another gfs2_walk_metadata fix
      gfs2: More gfs2_find_jhead fixes
      gfs2: Grab glock reference sooner in gfs2_add_revoke

Bob Peterson (11):
      gfs2: fix withdraw sequence deadlock
      gfs2: Fix error exit in do_xmote
      gfs2: Fix BUG during unmount after file system withdraw
      gfs2: Fix use-after-free in gfs2_logd after withdraw
      gfs2: Fix problems regarding gfs2_qa_get and _put
      gfs2: Change BUG_ON to an assert_withdraw in gfs2_quota_change
      gfs2: remove check for quotas on in gfs2_quota_check
      gfs2: move privileged user check to gfs2_quota_lock_check
      gfs2: don't call quota_unhold if quotas are not locked
      gfs2: If go_sync returns error, withdraw but skip invalidate
      Revert "gfs2: Don't demote a glock until its revokes are written"

 fs/gfs2/bmap.c    | 16 +++++++++-------
 fs/gfs2/glock.c   |  6 ++----
 fs/gfs2/inode.c   |  7 ++++---
 fs/gfs2/log.c     | 11 ++++++++---
 fs/gfs2/lops.c    | 19 ++++++++++++-------
 fs/gfs2/meta_io.c |  2 +-
 fs/gfs2/quota.c   | 13 +++++--------
 fs/gfs2/quota.h   |  3 ++-
 fs/gfs2/super.c   |  1 -
 fs/gfs2/util.c    | 10 ++++++----
 10 files changed, 49 insertions(+), 39 deletions(-)

