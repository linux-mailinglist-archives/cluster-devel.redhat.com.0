Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA44593A75
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660592618;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2A0RtH6mmm3RnHlO2wGYfCWdi5ZDvHBpe/F3SeGzt7g=;
	b=iOis0m/9IWacfa8Gq2zaM0ES0rXNlFGBy9nfgkH6HvLpWhlDlHQbHIKPs3JDxptMhMPaQU
	KUaPkTjski1HzFbwGfBL8fsYrfg0pHUfNy0QzfPyKW2SrhWarjFRPikhDbXxNICahHFzVD
	F2m6yf4Kvj17lmX0c+jh+xKrE4DKfY8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-4dYa8iabNLGyviPASMgriA-1; Mon, 15 Aug 2022 15:43:34 -0400
X-MC-Unique: 4dYa8iabNLGyviPASMgriA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53F6D1C07549;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E8F040D0160;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5ED5A1940354;
	Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14B0F194B966 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:43:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB176112131B; Mon, 15 Aug 2022 19:43:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEA181121315;
 Mon, 15 Aug 2022 19:43:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:43:12 -0400
Message-Id: <20220815194328.2208580-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [RESEND dlm/next 00/16] fs: dlm: fixes,
 cleanups and locktorture
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

this patch series contains fixes for lowcomms and -EBUSY handling. In
lowcomms we have a race which could end in a use after free. The current
validation of DLM API and between -EBUSY cases vs -EINVAL cases has a
issue because -EINVAL is checked on first but reading variables which
are only valid if there is a non -EBUSY case. To fix it we moved the
-EBUSY case check at first which should be always the first check which
should be done (in case of the current DLM API behaviour and -EBUSY). 

Then there are bunch of cleanup/fixes patches regarding the dlm callback
behaviour. Adding traceevents for dlm user space locks, before we only
captured kernel locks. Another cleanups like constify resource name
parameter prepares dlm for the a new locktorture module.

- Alex

changes since sending on mailinglist:

- fixed some error handling in locktorture if cluster is not
  configured at module init.
- add patch for else if branch for DLM_RCOM
- fixes user space tracing and error assign
- add WARN_ON(1) for -EINVAL case
- cleanup commit message for invalid derefence of sb_lvbptr

Alexander Aring (16):
  fs: dlm: fix race in lowcomms
  fs: dlm: fix race between test_bit() and queue_work()
  fs: dlm: handle -EBUSY as first for lock validation
  fs: dlm: handle -EBUSY as first for unlock validation
  fs: dlm: use __func__ for function name
  fs: dlm: handle -EINVAL as log_error()
  fs: dlm: fix invalid derefence of sb_lvbptr
  fs: dlm: allow lockspaces have zero lvblen
  fs: dlm: handle rcom in else if branch
  fs: dlm: remove dlm_del_ast prototype
  fs: dlm: change ls_clear_proc_locks to spinlock
  fs: dlm: trace user space callbacks
  fs: dlm: move DLM_LSFL_FS out of uapi
  fs: dlm: LSFL_CB_DELAY only for kernel lockspaces
  fs: dlm: const void resource name parameter
  fs: dlm: initial commit of locktorture

 drivers/md/md-cluster.c    |   4 +-
 fs/dlm/Kconfig             |  11 +
 fs/dlm/Makefile            |   1 +
 fs/dlm/ast.c               |  15 +-
 fs/dlm/ast.h               |   1 -
 fs/dlm/dlm_internal.h      |   2 +-
 fs/dlm/dlm_locktorture.c   | 517 +++++++++++++++++++++++++++++++++++++
 fs/dlm/lock.c              | 160 ++++++++----
 fs/dlm/lock.h              |   2 +-
 fs/dlm/lockspace.c         |  32 ++-
 fs/dlm/lockspace.h         |  13 +
 fs/dlm/lowcomms.c          |   4 +
 fs/dlm/user.c              |  17 +-
 fs/gfs2/lock_dlm.c         |   2 +-
 fs/ocfs2/stack_user.c      |   2 +-
 include/linux/dlm.h        |   5 +-
 include/trace/events/dlm.h |  26 +-
 include/uapi/linux/dlm.h   |   1 -
 18 files changed, 718 insertions(+), 97 deletions(-)
 create mode 100644 fs/dlm/dlm_locktorture.c

-- 
2.31.1

