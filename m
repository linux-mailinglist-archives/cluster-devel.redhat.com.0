Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 983E421B962
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jul 2020 17:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594394729;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9XYubToR8gPoZKz3xGIe2POziR6ztexd5h4TTQatCvU=;
	b=DsNEA1inxKOS5j3HgMMEmTHabZw2C4YSIBIXtMQzdO6w4CyS84+80QCmxqH4ksmwHSmny0
	MN+1Vn6i8KxtdipY1Z9FJSf+dliyXU7ycytFqEs9OyZiqZ5aBflC37elILKRGzUCHGZPiH
	13FWwu0LHHbRUsQ+Sjg9ZHdvCYTJG/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-a5uSQSAqNDK7V3rv9DdgmQ-1; Fri, 10 Jul 2020 11:25:27 -0400
X-MC-Unique: a5uSQSAqNDK7V3rv9DdgmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C99F110059A4;
	Fri, 10 Jul 2020 15:25:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7507C78A46;
	Fri, 10 Jul 2020 15:25:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F6958436A;
	Fri, 10 Jul 2020 15:25:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06AFNW3T013364 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jul 2020 11:23:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C076E1755E; Fri, 10 Jul 2020 15:23:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 300715C1BD;
	Fri, 10 Jul 2020 15:23:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Jul 2020 17:23:24 +0200
Message-Id: <20200710152324.1690683-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Dave Chinner <david@fromorbit.com>,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] Fix gfs2 readahead deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi Linus,

could you please pull the following two commits to fix the gfs2
deadlocks resulting from the conversion to ->readahead in commit
d4388340ae0b ("fs: convert mpage_readpages to mpage_readahead")?

The first commit adds a new IOCB_NOIO flag to generic_file_read_iter.

In the previous version [1] which you've acked [2] and Matthew Willcox
has reviewed [3], ->readpage could still be called even when IOCB_NOIO
was set, so I've added an additional check above that call and I've
dropped the ack and reviewed-by tags.  In addition, bit 8 is now left
unused for the new IOCB_WAITQ flag in the block tree per Jens Axboe's
request.

[1] https://lore.kernel.org/linux-fsdevel/CAHc6FU6LmR7m_8UHmB_77jUpYNo-kgCZ-1YTLqya-PPqvvBy7Q@mail.gmail.com/
[2] https://lore.kernel.org/linux-fsdevel/CAHk-=whBk-jYM6_HBXbu6+gs7Gtw3hWg4iSLncQ0QTwShm6Jaw@mail.gmail.com/
[3] https://lore.kernel.org/linux-fsdevel/20200703114108.GE25523@casper.infradead.org/

Thanks a lot,
Andreas


The following changes since commit dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258:

  Linux 5.8-rc4 (2020-07-05 16:20:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.8-rc4.fixes

for you to fetch changes up to 20f829999c38b18e3d17f9e40dea3a28f721fac4:

  gfs2: Rework read and page fault locking (2020-07-07 23:40:12 +0200)

----------------------------------------------------------------
Fix gfs2 readahead deadlocks

----------------------------------------------------------------
Andreas Gruenbacher (2):
      fs: Add IOCB_NOIO flag for generic_file_read_iter
      gfs2: Rework read and page fault locking

 fs/gfs2/aops.c     | 45 +--------------------------------------------
 fs/gfs2/file.c     | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/fs.h |  1 +
 mm/filemap.c       | 23 +++++++++++++++++++++--
 4 files changed, 73 insertions(+), 48 deletions(-)

