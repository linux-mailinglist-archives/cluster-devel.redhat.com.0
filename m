Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC7C5F8F00
	for <lists+cluster-devel@lfdr.de>; Sun,  9 Oct 2022 23:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665352561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CtHS9w/5k0BIRsJYRHFcjnQr1ZdZ1pnSzV1HOXUjrnw=;
	b=h0QL4RtZq3BNcsLnsR+6I3u9BSrXft0xo93qs7NT3JTxgzlu4y3alDeSUSbJmCCojVjn3m
	acBJBD+u4WhGNjh9Q+WzTj11/r5Dr+RMuXkm7KgUJoglwqU4tjQM0lWp4KHjRTZTM7+VO+
	kK5KwGVh+YJSE/tkcX9ftWq4XoFh4us=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-3y8IfxzcNjSIM4gU9cHqUg-1; Sun, 09 Oct 2022 17:55:57 -0400
X-MC-Unique: 3y8IfxzcNjSIM4gU9cHqUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD6329AB402;
	Sun,  9 Oct 2022 21:55:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98E3940FF656;
	Sun,  9 Oct 2022 21:55:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4E4BA19465A3;
	Sun,  9 Oct 2022 21:55:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13CAA1946595 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 21:55:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA292400D793; Sun,  9 Oct 2022 21:55:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fedora.redhat.com (unknown [10.40.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E2F4014CE7;
 Sun,  9 Oct 2022 21:55:54 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun,  9 Oct 2022 23:55:53 +0200
Message-Id: <20221009215553.380150-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [GIT PULL] gfs2 debugfs improvements
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Dear Linus,

please consider pulling the following gfs2 changes on top of the pull request
I've sent earlier today.

Commit "gfs2: Add glockfd debugfs file" modifies fs/file.c to export
task_lookup_next_fd_rcu(), and kernel/pid.c to export find_ge_pid().  We use
those two functions to iterate through all processes and their file
descriptors.  I haven't received any pushback to exporting those two functions,
but no affirmation, either.

The merge commit included in this pull request resolves a conflict in
gfs2_inode_lookup(); not sure if you'd rather like to squash this merge and
resolve the conflict directly; in any case, the merge commit shows the desired
end result.

Thank you very much,
Andreas

The following changes since commit 74b1b10e29b1f25e1a081fa82733baea65429d53:

  gfs2: Register fs after creating workqueues (2022-09-20 17:53:54 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-nopid-for-v6.1

for you to fetch changes up to c7d7d2d345697eb3781198e58a22504feb74af63:

  gfs2: Merge branch 'for-next.nopid' into for-next (2022-10-09 22:56:28 +0200)

----------------------------------------------------------------
gfs2 debugfs improvements

- Improve the way how the state of glocks is reported in debugfs
  for glocks which are not held by processes, but rather by other
  resouces like cached inodes or flocks.

----------------------------------------------------------------
Andreas Gruenbacher (6):
      gfs2: Add glockfd debugfs file
      gfs2: Add flocks to glockfd debugfs file
      gfs2: Add GL_NOPID flag for process-independent glock holders
      gfs2: Mark flock glock holders as GL_NOPID
      gfs2: Mark the remaining process-independent glock holders as GL_NOPID
      gfs2: Merge branch 'for-next.nopid' into for-next

 fs/file.c            |   1 +
 fs/gfs2/file.c       |  29 ++++++-
 fs/gfs2/glock.c      | 213 ++++++++++++++++++++++++++++++++++++++++++++++++---
 fs/gfs2/glock.h      |   1 +
 fs/gfs2/inode.c      |   5 +-
 fs/gfs2/ops_fstype.c |  14 ++--
 fs/gfs2/super.c      |   3 +-
 fs/gfs2/util.c       |   6 +-
 kernel/pid.c         |   1 +
 9 files changed, 248 insertions(+), 25 deletions(-)

