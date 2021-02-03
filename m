Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C7B8730E1E1
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qLecqkTbSjF5enNfov+Wq0oB8E0L0d2fC845BmQAVRI=;
	b=WWaJ0nPdTpWnEsaiCzhDTrPrkYezAmFZURrJjznlutxb6aJhVcpo7wu1BRH+cTbx5cNBOp
	6SrFQRSDliHBIHwbCzRwliToBC0Hs/vKn3mQVCw53DX5I5zFZ8Zanxw/7elt5xYKyQ93WV
	MOjzPiOoaY1c2egLUxadU6KdVzYiCKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-sJ9bIUQVO9eFjz4fnWzj7w-1; Wed, 03 Feb 2021 13:08:11 -0500
X-MC-Unique: sJ9bIUQVO9eFjz4fnWzj7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CBBC801979;
	Wed,  3 Feb 2021 18:08:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52C8E5D6A8;
	Wed,  3 Feb 2021 18:08:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 144079980;
	Wed,  3 Feb 2021 18:08:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I805r028493 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C5BF06F97A; Wed,  3 Feb 2021 18:08:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D83160D07;
	Wed,  3 Feb 2021 18:07:56 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:35 +0100
Message-Id: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 00/20] Some log space management cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hello,

here's another update on the log log space management cleanup.  The
major change from v3 is that this version retains the on-stack
transactions in gfs2_ail_empty_gl.  Most of the patches have basically
remained unchanged though, so I've marked the new / modified patches
with an asterisk below.  Please review.

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
* gfs2: Use sb_start_intwrite in gfs2_ail_empty_gl
* gfs2: Clean up on-stack transactions
  gfs2: Get rid of sd_reserving_log
  gfs2: Move lock flush locking to gfs2_trans_{begin,end}
  gfs2: Don't wait for journal flush in clean_journal
  gfs2: Clean up gfs2_log_reserve
  gfs2: Use a tighter bound in gfs2_trans_begin
  gfs2: Get rid of current_tail()
  gfs2: Move function gfs2_ail_empty_tr
  gfs2: No revokes for transactions at the tail of the log
  gfs2: Minor calc_reserved cleanup
* gfs2: Rework the log space allocation logic
* gfs2: Per-revoke accounting in transactions

 fs/gfs2/glops.c      |  38 +--
 fs/gfs2/incore.h     |  13 +-
 fs/gfs2/log.c        | 539 +++++++++++++++++++++++++------------------
 fs/gfs2/log.h        |  20 +-
 fs/gfs2/lops.c       |   3 +-
 fs/gfs2/lops.h       |  17 +-
 fs/gfs2/ops_fstype.c |   9 +-
 fs/gfs2/super.c      |  25 +-
 fs/gfs2/trans.c      | 103 ++++++---
 fs/gfs2/trans.h      |   3 +
 10 files changed, 439 insertions(+), 331 deletions(-)

-- 
2.26.2

