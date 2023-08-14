Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B977C226
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Aug 2023 23:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692047495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x6X/UhlcOZkD6o+yr1KBD7CLkqi3R+/GBSx6Mum85Rc=;
	b=Lde1dnFcxs7Il4lbQV/HAIgDfbjXXBf3ytvv1ggCkmvXZPCTMprUG6c2/uM17Xo1NtrmkQ
	+XsKWfYJMO90XsGp0lDc0I9/mBi/qh8Pk6i2zN5JxTV5z7gtS4uUMpfQCvl1Ku5O3O+KE3
	fbY/CI/+DTwiR+BaDUS37F2/nG/lLRg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-jyTeA4I7My6JHMGAtvBnJQ-1; Mon, 14 Aug 2023 17:11:28 -0400
X-MC-Unique: jyTeA4I7My6JHMGAtvBnJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6709E29AA2E9;
	Mon, 14 Aug 2023 21:11:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3009640679C1;
	Mon, 14 Aug 2023 21:11:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D3F6C194658D;
	Mon, 14 Aug 2023 21:11:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7B3C01946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 14 Aug 2023 21:11:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B0D7C15BB8; Mon, 14 Aug 2023 21:11:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B483EC15BAD;
 Mon, 14 Aug 2023 21:11:21 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Mon, 14 Aug 2023 17:11:09 -0400
Message-Id: <20230814211116.3224759-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [RFCv2 0/7] fs: nfs: async lock request changes
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
Cc: jlayton@kernel.org, cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev,
 chuck.lever@oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

this patch series contains changes to lockd asynchronous lock request
handling over vfs_lock_file(). The only one upstream user so far I see
is DLM. The current DLM handling of asynchronous lock request is broken.
Those patches makes the asynchronous lock request handling better, there
are still issues with fencing or lock cancellation that this patch
series does not tackle.

The cifs filesystem is another user of FILE_LOCK_DEFERRED but it does
not do anything on checking lm_grant() as the asynchronous lock API is
required to check if it's set.

- Alex

changes since v2:
 - add dlm fixes/changes to show how the new API should work. It's used
   by gfs2/ocfs2.
 - handle non-blocking request synchronously. For this reason we needed
   to introduce a new per nlm_block request to fix a race between
   request and lm_grant() callback handling, see b_cb_mutex
 - update documentation for new FL_SLEEP handling when lm_grant() is
   set and new requirement that lm_grant() need to be called from a
   sleepable contex.
 - clear new CALLBACK PENDING flag when nlm_block is removed from
   nlm_blocked
 - introduce helper export_op_support_safe_async_lock() to check if
   the filesystem supports asynchronous lock request calls
 - fix block variable never NULL when iterating over nlm_blocked list

Alexander Aring (7):
  lockd: fix race in async lock request handling
  lockd: FILE_LOCK_DEFERRED only on FL_SLEEP
  lockd: introduce safe async lock op
  locks: update lock callback documentation
  dlm: use fl_owner from lockd
  dlm: use FL_SLEEP to check if blocking request
  dlm: implement EXPORT_OP_SAFE_ASYNC_LOCK

 fs/dlm/plock.c              |  54 +++++++-------
 fs/gfs2/export.c            |   1 +
 fs/lockd/svclock.c          | 140 ++++++++++++++++++++----------------
 fs/locks.c                  |  28 ++++----
 fs/nfsd/nfs4state.c         |  13 +++-
 fs/ocfs2/export.c           |   1 +
 include/linux/exportfs.h    |   8 +++
 include/linux/lockd/lockd.h |   2 +
 8 files changed, 140 insertions(+), 107 deletions(-)

-- 
2.31.1

