Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 53907638BB
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 17:36:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15A4388E62;
	Tue,  9 Jul 2019 15:35:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DC7D1001DFA;
	Tue,  9 Jul 2019 15:35:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39A02206D3;
	Tue,  9 Jul 2019 15:35:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69FZIH6002580 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 11:35:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7B005C22D; Tue,  9 Jul 2019 15:35:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 870205C634;
	Tue,  9 Jul 2019 15:35:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CE0F30ADC82;
	Tue,  9 Jul 2019 15:35:00 +0000 (UTC)
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9261720656;
	Tue,  9 Jul 2019 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562686494;
	bh=gub/vrZ1KsSeLFGrO8xgrbIV84kVgeYFagd2MwkIbC0=;
	h=Date:From:To:Cc:Subject:From;
	b=MFWFdmqLBKqQWc5mPJMkSKEKKpzKlpA5PttUb1dRkUc1UAl85uBBky1+d91jh2qXT
	/9pHxlnwkkcjuVPf92gQxe2YFoU2u9iKR0hHQKGilDVg033Lrn/AUS7lQDtfr+DQKc
	R/LJNaQVe/NrP+67khS/FgOwGoP9ClBOFoKBlWm8=
Date: Tue, 9 Jul 2019 08:34:54 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190709153454.GQ1404256@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 09 Jul 2019 15:35:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 09 Jul 2019 15:35:00 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'djwong@kernel.org' RCPT:''
X-RedHat-Spam-Score: -0.098  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_HELO_NONE,
	SPF_NONE) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: new code for 5.3, part 1
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 09 Jul 2019 15:36:10 +0000 (UTC)

Hi Linus,

Here's the first part of the iomap merge for 5.3.  There are a few fixes
for gfs2 but otherwise it's pretty quiet so far. The branch merges
cleanly against this morning's HEAD and survived an overnight run of
xfstests.  The merge was completely straightforward, so please let me
know if you run into anything weird.

For the second part of the merge window I would like to break up iomap.c
into smaller files grouped by functional area so that it'll be easier in
the long run to keep the pieces separate and to review incoming patches.
There won't be any functional changes, as the file can still be split
very cleanly.

I prefer to get this done quickly before 5.3-rc1 because I anticipate
that there will be rather more iomap development work coming for 5.4, so
my plan is to rebase my splitting series after the mm and block merges
land and come back in a week or so having let it soak in for-next for
several days.  Let me know if you'd pefer a different timeline.

--D

The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:

  Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.3-merge-1

for you to fetch changes up to 36a7347de097edf9c4d7203d09fa223c86479674:

  iomap: fix page_done callback for short writes (2019-06-27 17:28:41 -0700)

----------------------------------------------------------------
New for 5.3:
- Only mark inode dirty at the end of writing to a file (instead of once
  for every page written).
- Fix for an accounting error in the page_done callback.

----------------------------------------------------------------
Andreas Gruenbacher (2):
      iomap: don't mark the inode dirty in iomap_write_end
      iomap: fix page_done callback for short writes

Christoph Hellwig (1):
      fs: fold __generic_write_end back into generic_write_end

 fs/buffer.c           | 62 ++++++++++++++++++++++++---------------------------
 fs/gfs2/bmap.c        |  2 ++
 fs/internal.h         |  2 --
 fs/iomap.c            | 17 ++++++++++++--
 include/linux/iomap.h |  1 +
 5 files changed, 47 insertions(+), 37 deletions(-)

