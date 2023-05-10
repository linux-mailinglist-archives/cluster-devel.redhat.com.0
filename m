Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8876FE170
	for <lists+cluster-devel@lfdr.de>; Wed, 10 May 2023 17:19:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683731974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+odEb/CddiPanIjP3NENKAtVaPdlZaMZHb/Bt6y5uac=;
	b=GdLs8UqEPz/NywfhQRb1NwKVK6h4pQIvGb+jvAF9wv1xnDxXaSDCMxbebLIGpJx56IMDQz
	T5Oi7pGGQW6nVBVY83IXmDeKplIzOS+0lZg85AeG/Bl7Xd3d+f4xm7PkjcZpC8IBnVyzIh
	ddYptBg27DNg/u+exRwUG3ZOtaAvJs4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81--dsn6dF6NxKzupqxIB1iGA-1; Wed, 10 May 2023 11:19:30 -0400
X-MC-Unique: -dsn6dF6NxKzupqxIB1iGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D16C31C06ED3;
	Wed, 10 May 2023 15:19:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C23BFC15BA0;
	Wed, 10 May 2023 15:19:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 966B119451C0;
	Wed, 10 May 2023 15:19:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F2E3E1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 10 May 2023 15:19:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 15D2540C2079; Wed, 10 May 2023 15:19:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.226.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3836240C2077;
 Wed, 10 May 2023 15:19:19 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 May 2023 17:19:18 +0200
Message-Id: <20230510151918.280115-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [GIT PULL] gfs2: Don't deref jdesc in evict
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hello Linus,

could you please pull the following gfs2 fix for 6.4?

Thanks,
Andreas

The following changes since commit e0fcc9c68d1147ca33159d57332b02ca8bac6ab9:

  Merge tag 'gfs2-v6.3-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2023-04-26 09:28:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.3-fix

for you to fetch changes up to 504a10d9e46bc37b23d0a1ae2f28973c8516e636:

  gfs2: Don't deref jdesc in evict (2023-05-10 17:15:18 +0200)

----------------------------------------------------------------
gfs2 fix

- Fix a NULL pointer dereference when mounting corrupted filesystems.

----------------------------------------------------------------
Bob Peterson (1):
      gfs2: Don't deref jdesc in evict

 fs/gfs2/super.c | 8 ++++++++
 1 file changed, 8 insertions(+)

