Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B77862B8
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Aug 2023 23:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692827181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xwzXGvvpmt4FEgLenzZ4PyVYxrazVCtDHUJfiFZMDNA=;
	b=VMAj+rIHn59iW0Ec5Tda2dicoaCht6Lc7k9qw0XW//tyjje8j6zry167l80+FoKJ3A0AnO
	o9wV9dg+osQHOlTuBLswTUliAG1g69DNmTij2PRtXHsvf0MLvYWjjSkdHyGijN1+w2XE8T
	bvaQMS3TPA9gdGDq9nNqdzlRxczfdjo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-SEXBd9cFON6JfPpuh_2hcw-1; Wed, 23 Aug 2023 17:46:17 -0400
X-MC-Unique: SEXBd9cFON6JfPpuh_2hcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5113685C70F;
	Wed, 23 Aug 2023 21:46:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44E9463F7A;
	Wed, 23 Aug 2023 21:46:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 061C61946594;
	Wed, 23 Aug 2023 21:46:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CA51C1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Aug 2023 21:33:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B468340C6F4E; Wed, 23 Aug 2023 21:33:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44F2D40C6F4C;
 Wed, 23 Aug 2023 21:33:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Wed, 23 Aug 2023 17:33:45 -0400
Message-Id: <20230823213352.1971009-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 0/7] lockd: dlm: async lock request changes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

I sent this as a PATCH now and drop the RFC. I got some review back from
Jeff Layton and hope I was successful to follow it. There are still
issues with lockd and asynchronous lock request but it will at least not
directly crash when somebody is using nfs on top of GFS2. The issues are
related to cancellation of locks/lockd decides to drop nlm_block for
some reasons while pending request is happening.

I did not change more documentation about the asynchronous lock request
functionality to not confuse users. In my opinion there should be more
documentation about what you SHOULD NOT do with this API. Otherwise I
think the documentation is still correct.

I will send a follow up patch to fsdevel to change all users using
IS_SETLKW() to use FL_SLEEP to determine if it's blocking or non-blocking
and send it to fsdevel as it was recommended. This will just be a grep
and replace patch and look what happens. 

- Alex

changes since RFC:

- drop the pending callback flag but introduce "lockd: don't call
  vfs_lock_file() for pending requests", see patch why I need it.
- drop per nlm_block callback mutex
- change async lock request documentation
- use always FL_SLEEP to determine if it's blocking vs non-blocking in
  DLM

Alexander Aring (7):
  lockd: introduce safe async lock op
  lockd: don't call vfs_lock_file() for pending requests
  lockd: fix race in async lock request handling
  lockd: add doc to enable EXPORT_OP_SAFE_ASYNC_LOCK
  dlm: use fl_owner from lockd
  dlm: use FL_SLEEP to determine blocking vs non-blocking
  dlm: implement EXPORT_OP_SAFE_ASYNC_LOCK

 fs/dlm/plock.c           | 20 +++++---------------
 fs/gfs2/export.c         |  1 +
 fs/lockd/svclock.c       | 40 +++++++++++++++++++++++++++-------------
 fs/locks.c               | 12 +++++++-----
 fs/nfsd/nfs4state.c      | 13 ++++++++++---
 fs/ocfs2/export.c        |  1 +
 include/linux/exportfs.h |  8 ++++++++
 7 files changed, 59 insertions(+), 36 deletions(-)

-- 
2.31.1

