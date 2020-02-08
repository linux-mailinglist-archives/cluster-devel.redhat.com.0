Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EBE501562A7
	for <lists+cluster-devel@lfdr.de>; Sat,  8 Feb 2020 03:05:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581127540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EJLUZsKIJ6Iw/7lWQwLXE5QYRJB7BkoU4gtE4QPy06c=;
	b=XCo2paa26P8yNcE4yjhiQ9gswDusbm26mMWhOksbuyweKS4zRHkVwz/KufLoWFw4JNQhEx
	MWH6SsqroUHXH/6bSBjfhZDK1qJi6oomS4LhenPHM2KC0U3Ps+oDEop2dXCkjrhTbIm8ux
	wgO99HkJduMis3GjZSVm66yVau2MRKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-0ey86xYaOUGCAm64a0lrNg-1; Fri, 07 Feb 2020 21:05:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72AAE184AEA3;
	Sat,  8 Feb 2020 02:05:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 959998ECEA;
	Sat,  8 Feb 2020 02:05:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C1091809567;
	Sat,  8 Feb 2020 02:05:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01825PTV000876 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 21:05:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 58FB32093CE0; Sat,  8 Feb 2020 02:05:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54626203DE70
	for <cluster-devel@redhat.com>; Sat,  8 Feb 2020 02:05:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8743E802E62
	for <cluster-devel@redhat.com>; Sat,  8 Feb 2020 02:05:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-229-U3DzQMPzPKiPIcFBDF6Qtg-1;
	Fri, 07 Feb 2020 21:05:19 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200207115039.48920-1-agruenba@redhat.com>
References: <20200207115039.48920-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200207115039.48920-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-for-5.6-2
X-PR-Tracked-Commit-Id: 6e5e41e2dc4e4413296d5a4af54ac92d7cd52317
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 175787e011cec507d8e2a1dbf37beef418499bc0
Message-Id: <158112751799.31333.8449716542912433599.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2020 02:05:17 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-MC-Unique: U3DzQMPzPKiPIcFBDF6Qtg-1
X-MC-Unique: 0ey86xYaOUGCAm64a0lrNg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01825PTV000876
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [GIT PULL] GFS2 changes for the 5.6 merge
	window (2)
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

The pull request you sent on Fri,  7 Feb 2020 12:50:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gf=
s2-for-5.6-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/175787e011cec507d8e2a1dbf37beef418499bc0

Thank you!

--=20
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


