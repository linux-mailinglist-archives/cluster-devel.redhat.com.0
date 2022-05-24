Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB295331D4
	for <lists+cluster-devel@lfdr.de>; Tue, 24 May 2022 21:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653421315;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wpWaat9buR/Fif/C0TdvorPSW4jwB7itL0WsZiKv6+A=;
	b=gb4yeUCDXKyivNwOztcna8rBjXZE9BdIfCaSim6ex8yS3PZxad8OjMCrrVrIoU2MSr8iX7
	LYEX8ikWQwXJxnFge9G3tSJmiNFgJNRCPJV1EdtpfLTOAv8mM3ODeLnk9VfxFn5k5mcFus
	tkpGE/gw1cGhb/z9+N8RgIwQk/gT8AY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-NA9vNTzzP92IEre4rHYyrw-1; Tue, 24 May 2022 15:41:52 -0400
X-MC-Unique: NA9vNTzzP92IEre4rHYyrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3196185A79C;
	Tue, 24 May 2022 19:41:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 068B0112131B;
	Tue, 24 May 2022 19:41:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CA5C6193222F;
	Tue, 24 May 2022 19:41:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 77E21194EBA0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 24 May 2022 19:41:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4273F3323E; Tue, 24 May 2022 19:41:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B95A7AD8;
 Tue, 24 May 2022 19:41:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 May 2022 21:41:45 +0200
Message-Id: <20220524194145.884805-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fixes for 5.19.

Thank you very much,
Andreas

The following changes since commit d928e8f3af38abc8d2d56d9329a8280f7af5f10e:

  Merge tag 'gfs2-v5.18-rc4-fix3' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2022-05-13 14:32:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.18-rc6-fixes

for you to fetch changes up to c360abbb9db298d0548b31e1a86a48ebb157d7cd:

  gfs2: Convert function bh_get to use iomap (2022-05-24 21:29:14 +0200)

----------------------------------------------------------------
gfs2 fixes

- Clean up the allocation of glocks that have an address space attached.
- Quota locking fix and quota iomap conversion.
- Fix the FITRIM error reporting.
- Some list iterator cleanups.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Explain some direct I/O oddities

Andrew Price (1):
      gfs2: Return more useful errors from gfs2_rgrp_send_discards()

Bob Peterson (2):
      gfs2: use i_lock spin_lock for inode qadata
      gfs2: Convert function bh_get to use iomap

Jakob Koschel (1):
      gfs2: replace 'found' with dedicated list iterator variable

Kees Cook (1):
      gfs2: Use container_of() for gfs2_glock(aspace)

 fs/gfs2/file.c     |  4 ++++
 fs/gfs2/glock.c    | 35 ++++++++++++++++--------------
 fs/gfs2/glock.h    | 12 +++++++++--
 fs/gfs2/main.c     | 10 ++++-----
 fs/gfs2/meta_io.h  |  8 ++++---
 fs/gfs2/quota.c    | 62 ++++++++++++++++++++++++++++++++----------------------
 fs/gfs2/recovery.c | 22 +++++++++----------
 fs/gfs2/rgrp.c     |  4 ++--
 8 files changed, 91 insertions(+), 66 deletions(-)

