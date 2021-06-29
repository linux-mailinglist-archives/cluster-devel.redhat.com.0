Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3013B70AC
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Jun 2021 12:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624962453;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x398MrgI290saNP+FLjnBg/QVE3FScuPBdMIn1/f/oM=;
	b=U/hpptSnxr6ZK8AZdyJsxIZiciPxeLPtbKIY+eGtXTaGoN1zgK4X9F6BcwROxBNFD6KqoH
	wy2uMxGfXyOaCBPsYyIMvlXXDn2o5eZXKl6rjsZmptxzhg5uYMhzGEyhqfBk7qlLASdmBL
	ysihwkTFBVFoLo288dKKiQZSimFLqRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-D8dzC940PWyn6BtWl8vYyA-1; Tue, 29 Jun 2021 06:27:32 -0400
X-MC-Unique: D8dzC940PWyn6BtWl8vYyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ECAC5074B;
	Tue, 29 Jun 2021 10:27:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 836FF5DA60;
	Tue, 29 Jun 2021 10:27:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31DB01809C99;
	Tue, 29 Jun 2021 10:27:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15TARGLC000774 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 29 Jun 2021 06:27:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF0BC101E663; Tue, 29 Jun 2021 10:27:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 425BE100164A;
	Tue, 29 Jun 2021 10:27:12 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Jun 2021 12:27:10 +0200
Message-Id: <20210629102710.1934579-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] Various minor gfs2 cleanups and fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following gfs2 changes for 5.14.

Thanks a lot,
Andreas

The following changes since commit 62fb9874f5da54fdb243003b386128037319b219:

  Linux 5.13 (2021-06-27 15:21:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.13-fixes

for you to fetch changes up to 7a607a41cdc6c6f27b8e234cb44ce57070513dac:

  gfs2: Clean up gfs2_unstuff_dinode (2021-06-29 10:56:51 +0200)

----------------------------------------------------------------
Various minor gfs2 cleanups and fixes

----------------------------------------------------------------
Andreas Gruenbacher (6):
      gfs2: Fix do_gfs2_set_flags description
      gfs2: Fix underflow in gfs2_page_mkwrite
      gfs2: Fix error handling in init_statfs
      gfs2: Clean up the error handling in gfs2_page_mkwrite
      gfs2: Unstuff before locking page in gfs2_page_mkwrite
      gfs2: Clean up gfs2_unstuff_dinode

Baokun Li (1):
      gfs2: Use list_move_tail instead of list_del/list_add_tail

 fs/gfs2/bmap.c       | 62 ++++++++++++++++++++---------------------
 fs/gfs2/bmap.h       |  2 +-
 fs/gfs2/dir.c        |  2 +-
 fs/gfs2/file.c       | 79 ++++++++++++++++++++++++++++++++--------------------
 fs/gfs2/glock.c      |  3 +-
 fs/gfs2/ops_fstype.c |  1 +
 fs/gfs2/quota.c      |  2 +-
 7 files changed, 85 insertions(+), 66 deletions(-)

