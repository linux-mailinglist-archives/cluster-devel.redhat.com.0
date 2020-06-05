Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDAD1F03E1
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403038;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kHPHYGIbW2FzzeFma3xhsulsOWcCkt9DqyGCuVW7leY=;
	b=MAdcVNZOtXb5H5d2zn3a9jVlx7RamjSXPadInW2pbCdrcGiCK2YVXX1gfs8EfR0fRdCdM2
	rdnqZbSp7yzhMVgkEmVCoNZOU1IZ5HgvQCLihQjw8tUeF7c954cp0kum6ynTx/QQUJ4R8/
	eUwMagIuRc1bnlHFcaxCJflIAkInqlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-u_xKIcZ7Np2f3LJYplsJcg-1; Fri, 05 Jun 2020 20:23:56 -0400
X-MC-Unique: u_xKIcZ7Np2f3LJYplsJcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F20121883610;
	Sat,  6 Jun 2020 00:23:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3A2679422;
	Sat,  6 Jun 2020 00:23:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1B07B34AF;
	Sat,  6 Jun 2020 00:23:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Gl4FD020656 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:47:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B4C137B610; Fri,  5 Jun 2020 16:47:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-115-80.phx2.redhat.com [10.3.115.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7ECAF7B60D
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:47:02 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  5 Jun 2020 11:46:55 -0500
Message-Id: <20200605164701.30776-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/6 v2] Misc Patch Collection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

I've revised my recent patch set based on feedback from Andreas.
Here is my latest. Changes from last time are:

1. Removed the spin_trylock related info from the status sysfs file
   as per Andreas's feedback. Although valuable to have, I see his point.
2. Removed "gfs2: Add new trace point for glock ail management".
   I still think this would be useful to have, but perhaps only compiled
   in with a new debug kernel option. For now, leave it out.
3. Removed "gfs2: add memory barriers to gfs2_glock_remove_revoke".
   It is not needed.
4. Removed "gfs2: Only do glock put in gfs2_create_inode for free inodes".
   It was pushed to the repo separately.
5. Revised "gfs2: instrumentation wrt log_flush stuck" moving that code
   to a new function, which makes the err string contiguous for grep.
6. Added "gfs2: new slab for transactions" which is revised to fix bugs
   that were in the old version.
7. Added "gfs2: fix use-after-free on transaction ail lists" that fixes
   a problem that comes to light with the previous patch.
8. Patches 1/8 and 2/8 are omitted, since they were pushed separately.

Bob Peterson (6):
  gfs2: Add new sysfs file for gfs2 status
  gfs2: print mapping->nrpages in glock dump for address space glocks
  gfs2: instrumentation wrt log_flush stuck
  gfs2: introduce new gfs2_glock_assert_withdraw
  gfs2: new slab for transactions
  gfs2: fix use-after-free on transaction ail lists

 fs/gfs2/glock.c | 32 +++++++++++++++---------
 fs/gfs2/glock.h |  9 +++++++
 fs/gfs2/glops.c |  2 ++
 fs/gfs2/log.c   | 54 ++++++++++++++++++++++++++++------------
 fs/gfs2/main.c  |  9 +++++++
 fs/gfs2/sys.c   | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/trans.c | 22 ++++++++++++++---
 fs/gfs2/trans.h |  1 +
 fs/gfs2/util.c  |  1 +
 fs/gfs2/util.h  |  1 +
 10 files changed, 165 insertions(+), 31 deletions(-)

-- 
2.26.2

