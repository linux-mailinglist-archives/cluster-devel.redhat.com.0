Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B0DDF364A3E
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618859506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=egdfscnN2V5OiwYY++d0RrtNrZo/RWQvMWiVXkJ3SEw=;
	b=DxX7/tUoq7hIwoemGSTsOTWx6ebasCpOAIoCXr4pjN1YLCqdF26lcXjUYplFc0/JKC5Ec/
	18oXxCA6QMRiRNveuiCxel/EZDGnkTboUUntkT6D+m4DTVHGXnVre34s0tr3J2Q5YpWP+8
	EFf2ZEO2emQl8bw9NbArbDYdzVNpFWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-qaPtBHbFMve0REp92asoWA-1; Mon, 19 Apr 2021 15:11:45 -0400
X-MC-Unique: qaPtBHbFMve0REp92asoWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 483228B5DFF;
	Mon, 19 Apr 2021 19:11:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A91ED18EF8;
	Mon, 19 Apr 2021 19:11:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0390E1806D18;
	Mon, 19 Apr 2021 19:11:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJBUdc000924 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:11:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 338EF60843; Mon, 19 Apr 2021 19:11:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D60F7094D
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:11:19 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 19 Apr 2021 20:11:09 +0100
Message-Id: <20210419191117.297653-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 0/8] gfs2-utils: Import
	linux/gfs2_ondisk.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

v1: https://listman.redhat.com/archives/cluster-devel/2019-April/msg00021.html

My previous attempt at this did a search+replace to satisfy the field types in gfs2_ondisk.h, which was a little OTT. This attempt adds a linux/types.h that gfs2_ondisk.h will pick up instead of the kernel one.

Having our own gfs2_ondisk.h means that we can support new gfs2 features unconditionally and more easily experiment with on-disk changes; we can use the PRI* macros from inttypes.h for consistent string formatting (appease -Wformat) across architectures, and it gets us closer to being able to compile gfs2-utils on non-linux systems.

Andy


Andrew Price (8):
  Import linux/gfs2_ondisk.h
  Remove HAS_UUID conditionals
  Remove GFS2_HAS_LEAF_HINTS conditionals
  Remove GFS2_HAS_DE_RAHEAD/COOKIE conditionals
  Remove GFS2_HAS_RG_SKIP conditionals
  Remove GFS2_HAS_RG_RI_FIELDS conditionals
  Remove GFS2_HAS_LH_V2 conditionals
  Use PRI* when printing gfs2 structures

 configure.ac                   |  25 +-
 gfs2/convert/gfs2_convert.c    |   2 -
 gfs2/edit/extended.c           |  54 ++--
 gfs2/edit/gfs2hex.c            |  45 ++-
 gfs2/edit/hexedit.c            |   2 -
 gfs2/edit/hexedit.h            |   1 -
 gfs2/edit/journal.c            |  15 +-
 gfs2/edit/savemeta.c           |   2 -
 gfs2/fsck/fs_recovery.c        |  10 +-
 gfs2/fsck/initialize.c         |  47 ++-
 gfs2/fsck/lost_n_found.c       |  10 +-
 gfs2/fsck/pass1.c              |   5 +-
 gfs2/fsck/pass2.c              |   2 +-
 gfs2/fsck/rgrepair.c           |  37 +--
 gfs2/include/Makefile.am       |   2 +
 gfs2/include/gfs2_ondisk.h     | 542 +++++++++++++++++++++++++++++++++
 gfs2/include/linux/types.h     |  32 ++
 gfs2/libgfs2/buf.c             |   1 -
 gfs2/libgfs2/device_geometry.c |   1 -
 gfs2/libgfs2/fs_ops.c          |   7 -
 gfs2/libgfs2/gfs1.c            |   2 -
 gfs2/libgfs2/lang.c            |  11 +-
 gfs2/libgfs2/libgfs2.h         |   6 +-
 gfs2/libgfs2/meta.c            |  27 +-
 gfs2/libgfs2/ondisk.c          | 266 ++++++----------
 gfs2/libgfs2/recovery.c        |   2 -
 gfs2/libgfs2/rgrp.c            |   8 -
 gfs2/libgfs2/structures.c      |  24 +-
 gfs2/mkfs/gfs2_mkfs.h          |   1 -
 gfs2/mkfs/main_grow.c          |   1 -
 gfs2/mkfs/main_jadd.c          |  10 +-
 gfs2/mkfs/main_mkfs.c          |  17 +-
 gfs2/tune/super.c              |  17 +-
 33 files changed, 773 insertions(+), 461 deletions(-)
 create mode 100644 gfs2/include/gfs2_ondisk.h
 create mode 100644 gfs2/include/linux/types.h

-- 
2.30.2

