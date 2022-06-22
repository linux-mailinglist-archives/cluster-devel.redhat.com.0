Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E5555377
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jun 2022 20:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655923632;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m6VaOUZZnrgecL4C3Eg1XM3Jf/kbzAkdFeznLlOt7TI=;
	b=YfQXR84L/pJnvmRU8K7R9WNJtpHdXenC/x1GeUGiFQTkaa1ogsbpBoM88nqXvW9FTIwQWj
	ji1JuycZ+gctm+4+kaCTZRMeMTum8Keq5BQ8tUanP4sbFXt184j7V+du3W2Tve2QlwGpy7
	De9paFzfhi3IHXADq7BzcT/HGz6D9oM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-kWRz8mYAPkymALyhCPa_Lg-1; Wed, 22 Jun 2022 14:47:09 -0400
X-MC-Unique: kWRz8mYAPkymALyhCPa_Lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 777E78032F2;
	Wed, 22 Jun 2022 18:47:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BDBEC2810D;
	Wed, 22 Jun 2022 18:47:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0BF011947060;
	Wed, 22 Jun 2022 18:47:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A64941947054 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 22 Jun 2022 18:45:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8245640CFD0E; Wed, 22 Jun 2022 18:45:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63B5D40CFD0A;
 Wed, 22 Jun 2022 18:45:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 14:45:03 -0400
Message-Id: <20220622184523.1886869-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH RESEND v5.19-rc3 00/20] fs: dlm: plock,
 recovery and API deprecation
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

this patch series is just a resend to push them to dlm/next.
It contains mainly three things:

1. Users asking while using plocks on gfs2 why they see "dev_write no
op...". I reproduced a similar output by calling "stress-ng --fcntl 100"
and hitting ctrl-c. However I think this message is harmless. The
message occurs if the plock kernel handling cannot find the plock
operation which was requested anymore as the user send a reply. Hitting
ctrl-c at the right place we will delete the original requests from a
lookup datastructure. First I added patches to signal that those original
requests operations were removed and that's why a possible lookup will
fail. However it confuses users, this patch will change the plock handling
that we never should delete a request on purpose. If a interruption was
happened during a requests to the user space and back we will signal this
requests got interrupted and ignore the requests and cleanup the plock
handling after we get a reply from the user space back. If there are
still "dev_write no op..." messages it will signal a bug.

2. Changes due recovery handling e.g. wait until recovery is done when
recovery is triggered by dlm_new_lockspace() and try to run the
recovery mechanism several times if -EAGAIN is returned.

3. Remove the dlm waiters warning and deprecate the internal DLM timeout
handling for now which will be removed in kernel v5.22. Upcomming patches
to libdlm will effect that the linked application will disable the use
of the feature which will be deprecated now.

- Alex

changes since on mailinglist:
 - remove null terminated resource name in dlm traces
 - add commit msg why it's safe to access rsb->res_name in traces
 - move -EAGAIN in dlm_recover_directory() call (if -EINVAL is returned)
 - remove patch "fs: dlm: add WARN_ON for non waiter case"
 - remove patch "fs: dlm: add dlm_is_member() check if fenced"
 - add "not" in comment about lkb IFL flags
 - remove prototype of function which is removed in patch
   "fs: dlm: remove warn waiter handling"
 - change prototype to static inline in patch
   "fs: dlm: don't use deprecated API by default"

Alexander Aring (20):
  fs: dlm: plock use list_first_entry
  fs: dlm: remove may interrupted message
  fs: dlm: add pid to debug log
  fs: dlm: change log output to debug again
  fs: dlm: use dlm_plock_info for do_unlock_close
  fs: dlm: change posix lock sigint handling
  fs: dlm: change ast and bast trace order
  fs: dlm: remove additional dereference of lkbsb
  fs: dlm: add resource name to tracepoints
  fs: dlm: add notes for recovery and membership handling
  fs: dlm: call dlm_lsop_recover_prep once
  fs: dlm: let new_lockspace() wait until recovery
  fs: dlm: handle recovery result outside of ls_recover
  fs: dlm: handle recovery -EAGAIN case as retry
  fs: dlm: change -EINVAL recovery error to -EAGAIN
  fs: dlm: add comment about lkb IFL flags
  fs: dlm: remove warn waiter handling
  fs: dlm: remove timeout from dlm_user_adopt_orphan
  fs: dlm: add API deprecation warning
  fs: dlm: don't use deprecated API by default

 fs/dlm/Kconfig             |   9 +++
 fs/dlm/Makefile            |   2 +-
 fs/dlm/ast.c               |   4 +-
 fs/dlm/config.c            |  21 ++++--
 fs/dlm/config.h            |   3 +-
 fs/dlm/dir.c               |   4 ++
 fs/dlm/dlm_internal.h      |  32 +++++++--
 fs/dlm/lock.c              | 132 ++++++++++++++-----------------------
 fs/dlm/lock.h              |  17 ++++-
 fs/dlm/lockspace.c         |  31 +++++++--
 fs/dlm/member.c            |  30 ++++-----
 fs/dlm/netlink.c           |   8 +++
 fs/dlm/plock.c             |  51 +++++++++-----
 fs/dlm/recoverd.c          |  60 +++++++++++++++--
 fs/dlm/user.c              |  21 +++++-
 include/trace/events/dlm.h | 118 ++++++++++++++++++++++++++-------
 16 files changed, 378 insertions(+), 165 deletions(-)

-- 
2.31.1

