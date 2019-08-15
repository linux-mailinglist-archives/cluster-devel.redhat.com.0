Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4B8F4FA
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Aug 2019 21:45:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6268C057F88;
	Thu, 15 Aug 2019 19:45:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3ED17B3F;
	Thu, 15 Aug 2019 19:45:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9C8318089C8;
	Thu, 15 Aug 2019 19:45:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FJj568019401 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 15:45:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8816171EA; Thu, 15 Aug 2019 19:45:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24D06171F1;
	Thu, 15 Aug 2019 19:45:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E2178553B;
	Thu, 15 Aug 2019 19:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565898301;
	bh=RkhfQrIe9++zikgZHlw+Y2EP8lb+hIuXuKwjYaod2tE=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=FU15IwHNgUSzGHHvSttuAz59jyQqAyFRFW6DOHoS4bZGt0QZXKJRziVhvm7//RNvI
	ccROhx0nhKZxJHXH7xZVG9U+l6oaWd6eoH4JloHMtucS4s+G2lUpTK2M+JFI+jm5/D
	7Kz1WVQRDF8SksJdkVz8SrwUQ+T0B1IEwkvcHpyY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190815171024.GC15186@magnolia>
References: <20190719162221.GF7093@magnolia> <20190815171024.GC15186@magnolia>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190815171024.GC15186@magnolia>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
	tags/iomap-5.3-fixes-1
X-PR-Tracked-Commit-Id: 9a67b72552f8d019948453e56ca7db8c7e5a94ba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ec1fa692dc7dc915c3485a7fad928924fc13de2
Message-Id: <156589830158.13301.5783532201325925027.pr-tracker-bot@kernel.org>
Date: Thu, 15 Aug 2019 19:45:01 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 15 Aug 2019 19:45:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Thu, 15 Aug 2019 19:45:02 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, sandeen@sandeen.net,
	"Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, hch@lst.de
Subject: Re: [Cluster-devel] [GIT PULL] iomap: small fixes for 5.3-rc5
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 15 Aug 2019 19:45:15 +0000 (UTC)

The pull request you sent on Thu, 15 Aug 2019 10:10:24 -0700:

> git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.3-fixes-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ec1fa692dc7dc915c3485a7fad928924fc13de2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

