Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F1546B3F
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 19:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654880790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=87nt8DHnwS8fYisQpk1mXKnODdXDk4wy+lRSm6vF0sk=;
	b=WZHU+lS4vX7p8yB7HQ7WkcmtZuNuzhWIwCOcJFYuzZbqguPS1ddrunxadTPdqJ/nw7uJME
	nodUmM61DpvGjDtu6M/a4RlY+y4/21yrcswREW0anu95RyFeHL3w1cpZkuk8EHlQWag1+n
	nPjulULMTu5fz+0dC97OQnbaTMh0ZtE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-PToUTJliP6WRhon6jT5h5A-1; Fri, 10 Jun 2022 13:06:27 -0400
X-MC-Unique: PToUTJliP6WRhon6jT5h5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2264B94AF48;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE7391415102;
	Fri, 10 Jun 2022 17:06:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 13B791947060;
	Fri, 10 Jun 2022 17:06:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C922719466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 17:06:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A468318EA5; Fri, 10 Jun 2022 17:06:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 824841730C;
 Fri, 10 Jun 2022 17:06:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 10 Jun 2022 13:06:09 -0400
Message-Id: <20220610170616.3480642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5.19-rc1 0/7] fs: dlm: recovery error
 handling
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

I have these patches laying around a long time... and it's maybe time to
bring them up. It does the three changes in dlm recovery handling:

1.

The dlm_lsop_recover_prep() callback should be called once after the
lockspace is stopped and not if it's already stopped when the recovery
is running. 

It will change possible:

dlm_lsop_recover_prep()
...
dlm_lsop_recover_prep()
dlm_lsop_recover_done()

to only have one possible prep call:

dlm_lsop_recover_prep()
dlm_lsop_recover_done()

2.

If a new_lockspace() is created we wait until a point when members are
successful pinged, then new_lockspace() returns to the caller. However
the recovery might be still running. Mostly all users of dlm will
workaround this with a dlm_lsop_recover_done() call wait to know the dlm
lockspace can be used now. This should be backwards compatible with the
existing dlm users, however they can drop their handling if they want.

3.

There exists two ways how recovery can be triggered. Either somebody called
new_lockspace(), that means a waiter waits until recovery is done. Or it
is a complete async process e.g. nodes joining/leaving the lockspace.
There is no caller in the async case which waits for dlm recovery is done,
therefore there exists no error handling which reacts on possible recovery
errors. This patch series will introduce a "best effort" approach to simple
retry/schedule() the recovery on error and hope the error gets resolved.
If this is not the case in 5 retries panic() will fence the node.

- Alex

Alexander Aring (7):
  fs: dlm: add notes for recovery and membership handling
  fs: dlm: call dlm_lsop_recover_prep once
  fs: dlm: let new_lockspace() wait until recovery
  fs: dlm: handle recovery result outside of ls_recover
  fs: dlm: handle recovery -EAGAIN case as retry
  fs: dlm: change -EINVAL recovery error to -EAGAIN
  fs: dlm: add WARN_ON for non waiter case

 fs/dlm/dlm_internal.h |  4 +--
 fs/dlm/lock.c         |  5 +++-
 fs/dlm/lockspace.c    |  9 ++++---
 fs/dlm/member.c       | 30 +++++++++++-----------
 fs/dlm/recoverd.c     | 60 ++++++++++++++++++++++++++++++++++++++++---
 5 files changed, 82 insertions(+), 26 deletions(-)

-- 
2.31.1

