Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A210C2B1163
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Nov 2020 23:24:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605219849;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rp2pBrrUWJ4/DT4IbJIqjOV2fOOYBjdstlgbwGEZFhg=;
	b=E1NW30pBbP4XkZ0Im7ah5z8YXKrR8jc074QmXS2sNSdmGIBdJaVvZSab/pbGC0K1DPEYWb
	iYQqj+tB22F1aX1Nr64hI0cBKb4GWtqA8arwjMQLWm5WDOqK/TtfGAOkWFw0doLZLE6Ghd
	c6rTf1wo3kT+67ZoThDOLzDe/cay+lY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-t7R-EVtWO6uq5f5-ZI7ZvQ-1; Thu, 12 Nov 2020 17:24:07 -0500
X-MC-Unique: t7R-EVtWO6uq5f5-ZI7ZvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 499EB80474C;
	Thu, 12 Nov 2020 22:24:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0C01002C33;
	Thu, 12 Nov 2020 22:24:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DDF358103;
	Thu, 12 Nov 2020 22:23:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACMNqK2010793 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 17:23:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18D355C1C7; Thu, 12 Nov 2020 22:23:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C9645C1BB;
	Thu, 12 Nov 2020 22:23:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Nov 2020 23:23:46 +0100
Message-Id: <20201112222346.2227664-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 fixes for 5.10-rc3
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

Hi Linus,

please consider pulling the following additional gfs2 fixes on top of 5.10-rc3.

Thank you very much,
Andreas

The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091:

  Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.10-rc3-fixes

for you to fetch changes up to 4e79e3f08e576acd51dffb4520037188703238b3:

  gfs2: Fix case in which ail writes are done to jdata holes (2020-11-12 18:55:20 +0100)

----------------------------------------------------------------
Fix jdata data corruption and glock reference leak

----------------------------------------------------------------
Bob Peterson (2):
      Revert "gfs2: Ignore journal log writes for jdata holes"
      gfs2: Fix case in which ail writes are done to jdata holes

Zhang Qilong (1):
      gfs2: fix possible reference leak in gfs2_check_blk_type

 fs/gfs2/aops.c |  2 +-
 fs/gfs2/bmap.c |  8 ++------
 fs/gfs2/log.c  |  2 ++
 fs/gfs2/rgrp.c | 10 +++++-----
 4 files changed, 10 insertions(+), 12 deletions(-)

