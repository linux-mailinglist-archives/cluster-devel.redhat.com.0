Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8763526C09
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 23:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652476036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sh5oKvIJmcZ6Z8sDauzoGErE3sFVtMbnI9oXNJC+aqg=;
	b=OoMVm2L2Fv//kt3ceM8FJ7PVI60194TvEseFoSLBfiI4KVIECykf7HgRx5kAVEoPHmihTx
	OnrZfYAhPM20g8vCeTaqJJ4DgPJmEga4I7+ECPt5YV2Xth+bphI7RTAWydcfYzicNLTkTH
	awShvGyA7WicXyKlTdDNU7pxVU31Sh4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-vmhuG3o5Mu2rGCOXFc2uWQ-1; Fri, 13 May 2022 17:07:15 -0400
X-MC-Unique: vmhuG3o5Mu2rGCOXFc2uWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 419CD3C021B2;
	Fri, 13 May 2022 21:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30624416157;
	Fri, 13 May 2022 21:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E7F741932235;
	Fri, 13 May 2022 21:07:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D13F5194975B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 21:07:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B265640D2822; Fri, 13 May 2022 21:07:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8084C40D2820;
 Fri, 13 May 2022 21:07:11 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 May 2022 23:07:10 +0200
Message-Id: <20220513210710.4124506-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

we've finally identified commit dc732906c245 ("gfs2: Introduce flag for glock
holder auto-demotion") to be the other cause of the filesystem corruption we've
been seeing.  This feature isn't strictly necessary anymore, so we've decided
to stop using it for now.  With this and the gfs_iomap_end rounding fix you've
already seen ("gfs2: Fix filesystem block deallocation for short writes" in
this pull request), we're corruption free again now.

Would you like to still pull these fixes for v5.18, or should we send them in
the next merge window?

Thanks again for all the help you've provided.

Andreas

The following changes since commit 4a2316a1eda4ef3ced18c7f08f7cb3726bcae44b:

  Merge tag 'gfs2-v5.18-rc4-fix2' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2022-04-28 09:50:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.18-rc4-fix3

for you to fetch changes up to e1fa9ea85ce89207d2ac0316da35a4a7736801f9:

  gfs2: Stop using glock holder auto-demotion for now (2022-05-13 22:32:52 +0200)

----------------------------------------------------------------
gfs2 fixes

- Fix filesystem block deallocation for short writes.
- Stop using glock holder auto-demotion for now.
- Get rid of buffered writes inefficiencies due to page
  faults being disabled.
- Minor other cleanups.

----------------------------------------------------------------
Andreas Gruenbacher (7):
      gfs2: Fix filesystem block deallocation for short writes
      gfs2: Variable rename
      gfs2: Clean up use of fault_in_iov_iter_{read,write}able
      gfs2: Pull return value test out of should_fault_in_pages
      gfs2: Align read and write chunks to the page cache
      gfs2: buffered write prefaulting
      gfs2: Stop using glock holder auto-demotion for now

 fs/gfs2/bmap.c |  11 +++--
 fs/gfs2/file.c | 139 ++++++++++++++++++++++++++-------------------------------
 2 files changed, 68 insertions(+), 82 deletions(-)

