Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD482742E13
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Jun 2023 22:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688068952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4dDgyzZLkY2/8iXhAmRttHNZmuwZzxKf8DyRqRDsvIs=;
	b=XyU7JCTcUX3W2d1Udha5/ybsWuGYTBSbpfts2YtQyqYc68KbC683AnlXyXRYqosWrs0oiB
	A7/FtcDksAayzYgDMiFThjIXjjn13Fr/aLCvYk5Mfif/gZ4XH2Lmw9a3ZK8wzPriDdJbyZ
	SL/UJMQHVrW+dERmsikhevM8ADfW1uE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-CZinEKtDP6yHbZ0_Hqi-iw-1; Thu, 29 Jun 2023 16:02:29 -0400
X-MC-Unique: CZinEKtDP6yHbZ0_Hqi-iw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 074C48EA662;
	Thu, 29 Jun 2023 20:02:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F38CC400E88;
	Thu, 29 Jun 2023 20:02:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E2CA1946A47;
	Thu, 29 Jun 2023 20:02:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E948719465B6 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 29 Jun 2023 20:02:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 96513F5CD2; Thu, 29 Jun 2023 20:02:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 590D7F5CE5;
 Thu, 29 Jun 2023 20:02:24 +0000 (UTC)
Date: Thu, 29 Jun 2023 15:02:23 -0500
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20230629200223.GC14388@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [GIT PULL] dlm updates for 6.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull dlm updates from tag:

git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.5

The dlm posix lock handling (for gfs2) has three notable changes:

- Local pids returned from GETLK are no longer negated.  A previous
  patch negating remote pids mistakenly changed local pids also.

- SETLKW operations can now be interrupted only when the process is
  killed, and not from other signals.  General interruption was
  resulting in previously acquired locks being cleared, not just
  the in-progress lock.  Handling this correctly will require
  extending a cancel capability to user space (a future feature.)

- If multiple threads are requesting posix locks (with SETLKW),
  fix incorrect matching of results to the requests.

The dlm networking has several minor cleanups, and one notable change:

- Avoid delaying ack messages for too long (used for message reliability),
  resulting in a backlog of un-acked messages.  These could previously
  be delayed as a result of either too many or too few other messages
  being sent.  Now an upper and lower threshold is used to determine
  when an ack should be sent.

Thanks,
Dave


Alexander Aring (18):
      fs: dlm: return positive pid value for F_GETLK
      fs: dlm: fix cleanup pending ops when interrupted
      fs: dlm: interrupt posix locks only when process is killed
      fs: dlm: make F_SETLK use unkillable wait_event
      fs: dlm: fix mismatch of plock results from userspace
      fs: dlm: revert check required context while close
      fs: dlm: clear pending bit when queue was empty
      fs: dlm: fix missing pending to false
      fs: dlm: unregister memory at the very last
      fs: dlm: don't check othercon twice
      fs: dlm: cleanup STOP_IO bitflag set when stop io
      fs: dlm: move dlm_purge_lkb_callbacks to user module
      fs: dlm: warn about messages from left nodes
      fs: dlm: filter ourself midcomms calls
      fs: dlm: handle lkb wait count as atomic_t
      fs: dlm: handle sequence numbers as atomic
      fs: dlm: add send ack threshold and append acks to msgs
      fs: dlm: remove filter local comms on close

Azeem Shaikh (1):
      dlm: Replace all non-returning strlcpy with strscpy


 fs/dlm/ast.c          |  25 ++--------
 fs/dlm/ast.h          |   1 -
 fs/dlm/config.c       |   4 +-
 fs/dlm/dlm_internal.h |   2 +-
 fs/dlm/lock.c         |  36 +++++++--------
 fs/dlm/lockspace.c    |  12 -----
 fs/dlm/lockspace.h    |   1 -
 fs/dlm/lowcomms.c     |  49 +++-----------------
 fs/dlm/main.c         |   2 +-
 fs/dlm/member.c       |  37 ++++++++++++---
 fs/dlm/midcomms.c     | 126 ++++++++++++++++++++++----------------------------
 fs/dlm/plock.c        | 115 +++++++++++++++++++++++++++------------------
 fs/dlm/user.c         |  18 ++++++++
 fs/dlm/user.h         |   1 +
 14 files changed, 205 insertions(+), 224 deletions(-)

