Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B121C6EF8FC
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Apr 2023 19:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682528819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YDB8CTLH7ALAHtQwta/pXSyIvuPZ+h0y3/8npAK7BVE=;
	b=PB1oQTVW2c6zMo82ZWLmpmRuBxrnFrmC4R/imJapyr8oK5OP05WARtcdwdxLor458eeb8/
	P9r948UtQ17altiu2oHdJdIm9RXE57fzf1DI3q18mV8HhJwYUVJRNCESeUFZ6RUlHNZjl4
	4ub4zXCXaV/gOulOUEtW+Dy8ziazgHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-K2ZqK8k8M6KrYhYr7BaSXw-1; Wed, 26 Apr 2023 13:06:54 -0400
X-MC-Unique: K2ZqK8k8M6KrYhYr7BaSXw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51DB5185A79C;
	Wed, 26 Apr 2023 17:06:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0987B492B03;
	Wed, 26 Apr 2023 17:06:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B4C421946A43;
	Wed, 26 Apr 2023 17:06:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 258C719465BD for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Apr 2023 17:06:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1359414171BB; Wed, 26 Apr 2023 17:06:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AB5714171B8
 for <cluster-devel@redhat.com>; Wed, 26 Apr 2023 17:06:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E015385530E
 for <cluster-devel@redhat.com>; Wed, 26 Apr 2023 17:06:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-Vgou7cWyPyif80C3xh0ghQ-1; Wed, 26 Apr 2023 13:06:35 -0400
X-MC-Unique: Vgou7cWyPyif80C3xh0ghQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31DEE6367A;
 Wed, 26 Apr 2023 17:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97289C4339B;
 Wed, 26 Apr 2023 17:06:33 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8538BE5FFC9; Wed, 26 Apr 2023 17:06:33 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230425153951.GB28392@redhat.com>
References: <20230425153951.GB28392@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230425153951.GB28392@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.4
X-PR-Tracked-Commit-Id: 7a40f1f18a88c6d43c8725d7f45146480a79fde1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fbfaf03ebac999b4f44f36d851bd729c24c5a658
Message-Id: <168252879353.19907.18311126134872951543.pr-tracker-bot@kernel.org>
Date: Wed, 26 Apr 2023 17:06:33 +0000
To: David Teigland <teigland@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [GIT PULL] dlm updates for 6.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Tue, 25 Apr 2023 10:39:51 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fbfaf03ebac999b4f44f36d851bd729c24c5a658

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

