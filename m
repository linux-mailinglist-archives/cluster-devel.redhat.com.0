Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 339181148B2
	for <lists+cluster-devel@lfdr.de>; Thu,  5 Dec 2019 22:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575581445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8YYcXl9kZ93+J2iM9k4SjdYRzLM2dKb4FstPop0eCdo=;
	b=hm705PkRmaGjzzxvBm3/1B+7LQNZjoNVkIk/lg2Kz5cvfUg6Mgwej0z5NPu1GX+OZ2jxOX
	sNh5VHoMUzocetl2hxMiasbIWhfIZgeYSgU6dPLarRpKjLcbPvXYCK4zl6ZAcVgzJbVMIL
	8g92gdl2uouoemHbIb2Q5jgh9Plep+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-7yvNfzLkO7KDZcn4LUGHeA-1; Thu, 05 Dec 2019 16:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 259DBDBA9;
	Thu,  5 Dec 2019 21:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA89019488;
	Thu,  5 Dec 2019 21:30:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 970F318089CD;
	Thu,  5 Dec 2019 21:30:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5LUXIw018870 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 16:30:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A465820316EB; Thu,  5 Dec 2019 21:30:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F99520316E8
	for <cluster-devel@redhat.com>; Thu,  5 Dec 2019 21:30:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78B03801E7A
	for <cluster-devel@redhat.com>; Thu,  5 Dec 2019 21:30:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-382-Mol111MTNyGbLokUxnFxvQ-1;
	Thu, 05 Dec 2019 16:30:29 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191205190915.5468-1-agruenba@redhat.com>
References: <20191205190915.5468-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191205190915.5468-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-for-5.5
X-PR-Tracked-Commit-Id: ade48088937f53fe0467162177726176813b9564
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f1266ec704d3efcfc8179c71bed9a75963b6344
Message-Id: <157558142773.8243.15014524712940034870.pr-tracker-bot@kernel.org>
Date: Thu, 05 Dec 2019 21:30:27 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-MC-Unique: Mol111MTNyGbLokUxnFxvQ-1
X-MC-Unique: 7yvNfzLkO7KDZcn4LUGHeA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB5LUXIw018870
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [GIT PULL] GFS2 changes for the 5.5 merge window
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 2
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

The pull request you sent on Thu,  5 Dec 2019 20:09:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gf=
s2-for-5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f1266ec704d3efcfc8179c71bed9a75963b6344

Thank you!

--=20
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


