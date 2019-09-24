Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A37BCFF1
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Sep 2019 19:03:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 688A081F31;
	Tue, 24 Sep 2019 17:02:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24E45600C8;
	Tue, 24 Sep 2019 17:02:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 952194E58A;
	Tue, 24 Sep 2019 17:02:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8OH2nBw003816 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 13:02:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D17D2194B2; Tue, 24 Sep 2019 17:02:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C736419C58;
	Tue, 24 Sep 2019 17:02:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E31210CC1FB;
	Tue, 24 Sep 2019 17:02:49 +0000 (UTC)
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9BFE620673;
	Tue, 24 Sep 2019 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569344568;
	bh=hKUJRk7QMuhzcgsjkjUUakju3zdnETRA3LHzs2tBu7E=;
	h=Date:From:To:Cc:Subject:From;
	b=F0fcM2yk9NZNZbOS6LAuxm9OivSaXSahX2/DCEbqrSxZOzv4wE9pTUpYs5Q8GDnXT
	S2NL4KHleHKltdp4qgFeb+e0c0qehI2XxwReFJtHAOQ7bwowJA4Bcq5SNHf38cpF19
	18iDiiZLLHOj+3HYzBYBZAwrGdPKH3aSDEP/19+E=
Date: Tue, 24 Sep 2019 10:02:48 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190924170248.GZ2229799@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Tue, 24 Sep 2019 17:02:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Tue, 24 Sep 2019 17:02:49 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'djwong@kernel.org' RCPT:''
X-RedHat-Spam-Score: -3.102  (BODY_QUOTE_MALF_MSGID, DKIMWL_WL_HIGH,
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: (far less) new code for 5.4
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 24 Sep 2019 17:03:00 +0000 (UTC)

Hi Linus,

Please pull this series containing all the new iomap code for 5.4.
After last week's failed pull request attempt, I scuttled everything in
the branch except for the directio endio api changes, which were
trivial.  Everything else will simply have to wait for the next cycle.

The branch merges cleanly against this morning's HEAD and survived a
week's worth of xfstests.  The merge was completely straightforward, so
please let me know if you run into anything weird.

--D

The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.4-merge-6

for you to fetch changes up to 838c4f3d7515efe9d0e32c846fb5d102b6d8a29d:

  iomap: move the iomap_dio_rw ->end_io callback into a structure (2019-09-19 15:32:45 -0700)

----------------------------------------------------------------
New code for 5.4:
- Report both io errors and short io results to the directio endio
  handler.
- Allow directio callers to pass an ops structure to iomap_dio_rw.

----------------------------------------------------------------
Christoph Hellwig (1):
      iomap: move the iomap_dio_rw ->end_io callback into a structure

Matthew Bobrowski (1):
      iomap: split size and error for iomap_dio_rw ->end_io

 fs/iomap/direct-io.c  | 24 ++++++++++--------------
 fs/xfs/xfs_file.c     | 14 ++++++++++----
 include/linux/iomap.h | 10 +++++++---
 3 files changed, 27 insertions(+), 21 deletions(-)

