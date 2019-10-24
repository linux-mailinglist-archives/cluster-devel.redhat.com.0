Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DCEEDE3C98
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Oct 2019 21:55:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571946926;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NtX/gL270g7dnfLQGG0OOwF/ggr78ENEQxmzqWBzPcU=;
	b=GA+1yBK2poqJiL+A5pdSY5CM74PZoKhngmadGSSCBuPY4vSUS6RDiTxpUpXPProaRuF5un
	QNKfgfH8sCQBWWzRPoNZAgXFzn0uqdK+Oug9wt0I8tzX4uXa6cuo029kDOBK7hFC1VV/U2
	Bqm8j04FmmuRuX7UmwSEjEXe/2ZMLKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-wXn-O333N6G8m3E8vlPB8g-1; Thu, 24 Oct 2019 15:55:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6B081005500;
	Thu, 24 Oct 2019 19:55:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 668BB5D712;
	Thu, 24 Oct 2019 19:55:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B4AF1808878;
	Thu, 24 Oct 2019 19:55:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OJtALb016394 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 15:55:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1D9360BF3; Thu, 24 Oct 2019 19:55:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 072E060BEC;
	Thu, 24 Oct 2019 19:55:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FAAB307D8B9;
	Thu, 24 Oct 2019 19:55:06 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191024145120.16939-1-agruenba@redhat.com>
References: <20191024145120.16939-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191024145120.16939-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-v5.4-rc4.fixes
X-PR-Tracked-Commit-Id: 30aecae86e914f526a2ca8d552011960ef6a2615
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65b15b7f4b37a7e14541a0d8eca144067d23eeb0
Message-Id: <157194690576.28436.9604049539253113022.pr-tracker-bot@kernel.org>
Date: Thu, 24 Oct 2019 19:55:05 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 24 Oct 2019 19:55:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 24 Oct 2019 19:55:06 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [GIT PULL] gfs2: Fix a memory leak introduced
	in -rc1
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
X-MC-Unique: wXn-O333N6G8m3E8vlPB8g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

The pull request you sent on Thu, 24 Oct 2019 16:51:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gf=
s2-v5.4-rc4.fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65b15b7f4b37a7e14541a0d8eca144067d23eeb0

Thank you!

--=20
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

