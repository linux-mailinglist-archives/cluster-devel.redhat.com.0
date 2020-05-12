Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EFD301CFDDD
	for <lists+cluster-devel@lfdr.de>; Tue, 12 May 2020 20:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589309727;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gHUTHq+wjLdshFsCTXn8N5UpEfXzAf01go5gVNRtUlE=;
	b=Ca0RBhKlbmBoCaLkSxic3pQiqx9gts3Leg0YN1MIVashFOOZdDX2lqGHeTSr16jD3NsUJV
	22jexH1hztigEk5lmD+yDtn+8vLjelRLSGthbbnyMmcTn2ZvSwoPcuJa9P3Y/539pmSPwg
	uCWB0oMRlfxXvXnWhg/GGj/xsgDhGxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-gH516kjlPY2VEv9HQKjFbQ-1; Tue, 12 May 2020 14:55:25 -0400
X-MC-Unique: gH516kjlPY2VEv9HQKjFbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D77BA835B40;
	Tue, 12 May 2020 18:55:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C61181CC;
	Tue, 12 May 2020 18:55:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17E4F1809547;
	Tue, 12 May 2020 18:55:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04CItFmG011154 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 14:55:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 275DB2017DCB; Tue, 12 May 2020 18:55:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20FDE200A798
	for <cluster-devel@redhat.com>; Tue, 12 May 2020 18:55:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 674278007C8
	for <cluster-devel@redhat.com>; Tue, 12 May 2020 18:55:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-240-mmS8JImjOeaQRzolFo3pvA-1;
	Tue, 12 May 2020 14:55:05 -0400
X-MC-Unique: mmS8JImjOeaQRzolFo3pvA-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200512145434.160164-1-agruenba@redhat.com>
References: <20200512145434.160164-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200512145434.160164-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-v5.7-rc1.fixes
X-PR-Tracked-Commit-Id: b14c94908b1b884276a6608dea3d0b1b510338b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e719340f46bd9413590121b140714728862ffe05
Message-Id: <158930970419.9866.14834853183650860586.pr-tracker-bot@kernel.org>
Date: Tue, 12 May 2020 18:55:04 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [GIT PULL] GFS2 fixes for 5.7
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
Content-Type: text/plain; charset=US-ASCII

The pull request you sent on Tue, 12 May 2020 16:54:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.7-rc1.fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e719340f46bd9413590121b140714728862ffe05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

