Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F9DA3D09
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Aug 2019 19:31:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7EED2EF16A;
	Fri, 30 Aug 2019 17:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2364760BF7;
	Fri, 30 Aug 2019 17:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68F971802218;
	Fri, 30 Aug 2019 17:31:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7UHV5ov030277 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 13:31:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5383A60606; Fri, 30 Aug 2019 17:31:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-77.phx2.redhat.com [10.3.117.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 208CC60872
	for <cluster-devel@redhat.com>; Fri, 30 Aug 2019 17:31:02 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 30 Aug 2019 12:30:59 -0500
Message-Id: <20190830173102.27437-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v4 0/3] gfs2: gfs2_rename lock ordering
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 30 Aug 2019 17:31:13 +0000 (UTC)

This v4 patch set incorporates several suggestions requested by
Andreas.

These three patches fix a gfs2 deadlock with gfs2_rename.
Comments for vfs function vfs_rename() explain situations in which AB-BA
deadlocks are possible, but prevented by a mutex, s_vfs_rename_mutex.

While that's all true at a single-node level, gfs2 can make processes
running on two distinct cluster nodes behave as if they're on the same
node. But since different nodes have different s_vfs_rename_mutexes
it's still possible to create a similar deadlock across nodes:
One node's gfs2_rename locks the two directory inodes based on their roles
of parent and child, in that order. But then the other node can reverse
their roles and request the same inodes, but in the opposite order.
IOW, both nodes lock parent-then-child, but since their roles switch,
it creates another AB-BA deadlock in which they wait forever for each other.

This patch set resolves the deadlock by submitting both deadlocks to dlm
asychronously. Then it waits for them both to be locked using a new event
that checks whether both glocks are locked properly.

The new event has a timeout, and if the timeout expires, it returns
-ESTALE, which signifies the locking has a conflict, and vfs retries
the locking operation.

The first patch separates the rgrp glock from the inode glocks because
that needs to happen last, rather than asychronously. The second patch
implements the async glock requests and the new event wait.

Andreas Gruenbacher (1):
  gfs2: create function gfs2_glock_update_hold_time

Bob Peterson (2):
  gfs2: separate holder for rgrps in gfs2_rename
  gfs2: Use async glocks for rename

 fs/gfs2/glock.c      | 113 ++++++++++++++++++++++++++++++++++++++++---
 fs/gfs2/glock.h      |   6 +++
 fs/gfs2/incore.h     |   1 +
 fs/gfs2/inode.c      |  63 ++++++++++++++++--------
 fs/gfs2/ops_fstype.c |   1 +
 5 files changed, 157 insertions(+), 27 deletions(-)

-- 
2.21.0

