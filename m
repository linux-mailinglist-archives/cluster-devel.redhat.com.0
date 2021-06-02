Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EC93F39884B
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Jun 2021 13:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622633188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gylhu4c5+fQCDTPC6IImtOwya8gXx77hl43NDHaB5sE=;
	b=LbkRcxhFCV1dpchJ/oU4ok74A6jrVUFayor0KmzlGPjff+3UEiUOjXFBA+I98PbYp4OTTG
	H4Lg8kwdPM1PMETo3/EX8oVbz6HXhEAer5zjhW3E7Tdwj7Z5LgbqxTSQatVjt6DXP7IqJF
	XXH/Br6h/sUQVIN1eaCe3+pAIf4vNY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-k3VJlrNOPMyNyxJIbQb1Zg-1; Wed, 02 Jun 2021 07:26:25 -0400
X-MC-Unique: k3VJlrNOPMyNyxJIbQb1Zg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA5EF107AD5C;
	Wed,  2 Jun 2021 11:26:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DFE75D9D0;
	Wed,  2 Jun 2021 11:26:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A36C44A5A;
	Wed,  2 Jun 2021 11:26:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 152BQCiZ009714 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 07:26:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C3A15C67A; Wed,  2 Jun 2021 11:26:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F1D6761EA;
	Wed,  2 Jun 2021 11:26:10 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed,  2 Jun 2021 13:26:09 +0200
Message-Id: <20210602112609.355793-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2: Recognize mmap + page fault
	self-recursion to prevent deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling the following fixes for partially addressing the mmap +
page fault deadlocks.  It's not clear to me if and when we'll find a better
solution, and those fixes prevent a kernel BUG in the simple self-recursion
case at least.  (This is the case that the new fstest [*] reproduces.)

[*] https://lore.kernel.org/fstests/20210531152604.240462-1-agruenba@redhat.com/

Thanks,
Andreas

The following changes since commit d5b8145455c629e7f157d2da46a9b2fba483f235:

  Revert "gfs2: Fix mmap locking for write faults" (2021-06-01 23:16:42 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.13-rc2-fixes3

for you to fetch changes up to 485805ef8389eb1caa484cbb66e815afac00879d:

  gfs2: Fix mmap + page fault deadlocks (part 1) (2021-06-02 11:44:54 +0200)

----------------------------------------------------------------
gfs2: Recognize mmap + page fault self-recursion to prevent deadlocks

----------------------------------------------------------------
Andreas Gruenbacher (4):
      gfs2: Clean up the error handling in gfs2_page_mkwrite
      gfs2: Add wrapper for iomap_file_buffered_write
      gfs2: Add gfs2_holder_is_compatible helper
      gfs2: Fix mmap + page fault deadlocks (part 1)

 fs/gfs2/file.c  | 117 +++++++++++++++++++++++++++++++++++++++-----------------
 fs/gfs2/glock.h |  14 +++++++
 2 files changed, 95 insertions(+), 36 deletions(-)

