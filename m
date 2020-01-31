Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 92EAB14F399
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 22:10:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580505026;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p4guzdVgW4gDeBa9QXegIywzzx8iz4MOfGYKVZw+/a0=;
	b=i9pkPUueCePfgrE1Mr1u22QCCZCfVJlVUXYquxVFtCFL4I0DNrrswuMsiewJqXNsfLr+2N
	pXHUDlp39vevFGLRKT+rahuXejXW+cU0UVPpz2xx8mPOHB8tr7ka/sfiywsBMUZYcf4ftH
	9+e4PjAEJDw4lxhUFewLRqvkkWGL70g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-DBNQoUHANue15FIOyuGh8w-1; Fri, 31 Jan 2020 16:10:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4F10800D48;
	Fri, 31 Jan 2020 21:10:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB5F89E6F;
	Fri, 31 Jan 2020 21:10:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C56D41809565;
	Fri, 31 Jan 2020 21:10:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VLAA7m031061 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 16:10:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3976211516F; Fri, 31 Jan 2020 21:10:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3586E107504
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 21:10:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 561B1803884
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 21:10:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-347-McB_Fz6SPKuL5AKS5itIpQ-1;
	Fri, 31 Jan 2020 16:10:05 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200131040753.GB6869@magnolia>
References: <20200131040753.GB6869@magnolia>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200131040753.GB6869@magnolia>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
	tags/iomap-5.6-merge-3
X-PR-Tracked-Commit-Id: 243145bc4336684c69f95de0a303b31f2e5bf264
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 677b60dcb68a0c43822b5a8ad97733b4193386b9
Message-Id: <158050500400.4115.17533922606838474963.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2020 21:10:04 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
X-MC-Unique: McB_Fz6SPKuL5AKS5itIpQ-1
X-MC-Unique: DBNQoUHANue15FIOyuGh8w-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00VLAA7m031061
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, sandeen@sandeen.net,
	Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, hch@lst.de
Subject: Re: [Cluster-devel] [GIT PULL] iomap: new code for 5.6
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

The pull request you sent on Thu, 30 Jan 2020 20:07:53 -0800:

> git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.6-merge-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/677b60dcb68a0c43822b5a8ad97733b4193386b9

Thank you!

--=20
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


