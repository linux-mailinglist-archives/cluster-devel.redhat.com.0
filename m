Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BAC0D2D945F
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607936102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c3qi7P1nzh/Q/3boKG7FyDnzZ4zRBSH6CpTc6ejzWUU=;
	b=eMwMC8O8jXkdGIso4g0KNQjousDnV4eqiVZi3/STz0d6u3HdzYhCmoy82d5Bgl5zgjVGll
	9wUC5165CkNeiIaqNM51E78HKEoGitsYlMD3JikablIrtZf895oOrWmSS8Baw7yXozKqFj
	FrjnCkHtZ9jgYtkl/N4M0f/4ZXv8l3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-wZGs-W_INeyKnzvOKvIYKw-1; Mon, 14 Dec 2020 03:55:01 -0500
X-MC-Unique: wZGs-W_INeyKnzvOKvIYKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72D56801AC9;
	Mon, 14 Dec 2020 08:54:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70ABC1002388;
	Mon, 14 Dec 2020 08:54:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F69C4A7C6;
	Mon, 14 Dec 2020 08:54:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE8smxF016371 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 03:54:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4584E62467; Mon, 14 Dec 2020 08:54:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD7F6267C;
	Mon, 14 Dec 2020 08:54:44 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 14 Dec 2020 09:54:30 +0100
Message-Id: <20201214085442.45467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH 00/12] Some log space management cleanups
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hello,

here's a bit of fallout in the log space management code that resulted
from looking into a revokes accounting problem in conjunction with the
resource group glock sharing patches.  I'm still working on some
follow-up changes, but this patch set should be reasonably
self-contained.  Please review.

Thanks,
Andreas

Andreas Gruenbacher (12):
  gfs2: Deobfuscate function jdesc_find_i
  gfs2: Simplify the buf_limit and databuf_limit definitions
  gfs2: Minor gfs2_write_revokes cleanups
  gfs2: Some documentation clarifications
  gfs2: A minor debugging improvement
  gfs2: Clean up ail2_empty
  gfs2: Get rid of on-stack transactions
  gfs2: Get rid of sd_reserving_log
  gfs2: Move lock flush locking to gfs2_trans_{begin,end}
  gfs2: Don't wait for journal flush in clean_journal
  gfs2: Clean up gfs2_log_reserve
  gfs2: Use a tighter bound in gfs2_trans_begin

 fs/gfs2/glops.c      |  29 ++------
 fs/gfs2/incore.h     |   4 -
 fs/gfs2/log.c        | 174 ++++++++++++++++++-------------------------
 fs/gfs2/log.h        |   3 +-
 fs/gfs2/lops.h       |  17 +----
 fs/gfs2/ops_fstype.c |   2 -
 fs/gfs2/super.c      |  25 +++----
 fs/gfs2/trans.c      |  59 ++++++++++-----
 fs/gfs2/trans.h      |   2 +
 9 files changed, 135 insertions(+), 180 deletions(-)

-- 
2.26.2

