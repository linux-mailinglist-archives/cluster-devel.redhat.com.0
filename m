Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D003739594A
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 12:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622458585;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XDhdJyYu9mTXSWKFBQ6lTq2vD2wtLvH820x3t8G/m0E=;
	b=K3UkrYkqrY1+Fxn9Q2fCofsDfAth4ck+rc8PWuJkwPM8P/A8xYdMC68dLNawfTvSQ5IzND
	gj4wVkJCFhlj1crUx+3dTS7c9Uqz4jeu5aROhZFiTV6iBu6ndq9zFEYJ68voQv+efHR4QZ
	j3seAEBQPOY21oCcvYCo8D1PM2Y0NtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-aRnaJjRrNx--ZfZbdPRgqA-1; Mon, 31 May 2021 06:56:24 -0400
X-MC-Unique: aRnaJjRrNx--ZfZbdPRgqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A986188E3CB;
	Mon, 31 May 2021 10:56:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0486E1B42E;
	Mon, 31 May 2021 10:56:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F126155346;
	Mon, 31 May 2021 10:56:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VAuChb020168 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 06:56:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A932661169; Mon, 31 May 2021 10:56:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9551860C0F;
	Mon, 31 May 2021 10:56:08 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 12:56:06 +0200
Message-Id: <20210531105606.228314-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for v5.13-rc5
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

please consider pulling the following gfs2 fixes for v5.13-rc5.

(I'll follow up with another set of fixes that may require additional
discussion later today.)

Thanks,
Andreas

The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.13-rc2-fixes

for you to fetch changes up to 1ab19c5de4c537ec0d9b21020395a5b5a6c059b2:

  gfs2: Fix use-after-free in gfs2_glock_shrink_scan (2021-05-31 12:03:28 +0200)

----------------------------------------------------------------
Various gfs2 fixes

----------------------------------------------------------------
Andreas Gruenbacher (2):
      gfs2: Prevent direct-I/O write fallback errors from getting lost
      gfs2: Fix mmap locking for write faults

Bob Peterson (4):
      gfs2: Fix I_NEW check in gfs2_dinode_in
      gfs2: fix scheduling while atomic bug in glocks
      gfs2: fix a deadlock on withdraw-during-mount
      gfs2: Clean up revokes on normal withdraws

Hillf Danton (1):
      gfs2: Fix use-after-free in gfs2_glock_shrink_scan

 fs/gfs2/file.c  |  9 +++++++--
 fs/gfs2/glock.c | 28 ++++++++++++++++++++++++----
 fs/gfs2/glops.c |  2 +-
 fs/gfs2/log.c   |  6 +++---
 fs/gfs2/log.h   |  1 +
 fs/gfs2/lops.c  |  7 ++++++-
 fs/gfs2/lops.h  |  1 +
 fs/gfs2/util.c  |  1 +
 8 files changed, 44 insertions(+), 11 deletions(-)

