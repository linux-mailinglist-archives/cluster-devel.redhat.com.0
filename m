Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B185F3598
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Oct 2022 20:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664821598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SUAwHqNFIaOPUYLVsPm7VMv/dvKWOFoch7fT0q85EK8=;
	b=RHgvWmMzu/lmxORxd/Hn6+19ZrLU56YwuCaKS0ztRkZFM9OZKFfGetJmsiYpJtzv7p/Aqz
	t6L3aq+vgB18AjH1RV1d+QxJ1fQ9RYaEg0pYfNGbNy4s84uAdAdnrMm7Xc9XmCSkYm1Qhi
	q9Vzrihqjj3F1RjdqyOd4YGt3DOxatg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-gQCV6N69M6yRCMd7t6fwFw-1; Mon, 03 Oct 2022 14:26:35 -0400
X-MC-Unique: gQCV6N69M6yRCMd7t6fwFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E5571C07595;
	Mon,  3 Oct 2022 18:26:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 038682027061;
	Mon,  3 Oct 2022 18:26:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8E3821946597;
	Mon,  3 Oct 2022 18:25:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 54E101946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  3 Oct 2022 18:25:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0F9CB2166B29; Mon,  3 Oct 2022 18:25:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5FCE2166B26;
 Mon,  3 Oct 2022 18:25:53 +0000 (UTC)
Date: Mon, 3 Oct 2022 13:25:52 -0500
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20221003182552.GA7517@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [GIT PULL] dlm updates for 6.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull dlm updates from tag:

git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.1

This set of commits includes:
. Fix a couple races found with a new torture test.
. Improve errors when api functions are used incorrectly.
. Improve tracing for lock requests from user space.
. Fix use after free in recently added tracing code.
. Small internal code cleanups.

Thanks,
Dave

Alexander Aring (16):
      fs: dlm: fix race in lowcomms
      fs: dlm: fix race between test_bit() and queue_work()
      fs: dlm: handle -EBUSY first in lock arg validation
      fs: dlm: handle -EBUSY first in unlock validation
      fs: dlm: use __func__ for function name
      fs: dlm: handle -EINVAL as log_error()
      fs: dlm: fix invalid derefence of sb_lvbptr
      fs: dlm: allow lockspaces have zero lvblen
      fs: dlm: handle rcom in else if branch
      fs: dlm: remove dlm_del_ast prototype
      fs: dlm: change ls_clear_proc_locks to spinlock
      fs: dlm: trace user space callbacks
      fs: dlm: remove DLM_LSFL_FS from uapi
      fs: dlm: LSFL_CB_DELAY only for kernel lockspaces
      fs: dlm: const void resource name parameter
      fs: dlm: fix possible use after free if tracing

 drivers/md/md-cluster.c    |   4 +-
 fs/dlm/ast.c               |  15 ++--
 fs/dlm/ast.h               |   1 -
 fs/dlm/dlm_internal.h      |   2 +-
 fs/dlm/lock.c              | 167 +++++++++++++++++++++++++++++----------------
 fs/dlm/lock.h              |   2 +-
 fs/dlm/lockspace.c         |  32 +++++++--
 fs/dlm/lockspace.h         |  13 ++++
 fs/dlm/lowcomms.c          |   4 ++
 fs/dlm/user.c              |  17 +++--
 fs/gfs2/lock_dlm.c         |   2 +-
 fs/ocfs2/stack_user.c      |   2 +-
 include/linux/dlm.h        |   5 +-
 include/trace/events/dlm.h |  26 +++----
 include/uapi/linux/dlm.h   |   1 -
 15 files changed, 193 insertions(+), 100 deletions(-)

