Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C564ECE5
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Dec 2022 15:33:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671201206;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aDHSOA22KQSb8+ekjaGQjCeC7AjJVyYVnoN4EpW6eJc=;
	b=ejM1ofHb+FtN76AK8hnaP6gOm6Jk28GGXvcoW2zD6xa1oy1BOjOREEjcPmYTpbIqkJWT3p
	vhaqpA61xmjqltOcrFlJyeZe3zMz8jZvjwU1wj9UZqD7YtP9ibbKCaACMFTwatbSTogrjB
	xCR0C/zwekBVuLVZgM5tJuw64itJfC8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-Ko3FwRHjOr2Wd6Glgw3sLA-1; Fri, 16 Dec 2022 09:33:22 -0500
X-MC-Unique: Ko3FwRHjOr2Wd6Glgw3sLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB29980D0E8;
	Fri, 16 Dec 2022 14:33:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDC7AC15BAE;
	Fri, 16 Dec 2022 14:33:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 545431946A6B;
	Fri, 16 Dec 2022 14:33:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D5AF1946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 14:33:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6948C40C2005; Fri, 16 Dec 2022 14:33:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-182.brq.redhat.com [10.40.192.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53A3340C2004;
 Fri, 16 Dec 2022 14:33:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 16 Dec 2022 15:33:17 +0100
Message-Id: <20221216143317.668868-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following gfs2 fixes.

Thank you very much,
Andreas


The following changes since commit b7b275e60bcd5f89771e865a8239325f86d9927d:

  Linux 6.1-rc7 (2022-11-27 13:31:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.1-rc7-fixes

for you to fetch changes up to 6b46a06100dd0e0ebe400573e94ccd09163bfd5b:

  gfs2: Remove support for glock holder auto-demotion (2) (2022-12-15 12:41:22 +0100)

----------------------------------------------------------------
gfs2 fixes

- Revert a change to delete_work_func() that has gone wrong in commit
  c412a97cf6c5 ("gfs2: Use TRY lock in gfs2_inode_lookup for UNLINKED
  inodes").

- Avoid dequeuing GL_ASYNC glock holders twice by first checking if the
  holder is still queued.

- gfs2: Always check the inode size of inline inodes when reading in
  inodes to prevent corrupt filesystem images from causing weid errors.

- Properly handle a race between gfs2_create_inode() and
  gfs2_inode_lookup() that causes insert_inode_locked4() to return
  -EBUSY.

- Fix and clean up the interaction between gfs2_create_inode() and
  gfs2_evict_inode() by completely handling the inode deallocation and
 destruction in gfs2_evict_inode().

- Remove support for glock holder auto-demotion as we have no current
  plans of using this feature again.

- And a few more minor cleanups and clarifications.

----------------------------------------------------------------
Andreas Gruenbacher (17):
      gfs2: Add extra error check in alloc_dinode
      gfs2: Get rid of ghs[] in gfs2_create_inode
      gfs2: Clean up initialization of "ip" in gfs2_create_inode
      gfs2: Fix and clean up create / evict interaction
      gfs2: Handle -EBUSY result of insert_inode_locked4
      gfs2: Cosmetic gfs2_dinode_{in,out} cleanup
      gfs2: Always check inode size of inline inodes
      gfs2: Make gfs2_glock_hold return its glock argument
      gfs2: Avoid dequeuing GL_ASYNC glock holders twice
      gfs2: Clean up after gfs2_create_inode rework
      gfs2: Simply dequeue iopen glock in gfs2_evict_inode
      gfs2: Uninline and improve glock_{set,clear}_object
      gfs2: Add gfs2_inode_lookup comment
      gfs2: Partially revert gfs2_inode_lookup change
      gfs2: Minor gfs2_try_evict cleanup
      gfs2: Remove support for glock holder auto-demotion
      gfs2: Remove support for glock holder auto-demotion (2)

 fs/gfs2/aops.c    |   2 -
 fs/gfs2/bmap.c    |   3 -
 fs/gfs2/file.c    |   3 +-
 fs/gfs2/glock.c   | 269 ++++++++++++++++++++----------------------------------
 fs/gfs2/glock.h   |  65 +------------
 fs/gfs2/glops.c   |  44 +++++----
 fs/gfs2/incore.h  |   1 -
 fs/gfs2/inode.c   |  64 +++++++------
 fs/gfs2/meta_io.c |   6 ++
 fs/gfs2/super.c   |  84 +++++++++--------
 fs/gfs2/xattr.c   |  26 +++---
 11 files changed, 234 insertions(+), 333 deletions(-)

