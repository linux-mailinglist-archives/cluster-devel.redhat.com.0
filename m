Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E45F8ABB
	for <lists+cluster-devel@lfdr.de>; Sun,  9 Oct 2022 12:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665312350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sBnuKOP8ea+z2pRs5J0bRVL8ZB6FmqEXDAXcvtpc13U=;
	b=bIdsEhEx9YW5LU//fwvqdjJMt6xek7rXuHn7NdUENw071K80cBYNjJEHY+Iagiq7mm1Uwx
	gOQyeew3AmIOLTMZICmRATCEUUz/2kytkkgxc7UsoOwTK2mEc9FMmOM/HgFxiG3ExIFHhA
	VkCn4r/eH3NVAi2LXZj48UxaVBC5uYM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-aIA3fagaNLa07z9Lu2COEQ-1; Sun, 09 Oct 2022 06:45:47 -0400
X-MC-Unique: aIA3fagaNLa07z9Lu2COEQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 034FB380673A;
	Sun,  9 Oct 2022 10:45:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DAE14A9279;
	Sun,  9 Oct 2022 10:45:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3E7351946595;
	Sun,  9 Oct 2022 10:45:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 64B391946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 10:45:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0F10DB17DB; Sun,  9 Oct 2022 10:45:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fedora.redhat.com (unknown [10.40.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96007A9FBE;
 Sun,  9 Oct 2022 10:45:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun,  9 Oct 2022 12:45:39 +0200
Message-Id: <20221009104539.368110-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fixes.

We have a second small set of changes queued up on top of these fixes [*]; second
pull request to follow.

[*] https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=for-next.nopid

Thank you very much,
Andreas

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.0-rc2-fixes

for you to fetch changes up to 74b1b10e29b1f25e1a081fa82733baea65429d53:

  gfs2: Register fs after creating workqueues (2022-09-20 17:53:54 +0200)

----------------------------------------------------------------
gfs2 fixes

- Make sure to initialize the filesystem work queues before registering
  the filesystem; this prevents them from being used uninitialized.

- On filesystem withdraw: prevent a a double iput() and immediately
  reject pending locking requests that can no longer succeed.

- Use TRY lock in gfs2_inode_lookup() to prevent a rare glock hang
  during evict.

- During filesystem mount, explicitly make sure that the sb_bsize and
  sb_bsize_shift super block fields are consistent with each other.
  This prevents messy error messages during fuzz testing.

- Switch from strlcpy to strscpy.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Switch from strlcpy to strscpy

Andrew Price (1):
      gfs2: Check sb_bsize_shift after reading superblock

Bob Peterson (5):
      gfs2: Use TRY lock in gfs2_inode_lookup for UNLINKED inodes
      gfs2: Prevent double iput for journal on error
      gfs2: Dequeue waiters when withdrawn
      gfs2: Clear flags when withdraw prevents xmote
      gfs2: Register fs after creating workqueues

 fs/gfs2/glock.c      | 44 +++++++++++++++++++++++++++++++++++++++-----
 fs/gfs2/glock.h      |  1 +
 fs/gfs2/inode.c      | 10 ++++++++--
 fs/gfs2/main.c       | 24 ++++++++++++------------
 fs/gfs2/ops_fstype.c | 17 +++++++++++------
 fs/gfs2/util.c       |  6 ++++++
 6 files changed, 77 insertions(+), 25 deletions(-)

