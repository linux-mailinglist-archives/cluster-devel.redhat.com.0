Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CE76EB3D
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Jul 2019 21:45:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4BFAC0AEE20;
	Fri, 19 Jul 2019 19:45:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97D7A5DA38;
	Fri, 19 Jul 2019 19:45:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7A514E58F;
	Fri, 19 Jul 2019 19:45:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6JJjBXH005634 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 15:45:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23D6762660; Fri, 19 Jul 2019 19:45:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B1A75B6A5;
	Fri, 19 Jul 2019 19:45:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5396B81E07;
	Fri, 19 Jul 2019 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563565506;
	bh=AjkeX1/9njlH2GZEKu5i9tUHylTBdJ3HoQAtY022+5I=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=oNvioO0AyHC5kfH0Rx8UoFpkg3m8AWmabEj7fsNBS4XTtiD7yycdc8EjQU1W4Agp9
	B9+KfmnyoM1RBs5BZmU7oWmicoQrxZpzJ7+0CYrdlk1+vT/sh7/2/VYO/hSoIP+Rrb
	Wn0GzEjCH070ys+CgsoRqO2MmE8jssOHBsCvx8mg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190719162221.GF7093@magnolia>
References: <20190719162221.GF7093@magnolia>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190719162221.GF7093@magnolia>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
	tags/iomap-5.3-merge-4
X-PR-Tracked-Commit-Id: 5d907307adc14cd5148b07629c2b4535acd06062
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 26473f83703e6bc56114ce4b045000de6efcfff7
Message-Id: <156356550679.25668.5508035864440295283.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jul 2019 19:45:06 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 19 Jul 2019 19:45:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 19 Jul 2019 19:45:07 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, sandeen@sandeen.net,
	"Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, hch@lst.de
Subject: Re: [Cluster-devel] [GIT PULL] iomap: cleanups for 5.3 (part 2)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 19 Jul 2019 19:45:20 +0000 (UTC)

The pull request you sent on Fri, 19 Jul 2019 09:22:21 -0700:

> git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.3-merge-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/26473f83703e6bc56114ce4b045000de6efcfff7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

