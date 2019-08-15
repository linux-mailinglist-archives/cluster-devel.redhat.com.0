Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E812C8F19F
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Aug 2019 19:10:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB071C036744;
	Thu, 15 Aug 2019 17:10:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 609E812A6A;
	Thu, 15 Aug 2019 17:10:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8A7A18089C8;
	Thu, 15 Aug 2019 17:10:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FHAS6b013923 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 13:10:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A36D63794; Thu, 15 Aug 2019 17:10:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 304393737;
	Thu, 15 Aug 2019 17:10:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FD4983F3C;
	Thu, 15 Aug 2019 17:10:25 +0000 (UTC)
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BB2FF2084D;
	Thu, 15 Aug 2019 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565889024;
	bh=mu8LD5qZnhRCtDTT0NY1oQ6FPPJv/PceMZl2lhZPTpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMC9A5dLSFqTd+vHnTaus8/oNnEY0p1mAMS4VR0BtBD9UhXeTTKBi3gpcIrngm5MQ
	TANMY7g4/HVlxdRUmWL6ul3OFDYlkHWzlRacDNsHX/+Li1yvohxPh45b6PFWOiutZV
	tMv6xZGlWIAilOWI2HXUB3tZKUsqOSOfB3svvNpY=
Date: Thu, 15 Aug 2019 10:10:24 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190815171024.GC15186@magnolia>
References: <20190719162221.GF7093@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719162221.GF7093@magnolia>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 15 Aug 2019 17:10:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 15 Aug 2019 17:10:25 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'djwong@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: small fixes for 5.3-rc5
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 15 Aug 2019 17:10:38 +0000 (UTC)

Hi Linus,

Here's a single update to the MAINTAINERS entry for iomap.
I test-merged it with this morning's master and didn't see any
conflicts.  Please let me know if you encounter any funniness.

--D

The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.3-fixes-1

for you to fetch changes up to 9a67b72552f8d019948453e56ca7db8c7e5a94ba:

  MAINTAINERS: iomap: Remove fs/iomap.c record (2019-08-13 08:15:07 -0700)

----------------------------------------------------------------
Changes since last update:
- Update MAINTAINERS now that we've removed fs/iomap.c.

----------------------------------------------------------------
Denis Efremov (1):
      MAINTAINERS: iomap: Remove fs/iomap.c record

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

