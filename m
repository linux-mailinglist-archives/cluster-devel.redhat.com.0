Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1525922CDCD
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CF/Dp/kJgcT97u38YxqZqYiJk7F9gIvvo256aAUwjvU=;
	b=iyXV9qiXBgg+u93xZFJLVoulGzZBCN8X7xxJdoYSAdUombjDdDwmR3aY7LUDOhGo5YA3xA
	U+zqiw4WEsBDjKo9DnxV3SXCUUB7SA1R2wmRl6p+pK8SW0+V9L7X66AL1ZqF+bExgZPyTp
	+B6SJ3NO1Dp9nSGrx9PP4RkXxYkw4f0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-ZmhUxORdOOqGNkVyVdoV9g-1; Fri, 24 Jul 2020 14:33:19 -0400
X-MC-Unique: ZmhUxORdOOqGNkVyVdoV9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8A8A80183C;
	Fri, 24 Jul 2020 18:33:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9899705A0;
	Fri, 24 Jul 2020 18:33:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EE37A3588;
	Fri, 24 Jul 2020 18:33:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXA2u016260 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD5246FEFE; Fri, 24 Jul 2020 18:33:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DC2F756A0
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:32:53 -0500
Message-Id: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 00/11] gfs2: jdata patch collection
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

These patches are for the jdata problems I've recently found. They allow
xfstests to pass in its entirety using jdata, and unlike before, 269
can be run multiple times without deadlocking. The last two patches are
just improvements to the log_blocks kernel trace point, which can be
pushed (or not) separately.

Bob Peterson (11):
  gfs2: inline gfs2_write_jdata_pagevec into gfs2_write_cache_jdata
  gfs2: don't break integrity writeback on __gfs2_jdata_writepage error
  gfs2: Fix inaccurate comment
  gfs2: don't try to add buffers to transactions a second time for jdata
  gfs2: Wipe jdata and ail1 in gfs2_journal_wipe, formerly
    gfs2_meta_wipe
  gfs2: rename gfs2_write_full_page to gfs2_write_jdata_page, remove
    parm
  gfs2: Add a new jdata-specific version of gfs2_get_block_noalloc
  gfs2: Add caller info to log_blocks trace point
  gfs2: enhance log_blocks trace point to show log blocks free
  gfs2: print details on transactions that aren't properly ended
  gfs2: Never call gfs2_block_zero_range with an open transaction

 fs/gfs2/aops.c       | 267 +++++++++++++++++++++++--------------------
 fs/gfs2/bmap.c       |  70 +++++++-----
 fs/gfs2/incore.h     |   3 +
 fs/gfs2/log.c        |  26 +++--
 fs/gfs2/lops.c       |   1 +
 fs/gfs2/meta_io.c    |  82 ++++++++++++-
 fs/gfs2/meta_io.h    |   5 +-
 fs/gfs2/ops_fstype.c |   2 +-
 fs/gfs2/rgrp.c       |   6 +-
 fs/gfs2/trace_gfs2.h |  23 +++-
 fs/gfs2/trans.c      |  31 ++---
 11 files changed, 327 insertions(+), 189 deletions(-)

-- 
2.26.2

