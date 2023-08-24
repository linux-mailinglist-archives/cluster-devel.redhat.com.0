Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9D7879F2
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jlTUGIrCU8Uqs0zgmSr8gIlHVppPnqRBGk1ZpMjiskw=;
	b=drQcvRQxmGo17chkygAZA0NUQuopUpu3P1pb+Ccj0aXi10Q2tGIUkPTN9zTyJlBJdQopcI
	2ClLiwQdnBCUWijgya9L1sI9pUYxxx3FDTcLXmcgDAKw+MWmZXaXYxbWlCWmDywD/7pgse
	yu764m1eFhoSNwf95j9TlGlpVXRbBsg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-L96nYFoUOI6slfB2nXmE4Q-1; Thu, 24 Aug 2023 17:11:06 -0400
X-MC-Unique: L96nYFoUOI6slfB2nXmE4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4066F8D40A0;
	Thu, 24 Aug 2023 21:11:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0D5B1121319;
	Thu, 24 Aug 2023 21:11:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5CA0019465B1;
	Thu, 24 Aug 2023 21:11:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1341B1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:11:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D5CC5492C18; Thu, 24 Aug 2023 21:11:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34E7F492C14;
 Thu, 24 Aug 2023 21:11:02 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:10:57 +0200
Message-Id: <20230824211101.3242346-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 0/4] gfs2: logd cleanups on for-next
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The following four patches related to gfs2's logd daemon are currently
queued up on our for-next branch, to be submitted upstream in the
upcoming merge window.

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=for-next

Thanks,
Andreas

Andreas Gruenbacher (4):
  gfs2: Switch to wait_event in gfs2_logd
  gfs2: low-memory forced flush fixes
  gfs2: Fix logd wakeup on I/O error
  gfs2: journal flush threshold fixes and cleanup

 fs/gfs2/aops.c |  4 +++-
 fs/gfs2/log.c  | 60 ++++++++++++++++++++++----------------------------
 2 files changed, 29 insertions(+), 35 deletions(-)

-- 
2.40.1

