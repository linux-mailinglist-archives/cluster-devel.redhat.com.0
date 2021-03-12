Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D86803392F1
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Mar 2021 17:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615565996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hd1Y8g/doR4JSStSaaWFs5iy4SzfG2qNO7QbxUyq6xg=;
	b=dJo5x3GSnyS/yDTeCituEpdCUNv8b05TOO9CZ9qjj276T418cgoXEKhtOmj50pLpB+fhXR
	+56mts2BOvw1ccQrzj11z8Uwmcej/W130fjOQoSgiT0uVlIMVa0jJAWaru/kP5QPGsqYNF
	M0ieyGiA+m8bGv0b/ea40O56vpHk91E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-peDAN5lbP5emXqSYw8LZTg-1; Fri, 12 Mar 2021 11:19:54 -0500
X-MC-Unique: peDAN5lbP5emXqSYw8LZTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D21961193;
	Fri, 12 Mar 2021 16:19:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5725710016FB;
	Fri, 12 Mar 2021 16:19:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E42671800232;
	Fri, 12 Mar 2021 16:19:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12CGJeG0022566 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Mar 2021 11:19:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF1FA5D735; Fri, 12 Mar 2021 16:19:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D67CA5D760;
	Fri, 12 Mar 2021 16:19:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Mar 2021 17:19:19 +0100
Message-Id: <20210312161919.1595228-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for 5.12-rc3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following gfs2 fixes.

Thanks,
Andreas

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.12-rc2-fixes

for you to fetch changes up to 0efc4976e3da40b09c592b21f722022d8f12a16b:

  gfs2: bypass log flush if the journal is not live (2021-03-12 15:52:48 +0100)

----------------------------------------------------------------
Various gfs2 fixes

----------------------------------------------------------------
Bob Peterson (3):
      gfs2: fix use-after-free in trans_drain
      gfs2: bypass signal_our_withdraw if no journal
      gfs2: bypass log flush if the journal is not live

Yang Li (1):
      gfs2: make function gfs2_make_fs_ro() to void type

 fs/gfs2/log.c        |  6 +++++-
 fs/gfs2/ops_fstype.c |  4 +---
 fs/gfs2/super.c      | 10 ++--------
 fs/gfs2/super.h      |  2 +-
 fs/gfs2/trans.c      |  2 ++
 fs/gfs2/util.c       | 17 +++++++++++------
 6 files changed, 22 insertions(+), 19 deletions(-)

