Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5308E3534E4
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Apr 2021 19:19:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617470374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0YBqTLP+FE1SvfYMmQXsZ4qifQi+UKGZR62cXzSBsmw=;
	b=J4mzLwfIzsNzK30Miylh3J7AAtNNbSjFKr8JIFsRZuGGgKdhcbjVI+YfgWBIhzDOyQeVS8
	1Ov/Au8OPWGILMEZ/2EUkx+8W+igdus7otUmItDq5o2+jxoDBD3SAQVtRcOf5Fk4G2yyWk
	yMsguGSEu9hv/62k6A5jnGgDhYE1LKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-RsEt_WO9NRe-RUIfVCPpcQ-1; Sat, 03 Apr 2021 13:19:32 -0400
X-MC-Unique: RsEt_WO9NRe-RUIfVCPpcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67E30107ACCA;
	Sat,  3 Apr 2021 17:19:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57C901980D;
	Sat,  3 Apr 2021 17:19:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F92B1809C83;
	Sat,  3 Apr 2021 17:19:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 133HJK4I019079 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 3 Apr 2021 13:19:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E89FB5C232; Sat,  3 Apr 2021 17:19:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83E9A5C1CF;
	Sat,  3 Apr 2021 17:19:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat,  3 Apr 2021 19:19:14 +0200
Message-Id: <20210403171914.18980-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes for v5.12-rc6
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

please consider pulling the following two gfs2 fixes for v5.12-rc6.

Thanks,
Andreas

The following changes since commit b77b5fdd052e7ee61b35164abb10e8433d3160e8:

  Merge tag 'gfs2-v5.12-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2021-03-12 11:46:09 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.12-rc2-fixes2

for you to fetch changes up to ff132c5f93c06bd4432bbab5c369e468653bdec4:

  gfs2: report "already frozen/thawed" errors (2021-03-25 18:53:38 +0100)

----------------------------------------------------------------
Two more gfs2 fixes

----------------------------------------------------------------
Andrew Price (1):
      gfs2: Flag a withdraw if init_threads() fails

Bob Peterson (1):
      gfs2: report "already frozen/thawed" errors

 fs/gfs2/super.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

