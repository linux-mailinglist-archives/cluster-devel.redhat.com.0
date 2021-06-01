Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09E7C397BB2
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Jun 2021 23:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622582536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SGACjImek1ptgXSeByQZrD4xRmOVpVtzNZYAghuZKk4=;
	b=MTGO7nOckIiZN6zCPiH3rHdhxZF8F8f0+QUwArs1sBrnixr3xO5g9P9B5MEHB4kqPgwzEm
	7eYFabNXHMQzLhhYzMZarQq0kwAKiv+0dKXr/kpTJYrgD0PcNAvMBCnRrxncf0FjkLhd67
	yPlLRzm6qQINAgtrumLhRbqIQbemIxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-YJln9ThENWSL3bukaUcp-A-1; Tue, 01 Jun 2021 17:22:14 -0400
X-MC-Unique: YJln9ThENWSL3bukaUcp-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AAE5425CE;
	Tue,  1 Jun 2021 21:22:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFEA41964B;
	Tue,  1 Jun 2021 21:22:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 395C51801265;
	Tue,  1 Jun 2021 21:22:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 151LM6Vi032502 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Jun 2021 17:22:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23765608DB; Tue,  1 Jun 2021 21:22:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05E9260CC5;
	Tue,  1 Jun 2021 21:22:01 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue,  1 Jun 2021 23:22:00 +0200
Message-Id: <20210601212200.318607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] Revert "gfs2: Fix mmap locking for write
	faults"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

please consider pulling this revert.  The commit in question is broken,
and reverting it will restore the correct behavior.  Sorry for the
confusion.

Thanks,
Andreas

The following changes since commit c2131f7e73c9e9365613e323d65c7b9e5b910f56:

  Merge tag 'gfs2-v5.13-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2021-05-31 05:57:22 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.13-rc2-fixes2

for you to fetch changes up to d5b8145455c629e7f157d2da46a9b2fba483f235:

  Revert "gfs2: Fix mmap locking for write faults" (2021-06-01 23:16:42 +0200)

----------------------------------------------------------------
Revert broken commit

----------------------------------------------------------------
Andreas Gruenbacher (1):
      Revert "gfs2: Fix mmap locking for write faults"

 fs/gfs2/file.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

