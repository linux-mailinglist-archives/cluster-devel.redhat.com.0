Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22D792FD2
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Sep 2023 22:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693945214;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x8LnA2bHbz4amj6l8yXx4VM3GhStLoQOJELkDs2Gh2E=;
	b=DPS1a+6pOyBlgoptIWFlfjyv1h5fdBkvORR0eybjAnZK6E8f9Gl7llSUDIEoX9P/rqwaoR
	YwozmtPTRsZ91szyLxtXYdm7leYnyq+6P5Gu3wkXh+KtJVGyjBHYvKbRMDbcQhQgGfDOdx
	1aaJPhOleMGak7B5rhITqpgNTqFGeos=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-xkGPgAwpPD6aTnTkV5wW_w-1; Tue, 05 Sep 2023 16:20:09 -0400
X-MC-Unique: xkGPgAwpPD6aTnTkV5wW_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 965DF1010429;
	Tue,  5 Sep 2023 20:20:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21B3A2026D4B;
	Tue,  5 Sep 2023 20:20:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC7D61946597;
	Tue,  5 Sep 2023 20:20:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 639C71946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  5 Sep 2023 20:20:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D87BC03292; Tue,  5 Sep 2023 20:20:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46930C15BB8
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 20:20:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29F2C800CA8
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 20:20:06 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-ou6oZMtEMx6AMX2N30rvhg-1; Tue,
 05 Sep 2023 16:20:04 -0400
X-MC-Unique: ou6oZMtEMx6AMX2N30rvhg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B5513CE126D;
 Tue,  5 Sep 2023 20:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 065F0C433BF;
 Tue,  5 Sep 2023 20:14:02 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E7F09C04E24; Tue,  5 Sep 2023 20:14:01 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230905161246.2042842-1-agruenba@redhat.com>
References: <20230905161246.2042842-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230905161246.2042842-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
 tags/gfs2-v6.5-rc5-fixes
X-PR-Tracked-Commit-Id: 2938fd750e8b73a6dac4d9339fb6f7f1cd624a2d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4
Message-Id: <169394484194.28658.6576619504433985005.pr-tracker-bot@kernel.org>
Date: Tue, 05 Sep 2023 20:14:01 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Tue,  5 Sep 2023 18:12:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.5-rc5-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

