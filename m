Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCC166B6
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 17:27:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D043F74BC;
	Tue,  7 May 2019 15:27:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 650BF17ADD;
	Tue,  7 May 2019 15:27:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A29C3FB11;
	Tue,  7 May 2019 15:27:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47FOb3h025081 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 11:24:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA01910027D1; Tue,  7 May 2019 15:24:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D44B010027BD;
	Tue,  7 May 2019 15:24:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A1958123D;
	Tue,  7 May 2019 15:24:32 +0000 (UTC)
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A2CC820578;
	Tue,  7 May 2019 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557242671;
	bh=ToU2kpbHG/+to4t9z5CCHvUa2rGkhrtoLNWhIuujHvc=;
	h=Date:From:To:Cc:Subject:From;
	b=1Mf7MCIqg/t7D00A8YxZvqyEX8dx7zQBve9p64kOHhbjGQT3TSgy3BJz4Fjin9Z57
	1B30hGaWj7MxqnYe/mcMnJYiLTfB+bLCHjRqbTuHo70ezcx6pzufAZOtCZf8RKDXDI
	jlchPPn977yqX1EDeWrKohTEcmJGGUVPD4zfZt5M=
Date: Tue, 7 May 2019 08:24:30 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190507152430.GB1473023@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 07 May 2019 15:24:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 07 May 2019 15:24:32 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'djwong@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_HI, SPF_PASS,
	T_DKIMWL_WL_HIGH) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 07 May 2019 11:27:42 -0400
Cc: cluster-devel@redhat.com, david@fromorbit.com, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: cleanups and enhancements for 5.2
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 07 May 2019 15:27:56 +0000 (UTC)

Hi Linus,

Here are some patches for the iomap code for 5.2.  Nothing particularly
exciting here, just adding some callouts for gfs2 and cleaning a few
things.  It merges cleanly against this morning's HEAD and survived an
overnight run of xfstests.  Let me know if you run into anything weird.

--D

The following changes since commit dc4060a5dc2557e6b5aa813bf5b73677299d62d2:

  Linux 5.1-rc5 (2019-04-14 15:17:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.2-merge-2

for you to fetch changes up to cbbf4c0be8a725f08153949f45a85b2adafbbbd3:

  iomap: move iomap_read_inline_data around (2019-05-01 20:16:40 -0700)

----------------------------------------------------------------
Changes for Linux 5.2:
- Add some extra hooks to the iomap buffered write path to enable gfs2
  journalled writes.
- SPDX conversion
- Various refactoring.

----------------------------------------------------------------
Andreas Gruenbacher (3):
      fs: Turn __generic_write_end into a void function
      iomap: Fix use-after-free error in page_done callback
      iomap: Add a page_prepare callback

Christoph Hellwig (3):
      iomap: convert to SPDX identifier
      iomap: Clean up __generic_write_end calling
      iomap: move iomap_read_inline_data around

 fs/buffer.c           |   8 ++--
 fs/gfs2/bmap.c        |  15 +++++---
 fs/internal.h         |   2 +-
 fs/iomap.c            | 105 +++++++++++++++++++++++++++-----------------------
 include/linux/iomap.h |  22 ++++++++---
 5 files changed, 88 insertions(+), 64 deletions(-)

