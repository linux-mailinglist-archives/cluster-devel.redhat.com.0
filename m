Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFBE4683FE
	for <lists+cluster-devel@lfdr.de>; Sat,  4 Dec 2021 11:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638613513;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ihpAmDy0ClSxFAbH5aDgEnZl10gfqE91dXR3hMgHpnQ=;
	b=ZbHVuwGzqWPioeEJKtjjttpWVMvePqvke8NwDOCkj4F++7hIrtnr/i3LON2JZ2K3+53neT
	T14n+UskQSlVt6603j7L7PZpGsTijgU/y4vQgOC15QanrQAwrY0I6PR/Pk0E+IyK26eK9u
	hQG96ksln0xBQ29leKehKIDEJpXE0Ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-Q_47VSCtP5qRRaiyWyqIsA-1; Sat, 04 Dec 2021 05:25:10 -0500
X-MC-Unique: Q_47VSCtP5qRRaiyWyqIsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10198801B0E;
	Sat,  4 Dec 2021 10:25:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BF6B5C640;
	Sat,  4 Dec 2021 10:25:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A82F4BB7C;
	Sat,  4 Dec 2021 10:24:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B4AOpw0017100 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 4 Dec 2021 05:24:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C99C618032; Sat,  4 Dec 2021 10:24:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBC855C25D;
	Sat,  4 Dec 2021 10:24:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat,  4 Dec 2021 11:24:46 +0100
Message-Id: <20211204102446.19275-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for v5.16-rc4
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

please consider pulling the following gfs2 fixes for 5.16-rc4.

Thanks,
Andreas

The following changes since commit 42eb8fdac2fc5d62392dcfcf0253753e821a97b0:

  Merge tag 'gfs2-v5.16-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2021-11-17 15:55:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.16-rc4-fixes

for you to fetch changes up to 3d36e57ff768dbb919c06ffedec4bfe4587c6254:

  gfs2: gfs2_create_inode rework (2021-12-02 12:41:10 +0100)

----------------------------------------------------------------
Fixes in gfs2:
* Since commit 486408d690e1 ("gfs2: Cancel remote delete work
  asynchronously"), inode create and lookup-by-number can overlap more
  easily and we can end up with temporary duplicate inodes.  Fix the
  code to prevent that.
* Fix a BUG demoting weak glock holders from a remote node.

----------------------------------------------------------------
Andreas Gruenbacher (4):
      gfs2: Fix remote demote of weak glock holders
      gfs2: gfs2_inode_lookup cleanup
      gfs2: gfs2_inode_lookup rework
      gfs2: gfs2_create_inode rework

 fs/gfs2/glock.c |  10 ++++--
 fs/gfs2/inode.c | 109 +++++++++++++++++++++++---------------------------------
 2 files changed, 52 insertions(+), 67 deletions(-)

