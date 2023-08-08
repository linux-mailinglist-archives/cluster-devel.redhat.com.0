Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A8774039
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Aug 2023 19:00:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691514043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nMW3Orbb/HQWc5qo2yRVzx4+aieaZHuHQ1JFrazHr/0=;
	b=GF47OKrALHyegToxxcpQVp1IIVD18i73sRor+w6jUQf034xWJwwBv0bZG9SVvakevA0TjG
	FAKLfHlfoUv3IGV0ppN20dJSoH3qQ83HYWXyPlXsqS+0boj2r5QkoOUSnBbUaFR8L0oUNu
	o1JGoqf7VIDnqns3cNzgAMBdyl4b5tk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-bp5x4OY_PmizfZi5napw4g-1; Tue, 08 Aug 2023 13:00:40 -0400
X-MC-Unique: bp5x4OY_PmizfZi5napw4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81F821C06EDC;
	Tue,  8 Aug 2023 17:00:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A9C8492C13;
	Tue,  8 Aug 2023 17:00:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CFB701946589;
	Tue,  8 Aug 2023 17:00:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 39B661946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 17:00:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DDFF1492C13; Tue,  8 Aug 2023 17:00:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D685A4A9004
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 17:00:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB8771021F73
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 17:00:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-3B8_BuEpMY60Xz2bBvWHUg-1; Tue, 08 Aug 2023 13:00:28 -0400
X-MC-Unique: 3B8_BuEpMY60Xz2bBvWHUg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3760962807;
 Tue,  8 Aug 2023 17:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A00D2C433C8;
 Tue,  8 Aug 2023 17:00:26 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8E693C395C5; Tue,  8 Aug 2023 17:00:26 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230808125315.1727575-1-agruenba@redhat.com>
References: <20230808125315.1727575-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
X-PR-Tracked-Message-Id: <20230808125315.1727575-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
 tags/gfs2-v6.4-fixes
X-PR-Tracked-Commit-Id: 0be8432166a61abc537e1247e530f4b85970b56b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 02aee814d37c563e24b73bcd0f9cb608fbd403d4
Message-Id: <169151402657.3633.463157749123463374.pr-tracker-bot@kernel.org>
Date: Tue, 08 Aug 2023 17:00:26 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fixes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Tue,  8 Aug 2023 14:53:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.4-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/02aee814d37c563e24b73bcd0f9cb608fbd403d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

