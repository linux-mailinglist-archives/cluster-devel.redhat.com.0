Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DB46E13
	for <lists+cluster-devel@lfdr.de>; Sat, 15 Jun 2019 06:05:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB2F7307D863;
	Sat, 15 Jun 2019 04:05:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DED0608C1;
	Sat, 15 Jun 2019 04:05:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCD62C589;
	Sat, 15 Jun 2019 04:05:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5F459dX017075 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 15 Jun 2019 00:05:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6199F19C67; Sat, 15 Jun 2019 04:05:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BBBE19700;
	Sat, 15 Jun 2019 04:05:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7574307D914;
	Sat, 15 Jun 2019 04:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560571505;
	bh=1ukOZZGAEs0BqwHmgc/wwwlmaTI8YBYbMmWhkj1EHSQ=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=kaG6bUzU6Ikg5WKyTmICva3c3J8cxo7ECCimX3xdix3NaGJIlDuf9tKgGACTVx9tz
	50qazRBijAZ7Ukm3FTSNaFmJB2/8+cycx6Ur/bwS2pTuu2xPgrgo2zsDR8vIxB7AWf
	zivz2ge81+3J73+Zpo52jrZQ4TwHbhwfA0ekAS9g=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHc6FU7aKs3bUwjnPeLn4Nw82ojGcQxkJbDsgtVdXYVRjVW0bQ@mail.gmail.com>
References: <CAHc6FU7aKs3bUwjnPeLn4Nw82ojGcQxkJbDsgtVdXYVRjVW0bQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHc6FU7aKs3bUwjnPeLn4Nw82ojGcQxkJbDsgtVdXYVRjVW0bQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-v5.2.fixes2
X-PR-Tracked-Commit-Id: 2741b6723bf6f7d92d07c44bd6a09c6e37f3f949
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4066524401724babc5710b0a6be88021a081874a
Message-Id: <156057150507.28747.7815529893071983386.pr-tracker-bot@kernel.org>
Date: Sat, 15 Jun 2019 04:05:05 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sat, 15 Jun 2019 04:05:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Sat, 15 Jun 2019 04:05:05 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [GIT PULL] gfs2: Fix rounding error in
	gfs2_iomap_page_prepare
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sat, 15 Jun 2019 04:05:27 +0000 (UTC)

The pull request you sent on Fri, 14 Jun 2019 18:55:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.2.fixes2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4066524401724babc5710b0a6be88021a081874a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

