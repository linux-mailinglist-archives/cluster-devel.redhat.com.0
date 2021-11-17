Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357A455132
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Nov 2021 00:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637192237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0HRQqF9IyHODpVuBExdtm/2V021JyHA28AYvgsTshqc=;
	b=XYDh/BZibtTCKPHOrw/+VGBybJXDbkOnYM+em4Tmp1YmsH8wyV0dR18G8cfn93vdxF6LNg
	ZEFXXwTtzRlZVuEly4jRE3aC0H44cqsthRQ6i+3bAsPe2N9w8nyJ4y1Es/amWFR4oU00oN
	f/EdW/S5qouxzmL0E6lWUAXydvjjKY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-XaNswkLwPhG55bR2pBUhdA-1; Wed, 17 Nov 2021 18:37:14 -0500
X-MC-Unique: XaNswkLwPhG55bR2pBUhdA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC54387D542;
	Wed, 17 Nov 2021 23:37:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E17D608BA;
	Wed, 17 Nov 2021 23:37:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E0ED4EA2A;
	Wed, 17 Nov 2021 23:37:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHNb3pj004205 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 18:37:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3E46E5DEFA; Wed, 17 Nov 2021 23:37:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39CB75DAA5;
	Wed, 17 Nov 2021 23:36:58 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Nov 2021 00:36:56 +0100
Message-Id: <20211117233656.77861-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for v5.16-rc2
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

please consider pulling the following gfs2 fixes for -rc2.  The one thing that
stands out is this commit:

  gfs2: Prevent endless loops in gfs2_file_buffered_write

We have a choice here between the proper fix in iomap_write_iter and
generic_perform_write and this patch, which is just a workaround.  I've tried
to get your feedback on this before:

  https://lore.kernel.org/all/20211110174457.533866-1-agruenba@redhat.com/

To me, it seems to be too late for the proper fix for v5.16 now; please advise
if you think otherwise.

Thanks,
Andreas


The following changes since commit 78805cbe5d72ad27a56962a8072edbcb45ca1180:

  Merge tag 'gfs2-v5.15-rc5-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2021-11-02 12:35:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.16-rc2-fixes

for you to fetch changes up to 554c577cee95bdc1d03d9f457e57dc96eb791845:

  gfs2: Prevent endless loops in gfs2_file_buffered_write (2021-11-10 18:22:37 +0100)

----------------------------------------------------------------
Fixes in gfs2:
* The current iomap_file_buffered_write behavior of failing the entire
  write when part of the user buffer cannot be faulted in leads to an
  endless loop in gfs2.  Work around that in gfs2 for now.
* Various other bugs all over the place.

----------------------------------------------------------------
Andreas Gruenbacher (5):
      gfs2: Only dereference i->iov when iter_is_iovec(i)
      gfs2: Fix atomic bug in gfs2_instantiate
      gfs2: Fix length of holes reported at end-of-file
      gfs2: Fix "Introduce flag for glock holder auto-demotion"
      gfs2: Prevent endless loops in gfs2_file_buffered_write

Bob Peterson (1):
      gfs2: release iopen glock early in evict

 fs/gfs2/bmap.c  |  2 +-
 fs/gfs2/file.c  |  9 ++++++---
 fs/gfs2/glock.c | 12 ++++--------
 fs/gfs2/super.c | 14 +++++++-------
 4 files changed, 18 insertions(+), 19 deletions(-)

