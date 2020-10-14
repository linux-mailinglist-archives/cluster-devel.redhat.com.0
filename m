Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 76D2428DE20
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QmPszzjLvkneNN20/U0U1+RNRmGJr1WDquHwiAMP0do=;
	b=IosMh1/QcnS4CqIDtcuSbfg/+SFkjNky0J297iDFH//egJZitP2gTVtaPh8DmfjJ+hCPyH
	4XGYu8/WVVj1rg4ssLPsBGBizzQhnta0fVCV7wsKyc37O1EcdAWcOZqS5OzYwaTIHFz5ke
	UTirXbQow55/zq5IuS8axs89mkZaZUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-HBSa1C_eM9KIJr36qLpzGw-1; Wed, 14 Oct 2020 05:58:53 -0400
X-MC-Unique: HBSa1C_eM9KIJr36qLpzGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E667D87952A;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A20166EF52;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F2DA181A06C;
	Wed, 14 Oct 2020 09:58:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9wdNY001332 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA84B7666D; Wed, 14 Oct 2020 09:58:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D0F67666B;
	Wed, 14 Oct 2020 09:58:35 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:16 +0200
Message-Id: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 00/17] gfs2: resource group glock sharing
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Here's an update of my resource group glock sharing patches.

The key patch of this patch queue is "gfs2: Add per-reservation reserved
block accounting": with resource group glock sharing, multiple
allocations can be going on in parallel.  This requires tracking of the
actual space reserved for each allocation to prevent the allocator from
handing out more blocks than available.

Before this commit, the filesystem would report to be out of space when
the number of tentatively reserved blocks would exceed the free space
available.  In the most extreme workload that only creates empty inodes,
that would be the case when only 1/32 of the filesystem is full.

With the above mentioned commit, the filesystem will continue to
allocate blocks in such situations, but only at a very slow rate because
the tentatively reserved blocks will still get in the way.  Commit
"gfs2: Limit the maximum amount of reserved space" changes that to
shrink the amount of tentatively reserved space to no more than half the
free space when no more blocks can be reserved.  

Thanks,
Andreas

Andreas Gruenbacher (14):
  gfs2: Turn gfs2_rbm_incr into gfs2_rbm_add
  gfs2: Only use struct gfs2_rbm for bitmap manipulations
  gfs2: Get rid of unnecessary variable in gfs2_alloc_blocks
  gfs2: Minor gfs2_inplace_reserve cleanup
  Revert "gfs2: Don't reject a supposedly full bitmap if we have blocks
    reserved"
  gfs2: Don't clear GBF_FULL flags in rs_deltree
  gfs2: Set GBF_FULL flags when reading resource groups
  gfs2: When looking for blocks to allocate, don't clamp at free blocks
  gfs2: Also reflect single-block allocations in rgd->rd_extfail_pt
  gfs2: Only pass reservation down to gfs2_rbm_find
  gfs: Don't search for unreserved space twice
  gfs2: Add per-reservation reserved block accounting
  gfs2: Limit the maximum amount of reserved space
  gfs2: Rename rs_free to rs_wanted

Bob Peterson (3):
  gfs2: Add local resource group locking
  gfs2: Allow node-wide exclusive glock sharing
  gfs2: Use resource group glock sharing

 fs/gfs2/bmap.c       |   4 +-
 fs/gfs2/file.c       |   4 +-
 fs/gfs2/glock.c      |  22 +-
 fs/gfs2/glock.h      |   6 +
 fs/gfs2/incore.h     |  36 +---
 fs/gfs2/inode.c      |   6 +-
 fs/gfs2/lops.c       |   7 +-
 fs/gfs2/rgrp.c       | 489 ++++++++++++++++++++++++++-----------------
 fs/gfs2/rgrp.h       |   4 +
 fs/gfs2/super.c      |   3 +-
 fs/gfs2/trace_gfs2.h |  33 ++-
 fs/gfs2/trans.h      |   2 +-
 fs/gfs2/xattr.c      |   6 +-
 13 files changed, 376 insertions(+), 246 deletions(-)

-- 
2.26.2

