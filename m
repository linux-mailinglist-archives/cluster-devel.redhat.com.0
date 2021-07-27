Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5B73D7C41
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8GzuItG85MtKqRb+fanAdPsYhOuFM3q4Hy+1FcAiVtY=;
	b=Lwx/mDor+QX0uCaWkYdagRZXMF2JuexEJLvFxne16iRGoqylVhOqX5LZ8FgdB6BUaB1c+L
	xFoUjH6VOSYB2K/br1hBXNyudmtWNgtMuGyyKRmm7N1JxTX7jlr9JnsSHpLOrop9oWqz36
	AoBcIrAQ9yej/gSfi6ld1+5n4ROE+9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-eacyeVD-MFKAfg5WBq9kfg-1; Tue, 27 Jul 2021 13:37:21 -0400
X-MC-Unique: eacyeVD-MFKAfg5WBq9kfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC5E802C8A;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD544101E249;
	Tue, 27 Jul 2021 17:37:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E962B4BB7C;
	Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbEfJ022778 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FDA81980E; Tue, 27 Jul 2021 17:37:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7214519630
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:09 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:36:54 -0500
Message-Id: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 00/15] gfs2: misc. patch collection (V2)
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This is version2 of a set of misc. patches from my collection.
As before, they can be added individually or as a set. Changes from V1:

1. I added a wrapper patch Andreas wrote. I'm not sure how serious he is
   about this one.
2. This set omits the patch "New log flush watchdog" due to Steve
   Whitehouse's objections.
3. New patches were added to allow several more xfstests to run.
4. A new patch fixes a recovery error more understandable.
5. Patch "gfs2: fix deadlock in gfs2_ail1_empty withdraw" has been
   reworked somewhat because of problems discovered by HCH.
6. A new patch was added to reduce code redundancy in gfs2_trans_add_*.
7. Two new patches from Andreas were added that allow xfstests
   generic/079 to run on gfs2.

Most of these patches are very safe and well-tested.
I left out some of my more experimental patches.

Andreas Gruenbacher (3):
  gfs2: Add wrapper for iomap_file_buffered_write
  fs: Move notify_change permission checks into may_setattr
  gfs2: Switch to may_setattr in gfs2_setattr

Bob Peterson (12):
  gfs2: Fix glock recursion in freeze_go_xmote_bh
  gfs2: Eliminate go_xmote_bh in favor of go_lock
  gfs2: be more verbose replaying invalid rgrp blocks
  gfs2: trivial clean up of gfs2_ail_error
  gfs2: tiny cleanup in gfs2_log_reserve
  gfs2: init system threads before freeze lock
  gfs2: Don't release and reacquire local statfs bh
  gfs2: fix deadlock in gfs2_ail1_empty withdraw
  gfs2: replace sd_aspace with sd_inode
  gfs2: reduce redundant code in gfs2_trans_add_*
  gfs2: Make recovery error more readable
  gfs2: ignore usr|grp|prjquota mount options

 fs/attr.c            |  50 ++++++++++++--------
 fs/gfs2/aops.c       |   9 +---
 fs/gfs2/file.c       |  20 +++++---
 fs/gfs2/glock.c      |  12 +----
 fs/gfs2/glops.c      |  43 +++++++++--------
 fs/gfs2/incore.h     |   9 +++-
 fs/gfs2/inode.c      |   4 +-
 fs/gfs2/log.c        |  18 +++++---
 fs/gfs2/lops.c       |  44 ++++++++++++------
 fs/gfs2/meta_io.c    |   2 +-
 fs/gfs2/meta_io.h    |   2 -
 fs/gfs2/ops_fstype.c |  84 ++++++++++++++++++++++++++++-----
 fs/gfs2/super.c      | 107 ++++++++-----------------------------------
 fs/gfs2/super.h      |   3 +-
 fs/gfs2/trans.c      |  46 ++++++++-----------
 fs/gfs2/util.c       |   2 +-
 include/linux/fs.h   |   2 +
 17 files changed, 238 insertions(+), 219 deletions(-)

-- 
2.31.1

