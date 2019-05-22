Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D399267A1
	for <lists+cluster-devel@lfdr.de>; Wed, 22 May 2019 18:01:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB081C0528B3;
	Wed, 22 May 2019 16:01:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D7C460928;
	Wed, 22 May 2019 16:00:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CA6F149E5;
	Wed, 22 May 2019 16:00:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MG0alo030127 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 12:00:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5425A62660; Wed, 22 May 2019 16:00:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C05B5D6A9;
	Wed, 22 May 2019 16:00:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A954086677;
	Wed, 22 May 2019 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558540819;
	bh=ybeBGEdz8z93uxrPAOGD3+lHShFIueux/w/4xzFA4rk=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=UKX77t/fpfEZOjyQa7kY0YrLMA3NgcMAkKteVEe2pRfmd+2XCgBdP/MjYoLg6XZ3w
	pYrQ5A1lS5sUwyJxISBDB9LIou5v2XmKB4xO+2RzZazgi78jh36jrVHWs18h9qMebq
	bojw9O4Mt5Jzw2SMdYdlO+aWddqhpFz8EHB+BHso=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHc6FU71Yp9Y8ZDrJnJ3AAQazW8-WpTCLCHWYu-+JQ2tTu4Ymg@mail.gmail.com>
References: <CAHc6FU71Yp9Y8ZDrJnJ3AAQazW8-WpTCLCHWYu-+JQ2tTu4Ymg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHc6FU71Yp9Y8ZDrJnJ3AAQazW8-WpTCLCHWYu-+JQ2tTu4Ymg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-5.1.fixes2
X-PR-Tracked-Commit-Id: 5a5ec83d6ac974b12085cd99b196795f14079037
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 651bae980e3f3e6acf0d297ced08f9d7af71a8c9
Message-Id: <155854081908.3461.15873360975965791406.pr-tracker-bot@kernel.org>
Date: Wed, 22 May 2019 16:00:19 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 22 May 2019 16:00:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Wed, 22 May 2019 16:00:24 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.1  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [GIT PULL] gfs2: Fix sign extension bug in
	gfs2_update_stats
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 22 May 2019 16:01:34 +0000 (UTC)

The pull request you sent on Wed, 22 May 2019 14:19:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-5.1.fixes2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/651bae980e3f3e6acf0d297ced08f9d7af71a8c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

