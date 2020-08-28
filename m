Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1189A255B42
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Aug 2020 15:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598621687;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ljr3BWVg1KGhtkgQvIGb9sjmr9D7YopQJEcP8hioYqE=;
	b=LsqPegTHlBt1N4boTBV034J8kcnwTnFclGK9lN7akbA2kmYyP9RPB27aCsf5ufNRa2k98W
	LbJndIi3L+np+f82/CdzyT4V8cfVOX6gRQd2gLVAMsPuDuMtubQecOoSkN6skrVF8QUt93
	QJXp8MsZVKoY/3VsR7kehnEHt0oVjWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-uee0bRz2PJKIPgLC4rjAYw-1; Fri, 28 Aug 2020 09:34:45 -0400
X-MC-Unique: uee0bRz2PJKIPgLC4rjAYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C861A1DE0B;
	Fri, 28 Aug 2020 13:34:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91CC674E1E;
	Fri, 28 Aug 2020 13:34:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01F93181A06B;
	Fri, 28 Aug 2020 13:34:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07SDWo2j022140 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 28 Aug 2020 09:32:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E0AF7D4F8; Fri, 28 Aug 2020 13:32:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.194.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA5097D4F6;
	Fri, 28 Aug 2020 13:32:34 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Aug 2020 15:32:33 +0200
Message-Id: <20200828133233.1147149-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2: Fix memory leak on filesystem
	withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi Linus,

could you please pull the following gfs2 fix?

We didn't detect this bug because we have slab merging on by default
(CONFIG_SLAB_MERGE_DEFAULT).  Adding "slub_nomerge" to the kernel
command line exposed the problem.

Thanks,
Andreas

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.9-rc2-fixes

for you to fetch changes up to 462582b99b6079a6fbcdfc65bac49f5c2a27cfff:

  gfs2: add some much needed cleanup for log flushes that fail (2020-08-24 13:54:07 +0200)

----------------------------------------------------------------
Fix memory leak on filesystem withdraw

----------------------------------------------------------------
Bob Peterson (1):
      gfs2: add some much needed cleanup for log flushes that fail

 fs/gfs2/log.c   | 31 +++++++++++++++++++++++++++++++
 fs/gfs2/trans.c |  1 +
 2 files changed, 32 insertions(+)

