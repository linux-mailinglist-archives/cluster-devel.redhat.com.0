Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1065140
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Jul 2019 06:40:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DBE4C0587F5;
	Thu, 11 Jul 2019 04:40:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 195E61001281;
	Thu, 11 Jul 2019 04:40:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8203C54D3C;
	Thu, 11 Jul 2019 04:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6B4e8i4018528 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Jul 2019 00:40:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A5A91001B35; Thu, 11 Jul 2019 04:40:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF08E1001B38;
	Thu, 11 Jul 2019 04:40:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 619A430BD1A6;
	Thu, 11 Jul 2019 04:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562820005;
	bh=ibpxCOtkNsRkNO/RbXgJ+4KafRgVn3nq0vXIFuNIHV4=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=PkhAN/CtwkUtIa+31JhxBERbCphvEL2vqYdDF029HrbFiOPJEFA0v5l/Pk3NOx8db
	gYKeqYaCkl4Y+KGzx0zIFJjXkwxISznxzQEtJbAEqbOZF9zyNM5GSSpozbsWphUv4g
	dQ5DLYnJZcw797l1GKE1lsGCpAXsN80exK/GI9qU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190709153454.GQ1404256@magnolia>
References: <20190709153454.GQ1404256@magnolia>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190709153454.GQ1404256@magnolia>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
	tags/iomap-5.3-merge-1
X-PR-Tracked-Commit-Id: 36a7347de097edf9c4d7203d09fa223c86479674
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a47f5c56b2eb55290e2a8668e9ca9c029990dbf6
Message-Id: <156282000493.18259.18191947984895266150.pr-tracker-bot@kernel.org>
Date: Thu, 11 Jul 2019 04:40:04 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 11 Jul 2019 04:40:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Thu, 11 Jul 2019 04:40:05 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, sandeen@sandeen.net,
	"Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, hch@lst.de
Subject: Re: [Cluster-devel] [GIT PULL] iomap: new code for 5.3, part 1
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 11 Jul 2019 04:40:34 +0000 (UTC)

The pull request you sent on Tue, 9 Jul 2019 08:34:54 -0700:

> git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.3-merge-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a47f5c56b2eb55290e2a8668e9ca9c029990dbf6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

