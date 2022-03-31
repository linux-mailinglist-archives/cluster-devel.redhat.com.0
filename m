Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B44EE268
	for <lists+cluster-devel@lfdr.de>; Thu, 31 Mar 2022 22:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648757542;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jBPSjnhwpWFALN0L6yWTQywPWw7srfjFAJx0tzMpuE8=;
	b=JxJ3olnBo7MnsdcK8vSyM13qREV/tshwNUeDsvXoaOSVrTnum8EP5ysoq4QGzb1xwrWna7
	qtJ5lxH8WqQL/Q2IwB25SRMk3+dd/xFLIXvJ+nYpWytoDJ7CKSqzQNj77zq9ksQnQFCyXc
	wFMdqe0HvdMXO6vIsyZBpNaYtKGHecU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-fTBQYTlGPEypq-zRJ5uVow-1; Thu, 31 Mar 2022 16:12:19 -0400
X-MC-Unique: fTBQYTlGPEypq-zRJ5uVow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E9CF2800161;
	Thu, 31 Mar 2022 20:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1331540CF8EB;
	Thu, 31 Mar 2022 20:11:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C7D511947BBE;
	Thu, 31 Mar 2022 20:11:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 956F419451F3 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 20:11:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8D77401E67; Thu, 31 Mar 2022 20:11:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3216C401DAD;
 Thu, 31 Mar 2022 20:11:52 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 31 Mar 2022 22:11:49 +0200
Message-Id: <20220331201149.566786-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [GIT PULL] gfs fixes for 5.18-rc1
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fixes for 5.18-rc1.

Thanks,
Andreas

The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07:

  Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.17-rc4-fixes

for you to fetch changes up to 27ca8273fda398638ca994a207323a85b6d81190:

  gfs2: Make sure FITRIM minlen is rounded up to fs block size (2022-03-31 20:35:38 +0200)

----------------------------------------------------------------
gfs2 fixes

* To avoid deadlocks, actively cancel dlm locking requests when we give
  up on them.  Further dlm operations on the same lock will return
  -EBUSY until the cancel has been completed, so in that case, wait and
  repeat.  (This is rare.)
* Lock inversion fixes in gfs2_inode_lookup() and gfs2_create_inode().
* Some more fallout from the gfs2 mmap + page fault deadlock fixes
  (merge c03098d4b9ad7).
* Various other minor bug fixes and cleanups.

----------------------------------------------------------------
Andreas Gruenbacher (12):
      gfs2: gfs2_setattr_size error path fix
      gfs2: Expect -EBUSY after canceling dlm locking requests
      gfs2: cancel timed-out glock requests
      gfs2: Switch lock order of inode and iopen glock
      gfs2: Make use of list_is_first
      gfs2: Initialize gh_error in gfs2_glock_nq
      gfs2: Fix should_fault_in_pages() logic
      gfs2: Disable page faults during lockless buffered reads
      gfs2: Minor retry logic cleanup
      gfs2: Fix gfs2_file_buffered_write endless loop workaround
      gfs2: Remove dead code in gfs2_file_read_iter
      gfs2: Make sure not to return short direct writes

Andrew Price (1):
      gfs2: Make sure FITRIM minlen is rounded up to fs block size

Bob Peterson (2):
      gfs2: assign rgrp glock before compute_bitstructs
      gfs2: Remove return value for gfs2_indirect_init

 fs/gfs2/bmap.c     |  9 ++++----
 fs/gfs2/file.c     | 68 ++++++++++++++++++++++++++----------------------------
 fs/gfs2/glock.c    | 14 +++++++++--
 fs/gfs2/inode.c    | 51 ++++++++++++++++++++++------------------
 fs/gfs2/lock_dlm.c | 15 +++++++++++-
 fs/gfs2/rgrp.c     | 19 ++++++++-------
 fs/gfs2/rgrp.h     |  2 +-
 fs/gfs2/super.c    |  2 +-
 8 files changed, 104 insertions(+), 76 deletions(-)

