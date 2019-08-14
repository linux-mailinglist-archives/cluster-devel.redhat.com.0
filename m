Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B3A8D8B2
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 19:01:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59A332F3669;
	Wed, 14 Aug 2019 17:01:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E057B6D8;
	Wed, 14 Aug 2019 17:01:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDBF718005A4;
	Wed, 14 Aug 2019 17:01:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EH1CfP028884 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 13:01:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5FD8283090; Wed, 14 Aug 2019 17:01:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5986583078
	for <cluster-devel@redhat.com>; Wed, 14 Aug 2019 17:01:08 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Aug 2019 18:01:00 +0100
Message-Id: <20190814170105.8775-1-anprice@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/5] gfs2-utils: New list implementation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 14 Aug 2019 17:01:37 +0000 (UTC)

This patch set updates the list implementation to the one currently in Linux.
See the comments in the new gfs2/include/list.h for details.

Andrew Price (5):
  Update list implementation
  gfs2_convert: Use the new list.h
  fsck.gfs2: Use the new list.h
  libgfs2: Use the new list.h
  Remove osi_list.h

 gfs2/convert/gfs2_convert.c |  80 ++--
 gfs2/edit/savemeta.c        |  25 +-
 gfs2/fsck/fs_recovery.c     |  29 +-
 gfs2/fsck/fsck.h            |   7 +-
 gfs2/fsck/inode_hash.c      |   1 -
 gfs2/fsck/main.c            |   1 -
 gfs2/fsck/metawalk.c        |  38 +-
 gfs2/fsck/pass1.c           |   2 +-
 gfs2/fsck/pass1b.c          |  36 +-
 gfs2/fsck/pass3.c           |   1 -
 gfs2/fsck/pass4.c           |   4 +-
 gfs2/fsck/rgrepair.c        |   3 +-
 gfs2/fsck/util.c            |  66 ++-
 gfs2/fsck/util.h            |   2 +-
 gfs2/include/Makefile.am    |   2 +-
 gfs2/include/list.h         | 902 ++++++++++++++++++++++++++++++++++++
 gfs2/include/osi_list.h     |  84 ----
 gfs2/libgfs2/block_list.c   |  17 +-
 gfs2/libgfs2/buf.c          |   4 +-
 gfs2/libgfs2/fs_ops.c       |  13 +-
 gfs2/libgfs2/gfs1.c         |   1 -
 gfs2/libgfs2/lang.h         |   1 +
 gfs2/libgfs2/libgfs2.h      |   6 +-
 gfs2/libgfs2/super.c        |   1 -
 gfs2/mkfs/gfs2_mkfs.h       |   1 -
 25 files changed, 1063 insertions(+), 264 deletions(-)
 create mode 100644 gfs2/include/list.h
 delete mode 100644 gfs2/include/osi_list.h

-- 
2.21.0

