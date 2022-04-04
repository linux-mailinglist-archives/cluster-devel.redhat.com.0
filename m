Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0B4F1A11
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TnkGnBJt4Ax6kKlsBEi7/klvcUCZWXokf8clCOEsQWI=;
	b=I/rOYAJOCjH2orjZU4RAwlf2WdRHYGuDIwujkehMQ/lzmgqqD5DjKtAVkX5tYUD95pKFNL
	1R4qV4CtxDCS3BIrYCPwYkDu2/JDBXhAvK7MJAEHxeuMur6MoItvRql+S5hFrXNYchE/7X
	b6Wmy7ReYiPFGLvcpFCn24Yz81PDelE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-QvsCRiDlNxmGWoav3xYuwQ-1; Mon, 04 Apr 2022 16:07:22 -0400
X-MC-Unique: QvsCRiDlNxmGWoav3xYuwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E645100F81E;
	Mon,  4 Apr 2022 20:06:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 654492166B49;
	Mon,  4 Apr 2022 20:06:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0AD28194036A;
	Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1AB3119451EF for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ACAD87C43; Mon,  4 Apr 2022 20:06:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 888F67C28;
 Mon,  4 Apr 2022 20:06:49 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:27 -0400
Message-Id: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 00/19] fs: dlm: resend
 patches for v5.18-rc1
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi all,

this is a resend of all pending patches for dlm/next based on v5.18-rc1.
I removed some pending traces patches, I working on a dlm state viewer
and currently I need to figure out the needs for tracing.

- Alex

Alexander Aring (18):
  fs: dlm: fix missing check in validate_lock_args
  fs: dlm: fix plock invalid read
  fs: dlm: replace sanity checks with WARN_ON
  fs: dlm: cleanup plock_op vs plock_xop
  fs: dlm: rearrange async condition return
  fs: dlm: improve plock logging if interrupted
  fs: dlm: remove unnecessary INIT_LIST_HEAD()
  fs: dlm: move global to static inits
  fs: dlm: add __CHECKER__ for false positives
  fs: dlm: use __le types for options header
  fs: dlm: use __le types for dlm header
  fs: dlm: use __le types for rcom messages
  fs: dlm: use __le types for dlm messages
  fs: dlm: move conversion to compile time
  fs: dlm: remove __user conversion warnings
  fs: dlm: remove found label in dlm_master_lookup
  fs: dlm: cleanup lock handling in dlm_master_lookup
  fs: dlm: check required context while close

Dan Carpenter (1):
  fs: dlm: uninitialized variable on error in dlm_listen_for_all()

 fs/dlm/dir.c          |   2 +-
 fs/dlm/dlm_internal.h |  66 ++---
 fs/dlm/lock.c         | 548 ++++++++++++++++++++++--------------------
 fs/dlm/lockspace.c    |  12 +
 fs/dlm/lockspace.h    |   1 +
 fs/dlm/lowcomms.c     |  12 +-
 fs/dlm/member.c       |  11 +-
 fs/dlm/midcomms.c     |  61 +++--
 fs/dlm/plock.c        | 156 ++++++------
 fs/dlm/rcom.c         | 120 ++++-----
 fs/dlm/recover.c      |  10 +-
 fs/dlm/requestqueue.c |  20 +-
 fs/dlm/user.c         |  16 +-
 fs/dlm/util.c         |  92 +------
 fs/dlm/util.h         |   8 +-
 15 files changed, 546 insertions(+), 589 deletions(-)

-- 
2.31.1

