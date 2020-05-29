Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EA1791E8993
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 23:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590786624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VBM5S060zVzdGeOdP0b2lh2Q3ySTS3W1wqDGYywWMaw=;
	b=Fq8QcqLj+05u8ytMjO9kHMpUI+C+nvAkU97IVN9IQQ5stQn+5aYwpj0ULOG4pS/i4dXCFm
	NRh+cVcZXGMYN7hg4da2nNuXF1JCAEBsMjT/IFbchtjaWfPz+B4ze/FqRIRpj2B/RWFB2f
	uZcrXF09PxoN6oUqlvGT+g7rnLAATqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-IUcwLOkhNi6-kFB3g54r0w-1; Fri, 29 May 2020 17:10:22 -0400
X-MC-Unique: IUcwLOkhNi6-kFB3g54r0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1FE980183C;
	Fri, 29 May 2020 21:10:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A42BC10013C2;
	Fri, 29 May 2020 21:10:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B622A6EF5F;
	Fri, 29 May 2020 21:10:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TLAEkX019467 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 17:10:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70C492028CD3; Fri, 29 May 2020 21:10:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CEFC2026972
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 21:10:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DA52833B44
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 21:10:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-338-wdrI82aUNOiBXKm3wTGjYQ-1;
	Fri, 29 May 2020 17:10:06 -0400
X-MC-Unique: wdrI82aUNOiBXKm3wTGjYQ-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHc6FU6RofgpBz0t_DxGMKDbHJrVMcwHVBh63Pa6Tu2Wbiuaww@mail.gmail.com>
References: <CAHc6FU6RofgpBz0t_DxGMKDbHJrVMcwHVBh63Pa6Tu2Wbiuaww@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHc6FU6RofgpBz0t_DxGMKDbHJrVMcwHVBh63Pa6Tu2Wbiuaww@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-v5.7-rc7.fixes
X-PR-Tracked-Commit-Id: 20be493b787cd581c9fffad7fcd6bfbe6af1050c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 835e36b1197a4f066d0254c897f2c8b455cbb581
Message-Id: <159078660565.32003.9740215447484581952.pr-tracker-bot@kernel.org>
Date: Fri, 29 May 2020 21:10:05 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [GIT PULL] GFS2 fix for v5.7-rc7
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

The pull request you sent on Fri, 29 May 2020 17:11:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.7-rc7.fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/835e36b1197a4f066d0254c897f2c8b455cbb581

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

