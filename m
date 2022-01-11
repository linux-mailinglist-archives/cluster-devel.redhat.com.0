Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55348B3B2
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Jan 2022 18:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641921763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r+yC4hEgN269opLBx7nLXsP7O007gMpSwFuaPmq+JHk=;
	b=NkolOLIHvpEKzpwKL5uGKIDnotTRWj3ypFe42qCS4l7EkFy5n/jgOGWQ3p8ZSkQzNX5KYZ
	FfO3wPpXzRLALpxmLl1tg3d+ql9c22Cv4RzWq5b83s/fEa0nFribBc0wYRVs++zS2lCsWg
	TvI5LC85qOfGO2u1iY3VvylpGjZ/IxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-zIxtQRLrPPi9lOEgeWQcPQ-1; Tue, 11 Jan 2022 12:22:40 -0500
X-MC-Unique: zIxtQRLrPPi9lOEgeWQcPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5F4839A44;
	Tue, 11 Jan 2022 17:22:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA0CA7512F;
	Tue, 11 Jan 2022 17:22:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B7514BB7C;
	Tue, 11 Jan 2022 17:22:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20BHMSk8007204 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jan 2022 12:22:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A6171106C07E; Tue, 11 Jan 2022 17:22:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEE2A106C07F;
	Tue, 11 Jan 2022 17:22:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Jan 2022 18:22:15 +0100
Message-Id: <20220111172215.1149791-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] Various minor gfs2 cleanups and fixes
	for 5.17
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following gfs2 changes for 5.17.

Thanks,
Andreas

The following changes since commit 5c623c368933f22fcf77e040a0ad83f90c4e39ac:

  Merge tag 'gfs2-v5.16-rc4-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2021-12-04 08:13:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.16-rc3-fixes

for you to fetch changes up to 74382e277ae97b4bcfac6f8b61df7a500d392500:

  gfs2: dump inode object for iopen glocks (2022-01-11 16:52:44 +0100)

----------------------------------------------------------------
Various minor gfs2 cleanups and fixes

----------------------------------------------------------------
Andreas Gruenbacher (3):
      gfs2: Fix __gfs2_holder_init function name in kernel-doc comment
      gfs2: Remove redundant check for GLF_INSTANTIATE_NEEDED
      gfs2: Fix gfs2_instantiate description

Bob Peterson (2):
      gfs2: remove redundant set of INSTANTIATE_NEEDED
      gfs2: dump inode object for iopen glocks

 fs/gfs2/glock.c | 4 ++--
 fs/gfs2/glops.c | 2 +-
 fs/gfs2/super.c | 8 +++-----
 3 files changed, 6 insertions(+), 8 deletions(-)

