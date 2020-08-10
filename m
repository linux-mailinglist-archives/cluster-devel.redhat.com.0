Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 34EF9240D12
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Aug 2020 20:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597084617;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QXfIGxWYHli8UViM6M93oQLb9NwlH1AHgGXp2GsD3So=;
	b=frLeNsFgoDh/XPfE23FWASSdFNiyXI8Kn93VRUFyEjTTkl+ZEkwvQqwjSavbAf0iIY6agm
	FeM2S48qospUDGvzOv7bhTMEsLoiqFSJG1uMP8N4JeAW8CjBWdEJcUNmPh2RR2cH57Xt/4
	BxeLrdxSBdQs6ii6RVyBusw6mHC1+QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-tbWeXqQQPY-smjOH5S4jbQ-1; Mon, 10 Aug 2020 14:36:55 -0400
X-MC-Unique: tbWeXqQQPY-smjOH5S4jbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D186D8014D7;
	Mon, 10 Aug 2020 18:36:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A53310013D5;
	Mon, 10 Aug 2020 18:36:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B385A5522;
	Mon, 10 Aug 2020 18:36:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AIaeLC002470 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 14:36:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5FE955D9D3; Mon, 10 Aug 2020 18:36:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.194.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D0045D9E7;
	Mon, 10 Aug 2020 18:36:35 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Aug 2020 20:36:34 +0200
Message-Id: <20200810183634.617307-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 changes for 5.9
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi Linus,

please consider pulling the following gfs2 changes for 5.9.

Thanks a lot,
Andreas

The following changes since commit 11ba468877bb23f28956a35e896356252d63c983:

  Linux 5.8-rc5 (2020-07-12 16:34:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.9

for you to fetch changes up to e28c02b94f9e039beeb5c75198caf6e17b66c520:

  gfs2: When gfs2_dirty_inode gets a glock error, dump the glock (2020-08-07 17:26:24 +0200)

----------------------------------------------------------------
Changes in gfs2:

- Make sure transactions won't be started recursively in gfs2_block_zero_range.
  (Bug introduced in 5.4 when switching to iomap_zero_range.)
- Fix a glock holder refcount leak introduced in the iopen glock locking
  scheme rework merged in 5.8.
- A few other small improvements (debugging, stack usage, comment fixes).

----------------------------------------------------------------
Andreas Gruenbacher (3):
      gfs2: Pass glock holder to gfs2_file_direct_{read,write}
      gfs2: Fix refcount leak in gfs2_glock_poke
      fs: Fix typo in comment

Bob Peterson (5):
      gfs2: Add some flags missing from glock output
      gfs2: Fix inaccurate comment
      gfs2: print details on transactions that aren't properly ended
      gfs2: Never call gfs2_block_zero_range with an open transaction
      gfs2: When gfs2_dirty_inode gets a glock error, dump the glock

 fs/gfs2/bmap.c     | 69 ++++++++++++++++++++++++++++++------------------------
 fs/gfs2/file.c     | 31 ++++++++++++------------
 fs/gfs2/glock.c    | 10 +++++++-
 fs/gfs2/log.c      |  2 +-
 fs/gfs2/super.c    |  1 +
 fs/gfs2/trans.c    | 29 +++++++++++++----------
 include/linux/fs.h |  2 +-
 7 files changed, 82 insertions(+), 62 deletions(-)

