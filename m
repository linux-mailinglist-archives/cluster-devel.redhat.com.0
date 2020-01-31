Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCBC14F015
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 16:48:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580485723;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ds/02f4cI5GbAWYpTY4oLc9qK4QpSo7NsCV9xNnhXJg=;
	b=fSfjt1JrrgDZCnx9HK8z54weyhoCJ6BdhUPr3ZMMYiAt99fDgDxBeHMpM6CLOIplGuwVw7
	mA1O4Qwao6uu9Ro8e1VKpSP85mH9RjV0741KptPujyViFfg0le9XHkzqK+dDxKpgWPk1Rd
	akm/AZpyyBzw3r/WYVUq3LT68qd5WWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-RXwdUkjiOe6e2r-ApVCG7Q-1; Fri, 31 Jan 2020 10:48:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BF19A0CBF;
	Fri, 31 Jan 2020 15:48:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95CC460C81;
	Fri, 31 Jan 2020 15:48:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36F9B18095FF;
	Fri, 31 Jan 2020 15:48:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VFmTog022546 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 10:48:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B8E1486CC2; Fri, 31 Jan 2020 15:48:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-205-139.brq.redhat.com [10.40.205.139])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26BFE89E75;
	Fri, 31 Jan 2020 15:48:25 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Jan 2020 16:48:23 +0100
Message-Id: <20200131154823.30363-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 changes for the 5.6 merge window
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: RXwdUkjiOe6e2r-ApVCG7Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

could you please pull the following changes for gfs2?

In addition, please expect to see another pull request from Bob Peterson
about his gfs2 recovery patch queue shortly.

Thanks a lot,
Andreas

The following changes since commit 887352fb5ffd593d28f77059c09dabb47c5b86e9=
:

  Merge branch 'for-linus' from git://git.kernel.dk/linux-block (2019-12-10=
 11:02:38 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gf=
s2-for-5.6

for you to fetch changes up to a31b4ec539e966515f1f97f4000d0e2a399930ce:

  Revert "gfs2: eliminate tr_num_revoke_rm" (2020-01-28 15:04:53 +0100)

----------------------------------------------------------------
Changes in gfs2:

- Fix some corner cases on filesystems with a block size < page size.
- Fix a corner case that could expose incorrect access times over nfs.
- Revert an otherwise sensible revoke accounting cleanup that causes
  assertion failures.  The revoke accounting is whacky and needs to be
  fixed properly before we can add back this cleanup.
- Various other minor cleanups.

----------------------------------------------------------------
Alex Shi (2):
      fs/gfs2: remove unused IS_DINODE and IS_LEAF macros
      gfs2: remove unused LBIT macros

Andreas Gruenbacher (4):
      gfs2: Another gfs2_find_jhead fix
      gfs2: Avoid access time thrashing in gfs2_inode_lookup
      gfs2: Fix incorrect variable name
      gfs2: Remove GFS2_MIN_LVB_SIZE define

Bob Peterson (3):
      gfs2: eliminate ssize parameter from gfs2_struct2blk
      gfs2: minor cleanup: remove unneeded variable ret in gfs2_jdata_write=
page
      Revert "gfs2: eliminate tr_num_revoke_rm"

 fs/gfs2/aops.c       |  4 +--
 fs/gfs2/dir.c        |  3 ---
 fs/gfs2/glock.c      |  2 +-
 fs/gfs2/glops.c      |  2 +-
 fs/gfs2/incore.h     |  6 ++---
 fs/gfs2/inode.c      | 10 ++++----
 fs/gfs2/log.c        | 21 +++++++---------
 fs/gfs2/log.h        |  4 +--
 fs/gfs2/lops.c       | 70 +++++++++++++++++++++++++++++++++---------------=
----
 fs/gfs2/ops_fstype.c |  2 ++
 fs/gfs2/rgrp.c       | 10 --------
 fs/gfs2/trans.c      |  9 +++----
 12 files changed, 73 insertions(+), 70 deletions(-)

