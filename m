Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C627D2A1088
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oWh/vsDqbOpkJqRxWX8QPxmNnwzH3KVdvaGqMrpGQT4=;
	b=fNPRmYWTL/dOuO7LPnDIV/6iPi7HOa+SMP6PlQ1yNnVCNIz2UbgQFO8kVafdZVvTee1LPA
	bGlO6wcAKrlXy+71tCvtQJAW7vYJLv/K/eQL+4F4QzgutDXi2/joXifvjR5XtDCIUkV1Z5
	1ipl+1ierOK31jLLLeVwE8NJDQXP1wE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Blx8pum9NFeDiVJS0BWlcA-1; Fri, 30 Oct 2020 17:52:13 -0400
X-MC-Unique: Blx8pum9NFeDiVJS0BWlcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9967810066FE;
	Fri, 30 Oct 2020 21:52:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B59EE60DA0;
	Fri, 30 Oct 2020 21:52:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1BF6181A86E;
	Fri, 30 Oct 2020 21:52:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULpve1023989 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:51:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E39C268431; Fri, 30 Oct 2020 21:51:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 286876716C;
	Fri, 30 Oct 2020 21:51:53 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:35 +0100
Message-Id: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 00/17] gfs2: resource group glock sharing
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

Here's another update of my resource group glock sharing patches.

The key patch of this patch queue is "gfs2: Add per-reservation reserved
block accounting": with resource group glock sharing, multiple
allocations can be going on in parallel.  This requires tracking of the
actual space reserved for each allocation to prevent the allocator from
handing out more blocks than available.  Other than the previous
version of this patch, this updated version sticks with the existing
allocator behavior and only uses the number of reserved blocks as an
additional constraint.

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
  gfs2: Set GBF_FULL flags when reading resource group
  gfs2: When looking for blocks to allocate, don't clamp at free blocks
  gfs2: Also reflect single-block allocations in rgd->rd_extfail_pt
  gfs2: Only pass reservation down to gfs2_rbm_find
  gfs: Don't search for unreserved space twice
  gfs2: Check for active reservation in gfs2_release
  gfs2: Rename rs_{free -> requested} and rd_{reserved -> requested}
  gfs2: Add per-reservation reserved block accounting

Bob Peterson (3):
  gfs2: Add local resource group locking
  gfs2: Allow node-wide exclusive glock sharing
  gfs2: Use resource group glock sharing

 fs/gfs2/bmap.c       |   4 +-
 fs/gfs2/file.c       |   8 +-
 fs/gfs2/glock.c      |  22 ++-
 fs/gfs2/glock.h      |   6 +
 fs/gfs2/incore.h     |  38 +---
 fs/gfs2/inode.c      |   6 +-
 fs/gfs2/lops.c       |   7 +-
 fs/gfs2/rgrp.c       | 443 +++++++++++++++++++++++++++----------------
 fs/gfs2/rgrp.h       |   6 +-
 fs/gfs2/super.c      |   3 +-
 fs/gfs2/trace_gfs2.h |  37 ++--
 fs/gfs2/trans.h      |   2 +-
 fs/gfs2/xattr.c      |   6 +-
 13 files changed, 363 insertions(+), 225 deletions(-)

-- 
2.26.2

