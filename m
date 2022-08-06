Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F7358B88F
	for <lists+cluster-devel@lfdr.de>; Sun,  7 Aug 2022 00:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659824162;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=inIiIbaFb0BzSrzZiiMZ5QqgiKxDSg6KzHBrn+CGjXI=;
	b=F8StX3mjvpX209h38N5p+8+mzPU93Cj//tFA/UhMtQQ9oW1gzILDOXrcZfZu0D7t14wq1H
	UoQIbjNu5DZI+qsfYVRzsfFcS5uPQFPCWJOOUone6VNWMTlsra83YN8ELgabpVw8Pj+4gw
	CRls5u9dtWjDeux1h9TUVjCbSYg4HDY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-wFxjFFKKOEyeyxlzIE55Ew-1; Sat, 06 Aug 2022 18:16:01 -0400
X-MC-Unique: wFxjFFKKOEyeyxlzIE55Ew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9361D803520;
	Sat,  6 Aug 2022 22:16:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3F0C94571;
	Sat,  6 Aug 2022 22:15:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2287D194F842;
	Sat,  6 Aug 2022 22:15:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F8211946A45 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  6 Aug 2022 22:15:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEDAC401E5C; Sat,  6 Aug 2022 22:15:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAC92492C3B
 for <cluster-devel@redhat.com>; Sat,  6 Aug 2022 22:15:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3D183804530
 for <cluster-devel@redhat.com>; Sat,  6 Aug 2022 22:15:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-kC5JozohPZSNM2Nmz_PaKw-1; Sat, 06 Aug 2022 18:15:55 -0400
X-MC-Unique: kC5JozohPZSNM2Nmz_PaKw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81F3E60C62;
 Sat,  6 Aug 2022 22:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DED4DC433D6;
 Sat,  6 Aug 2022 22:08:34 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D0369C43142; Sat,  6 Aug 2022 22:08:34 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220805201248.123846-1-agruenba@redhat.com>
References: <20220805201248.123846-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220805201248.123846-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
 tags/gfs2-v5.19-rc4-fixes
X-PR-Tracked-Commit-Id: 446279168e030fd0ed68e2bba336bef8bb3da352
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c42b729ef6bfc72fed56f81f589a39298b9d12c8
Message-Id: <165982371484.16627.9098253173243829418.pr-tracker-bot@kernel.org>
Date: Sat, 06 Aug 2022 22:08:34 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Fri,  5 Aug 2022 22:12:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v5.19-rc4-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c42b729ef6bfc72fed56f81f589a39298b9d12c8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

