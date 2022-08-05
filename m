Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF358B0C2
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Aug 2022 22:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659730377;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EWmziQ+zkkO5p4AUbX/aH6NjevdABku8Grwyp4hC0jQ=;
	b=iLlgnKIcqyhcJBRWjL5nSG0KevbVEef1qODcFCLNXmanJ8Eb84ZpJ1drzxVkmcjoXvi/83
	/Tgyx6oywsW2mAvvx9W8LRuCFyGIB2W9SMBe1ylciGoQnnClm8s7L2Wq4tk42guHxerlzh
	W5/PXPU7VohdNuPEzejluQpqbYSaDW8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-TTfSs3l1MpytnfIwF9UwHA-1; Fri, 05 Aug 2022 16:12:54 -0400
X-MC-Unique: TTfSs3l1MpytnfIwF9UwHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 124BF802D1C;
	Fri,  5 Aug 2022 20:12:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AD62C23DBF;
	Fri,  5 Aug 2022 20:12:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51C351932220;
	Fri,  5 Aug 2022 20:12:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 23E461932216 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  5 Aug 2022 20:12:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0667BC27DB3; Fri,  5 Aug 2022 20:12:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fedora.redhat.com (unknown [10.40.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8880C28125;
 Fri,  5 Aug 2022 20:12:49 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri,  5 Aug 2022 22:12:48 +0200
Message-Id: <20220805201248.123846-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fixes.

Thank you very much,
Andreas

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.19-rc4-fixes

for you to fetch changes up to 446279168e030fd0ed68e2bba336bef8bb3da352:

  Merge part of branch 'for-next.instantiate' into for-next (2022-08-05 18:37:03 +0200)

----------------------------------------------------------------
gfs2 fixes

- Instantiate glocks ouside of the glock state engine, in the contect of
  the process taking the glock.  This moves unnecessary complexity out
  of the core glock code.  Clean up the instantiate logic to be more
  sensible.

- In gfs2_glock_async_wait(), cancel pending locking request upon
  failure.  Make sure all glocks are left in a consistent state.

- Various other minor cleanups and fixes.

----------------------------------------------------------------
Andreas Gruenbacher (9):
      gfs2: Minor gfs2_glock_nq_m cleanup
      gfs2: Fix up gfs2_glock_async_wait
      gfs2: Instantiate glocks ouside of glock state engine
      gfs2: Revert 'Fix "truncate in progress" hang'
      gfs2: Add new go_held glock operation
      gfs2: Make go_instantiate take a glock
      gfs2: Use better variable name
      gfs2: List traversal in do_promote is safe
      Merge part of branch 'for-next.instantiate' into for-next

Bob Peterson (2):
      gfs2: Rewrap overlong comment in do_promote
      gfs2: do_promote glock holder stealing fix

Minghao Chi (1):
      gfs2: Remove redundant NULL check before kfree

Zhang Jiaming (1):
      gfs2: Fix spelling mistake in comment

 fs/gfs2/dir.c        |   2 +-
 fs/gfs2/file.c       |   3 +-
 fs/gfs2/glock.c      | 200 ++++++++++++++++++++-------------------------------
 fs/gfs2/glock.h      |   2 +-
 fs/gfs2/glops.c      |  31 ++++----
 fs/gfs2/incore.h     |   6 +-
 fs/gfs2/lock_dlm.c   |   2 +-
 fs/gfs2/main.c       |   1 -
 fs/gfs2/ops_fstype.c |   2 -
 fs/gfs2/quota.c      |  28 +-------
 fs/gfs2/rgrp.c       |  12 ++--
 fs/gfs2/rgrp.h       |   5 +-
 fs/gfs2/super.c      |   2 +-
 fs/gfs2/xattr.c      |   2 +-
 14 files changed, 111 insertions(+), 187 deletions(-)

