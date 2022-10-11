Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 785535FAB6C
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 05:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665460267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U7UO/jGyCNsc/q8+7qzQXsdRQ3FufD51twMt+zUmmUo=;
	b=AqvMVpXMTUGFR78QqVZtjbopDAG53ZBfx/4yy3lJRWfv4Rrh2WNNAfLUCns3ydkVF3nwTb
	BTVKYuWfdaFaSI1BZqld2H+zXfUmQsWDA8QnrmtL/g30jRW4P3cAUozAh4iYpsyHPqPYWa
	6Fj4wL6tUW/q1eyk1IFwR7kxWXZI1go=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-E8tqbMIcNjmY7HtXnl22gA-1; Mon, 10 Oct 2022 23:51:04 -0400
X-MC-Unique: E8tqbMIcNjmY7HtXnl22gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84FE0185A792;
	Tue, 11 Oct 2022 03:51:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 750422156892;
	Tue, 11 Oct 2022 03:51:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 44AAD1946A45;
	Tue, 11 Oct 2022 03:51:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AB8DE19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 03:51:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E98F492B0C; Tue, 11 Oct 2022 03:51:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7711C492B08
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 03:51:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D744833949
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 03:51:01 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-Yh80PF_0PkSVjl5QburGmA-1; Mon, 10 Oct 2022 23:50:58 -0400
X-MC-Unique: Yh80PF_0PkSVjl5QburGmA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63FC8B811E6;
 Tue, 11 Oct 2022 03:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19934C433C1;
 Tue, 11 Oct 2022 03:43:22 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0953AE29F33; Tue, 11 Oct 2022 03:43:22 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221009104539.368110-1-agruenba@redhat.com>
References: <20221009104539.368110-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221009104539.368110-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
 tags/gfs2-v6.0-rc2-fixes
X-PR-Tracked-Commit-Id: 74b1b10e29b1f25e1a081fa82733baea65429d53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c7d7d2d345697eb3781198e58a22504feb74af63
Message-Id: <166545980203.4678.2491823509591876881.pr-tracker-bot@kernel.org>
Date: Tue, 11 Oct 2022 03:43:22 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Sun,  9 Oct 2022 12:45:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.0-rc2-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c7d7d2d345697eb3781198e58a22504feb74af63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

