Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D45FE510890
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Apr 2022 21:07:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-oqUNqg7YM52Gb-ES4c6byw-1; Tue, 26 Apr 2022 15:07:06 -0400
X-MC-Unique: oqUNqg7YM52Gb-ES4c6byw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 783B93838C85;
	Tue, 26 Apr 2022 19:07:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EC221468F22;
	Tue, 26 Apr 2022 19:07:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D9DB91947BBE;
	Tue, 26 Apr 2022 19:07:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9B4D19451EC for <cluster-devel@listman.corp.redhat.com>;
 Tue, 26 Apr 2022 19:07:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C54511468F22; Tue, 26 Apr 2022 19:07:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C17031468F21
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 19:07:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0CE71857F07
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 19:07:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-PjDWT6ZtPL-bZcBiqfCA0w-1; Tue, 26 Apr 2022 15:07:01 -0400
X-MC-Unique: PjDWT6ZtPL-bZcBiqfCA0w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF64661A43;
 Tue, 26 Apr 2022 19:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31259C385AD;
 Tue, 26 Apr 2022 19:07:00 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1C661F67CA0; Tue, 26 Apr 2022 19:07:00 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220426145445.2282274-1-agruenba@redhat.com>
References: <20220426145445.2282274-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220426145445.2282274-1-agruenba@redhat.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
 tags/gfs2-v5.18-rc4-fix
X-PR-Tracked-Commit-Id: e57f9af73d6b0ffb5f1aeaf6cec9a751dd8535c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4fad37d595b9d9a2996467d780cb2e7a1b08b2c0
Message-Id: <165100002011.21339.8081509732129826179.pr-tracker-bot@kernel.org>
Date: Tue, 26 Apr 2022 19:07:00 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Tue, 26 Apr 2022 16:54:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.18-rc4-fix

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4fad37d595b9d9a2996467d780cb2e7a1b08b2c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

