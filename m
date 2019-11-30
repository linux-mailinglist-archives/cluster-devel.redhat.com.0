Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BA5B610DEFC
	for <lists+cluster-devel@lfdr.de>; Sat, 30 Nov 2019 20:46:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575143177;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5E+WClmSZ6fDmuqp/k6qsGUyTb1jGY9WBqIaYFxTiOQ=;
	b=ISsg/RHZew0JBq49D7akRA9pJdL45NlLLz5qEDJqv9yKoXNYs98QD34wXymTMVnw9yv1xf
	XPqKB7pwseVdE4bEdj5oMLc2y+ha0cq3vcIescS0gtPEMHf9geNYxo4lg7NMiA+i4wlCPh
	PjQGkkvDy7KyIBGtxbpiApSDLD8jzr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-nXRnWg2gNXuyKDIxQvUc8Q-1; Sat, 30 Nov 2019 14:46:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5A6F184CAB2;
	Sat, 30 Nov 2019 19:46:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 317CF5D9E1;
	Sat, 30 Nov 2019 19:46:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E7B91809567;
	Sat, 30 Nov 2019 19:46:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAUJk0Gp018505 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 30 Nov 2019 14:46:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8AE942166B29; Sat, 30 Nov 2019 19:46:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 866922166B27
	for <cluster-devel@redhat.com>; Sat, 30 Nov 2019 19:45:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3571180206D
	for <cluster-devel@redhat.com>; Sat, 30 Nov 2019 19:45:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-185-MdoHX9xRMCilgqaMArVVuw-1;
	Sat, 30 Nov 2019 14:45:54 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191125190907.GN6219@magnolia>
References: <20191125190907.GN6219@magnolia>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191125190907.GN6219@magnolia>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
	tags/iomap-5.5-merge-11
X-PR-Tracked-Commit-Id: 419e9c38aa075ed0cd3c13d47e15954b686bcdb6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b266a52d8d6e02ea6c1bb52c96342128e624554
Message-Id: <157514280298.12928.5427720879261656936.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2019 19:40:02 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
X-MC-Unique: MdoHX9xRMCilgqaMArVVuw-1
X-MC-Unique: nXRnWg2gNXuyKDIxQvUc8Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAUJk0Gp018505
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, sandeen@sandeen.net,
	Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, hch@lst.de
Subject: Re: [Cluster-devel] [GIT PULL] iomap: new code for 5.5
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 2
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

The pull request you sent on Mon, 25 Nov 2019 11:09:07 -0800:

> git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.5-merge-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b266a52d8d6e02ea6c1bb52c96342128e624554

Thank you!

--=20
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


