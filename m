Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 021A53C7642
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 20:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626199837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ib8BBbFKnmqA2XcJyH62vOs/9OpwLB+t9opn+r8SeX8=;
	b=h+4JDOJijohKPvdwwvlEdQ2bMw5hEQOOUHCDage2pfFykU3NHpTQZaFNzwcQKLcG+KPsPz
	Hkr7W9OqkR68YuLlKxzxh9Jm0QhXqIHSLUxBk36qEMRK7VaGk4iNYry7XNWNQAr5u083RS
	gO1sX+pyTwwU8HIDZxzhjofJoEIREEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-oj9Nte5fPdCMGP8lMCyquA-1; Tue, 13 Jul 2021 14:10:35 -0400
X-MC-Unique: oj9Nte5fPdCMGP8lMCyquA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6263391275;
	Tue, 13 Jul 2021 18:10:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 531335C225;
	Tue, 13 Jul 2021 18:10:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3912E1809C98;
	Tue, 13 Jul 2021 18:10:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DIA1aw022056 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 14:10:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3AA49100F49F; Tue, 13 Jul 2021 18:10:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0991E100EB3D
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:09:58 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 13 Jul 2021 13:09:48 -0500
Message-Id: <20210713180958.66995-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 00/10] gfs2: misc. patch collection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This is a set of 10 patches from my collection. They can be added
individually or as a set.

Bob Peterson (10):
  gfs2: Fix glock recursion in freeze_go_xmote_bh
  gfs2: Eliminate go_xmote_bh in favor of go_lock
  gfs2: be more verbose replaying invalid rgrp blocks
  gfs2: trivial clean up of gfs2_ail_error
  gfs2: tiny cleanup in gfs2_log_reserve
  gfs2: init system threads before freeze lock
  gfs2: Don't release and reacquire local statfs bh
  gfs2: New log flush watchdog
  gfs2: fix deadlock in gfs2_ail1_empty withdraw
  gfs2: replace sd_aspace with sd_inode

 fs/gfs2/aops.c       |   9 +---
 fs/gfs2/glock.c      |  12 +----
 fs/gfs2/glops.c      |  43 +++++++++--------
 fs/gfs2/incore.h     |  15 +++++-
 fs/gfs2/log.c        |  71 +++++++++++++++++++++++++---
 fs/gfs2/log.h        |   1 +
 fs/gfs2/lops.c       |  44 ++++++++++++------
 fs/gfs2/main.c       |   8 ++++
 fs/gfs2/meta_io.c    |   2 +-
 fs/gfs2/meta_io.h    |   2 -
 fs/gfs2/ops_fstype.c |  80 +++++++++++++++++++++++++++-----
 fs/gfs2/super.c      | 107 ++++++++-----------------------------------
 fs/gfs2/super.h      |   3 +-
 fs/gfs2/sys.c        |   6 ++-
 14 files changed, 235 insertions(+), 168 deletions(-)

-- 
2.31.1

