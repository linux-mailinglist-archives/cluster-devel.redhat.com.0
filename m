Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 210D42B8124
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Nov 2020 16:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605714651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YEB1MOPxQr2d0F2dvLjWRdDGxOL6d15wgfjJ3wkEM+Q=;
	b=PX2atRlOH6tNDUWwx2jiJsAxLP1gc4LR2m4EI0uwlzfIBzp3WfQxzqo3SjW8eJab0hatkA
	c47FOPAnRRqm4CM1NxADtOBazf9mlCpFkOfWgb21gGl3er/mxFFZ3RSwbnlD2TxNmclaSE
	QSZHdtbV7D8bKxouLeTNbkpH9YIkM3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-XizQBorvNda-JhSKFtFIqw-1; Wed, 18 Nov 2020 10:50:49 -0500
X-MC-Unique: XizQBorvNda-JhSKFtFIqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00EB76D585;
	Wed, 18 Nov 2020 15:50:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4F5C60636;
	Wed, 18 Nov 2020 15:50:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16ABB5813D;
	Wed, 18 Nov 2020 15:50:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIFohcP023548 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 10:50:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 040FC1964A; Wed, 18 Nov 2020 15:50:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 203AA21E78;
	Wed, 18 Nov 2020 15:50:33 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Nov 2020 16:50:32 +0100
Message-Id: <20201118155032.127787-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] Another gfs2 fix for 5.10-rc4
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

Hi Linus,

please consider pulling the following additional gfs2 fix.

Thanks,
Andreas

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.10-rc4-fixes

for you to fetch changes up to 20b329129009caf1c646152abe09b697227e1c37:

  gfs2: Fix regression in freeze_go_sync (2020-11-18 16:28:11 +0100)

----------------------------------------------------------------
Fix gfs2 freeze/thaw

----------------------------------------------------------------
Bob Peterson (1):
      gfs2: Fix regression in freeze_go_sync

 fs/gfs2/glops.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

