Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C786B0B
	for <lists+cluster-devel@lfdr.de>; Thu,  8 Aug 2019 22:04:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0E04C057E16;
	Thu,  8 Aug 2019 20:04:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC93E600C8;
	Thu,  8 Aug 2019 20:04:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09C333CBF;
	Thu,  8 Aug 2019 20:04:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78K4hbW008120 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 16:04:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD9BE608A7; Thu,  8 Aug 2019 20:04:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 031D260600;
	Thu,  8 Aug 2019 20:04:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  8 Aug 2019 22:04:38 +0200
Message-Id: <20190808200438.10227-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Always mark inode dirty in fallocate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 20:04:55 +0000 (UTC)

When allocating space with fallocate, always update the file timestamps
and mark the inode dirty, no matter if the FALLOC_FL_KEEP_SIZE flag set
or not.  The inode needs to be marked dirty so that a subsequent fsync
will pick up the inode, and any new allocations will make it to disk.
Filesystems like xfs and ext4 always update the timestamps, so make gfs2
behave the same way.

Fixes fstest generic/483.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 52fa1ef8400b..99e2c8cd5eaa 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1065,11 +1065,10 @@ static long __gfs2_fallocate(struct file *file, int mode, loff_t offset, loff_t
 		gfs2_quota_unlock(ip);
 	}
 
-	if (!(mode & FALLOC_FL_KEEP_SIZE) && (pos + count) > inode->i_size) {
+	if (!(mode & FALLOC_FL_KEEP_SIZE) && (pos + count) > inode->i_size)
 		i_size_write(inode, pos + count);
-		file_update_time(file);
-		mark_inode_dirty(inode);
-	}
+	file_update_time(file);
+	mark_inode_dirty(inode);
 
 	if ((file->f_flags & O_DSYNC) || IS_SYNC(file->f_mapping->host))
 		return vfs_fsync_range(file, pos, pos + count - 1,
-- 
2.20.1

