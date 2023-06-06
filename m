Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6E72444E
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 15:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686057843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IqE/Vi7koRZCh7jHPm9SZ3ef9Tmmt6jYD7T87I6HokQ=;
	b=hJIY320DHRG9tHKnK9HVtVBZ5HRdMPCitjIxVAvjw1iiaXewVdetfWVXx0kqCPLEYpX1p/
	rdpwaPklDRCO1oqG+DQ5ifmE0n/jmiyKqzL/KjhBk2jsQ+Ojqi/uPZQzH8bXrsruz7RPJJ
	fxEydneHQIrnmCJ74WqzqwPX2D6ftFc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-6rmlBm7bOQ2UbZDykWOC9g-1; Tue, 06 Jun 2023 09:24:02 -0400
X-MC-Unique: 6rmlBm7bOQ2UbZDykWOC9g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6C458039A7;
	Tue,  6 Jun 2023 13:23:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52080492B00;
	Tue,  6 Jun 2023 13:23:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1176F1946A42;
	Tue,  6 Jun 2023 13:23:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 90B4B19452C4 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 13:22:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 96F9F4021AC; Tue,  6 Jun 2023 13:22:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2444021AA
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 13:22:49 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 697F61C06ECA
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 13:22:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-JtLPLZyJNoqqya_ad5Eyvw-1; Tue, 06 Jun 2023 09:22:45 -0400
X-MC-Unique: JtLPLZyJNoqqya_ad5Eyvw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19A206331C;
 Tue,  6 Jun 2023 13:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80308C4339C;
 Tue,  6 Jun 2023 13:22:44 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 647A1E8722F; Tue,  6 Jun 2023 13:22:44 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230606124800.1151665-1-agruenba@redhat.com>
References: <20230606124800.1151665-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230606124800.1151665-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
 tags/gfs2-v6.4-rc4-fix
X-PR-Tracked-Commit-Id: fa58cc888d67e640e354d8b3ceef877ea167b0cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0bdd0f0bf17c5aac16f348ee4b1ebf23d1ec1649
Message-Id: <168605776440.13551.2741621756274355701.pr-tracker-bot@kernel.org>
Date: Tue, 06 Jun 2023 13:22:44 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Tue,  6 Jun 2023 14:48:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.4-rc4-fix

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0bdd0f0bf17c5aac16f348ee4b1ebf23d1ec1649

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

