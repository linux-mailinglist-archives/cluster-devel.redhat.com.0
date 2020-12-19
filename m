Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A48332DF1C6
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 22:11:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608412302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dTGtJY+9wNly4hZX1MdxzXhtCkjgVNIWSrDydIXdAMU=;
	b=aMTEtJMxP8ZCdHmacB1McjDqXGl+qZi76X2NBm2f1TEnmwcfvwU918wvfSWR9ovai1eieC
	b55BjS6Kx6GLGVQ43vTNQnwb3dS9mgaZheCls2agmCQarv2SDgHkk8YpaIM7+AthP/BzGN
	oWWZqiz/Yiq5WPYL3xF0pU1ibakK1/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-z88kpROOPm6uPo59emaqlA-1; Sat, 19 Dec 2020 16:11:41 -0500
X-MC-Unique: z88kpROOPm6uPo59emaqlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84F05180A089;
	Sat, 19 Dec 2020 21:11:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA38E1A838;
	Sat, 19 Dec 2020 21:11:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3C614A7C6;
	Sat, 19 Dec 2020 21:11:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJLBY3o024286 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 16:11:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D9BF1A838; Sat, 19 Dec 2020 21:11:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2E561A7C1;
	Sat, 19 Dec 2020 21:11:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Dec 2020 22:11:27 +0100
Message-Id: <20201219211127.287454-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 changes for 5.11
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

could you please pull the following gfs2 changes for 5.11?

Thanks a lot,
Andreas

The following changes since commit dd0ecf544125639e54056d851e4887dbb94b6d2f:

  gfs2: Fix deadlock between gfs2_{create_inode,inode_lookup} and delete_work_func (2020-12-01 00:21:10 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.11

for you to fetch changes up to 6e5c4ea37a99e5b97aba227fc43f3682d4bc0496:

  gfs2: in signal_our_withdraw wait for unfreeze of _this_ fs only (2020-12-03 17:04:41 +0100)

----------------------------------------------------------------
Changes in gfs2:
* Don't wait for unfreeze of the wrong filesystems.
* Remove an obsolete delete_work_func hack and an incorrect sb_start_write.
* Minor documentation updates and cosmetic care.

----------------------------------------------------------------
Andreas Gruenbacher (2):
      gfs2: Make inode operations static
      Revert "GFS2: Prevent delete work from occurring on glocks used for create"

Andrew Price (2):
      Documentation: Update filesystems/gfs2.rst
      MAINTAINERS: Add gfs2 bug tracker link

Bob Peterson (2):
      gfs2: Remove sb_start_write from gfs2_statfs_sync
      gfs2: in signal_our_withdraw wait for unfreeze of _this_ fs only

Tom Rix (1):
      gfs2: remove trailing semicolons from macro definitions

 Documentation/filesystems/gfs2.rst | 37 ++++++++++++++++++-------------------
 MAINTAINERS                        |  2 +-
 fs/gfs2/glock.c                    |  8 --------
 fs/gfs2/incore.h                   |  1 -
 fs/gfs2/inode.c                    | 16 ++++++++--------
 fs/gfs2/inode.h                    |  3 ---
 fs/gfs2/super.c                    |  2 --
 fs/gfs2/util.c                     |  2 +-
 fs/gfs2/util.h                     |  6 +++---
 9 files changed, 31 insertions(+), 46 deletions(-)

