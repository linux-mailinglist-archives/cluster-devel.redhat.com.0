Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6653B598B3A
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Aug 2022 20:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660847567;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gagX3mFev1QAvJdumr+W7xDFcDwBCHi77OMJvY9MaAk=;
	b=fkvaqWEjP7iiLT1tASX18qcXnfkPe/TziOcGNX2r8y6w42keiTWuZw6HEmW4a5+3PCKnIb
	Na+43cC2HqwRSeUNLcF32O+VTHL5Rre9kZ8EtB1g7L4vkrjRg5jb9OMcb+a62tucdna49n
	MneJmSczXY+E3xlR1KAgL+xx2PX80rM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-pBcN-YunMy2z9rS9NKBN8A-1; Thu, 18 Aug 2022 14:32:45 -0400
X-MC-Unique: pBcN-YunMy2z9rS9NKBN8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 378773C0D87B;
	Thu, 18 Aug 2022 18:32:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A0542166B29;
	Thu, 18 Aug 2022 18:32:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 47895194E12A;
	Thu, 18 Aug 2022 18:32:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D24341946A41 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 18:32:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7A2BBC15BBD; Thu, 18 Aug 2022 18:32:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.17.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 554B4C15BBA
 for <cluster-devel@redhat.com>; Thu, 18 Aug 2022 18:32:39 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 18 Aug 2022 13:32:35 -0500
Message-Id: <20220818183238.121677-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [GFS2 v3 PATCH 0/3] gfs2: Misc withdraw patches
 (version 3)
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

This is version 3 which has further simplification and improvements.

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
  gfs2: Clear flags when withdraw prevents xmote

 fs/gfs2/glock.c | 36 ++++++++++++++++++++++++++++++++++--
 fs/gfs2/glock.h |  1 +
 fs/gfs2/util.c  |  6 ++++++
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.37.2

