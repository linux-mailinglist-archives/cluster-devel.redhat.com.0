Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 80E5A21388A
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Jul 2020 12:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593771555;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=44JtbJMmCSQYDS81jJeGZeKwGH9kWwFJF0hFzZPWY1Y=;
	b=YrEB/qa2UNdIN9vb/hTP4r3eUUn/pZgsZgn5OuiqtiHEILrSCZb1MVElLK9+qpUOtUR0+g
	PKYZuj/MumK/5JO8z5VqD0hx/KI/lD36dre9OclIJHoU/tkZZ6QX0DABbaAujvAh1zWkvF
	RQkxyhM58PcB4C7KURWkd+XJrbMwumM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-1_bYQ78VM8SM4Lk-d-RTMA-1; Fri, 03 Jul 2020 06:19:13 -0400
X-MC-Unique: 1_bYQ78VM8SM4Lk-d-RTMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F2391005510;
	Fri,  3 Jul 2020 10:19:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A90CC61462;
	Fri,  3 Jul 2020 10:19:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60F876C9C4;
	Fri,  3 Jul 2020 10:19:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063AIxhi014962 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 06:18:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E27DF7AC64; Fri,  3 Jul 2020 10:18:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F32B19CA0;
	Fri,  3 Jul 2020 10:18:55 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri,  3 Jul 2020 12:18:54 +0200
Message-Id: <20200703101854.1493930-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] Additional gfs2 fixes for 5.8
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi Linus,

could you please pull the following additional gfs2 fixes?

These don't conflict with the IOCB_NOIO / readahead deadlock fixes.

Thanks a lot,
Andreas

The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:

  Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.8-rc3.fixes

for you to fetch changes up to c860f8ffbea8924de05a281b937128773d30a77c:

  gfs2: The freeze glock should never be frozen (2020-07-03 12:05:35 +0200)

----------------------------------------------------------------
Various gfs2 fixes

----------------------------------------------------------------
Andreas Gruenbacher (2):
      gfs2: Don't return NULL from gfs2_inode_lookup
      gfs2: Don't sleep during glock hash walk

Bob Peterson (6):
      gfs2: fix trans slab error when withdraw occurs inside log_flush
      gfs2: eliminate GIF_ORDERED in favor of list_empty
      gfs2: freeze should work on read-only mounts
      gfs2: read-only mounts should grab the sd_freeze_gl glock
      gfs2: When freezing gfs2, use GL_EXACT and not GL_NOCACHE
      gfs2: The freeze glock should never be frozen

 fs/gfs2/glock.c      |  5 ++++-
 fs/gfs2/glops.c      | 10 ++++++----
 fs/gfs2/incore.h     |  1 -
 fs/gfs2/inode.c      |  3 ++-
 fs/gfs2/log.c        | 25 +++++++++++++++++++------
 fs/gfs2/log.h        |  4 ++--
 fs/gfs2/main.c       |  1 +
 fs/gfs2/ops_fstype.c | 13 ++++++++++++-
 fs/gfs2/recovery.c   |  4 ++--
 fs/gfs2/super.c      | 20 ++++++++++----------
 10 files changed, 58 insertions(+), 28 deletions(-)

