Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59E6B14F39A
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 22:10:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580505032;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cfCTKYOq0cQHPsVhqt9v+Ut0vlDAvKaBPBsVfgwai5M=;
	b=i40zLmg77/Q700+qOxeGzt8cm/ccxHCLo//Nhvsfs2InViH+0qEPMM0+6vnvB/V7btGdsL
	/cT5JKT05pFpeen+zr4vFRZv+Ppu+Mj2wUJ0QTPLEEGdNWO989OHCih76AI2nDvzB0W0nx
	4svy1ujFFsAvp0/udUpQEJznOcImeuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-pELTfx9kNTq-hAkyFZW2yA-1; Fri, 31 Jan 2020 16:10:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9C9E1851FCA;
	Fri, 31 Jan 2020 21:10:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C1C57FB60;
	Fri, 31 Jan 2020 21:10:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D69A85CE5;
	Fri, 31 Jan 2020 21:10:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VLANjP031075 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 16:10:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ED864202A940; Fri, 31 Jan 2020 21:10:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8D732026D67
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 21:10:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E168803AE2
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 21:10:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-133-LmAsqKroNBeljw1qkRunHw-1;
	Fri, 31 Jan 2020 16:10:16 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200131154823.30363-1-agruenba@redhat.com>
References: <20200131154823.30363-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200131154823.30363-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-for-5.6
X-PR-Tracked-Commit-Id: a31b4ec539e966515f1f97f4000d0e2a399930ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a62aa6f7f50a9a0af5e07d98774f8a7b439d390f
Message-Id: <158050501536.4115.8230409088114911082.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2020 21:10:15 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-MC-Unique: LmAsqKroNBeljw1qkRunHw-1
X-MC-Unique: pELTfx9kNTq-hAkyFZW2yA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00VLANjP031075
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [GIT PULL] GFS2 changes for the 5.6 merge window
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

The pull request you sent on Fri, 31 Jan 2020 16:48:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gf=
s2-for-5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a62aa6f7f50a9a0af5e07d98774f8a7b439d390f

Thank you!

--=20
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


