Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608A4B2B44
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Feb 2022 18:06:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644599159;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UDk1zAMKdbmY1e5sy2VAX1LIyapo0Bn+bNb2SHhF21Y=;
	b=B0ofIYitvxy8e42FYZn7F8EmrUCYmmMT1jVgcMvqLZKbzhCkaRo8x/ox1JnCeDUEqwKUwT
	PowhL6WUvX80apHEjivy9gky9CXvet0rKReP1B0aEq4ZlNVZ7gifcfQFzYs+sARL1xz6Xe
	Jr/u8y73BhXbc0xU59dvcpFVxcTC6EE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-44hTvGd6PWy1C2S8KWzi3A-1; Fri, 11 Feb 2022 12:05:56 -0500
X-MC-Unique: 44hTvGd6PWy1C2S8KWzi3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1404423C7;
	Fri, 11 Feb 2022 17:05:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 221B3105C896;
	Fri, 11 Feb 2022 17:05:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 687D54BB7C;
	Fri, 11 Feb 2022 17:05:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BH5aRe003652 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 12:05:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F34162DE67; Fri, 11 Feb 2022 17:05:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19AC22DE97;
	Fri, 11 Feb 2022 17:05:23 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Feb 2022 18:05:22 +0100
Message-Id: <20220211170522.348999-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following two gfs2 fixes for 5.17-rc4.

Thanks,
Andreas

The following changes since commit 74382e277ae97b4bcfac6f8b61df7a500d392500:

  gfs2: dump inode object for iopen glocks (2022-01-11 16:52:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.16-rc3-fixes2

for you to fetch changes up to d3add1a9519dcacd6e644ecac741c56cf18b67f5:

  gfs2: Fix gfs2_release for non-writers regression (2022-02-11 17:44:42 +0100)

----------------------------------------------------------------
gfs2 fixes:
* Revert debug commit that causes unexpected data corruption.
* Fix muti-block reservation regression.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      Revert "gfs2: check context in gfs2_glock_put"

Bob Peterson (1):
      gfs2: Fix gfs2_release for non-writers regression

 fs/gfs2/file.c  | 7 ++++---
 fs/gfs2/glock.c | 3 ---
 2 files changed, 4 insertions(+), 6 deletions(-)

