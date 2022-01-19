Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AD4938BB
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589026;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f4rpDvX1G5edZSJeoP2jHZKEdUQPwbL0MQZsaXX0LAU=;
	b=Qi7Pt7J2EolvGobuKmbTK5DavGQBXCbsPnlrNGJnFboGqbV8aJocQ9Et1EnvBMVC446w52
	gZr/QkutM0kjcLOTzAr8fpjxCY+w7cADuy0UNeWnpKILtGdnaQFETkX+Jz3w+3XwDF0dSx
	M05mwgXiod+ze2irWpexnIDuW3j4ukM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-0a6YAmANPUmsx1ADHl2suA-1; Wed, 19 Jan 2022 05:43:43 -0500
X-MC-Unique: 0a6YAmANPUmsx1ADHl2suA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66CCF192D786;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40E426F125;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACDCD4BB7C;
	Wed, 19 Jan 2022 10:43:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhT22024153 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D04E17A225; Wed, 19 Jan 2022 10:43:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 076F1795B7
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:18 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:42:55 +0000
Message-Id: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 00/21] libgfs2: Namespace improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In libgfs2 we have a mix of function names prefixed with gfs2_, lgfs2_ or nothing at all that denotes where they are defined. This patch set addresses that problem by more strictly enforcing a prefix namespace scheme on the symbols exposed by libgfs2. So now we (mostly) have these prefix conventions:

GFS2_/gfs2_   - kernel code
LGFS2_/lgfs2_ - libgfs2 interfaces
No prefix     - application/internal code

This means we can tell at a glance where names are defined, which makes the code easier to work with.

Some changes that were not made in this set are:

- gfs(1) on-disk structures defined in libgfs2.h for compatibility were not renamed as they're essentially kernel-defined.
- The endianness conversion macros (be64_to_cpu(), etc.) were not renamed but they will likely be renamed once a concise naming scheme has been decided upon.

This is obviously a large amount of churn but it pays off a lot of technical debt and I think it's worth getting it out of the way in one go. Many of the changes were scripted but each patch was reviewed by eye and tested with 'make check'.

Andrew Price (21):
  libgfs2: Namespace improvements - structures.c
  libgfs2: Namespace improvements - buf.c
  libgfs2: Namespace improvements - fs_ops.c
  libgfs2: Namespace improvements - fs_bits.c
  libgfs2: Namespace improvements - gfs1.c
  libgfs2: Namespace improvements - misc.c
  libgfs2: Namespace improvements - rgrp.c
  libgfs2: Namespace improvements - super.c
  libgfs2: Namespace improvements - gfs2_disk_hash.c
  libgfs2: Remove revoke function declarations from libgfs2.h
  libgfs2: Namespace improvements - recovery.c
  libgfs2: Namespace improvements - device_geometry.c
  libgfs2: Namespace improvements - struct gfs2_inode
  libgfs2: Namespace improvements - struct gfs2_buffer_head
  libgfs2: Namespace improvements - struct gfs2_sbd
  libgfs2: Namespace improvements - struct metapath
  libgfs2: Namespace improvements - struct master_dir
  libgfs2: Namespace improvements - struct device
  libgfs2: Namespace improvements - struct gfs2_bitmap
  libgfs2: Namespace improvements - constants
  libgfs2: Namespace improvements - struct rgrp_tree

 gfs2/convert/gfs2_convert.c    | 398 +++++++++++------------
 gfs2/edit/extended.c           |  72 ++---
 gfs2/edit/gfs2hex.c            |   8 +-
 gfs2/edit/hexedit.c            | 198 ++++++------
 gfs2/edit/hexedit.h            |   6 +-
 gfs2/edit/journal.c            |  84 ++---
 gfs2/edit/savemeta.c           |  32 +-
 gfs2/fsck/afterpass1_common.c  |  54 ++--
 gfs2/fsck/afterpass1_common.h  |  26 +-
 gfs2/fsck/fs_recovery.c        | 206 ++++++------
 gfs2/fsck/fs_recovery.h        |  10 +-
 gfs2/fsck/fsck.h               |  46 +--
 gfs2/fsck/initialize.c         | 278 ++++++++--------
 gfs2/fsck/link.c               |   6 +-
 gfs2/fsck/link.h               |   4 +-
 gfs2/fsck/lost_n_found.c       |  34 +-
 gfs2/fsck/lost_n_found.h       |   4 +-
 gfs2/fsck/main.c               |  38 +--
 gfs2/fsck/metawalk.c           | 178 +++++------
 gfs2/fsck/metawalk.h           |  70 ++---
 gfs2/fsck/pass1.c              | 356 ++++++++++-----------
 gfs2/fsck/pass1b.c             | 118 +++----
 gfs2/fsck/pass2.c              | 278 ++++++++--------
 gfs2/fsck/pass3.c              |  14 +-
 gfs2/fsck/pass4.c              |  24 +-
 gfs2/fsck/pass5.c              |  28 +-
 gfs2/fsck/rgrepair.c           | 222 ++++++-------
 gfs2/fsck/util.c               |  18 +-
 gfs2/fsck/util.h               |  26 +-
 gfs2/glocktop/glocktop.c       |  18 +-
 gfs2/libgfs2/buf.c             |  28 +-
 gfs2/libgfs2/check_ondisk.c    |   6 +-
 gfs2/libgfs2/check_rgrp.c      |   8 +-
 gfs2/libgfs2/device_geometry.c |   4 +-
 gfs2/libgfs2/fs_bits.c         |  32 +-
 gfs2/libgfs2/fs_ops.c          | 557 ++++++++++++++++-----------------
 gfs2/libgfs2/gfs1.c            |  82 ++---
 gfs2/libgfs2/gfs2_disk_hash.c  |   5 +-
 gfs2/libgfs2/gfs2l.c           |  20 +-
 gfs2/libgfs2/lang.c            |  40 +--
 gfs2/libgfs2/lang.h            |   2 +-
 gfs2/libgfs2/libgfs2.h         | 319 +++++++++----------
 gfs2/libgfs2/misc.c            |   8 +-
 gfs2/libgfs2/ondisk.c          |   8 +-
 gfs2/libgfs2/recovery.c        |  38 +--
 gfs2/libgfs2/rgrp.c            |  88 +++---
 gfs2/libgfs2/rgrp.h            |   4 +-
 gfs2/libgfs2/structures.c      | 168 +++++-----
 gfs2/libgfs2/super.c           |  48 +--
 gfs2/mkfs/main_grow.c          |  32 +-
 gfs2/mkfs/main_jadd.c          |  24 +-
 gfs2/mkfs/main_mkfs.c          | 104 +++---
 gfs2/tune/super.c              |   6 +-
 tests/nukerg.c                 |  22 +-
 54 files changed, 2243 insertions(+), 2264 deletions(-)

-- 
2.34.1

