Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D635A117093
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0YSQdMnjKm1RGFQDdqmRbqI23Qdo24D8xx9rR7R0ytc=;
	b=GO/sARJd44sttPdM9nYrTA3duIefbpXXfRH1W9krk62xrFWEh6f1nCkiuZZ/hKGgl5t5mU
	BfehuQk7HXX1bsDbKBkNG4rDPVF9TnDmp1V2h18xQjPncxe3OdCrC4w1PesxlYHYtOUSKA
	LvD89wRFzZGzRvi74Khy5/NBOVEy76Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-4pmZ3xJ4OGWQHzSESRKUpg-1; Mon, 09 Dec 2019 10:37:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09041108BC53;
	Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E678360C18;
	Mon,  9 Dec 2019 15:37:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9DE11803C33;
	Mon,  9 Dec 2019 15:37:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Fb4tC004833 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D62F5DA75; Mon,  9 Dec 2019 15:37:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBFB35D9D6
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:01 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:38 -0600
Message-Id: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 00/22] GFS2 Recovery corruption
	patches v8
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
X-MC-Unique: 4pmZ3xJ4OGWQHzSESRKUpg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Now that Linus has merged our latest for-next patches, I thought I'd
send out my latest patches for the recovery / journal replay corruption
problems. I also pushed them to a "for-next.recovery13b" branch in case
people want to check that out or cherry-pick from it.

Like before, some of these may be pushed separately, but many build upon
others, so it may be tricky.

The most important patch in this set is the last one:
gfs2: Do proper error checking for go_sync family of glops functions.

This recovery patch set has been extensively tested in rhel8 recovery
situations.

Bob Peterson (22):
  gfs2: Introduce concept of a pending withdraw
  gfs2: clear ail1 list when gfs2 withdraws
  gfs2: Rework how rgrp buffer_heads are managed
  gfs2: log error reform
  gfs2: Only complain the first time an io error occurs in quota or log
  gfs2: Ignore dlm recovery requests if gfs2 is withdrawn
  gfs2: move check_journal_clean to util.c for future use
  gfs2: Allow some glocks to be used during withdraw
  gfs2: Make secondary withdrawers wait for first withdrawer
  gfs2: Force withdraw to replay journals and wait for it to finish
  gfs2: fix infinite loop when checking ail item count before go_inval
  gfs2: Add verbose option to check_journal_clean
  gfs2: Issue revokes more intelligently
  gfs2: Prepare to withdraw as soon as an IO error occurs in log write
  gfs2: Check for log write errors before telling dlm to unlock
  gfs2: new slab for transactions
  gfs2: Do log_flush in gfs2_ail_empty_gl even if ail list is empty
  gfs2: Don't skip log flush if glock still has revokes
  gfs2: Withdraw in gfs2_ail1_flush if write_cache_pages returns error
  gfs2: drain the ail2 list after io errors
  gfs2: Don't demote a glock until its revokes are written
  gfs2: Do proper error checking for go_sync family of glops functions

 fs/gfs2/glock.c      | 123 ++++++++++++++++++----
 fs/gfs2/glops.c      | 148 ++++++++++++++++++++++-----
 fs/gfs2/incore.h     |  20 +++-
 fs/gfs2/lock_dlm.c   |  52 ++++++++++
 fs/gfs2/log.c        | 221 +++++++++++++++++++++++++++-------------
 fs/gfs2/log.h        |   1 +
 fs/gfs2/lops.c       |  12 ++-
 fs/gfs2/main.c       |  23 +++++
 fs/gfs2/meta_io.c    |   2 +-
 fs/gfs2/ops_fstype.c |  55 ++--------
 fs/gfs2/quota.c      |   8 +-
 fs/gfs2/recovery.c   |   5 +
 fs/gfs2/rgrp.c       |  60 +++++++----
 fs/gfs2/rgrp.h       |   1 -
 fs/gfs2/super.c      |  73 ++++++++++----
 fs/gfs2/trans.c      |  32 ++++--
 fs/gfs2/trans.h      |   1 +
 fs/gfs2/util.c       | 235 +++++++++++++++++++++++++++++++++++++++++--
 fs/gfs2/util.h       |   7 +-
 19 files changed, 852 insertions(+), 227 deletions(-)

--=20
2.23.0

