Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6FD1F2090
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 22:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591647350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yLt9+o08GHsHCVvCahlujo447V9k4b4FiUApGsudE0A=;
	b=KeQMgAEMK0yRiq6iR+B1ZGTXnCkeahflisgv3o3vDiO7D+BmgqA7i322JlgXepkyJ73Jtt
	v/JMLVYTjiR0esd2XYzkruqln+98xU933wo7/Zt0gH6SNzpv2L62WwsG3aeUKo8L5EKKL1
	/ioZ+G2M3qd/ihDAFm9SCohqKBHWoWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-AgBoHeIGOueCG88dtZTBtA-1; Mon, 08 Jun 2020 16:15:41 -0400
X-MC-Unique: AgBoHeIGOueCG88dtZTBtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D940E106B20E;
	Mon,  8 Jun 2020 20:15:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00AFE7BA1E;
	Mon,  8 Jun 2020 20:15:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 679CB1809547;
	Mon,  8 Jun 2020 20:15:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058KFUAd011135 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 16:15:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E03C4A9F40; Mon,  8 Jun 2020 20:15:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3F9AB0785
	for <cluster-devel@redhat.com>; Mon,  8 Jun 2020 20:15:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14E40186E3A5
	for <cluster-devel@redhat.com>; Mon,  8 Jun 2020 20:15:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-165-73R7fgxnOJa__ZVl91swDg-1;
	Mon, 08 Jun 2020 16:15:15 -0400
X-MC-Unique: 73R7fgxnOJa__ZVl91swDg-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200608163250.550547-1-agruenba@redhat.com>
References: <20200608163250.550547-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200608163250.550547-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-for-5.8
X-PR-Tracked-Commit-Id: 300e549b6e53025ea69550f009451f7a13bfc3eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca687877e05ad1bf5b4cefd9cdd091044626deac
Message-Id: <159164672284.26583.13414931699565927085.pr-tracker-bot@kernel.org>
Date: Mon, 08 Jun 2020 20:05:22 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [GIT PULL] GFS2 changes for 5.8
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

The pull request you sent on Mon,  8 Jun 2020 18:32:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca687877e05ad1bf5b4cefd9cdd091044626deac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

