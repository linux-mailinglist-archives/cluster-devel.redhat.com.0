Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B106814D7
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 16:21:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675092115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C4ySqOtL494jsbwnUjLwC/iwtux+7IBcr8QzmsBs3f4=;
	b=gKewZoKbn9wfGGO4BwQR99KA8aa/lgW/Va9hMIL86jBJjpKYH8Mf9EdrauiywrackqlR3P
	7Hn2NiU0hGYUB0sQb98x1nWQJiNamytKBnVY8o6Y6LUTHeNGaJXg3hR1UiAu3maKdZmOSH
	AuVF1waxCWGggNi/f051+ZNmd8B3mpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-etWFHWTGNfGo_Gxr_KgkeA-1; Mon, 30 Jan 2023 10:21:52 -0500
X-MC-Unique: etWFHWTGNfGo_Gxr_KgkeA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CBEA857A99;
	Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFD68492B00;
	Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 80E861946595;
	Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5EAF11946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 15:21:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 13EB240C2064; Mon, 30 Jan 2023 15:21:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.37.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B47A540C2005
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 15:21:47 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 30 Jan 2023 15:21:40 +0000
Message-Id: <20230130152146.633484-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 0/6] gfs2-utils: Cleanups and fsck.gfs2 fixes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This set is mainly cleanups but patches 5 and 6 are small fixes for
fsck.gfs2 which I would like to draw attention to.

PR is https://pagure.io/gfs2-utils/pull-request/14 awaiting CI testing
should you prefer to comment there.

Andy

Andrew Price (6):
  libgfs2: Return the inode from lgfs2_lookupi()
  libgfs2: Remove lgfs2_gfs_createi()
  libgfs2: Reorganise lgfs2_createi()
  fsck.gfs2: Remove de variable from dirref_find()
  fsck.gfs2: Fix wrong entry used in dentry comparison
  fsck.gfs2: fix_hashtable: Decrement i_blocks when freeing leaf blocks

 gfs2/convert/gfs2_convert.c |   7 +--
 gfs2/edit/hexedit.c         |   2 +-
 gfs2/fsck/fs_recovery.c     |  14 ++---
 gfs2/fsck/initialize.c      |  18 +++---
 gfs2/fsck/lost_n_found.c    |   6 +-
 gfs2/fsck/pass2.c           |  22 +++----
 gfs2/glocktop/glocktop.c    |   6 +-
 gfs2/libgfs2/check_fs_ops.c |  18 +++---
 gfs2/libgfs2/fs_ops.c       | 121 +++++++++++++++++++-----------------
 gfs2/libgfs2/gfs2l.c        |   2 +-
 gfs2/libgfs2/lang.c         |  10 +--
 gfs2/libgfs2/libgfs2.h      |   6 +-
 tests/nukerg.c              |   2 +-
 13 files changed, 113 insertions(+), 121 deletions(-)

-- 
2.39.0

