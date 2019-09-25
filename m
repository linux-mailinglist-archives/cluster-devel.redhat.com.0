Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 15458BE377
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Sep 2019 19:40:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 523DB307D97F;
	Wed, 25 Sep 2019 17:40:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD735D6A7;
	Wed, 25 Sep 2019 17:40:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 939B718037CA;
	Wed, 25 Sep 2019 17:40:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8PHe78R029597 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Sep 2019 13:40:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED5615D9E2; Wed, 25 Sep 2019 17:40:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 994385D9CC;
	Wed, 25 Sep 2019 17:40:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D32254ACA5;
	Wed, 25 Sep 2019 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569433204;
	bh=/w//plmTVfb+jD8Ts2mXorTsUriRLt0L6daqDu4/6EY=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=drJdohMAPFDyY+lsGSHUixoJM/qIqY7aHvtrLYjmiB4FOpDEkTa5lWrdcTKfG+/5X
	erRK42cKLp4gL4x4cDPFcBN23BeqsnQo4loJK4tkGbf6IeiVYN92iRnLtL3BkguxLX
	IuNGn79SP7yl2Kyh4/+Cpijm833oDVz5lq8lXeh4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190924170248.GZ2229799@magnolia>
References: <20190924170248.GZ2229799@magnolia>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190924170248.GZ2229799@magnolia>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
	tags/iomap-5.4-merge-6
X-PR-Tracked-Commit-Id: 838c4f3d7515efe9d0e32c846fb5d102b6d8a29d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ef5b13a294c136c9673a8e04e6afea333c7f755
Message-Id: <156943320431.26797.4088494249840572183.pr-tracker-bot@kernel.org>
Date: Wed, 25 Sep 2019 17:40:04 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 25 Sep 2019 17:40:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Wed, 25 Sep 2019 17:40:05 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, sandeen@sandeen.net,
	"Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, hch@lst.de
Subject: Re: [Cluster-devel] [GIT PULL] iomap: (far less) new code for 5.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 25 Sep 2019 17:40:18 +0000 (UTC)

The pull request you sent on Tue, 24 Sep 2019 10:02:48 -0700:

> git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.4-merge-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ef5b13a294c136c9673a8e04e6afea333c7f755

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

