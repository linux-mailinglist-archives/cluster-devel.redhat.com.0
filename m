Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8138C1426C8
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AoUzzG07tRllk8u3lkySA6vG+VaV35uxeyX5JC9T0WM=;
	b=YmaPsFFf9Un9ywBr4BFaSRjVz/8CImoirwmvEcbdAVszFpnDrVp05zJFpDwIHNg4OUoihR
	40ykyImN6YkNf0TJBh/XaG75U88JLjhPacy6oArWWwOFL5Avjqgf3+khRD4h8cdii52SEL
	Khz2H8yAFYefmBrqbBmYPQMxaJ+JDok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-hjJBqDzxO2CMEKTHYVaw-Q-1; Mon, 20 Jan 2020 04:13:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4116801E72;
	Mon, 20 Jan 2020 09:13:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD7D2857B;
	Mon, 20 Jan 2020 09:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEF0218089CE;
	Mon, 20 Jan 2020 09:13:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DBms031649 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8724984D9F; Mon, 20 Jan 2020 09:13:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCD4585720;
	Mon, 20 Jan 2020 09:13:08 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:12:54 +0100
Message-Id: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 00/11] gfs2: iopen glock locking scheme
	rework
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: hjJBqDzxO2CMEKTHYVaw-Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This patch queue reworks the iopen glock locking scheme to avoid
resource group glock bouncing and cache thrashing when inodes are
deleted that have been accessed on other cluster nodes.

When the link count of an inode drops to zero, the inode is marked
GFS2_BLKST_UNLINKED in the bitmap.  Before the inode can be deleted, we
need to make sure that it's no longer in use locally or on any other
cluster node.  We use the inode reference count to keep track of local
users, and the iopen glock to keep track of other users across the
cluster: all nodes that have an inode cached or in active use keep a
shared lock on the iopen glock.  When deleting an inode, the iopen glock
is promoted to an exclusive lock first.  Other nodes may keep the inode
open, so there's no guarantee that we'll get that exclusive lock in
definite time.

To work around that, when a node fails to get that exclusive lock, it
will rely on the other nodes to perform the delete.  The delete will
happen eventually, on the first node that obtains the iopen glock
exclusively, leading to resource group glock bouncing and the associated
loss of caching.  Note that the inode doesn't have to be in active use
on multiple nodes at the same time to trigger that behavior; all it
takes is to delete the inode on another node that the one on which it
was created.

This patch queue reworks this locking scheme in the following ways: when
trying to obtain the iopen glock exclusively, nodes will give the other
nodes holding the inode cached a chance to drop the inode and release
their shared lock.  When a node cannot drop the inode immeidately in
response to such a request (because the inode is held open), it will
signal that to the cluster by causing activity on the associated inode
glock.

Because we cannot rely on existing nodes to cooperate in this new
scheme, after giving up a shared iopen glock, we need to verify that the
inode was deleted eventually.  This would normally require accessing the
resource group, negating any benefits we've had so far, but we can
remember that the inode was deleted in the inode glock lock value block
(LVB) to get around that.

Thanks,
Andreas

Andreas Gruenbacher (10):
  gfs2: Don't add glocks to the LRU while still in use
  gfs2: Keep track of deletes in inode LVBs
  gfs2: Turn gl_delete into a delayed work
  gfs2: Give up the iopen glock on contention
  gfs2: Try harder to delete inodes locally
  gfs2: Minor gfs2_lookup_by_inum cleanup
  gfs2: Move inode generation number check into gfs2_inode_lookup
  gfs2: Check inode generation number in delete_work_func
  gfs2: Wake up when setting GLF_DEMOTE
  gfs2: Smarter iopen glock waiting

Bob Peterson (1):
  gfs2: Allow ASPACE glocks to also have an lvb

 fs/gfs2/export.c                 |   4 +-
 fs/gfs2/glock.c                  | 137 ++++++++++++++++++++++++++++---
 fs/gfs2/glock.h                  |   4 +-
 fs/gfs2/glops.c                  |   5 +-
 fs/gfs2/incore.h                 |   8 +-
 fs/gfs2/inode.c                  |  34 ++++++--
 fs/gfs2/inode.h                  |   2 +-
 fs/gfs2/rgrp.c                   |   3 +-
 fs/gfs2/super.c                  |  72 +++++++++++++---
 include/uapi/linux/gfs2_ondisk.h |   6 ++
 10 files changed, 237 insertions(+), 38 deletions(-)

--=20
2.20.1

