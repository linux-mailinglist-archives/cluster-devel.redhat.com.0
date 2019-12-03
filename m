Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 63E72111B80
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Dec 2019 23:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575411323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j2k83pNssZy4Jxi8fCgbfaK1t8DdZWLbLPa1/Y3kP+w=;
	b=aPm8f904LSJ/oXyMOSLwEO/yAQB8gSIkj+FS8TNif3tQu6oH0kDXjiQbpaCxACZZLcmVN6
	okjCDaBCeu9CXf3Jk076FgakRjsZhM0OX+CcXdD0/48ZAet6Gioa61tZkEaTVmQjLiLlcc
	N7PupHkhTbRfBU9pcu6FIMThHa4DaXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-4YO-xBmzOF-nrDCKik8hbA-1; Tue, 03 Dec 2019 17:15:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECDDD1803687;
	Tue,  3 Dec 2019 22:15:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5A4600C8;
	Tue,  3 Dec 2019 22:15:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 187205BBFE;
	Tue,  3 Dec 2019 22:15:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3MFDB5020660 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 17:15:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3779D208BDC2; Tue,  3 Dec 2019 22:15:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A722026D69
	for <cluster-devel@redhat.com>; Tue,  3 Dec 2019 22:15:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6CBB906E1C
	for <cluster-devel@redhat.com>; Tue,  3 Dec 2019 22:15:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-270-YGoaPTDANN-e9N3tfhVR_w-1;
	Tue, 03 Dec 2019 17:15:07 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191203160856.GC7323@magnolia>
References: <20191203160856.GC7323@magnolia>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191203160856.GC7323@magnolia>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
	tags/iomap-5.5-merge-13
X-PR-Tracked-Commit-Id: 88cfd30e188fcf6fd8304586c936a6f22fb665e5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a31aca5006749f7d4655836c61d4a53bfae8e53
Message-Id: <157541130508.3528.9113610201591318656.pr-tracker-bot@kernel.org>
Date: Tue, 03 Dec 2019 22:15:05 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
X-MC-Unique: YGoaPTDANN-e9N3tfhVR_w-1
X-MC-Unique: 4YO-xBmzOF-nrDCKik8hbA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB3MFDB5020660
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, sandeen@sandeen.net,
	Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, hch@lst.de
Subject: Re: [Cluster-devel] [GIT PULL] iomap: small cleanups for 5.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 2
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

The pull request you sent on Tue, 3 Dec 2019 08:08:56 -0800:

> git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.5-merge-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a31aca5006749f7d4655836c61d4a53bfae8e53

Thank you!

--=20
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


