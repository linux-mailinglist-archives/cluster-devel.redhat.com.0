Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DDA1E14F1DE
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PqfCkhGAd3dDxR6cAYDw61zoLgU61mY7EBev227OBrs=;
	b=X3qi4fW2SwtwtX74V7/DhcgJPrJSQJttqYHexTA82kg61Clbefq75q7/ccopPe3o9aszGF
	1HNJyJEBtnv5jZ7TWBUI1mtMyOWvZLhQUy34VVl/nqcVqtKq26apihMZQFaSjTUHUC6LMB
	Vh1xxqjzlyj56j/Ise1tDcQnIVVy9YY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-603JfJo2PXueLRGGHFEZBA-1; Fri, 31 Jan 2020 13:07:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FFB210C667C;
	Fri, 31 Jan 2020 18:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2CE0100EBA8;
	Fri, 31 Jan 2020 18:07:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85BEC18089C8;
	Fri, 31 Jan 2020 18:07:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI7Tog026850 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:07:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D246C60BE1; Fri, 31 Jan 2020 18:07:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E12060BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:07:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:06:58 -0600
Message-Id: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 00/25] GFS2 recovery patches v9
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 603JfJo2PXueLRGGHFEZBA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

As you may recall, Andreas and I have been working to clean up the extensiv=
e
recovery patch set. Here, then, is the most recent version. Note that some
patches were removed, and others were restructered a bit.
I hope to push this to for-next and merge it in soon.

Many thanks to Andreas Gruenbacher for his suggestions and clean-ups.

Regards,

Bob Peterson

Andreas Gruenbacher (5):
  gfs2: Split gfs2_lm_withdraw into two functions
  gfs2: Report errors before withdraw
  gfs2: Remove usused cluster_wide arguments of gfs2_consist functions
  gfs2: Turn gfs2_consist into void functions
  gfs2: Return bool from gfs2_assert functions

Bob Peterson (20):
  gfs2: Introduce concept of a pending withdraw
  gfs2: clear ail1 list when gfs2 withdraws
  gfs2: Rework how rgrp buffer_heads are managed
  gfs2: log error reform
  gfs2: Only complain the first time an io error occurs in quota or log
  gfs2: Ignore dlm recovery requests if gfs2 is withdrawn
  gfs2: move check_journal_clean to util.c for future use
  gfs2: Allow some glocks to be used during withdraw
  gfs2: Make secondary withdrawers wait for first withdrawer
  gfs2: fix infinite loop when checking ail item count before go_inval
  gfs2: Add verbose option to check_journal_clean
  gfs2: Issue revokes more intelligently
  gfs2: Prepare to withdraw as soon as an IO error occurs in log write
  gfs2: Check for log write errors before telling dlm to unlock
  gfs2: Do log_flush in gfs2_ail_empty_gl even if ail list is empty
  gfs2: Withdraw in gfs2_ail1_flush if write_cache_pages fails
  gfs2: drain the ail2 list after io errors
  gfs2: Don't demote a glock until its revokes are written
  gfs2: Do proper error checking for go_sync family of glops functions
  gfs2: flesh out delayed withdraw for gfs2_log_flush

 fs/gfs2/glock.c      | 125 +++++++++++---
 fs/gfs2/glops.c      | 157 ++++++++++++++---
 fs/gfs2/incore.h     |  25 ++-
 fs/gfs2/lock_dlm.c   |  52 ++++++
 fs/gfs2/log.c        | 238 +++++++++++++++++---------
 fs/gfs2/log.h        |   1 +
 fs/gfs2/lops.c       |   8 +-
 fs/gfs2/meta_io.c    |   2 +-
 fs/gfs2/ops_fstype.c |  55 +-----
 fs/gfs2/quota.c      |   7 +-
 fs/gfs2/recovery.c   |   5 +
 fs/gfs2/rgrp.c       |  71 +++-----
 fs/gfs2/rgrp.h       |   1 -
 fs/gfs2/super.c      |  73 +++++---
 fs/gfs2/sys.c        |   3 +-
 fs/gfs2/trans.c      |   4 +
 fs/gfs2/util.c       | 396 +++++++++++++++++++++++++++++++++----------
 fs/gfs2/util.h       |  76 ++++++---
 18 files changed, 934 insertions(+), 365 deletions(-)

--=20
2.24.1

