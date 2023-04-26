Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9B66EF904
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Apr 2023 19:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682528887;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p4JlPEUyQqN+M+T7wXbTa7b36NIs9ZnoI4DnmYBGOEc=;
	b=OD1kil4IrrRgFrGbV5TvonCvH+nWq1tgeZHjzHrVNew2+XyiEZyvsJwbjHM/F4lt6HKoN6
	h09ByMb6AdtvE0laEtOcMlntcb7zFaeA+f9nN7DpeIZvC9wv78ZxNES7mSDoWmEHaq94pw
	aNeRHBd20/Q+vNL2UkXxKqUol8H/g9M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-2Y4KjSxJPOisyvaW1lJhNA-1; Wed, 26 Apr 2023 13:08:06 -0400
X-MC-Unique: 2Y4KjSxJPOisyvaW1lJhNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CCF03822DE5;
	Wed, 26 Apr 2023 17:08:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E71844002;
	Tue, 18 Apr 2023 11:49:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D3CB61946A43;
	Wed, 26 Apr 2023 17:08:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B0F1C19465BD for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Apr 2023 17:06:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9195314171BA; Wed, 26 Apr 2023 17:06:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8930614171B8
 for <cluster-devel@redhat.com>; Wed, 26 Apr 2023 17:06:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F261A0F382
 for <cluster-devel@redhat.com>; Wed, 26 Apr 2023 17:06:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-pD0eigW-MJavKSeC9sndAA-1; Wed, 26 Apr 2023 13:06:34 -0400
X-MC-Unique: pD0eigW-MJavKSeC9sndAA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3D6461EA5;
 Wed, 26 Apr 2023 17:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45AF1C433A0;
 Wed, 26 Apr 2023 17:06:33 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3560FE5FFC8; Wed, 26 Apr 2023 17:06:33 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230425135044.1100895-1-agruenba@redhat.com>
References: <20230425135044.1100895-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230425135044.1100895-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
 tags/gfs2-v6.3-rc3-fixes
X-PR-Tracked-Commit-Id: 644f6bf762fa903f64c59c2ec0f4d0d753527053
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e0fcc9c68d1147ca33159d57332b02ca8bac6ab9
Message-Id: <168252879321.19907.8499411321786175819.pr-tracker-bot@kernel.org>
Date: Wed, 26 Apr 2023 17:06:33 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fixes for 6.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Tue, 25 Apr 2023 15:50:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.3-rc3-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e0fcc9c68d1147ca33159d57332b02ca8bac6ab9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

