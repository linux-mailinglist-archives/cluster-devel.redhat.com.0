Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB60D3065A7
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781913;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FC+3bRQyH80Zqr9nnLyiUuMMZaXnww0oOWN/xY4PFTk=;
	b=a6rtk+4RWsUDru9r0kMYxL2d7jLq2nNPQ03581AoXJ9F/ptPjOOPodXi/aRDQ3IQPiMYmr
	VQEoBssMoMJgNeG4g6x/fMSTjXE5aJsYasf0e1hIne9mnt1dTJSTs9b3y5oIKTVQN8xo3c
	oLE1t9EaD01vo9UibmTpzWGAfYSaQ9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-yJThYBy4MD685hbiDfI6PA-1; Wed, 27 Jan 2021 16:11:52 -0500
X-MC-Unique: yJThYBy4MD685hbiDfI6PA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 895BE8066EA;
	Wed, 27 Jan 2021 21:11:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DB755C1D0;
	Wed, 27 Jan 2021 21:11:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C75A81809CA0;
	Wed, 27 Jan 2021 21:11:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL7pMt013736 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:07:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 78E216F456; Wed, 27 Jan 2021 21:07:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B18A55B4A8;
	Wed, 27 Jan 2021 21:07:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:26 +0100
Message-Id: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 00/20] Some log space management cleanups
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hello,

here's another update on the log log space management cleanup.  The
changes are mostly in the topmost patch ("gfs2: Per-revoke accounting in
transactions"), which still had several bugs in v2.  Please review.

Thanks,
Andreas

Andreas Gruenbacher (20):
  gfs2: Un-obfuscate function jdesc_find_i
  gfs2: Simplify the buf_limit and databuf_limit definitions
  gfs2: Minor gfs2_write_revokes cleanups
  gfs2: Some documentation updates
  gfs2: Minor debugging improvement
  gfs2: Rename gfs2_{write => flush}_revokes
  gfs2: Clean up ail2_empty
  gfs2: Get rid of on-stack transactions
  gfs2: Get rid of sd_reserving_log
  gfs2: Move lock flush locking to gfs2_trans_{begin,end}
  gfs2: Don't wait for journal flush in clean_journal
  gfs2: Clean up gfs2_log_reserve
  gfs2: Use a tighter bound in gfs2_trans_begin
  gfs2: Get rid of current_tail()
  gfs2: Move function gfs2_ail_empty_tr
  gfs2: No revokes for transactions at the tail of the log
  gfs2: Remove sd_log_committed_revoke
  gfs2: Remove sd_log_blks_reserved
  gfs2: Rework the log space allocation logic
  gfs2: Per-revoke accounting in transactions

 fs/gfs2/glops.c      |  37 +--
 fs/gfs2/incore.h     |  13 +-
 fs/gfs2/log.c        | 545 +++++++++++++++++++++++++------------------
 fs/gfs2/log.h        |  20 +-
 fs/gfs2/lops.c       |   3 +-
 fs/gfs2/lops.h       |  17 +-
 fs/gfs2/ops_fstype.c |   9 +-
 fs/gfs2/super.c      |  25 +-
 fs/gfs2/trans.c      |  89 ++++---
 fs/gfs2/trans.h      |   2 +
 10 files changed, 426 insertions(+), 334 deletions(-)

-- 
2.26.2

