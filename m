Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E068ECCA
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Aug 2019 15:27:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D48D011A03;
	Thu, 15 Aug 2019 13:27:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A76608AB;
	Thu, 15 Aug 2019 13:27:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D7AF2551D;
	Thu, 15 Aug 2019 13:27:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FDRPrm004925 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 09:27:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D72460F8C; Thu, 15 Aug 2019 13:27:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-77.phx2.redhat.com [10.3.117.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58C5960CC0
	for <cluster-devel@redhat.com>; Thu, 15 Aug 2019 13:27:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 15 Aug 2019 08:27:20 -0500
Message-Id: <20190815132722.1522-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/2] gfs2: gfs2_rename lock ordering
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 15 Aug 2019 13:27:35 +0000 (UTC)

These two patches fix a gfs2 deadlock with gfs2_rename.
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

Bob Peterson (2):
  gfs2: separate holder for rgrps in gfs2_rename
  gfs2: Use async glocks for rename

 fs/gfs2/glock.c      | 40 ++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/glock.h      |  1 +
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/inode.c      | 28 ++++++++++++++++++++++------
 fs/gfs2/ops_fstype.c |  1 +
 5 files changed, 65 insertions(+), 6 deletions(-)

-- 
2.21.0

