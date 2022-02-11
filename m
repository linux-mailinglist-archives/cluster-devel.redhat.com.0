Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C94B2E4B
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Feb 2022 21:17:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-TBy26I_lOK2ENyW9y4dBaQ-1; Fri, 11 Feb 2022 15:17:01 -0500
X-MC-Unique: TBy26I_lOK2ENyW9y4dBaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0B51124C42;
	Fri, 11 Feb 2022 20:16:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB00B5DF4B;
	Fri, 11 Feb 2022 20:16:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10FD24BB7B;
	Fri, 11 Feb 2022 20:16:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BKBlch018747 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 15:11:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B562240E80E5; Fri, 11 Feb 2022 20:11:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B180D40E80E4
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 20:11:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08B9E28F4872
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 20:11:44 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-546-XXSSeuyyNl-KzwONuZ7-QQ-1; Fri, 11 Feb 2022 15:11:32 -0500
X-MC-Unique: XXSSeuyyNl-KzwONuZ7-QQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2FD3FB82C90;
	Fri, 11 Feb 2022 20:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D59E6C340F2;
	Fri, 11 Feb 2022 20:05:20 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
	(localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP
	id C390EE5CF96; Fri, 11 Feb 2022 20:05:20 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220211170522.348999-1-agruenba@redhat.com>
References: <20220211170522.348999-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220211170522.348999-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
	tags/gfs2-v5.16-rc3-fixes2
X-PR-Tracked-Commit-Id: d3add1a9519dcacd6e644ecac741c56cf18b67f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ce964b520ad0ad626cb1ee93a444aedceed5425
Message-Id: <164460992079.1412.7862203771120970033.pr-tracker-bot@kernel.org>
Date: Fri, 11 Feb 2022 20:05:20 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

The pull request you sent on Fri, 11 Feb 2022 18:05:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.16-rc3-fixes2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ce964b520ad0ad626cb1ee93a444aedceed5425

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

