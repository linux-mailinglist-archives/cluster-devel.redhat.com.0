Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 938EE36EF36
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Apr 2021 19:53:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-H0o3Px1mPkKJgVXJXIWR6Q-1; Thu, 29 Apr 2021 13:53:05 -0400
X-MC-Unique: H0o3Px1mPkKJgVXJXIWR6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 249E4809CD6;
	Thu, 29 Apr 2021 17:52:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0768019C45;
	Thu, 29 Apr 2021 17:52:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91DBD44A6C;
	Thu, 29 Apr 2021 17:52:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13THqpQg026333 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Apr 2021 13:52:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69ED4100763C; Thu, 29 Apr 2021 17:52:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast03.extmail.prod.ext.phx2.redhat.com [10.5.110.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 643EB101F965
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 17:52:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBE1F18C35CB
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 17:52:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-269-Hc6ldFI-M1WAsMqi7sDYJA-1;
	Thu, 29 Apr 2021 13:52:15 -0400
X-MC-Unique: Hc6ldFI-M1WAsMqi7sDYJA-1
Received: by mail.kernel.org (Postfix) with ESMTPS id 2E1AB61405;
	Thu, 29 Apr 2021 17:52:13 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
	[127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id
	28D2F60A36; Thu, 29 Apr 2021 17:52:13 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210429103445.846975-1-agruenba@redhat.com>
References: <20210429103445.846975-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210429103445.846975-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-for-5.13
X-PR-Tracked-Commit-Id: e5966cf20f0c7e40fd8c208ba1614e1a35a8deee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f2c80837e27e67e91ad93f41f0849be28b808b14
Message-Id: <161971873316.11214.7996386584154973395.pr-tracker-bot@kernel.org>
Date: Thu, 29 Apr 2021 17:52:13 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [GIT PULL] GFS2 changes for 5.13
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

The pull request you sent on Thu, 29 Apr 2021 12:34:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f2c80837e27e67e91ad93f41f0849be28b808b14

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

