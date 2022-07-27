Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9E582A8E
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jul 2022 18:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658938881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q/oB+7IYfXXab9ExiYj3ka0/IEFJ6onLyCCtS7kIyGw=;
	b=OL0OQDO7H1VifG48wFiqDXkRC3x+2R/DWLzbKkeys8Qr55bC+ZGev1mFYAe0qj+sSqnLKL
	XBfa3f6woYgvy1vEsOkv5q1xW8bDpdPCDhrXTzy60zYuNjvvVX54i87djvzqb/uieMQWJU
	dvQoVQ0R6i5jrDryBVpeM74sjx/yrNc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-YOMMOYObNemqtWNbjk1KtQ-1; Wed, 27 Jul 2022 12:21:17 -0400
X-MC-Unique: YOMMOYObNemqtWNbjk1KtQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5933E185A7BA;
	Wed, 27 Jul 2022 16:21:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E3E840CFD0A;
	Wed, 27 Jul 2022 16:21:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 20F141945DA9;
	Wed, 27 Jul 2022 16:21:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 08FCA1945DA2 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0686403D0E0; Wed, 27 Jul 2022 16:02:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A92EB4047D22
 for <cluster-devel@redhat.com>; Wed, 27 Jul 2022 16:02:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 27 Jul 2022 11:02:19 -0500
Message-Id: <20220727160222.227803-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 0/3] Misc withdraw patches
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

This patch set fixes a few bugs in how gfs2 handles file systems after
withdraw. In an ideal world, after a file system is withdrawn, users
should be able to unmount the file system without problems. However, we
discovered three problems that prevented clean unmounts:

1. A duplicate iput of the journal after attempted recovery caused
   kernel panics after withdraw.
2. After withdraw, unmount would hang for its alloted timeout period
   when glocks had waiters queued that, due to the withdraw, could
   never be granted.
3. Unmount would similarly hang when the withdraw prevented an outgoing
   request to dlm, but so the glock was never unlocked.

Bob Peterson (3):
  gfs2: Prevent double iput for journal on error
  gfs2: Dequeue waiters when withdrawn
  gfs2: Clear GLF_LOCK when withdraw prevents xmote

 fs/gfs2/glock.c | 33 ++++++++++++++++++++++++++++++++-
 fs/gfs2/glock.h |  1 +
 fs/gfs2/util.c  | 16 ++++++++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.36.1

