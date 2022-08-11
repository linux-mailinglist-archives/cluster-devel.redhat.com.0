Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C7590818
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Aug 2022 23:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660253549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PAf+w6zUN49n5gI3RIoWuYsSpqaEUHF1KVhBbUyMGJ4=;
	b=ick23LueR6+davViF4plSZCRlMyQUdwAjSlo1AcHg/yoyYGqj/qfBBF0GOXqr6Mp0I0ra+
	0xbTwvJ6iC7dR7R8XSylhM4glEOhPjsBXu8VPIZFXLd9TlHrNyWUZAh0+iwKXhQ9h/dEQW
	0wPhmliB1m3VCBsXq1aPJEngij4w2CI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-6OmFfogfNhKzX-d2OR000A-1; Thu, 11 Aug 2022 17:32:26 -0400
X-MC-Unique: 6OmFfogfNhKzX-d2OR000A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90C5B800124;
	Thu, 11 Aug 2022 21:32:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C47E5945D9;
	Thu, 11 Aug 2022 21:32:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5039B1946A43;
	Thu, 11 Aug 2022 21:32:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FABE1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 11 Aug 2022 21:32:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F8EFC15BAE; Thu, 11 Aug 2022 21:32:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB6EC15BA6
 for <cluster-devel@redhat.com>; Thu, 11 Aug 2022 21:32:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2102F3C11E72
 for <cluster-devel@redhat.com>; Thu, 11 Aug 2022 21:32:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-vzTJ6WICM7eqKlNJ0Iii2A-1; Thu, 11 Aug 2022 17:32:16 -0400
X-MC-Unique: vzTJ6WICM7eqKlNJ0Iii2A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2FD18614B3;
 Thu, 11 Aug 2022 21:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92860C433D6;
 Thu, 11 Aug 2022 21:32:14 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 80820C43142; Thu, 11 Aug 2022 21:32:14 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YvUnxjj5ktXpwGj9@magnolia>
References: <YvUnxjj5ktXpwGj9@magnolia>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YvUnxjj5ktXpwGj9@magnolia>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
 tags/iomap-6.0-merge-2
X-PR-Tracked-Commit-Id: 478af190cb6c501efaa8de2b9c9418ece2e4d0bd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8745889a7fd04d14f461f6536c45f70cbaf3ee02
Message-Id: <166025353452.15191.18167009332867162574.pr-tracker-bot@kernel.org>
Date: Thu, 11 Aug 2022 21:32:14 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [GIT PULL] iomap: new code for 5.20/6.0, part 2
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Johannes Thumshirn <jth@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The pull request you sent on Thu, 11 Aug 2022 09:01:10 -0700:

> git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-6.0-merge-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8745889a7fd04d14f461f6536c45f70cbaf3ee02

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

