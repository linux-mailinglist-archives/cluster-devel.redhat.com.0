Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1324124DE83
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pYFPh0IR3ROYzHj4PvR5e/QP3b+ecWTAsChsoI/kgIU=;
	b=LGNuw1m4kHj/684HShxs4cnRg9e7htfhThft3wH5eWgjE5aTN8HvvKnaZ16inRmGUDp67H
	3pF5z/vd9DcO4idNGzWrZ684QhUGBS5IUvE2GqsFsJqm6ClBrbDxCMONwwWlWT4XU7TuAV
	ljwIyikIvzShITM871RqWhFUR2HDLnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-yDMGcUvYPMyQ9C2tXacFLw-1; Fri, 21 Aug 2020 13:33:55 -0400
X-MC-Unique: yDMGcUvYPMyQ9C2tXacFLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5CB80733F;
	Fri, 21 Aug 2020 17:33:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 048005DA78;
	Fri, 21 Aug 2020 17:33:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CDD959CCD;
	Fri, 21 Aug 2020 17:33:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXfsd028364 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5ADBB5DA75; Fri, 21 Aug 2020 17:33:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 281955DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:38 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:25 -0500
Message-Id: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 00/12] gfs2: jdata patch collection
	revisited
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

On 24 July I posted a set of patches for various problems I found and fixed
while testing jdata with xfstests. The safest of these were recently pushed
upstream in the last merge window. Since then, I've found and fixed more
problems, and cleaned up some of the more risky patches. So this is my
latest collection of patches.

These patches allow xfstests to pass in its entirety using jdata, and
unlike before, 269 can be run multiple times without deadlocking.

Bob Peterson (12):
  gfs2: rename gfs2_write_full_page to gfs2_write_jdata_page, remove
    parm
  gfs2: add missing log_blocks trace points in gfs2_write_revokes
  gfs2: enhance log_blocks trace point to show log blocks free
  gfs2: Wipe jdata and ail1 in gfs2_journal_wipe, formerly
    gfs2_meta_wipe
  gfs2: Calculate number of revokes during evict
  gfs2: Create transaction for inodes with i_nlink != 0
  gfs2: make gfs2_ail1_empty_one return the count of active items
  gfs2: don't lock sd_ail_lock in gfs2_releasepage
  gfs2: Only set PageChecked if we have a transaction
  gfs2: simplify gfs2_block_map
  gfs2: Ignore journal log writes for jdata holes
  gfs2: add some much needed cleanup for log flushes that fail

 fs/gfs2/aops.c       | 51 ++++++++++++++++++++++------
 fs/gfs2/bmap.c       | 14 ++++----
 fs/gfs2/log.c        | 57 +++++++++++++++++++++++++++----
 fs/gfs2/log.h        |  2 +-
 fs/gfs2/meta_io.c    | 81 +++++++++++++++++++++++++++++++++++++++++---
 fs/gfs2/meta_io.h    |  2 +-
 fs/gfs2/rgrp.c       |  6 ++--
 fs/gfs2/super.c      | 28 ++++++++++-----
 fs/gfs2/trace_gfs2.h |  6 ++--
 fs/gfs2/trans.c      |  1 +
 10 files changed, 202 insertions(+), 46 deletions(-)

-- 
2.26.2

