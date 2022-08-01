Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D8A586D27
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Aug 2022 16:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659365018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lHBn5LnyRO9uny/Jc1eLld7xvN44+4tID8y8dm6xkco=;
	b=Nzze5dYnQ34VrrLy51gsgwV5d9khTbRGkOqq3BxDsUdLGOi850/8UyzwHS2Vmvoo+8Th9g
	dsX0eFjbO3QZjx/srZE7rWADZ/xZl3acqZ/ZkMEh5L/rFKADZESoAdvTxJ4wKQLzD7AIFT
	Xr+usCE/c2HWhqVcGN1KlfW8vjGDHOg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-kbWQK72UO9GpCBxTmG7c7A-1; Mon, 01 Aug 2022 10:43:35 -0400
X-MC-Unique: kbWQK72UO9GpCBxTmG7c7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FB7C85A58B;
	Mon,  1 Aug 2022 14:43:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 533C6141510F;
	Mon,  1 Aug 2022 14:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 289D01946A47;
	Mon,  1 Aug 2022 14:43:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 855B41946A40 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  1 Aug 2022 14:43:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6429D2026D07; Mon,  1 Aug 2022 14:43:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 304CC2026D64;
 Mon,  1 Aug 2022 14:43:31 +0000 (UTC)
Date: Mon, 1 Aug 2022 09:43:29 -0500
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20220801144329.GA10643@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [GIT PULL] dlm updates for 6.0
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull dlm updates from tag:

git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.0

Changes in this set of commits:

. Delay the cleanup of interrupted posix lock requests until the
  user space result arrives. Previously, the immediate cleanup
  would lead to extraneous warnings when the result arrived.

. Tracepoint improvements, e.g. adding the lock resource name.

. Delay the completion of lockspace creation until one full recove
  cycle has completed. This allows more error cases to be returned
  the caller.

. Remove warnings from the locking layer about delayed network rep
  The recently added midcomms warnings are much more useful.

. Begin the process of deprecating two unused lock-timeout-related
  features. These features now require enabling via a Kconfig opti
  and enabling them triggers deprecation warnings. We expect to
  remove the code in v6.2.

Thanks,
Dave

(You can ignore the premature 5.20 pull request from some weeks ago.)

Alexander Aring (19):
      fs: dlm: plock use list_first_entry
      fs: dlm: add pid to debug log
      fs: dlm: change plock interrupted message to debug again
      fs: dlm: use dlm_plock_info for do_unlock_close
      fs: dlm: change posix lock sigint handling
      fs: dlm: change ast and bast trace order
      fs: dlm: remove additional dereference of lksb
      fs: dlm: add resource name to tracepoints
      fs: dlm: update comments about recovery and membership handling
      fs: dlm: call dlm_lsop_recover_prep once
      fs: dlm: make new_lockspace() wait until recovery completes
      fs: dlm: handle recovery result outside of ls_recover
      fs: dlm: add comment about lkb IFL flags
      fs: dlm: fix grammar in lowcomms output
      fs: dlm: remove waiter warnings
      fs: dlm: remove timeout from dlm_user_adopt_orphan
      fs: dlm: add deprecation Kconfig and warnings for timeouts
      fs: dlm: don't use deprecated timeout features by default
      fs: dlm: move kref_put assert for lkb structs


 fs/dlm/Kconfig             |   9 +++
 fs/dlm/Makefile            |   2 +-
 fs/dlm/ast.c               |   4 +-
 fs/dlm/config.c            |  21 ++++---
 fs/dlm/config.h            |   3 +-
 fs/dlm/dlm_internal.h      |  32 ++++++++--
 fs/dlm/lock.c              | 143 ++++++++++++++++++---------------------------
 fs/dlm/lock.h              |  17 +++++-
 fs/dlm/lockspace.c         |  31 +++++++---
 fs/dlm/lowcomms.c          |   4 +-
 fs/dlm/member.c            |  30 +++++-----
 fs/dlm/plock.c             |  51 +++++++++++-----
 fs/dlm/recoverd.c          |  35 +++++++++--
 fs/dlm/user.c              |  21 ++++++-
 include/trace/events/dlm.h | 118 ++++++++++++++++++++++++++++++-------
 15 files changed, 351 insertions(+), 170 deletions(-)

