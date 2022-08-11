Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B25901ED
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Aug 2022 18:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660233685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ugRsXHMC0bDF0dKd59D5itO8jNALFXDuleKz08iVqsk=;
	b=C4oWBSiwtsRcVjPIf8OoerJ1WPCSI+jt4nEhWQ/dIATF+y/aYn4dA5eZ6gyZuzh8qQlImc
	km6XYcPk0ar5s3BdtUonF9tkW9Cx9kjVye++CH1nW/FmcskuDJibHmh2jXxsnRdxAfH3Sa
	GG4XYTmg8196Amv5WRucy8kyyA6rF0E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-vHxbAPGOOCuwVhIAJYg4lw-1; Thu, 11 Aug 2022 12:01:22 -0400
X-MC-Unique: vHxbAPGOOCuwVhIAJYg4lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AC911824600;
	Thu, 11 Aug 2022 16:01:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0ADAC2026D64;
	Thu, 11 Aug 2022 16:01:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FBAE1946A46;
	Thu, 11 Aug 2022 16:01:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7289E1946A41 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 11 Aug 2022 16:01:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 64A5940CF8E7; Thu, 11 Aug 2022 16:01:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60F7B400DFD7
 for <cluster-devel@redhat.com>; Thu, 11 Aug 2022 16:01:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48117805B72
 for <cluster-devel@redhat.com>; Thu, 11 Aug 2022 16:01:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-iKdLRrXJOJC84X4BfpD8gQ-1; Thu, 11 Aug 2022 12:01:12 -0400
X-MC-Unique: iKdLRrXJOJC84X4BfpD8gQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9665C6119D;
 Thu, 11 Aug 2022 16:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6006C433C1;
 Thu, 11 Aug 2022 16:01:10 +0000 (UTC)
Date: Thu, 11 Aug 2022 09:01:10 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YvUnxjj5ktXpwGj9@magnolia>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [GIT PULL] iomap: new code for 5.20/6.0, part 2
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this second branch containing new code for iomap for
5.20^W6.0.  In the past 10 days or so I've not heard any ZOMG STOP style
complaints about removing ->writepage support from gfs2 or zonefs, so
here's the pull request removing them (and the underlying fs iomap
support) from the kernel.

As usual, I did a test-merge with upstream master as of a few minutes
ago, and didn't see any conflicts.  Please let me know if you encounter
any problems.

--D

The following changes since commit f8189d5d5fbf082786fb91c549f5127f23daec09:

  dax: set did_zero to true when zeroing successfully (2022-06-30 10:05:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-6.0-merge-2

for you to fetch changes up to 478af190cb6c501efaa8de2b9c9418ece2e4d0bd:

  iomap: remove iomap_writepage (2022-07-22 10:59:17 -0700)

----------------------------------------------------------------
New code for 6.0:
 - Remove iomap_writepage and all callers, since the mm apparently never
   called the zonefs or gfs2 writepage functions.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>

----------------------------------------------------------------
Christoph Hellwig (4):
      gfs2: stop using generic_writepages in gfs2_ail1_start_one
      gfs2: remove ->writepage
      zonefs: remove ->writepage
      iomap: remove iomap_writepage

 fs/gfs2/aops.c         | 26 --------------------------
 fs/gfs2/log.c          |  5 ++---
 fs/iomap/buffered-io.c | 15 ---------------
 fs/zonefs/super.c      |  8 --------
 include/linux/iomap.h  |  3 ---
 5 files changed, 2 insertions(+), 55 deletions(-)

