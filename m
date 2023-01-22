Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3027D676BBF
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Jan 2023 10:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674378084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a7i0etABdzzwG0ukyprDvsLxykkelef63qcM2z1SEbk=;
	b=Xh4qpUmzqcLx5KH5DC2NC+FkoyJO5m7yYjkXFJAzTK2mOs1OLdgYT8TRUwtySz16ATSzqH
	+pc2n9bgWH+aCStbj8ZSEw6NSM3VEktELOnoQ3UwlPuAl0JXxnqrJKMe8df1csspSygi2t
	AYUwE3KTZzL22DWbb8CBlTTMstAFPMQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-RbMnjfHPNpeSE8XCgh2UcQ-1; Sun, 22 Jan 2023 04:01:20 -0500
X-MC-Unique: RbMnjfHPNpeSE8XCgh2UcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37B3C811E9C;
	Sun, 22 Jan 2023 09:01:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E75372026D68;
	Sun, 22 Jan 2023 09:01:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD7041946589;
	Sun, 22 Jan 2023 09:01:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D39D31946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 09:01:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B6BE814171C1; Sun, 22 Jan 2023 09:01:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-72.brq.redhat.com [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C064614171C0;
 Sun, 22 Jan 2023 09:01:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jan 2023 10:01:15 +0100
Message-Id: <20230122090115.1563753-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [GIT PULL] gfs2 writepage fix
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Linus Torvalds <torvalds@linux-foundation.org>

Hi Linus,

please consider pulling the following gfs2 fix.

Thank you very much,
Andreas

The following changes since commit 5dc4c995db9eb45f6373a956eb1f69460e69e6d4:

  Linux 6.2-rc4 (2023-01-15 09:22:43 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.2-rc4-fix

for you to fetch changes up to 95ecbd0f162fc06ef4c4045a66f653f47b62a2d3:

  Revert "gfs2: stop using generic_writepages in gfs2_ail1_start_one" (2023-01-22 09:46:14 +0100)

----------------------------------------------------------------
gfs2 writepage fix

- Fix a regression introduced by commit "gfs2: stop using
  generic_writepages in gfs2_ail1_start_one".

----------------------------------------------------------------
Andreas Gruenbacher (1):
      Revert "gfs2: stop using generic_writepages in gfs2_ail1_start_one"

 fs/gfs2/log.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

