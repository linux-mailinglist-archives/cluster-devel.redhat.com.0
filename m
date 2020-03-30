Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCFD197D49
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576008;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eEd+p2Tm8Jh72lGkQKwf0dyyzYpUkXuxe0gw1gjMbOo=;
	b=H04qRvnUv6evs6+IRPWCqhSlUtLe3XR4OqWOIZlCjX9geN/Zt5Q8eSjXvoYo+u5DcuwKSp
	sFRa2aa2eY35i79L5c7c+xNBgqmCbulstiC0rhcB8es8ZrJLGPm9mnBNcaubPYq1OXZeOj
	wf5g29uwAwBru7wDPbyMcLB6HxEm898=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-nW5dHStdM1edUp9v-I7BVw-1; Mon, 30 Mar 2020 09:46:44 -0400
X-MC-Unique: nW5dHStdM1edUp9v-I7BVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55475108C31E;
	Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D2DD5C1C5;
	Mon, 30 Mar 2020 13:46:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA15518089CD;
	Mon, 30 Mar 2020 13:46:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkSkN020091 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8496648; Mon, 30 Mar 2020 13:46:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0350297B13
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:45:45 -0500
Message-Id: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 00/39] GFS2: Pre-pull patch posting
	(merge window)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

We've got a lot of patches (39) for this merge window. Most of these patche=
s
are related to corruption that occurs when journals are replayed.
For example:

   1. A node fails while writing to the file system.
   2. Other nodes use the metadata that was once used by the failed node.
   3. When the node returns to the cluster, its journal is replayed,
      but the older metadata blocks overwrite the changes from step 2.

o Fixed the recovery sequence to prevent corruption during journal replay.
o Many bug fixes found during recovery testing.
o New improved file system withdraw sequence.
o Fixed how resource group buffers are managed.
o Fixed how metadata revokes are tracked and written.
o Improve processing of IO errors hit by daemons like logd and quotad.
o Improved error checking in metadata writes.

Regards,

Bob Peterson

Andreas Gruenbacher (9):
  gfs2: Split gfs2_lm_withdraw into two functions
  gfs2: Report errors before withdraw
  gfs2: Remove usused cluster_wide arguments of gfs2_consist functions
  gfs2: Turn gfs2_consist into void functions
  gfs2: Return bool from gfs2_assert functions
  gfs2: Clean up inode initialization and teardown
  gfs2: Switch to list_{first,last}_entry
  gfs2: Split gfs2_rsqa_delete into gfs2_rs_delete and gfs2_qa_put
  gfs2: Remove unnecessary gfs2_qa_{get,put} pairs

Bob Peterson (30):
  gfs2: Introduce concept of a pending withdraw
  gfs2: clear ail1 list when gfs2 withdraws
  gfs2: Rework how rgrp buffer_heads are managed
  gfs2: log error reform
  gfs2: Only complain the first time an io error occurs in quota or log
  gfs2: Ignore dlm recovery requests if gfs2 is withdrawn
  gfs2: move check_journal_clean to util.c for future use
  gfs2: Allow some glocks to be used during withdraw
  gfs2: Force withdraw to replay journals and wait for it to finish
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
  gfs2: don't allow releasepage to free bd still used for revokes
  gfs2: allow journal replay to hold sd_log_flush_lock
  gfs2: leaf_dealloc needs to allocate one more revoke
  gfs2: Additional information when gfs2_ail1_flush withdraws
  gfs2: eliminate gfs2_rsqa_alloc in favor of gfs2_qa_alloc
  gfs2: Change inode qa_data to allow multiple users
  gfs2: don't lock sd_log_flush_lock in try_rgrp_unlink
  gfs2: instrumentation wrt ail1 stuck
  gfs2: change from write to read lock for sd_log_flush_lock in journal
    replay
  gfs2: Fix oversight in gfs2_ail1_flush

 fs/gfs2/acl.c        |   7 +-
 fs/gfs2/aops.c       |  11 +-
 fs/gfs2/bmap.c       |   9 +-
 fs/gfs2/dir.c        |   3 +-
 fs/gfs2/file.c       |  43 ++---
 fs/gfs2/glock.c      | 137 +++++++++++---
 fs/gfs2/glops.c      | 157 +++++++++++++---
 fs/gfs2/incore.h     |  27 ++-
 fs/gfs2/inode.c      |  53 +++---
 fs/gfs2/lock_dlm.c   |  52 ++++++
 fs/gfs2/log.c        | 288 ++++++++++++++++++++---------
 fs/gfs2/log.h        |   1 +
 fs/gfs2/lops.c       |  14 +-
 fs/gfs2/meta_io.c    |   3 +-
 fs/gfs2/ops_fstype.c |  59 ++----
 fs/gfs2/quota.c      |  76 ++++----
 fs/gfs2/quota.h      |   4 +-
 fs/gfs2/recovery.c   |  12 +-
 fs/gfs2/rgrp.c       |  88 ++++-----
 fs/gfs2/rgrp.h       |   4 +-
 fs/gfs2/super.c      | 112 ++++++++----
 fs/gfs2/super.h      |   1 -
 fs/gfs2/sys.c        |   5 +-
 fs/gfs2/trans.c      |   4 +
 fs/gfs2/util.c       | 419 +++++++++++++++++++++++++++++++++----------
 fs/gfs2/util.h       |  76 +++++---
 fs/gfs2/xattr.c      |  12 +-
 27 files changed, 1168 insertions(+), 509 deletions(-)

--=20
2.25.1

