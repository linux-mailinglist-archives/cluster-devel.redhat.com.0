Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42A588162
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 19:58:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659463099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uwI58N/K8xaSJpSIyGiNSlEgW948iw8/PEGseCyuqq8=;
	b=eldQRY1Mdm7oZLiDEcQit5liBfhfR1Jp0CP4frYO02+LPnKNzvyu/9g7bCVfkjGahmrD8C
	luTVSxt3Dr2onuWktP8tfmrJHUVaUOHczEj5MNG+tw1J4lUne5Xrnj4jKq22935uBTDFWm
	+BzBGp6N4NyD1G1gdNGuExRDiBXO3A4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-DlsoVw3nNiOtOSHAtFD35w-1; Tue, 02 Aug 2022 13:58:16 -0400
X-MC-Unique: DlsoVw3nNiOtOSHAtFD35w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A7C68026BA;
	Tue,  2 Aug 2022 17:58:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A7DBC15D4F;
	Tue,  2 Aug 2022 17:58:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 355F51946A53;
	Tue,  2 Aug 2022 17:58:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EAC871946A57 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 653881415116; Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D8441410F3C
 for <cluster-devel@redhat.com>; Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue,  2 Aug 2022 12:58:08 -0500
Message-Id: <20220802175811.438067-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v2 0/3] gfs2: Misc withdraw patches
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

This is version 2 which simplifies patch 1 and clarifies the comments of
patch 2 as per Andreas Gruenbacher's suggestions.

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
 fs/gfs2/util.c  |  6 ++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.36.1

