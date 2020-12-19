Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD562DF19A
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hlADMv+8aHhyoiV4NWwtCVUmf02FkRVtYbkZVLlCGVw=;
	b=FGBTt6LNJkgwV9NtqVFuY0T0cdKMOBm00E4RB6E6kLNcy1K6e4gJR5JBRimv43mAWpCE4F
	MPMM9avk9tjIucUQaADXoSk3bK26Ev+LtTsA3j0Hc4LUhVwe6E7EDdsaRusoRhoxiQdmB3
	FDAHDMzQuNs6wkpJMHUCnXqa+8gbLcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-2szZeXOfOgC4-Aup-87yBg-1; Sat, 19 Dec 2020 15:49:09 -0500
X-MC-Unique: 2szZeXOfOgC4-Aup-87yBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A42C0107ACE3;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A7B50DD2;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBB1C1809CA1;
	Sat, 19 Dec 2020 20:49:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKmvBk020072 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:48:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 079E050C0A; Sat, 19 Dec 2020 20:48:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8F622DAD0;
	Sat, 19 Dec 2020 20:48:52 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:28 +0100
Message-Id: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 00/20] Some log space management cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hello,

here's an update on the log log space management cleanup.  The
notable additions are:

* gfs2: Get rid of current_tail()

  Replace current_tail() with a new sd_log_flush_tail variable in
  the super block.

* gfs2: No revokes for transactions at the tail of the log

  We no longer write out revokes for transactions at the tail
  of the log that have completed; the log header with its
  updated lh_tail will implicitly take care of revoking those.

* gfs2: Rework the log space allocation logic

  Clean up the entire log space allocation code to make it
  more manageable.

* gfs2: Hand out revokes to transactions one by one

  Based on the previous patch, clean up the revoke allocation
  code.

Thanks,
Andreas

Andreas Gruenbacher (20):
  gfs2: Deobfuscate function jdesc_find_i
  gfs2: Simplify the buf_limit and databuf_limit definitions
  gfs2: Minor gfs2_write_revokes cleanups
  gfs2: Some documentation updates
  gfs2: A minor debugging improvement
  gfs2: Rename gfs2_{write => add_aux}_revokes
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
  gfs2: Hand out revokes to transactions one by one

 fs/gfs2/glops.c      |  29 +--
 fs/gfs2/incore.h     |  13 +-
 fs/gfs2/log.c        | 558 +++++++++++++++++++++++++------------------
 fs/gfs2/log.h        |  20 +-
 fs/gfs2/lops.c       |  10 +-
 fs/gfs2/lops.h       |  17 +-
 fs/gfs2/ops_fstype.c |   9 +-
 fs/gfs2/super.c      |  25 +-
 fs/gfs2/trans.c      |  91 ++++---
 fs/gfs2/trans.h      |   2 +
 10 files changed, 444 insertions(+), 330 deletions(-)

-- 
2.26.2

