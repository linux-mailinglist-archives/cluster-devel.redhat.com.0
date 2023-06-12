Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107D72CB93
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 18:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686587636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NvcbhPWpSagjBzoWrr0KwAhJ43J8H1zjHIxc9oELqxk=;
	b=fvsXj64hXj9zl0ZF/ty3mHVLSMdHvJ+WJZtJ9IQ9X8db62nG5JMuYpuavylCBKcph2euIw
	2aAQl+kgdCZA734P3morrrEeX48PjTZPFWU2TYkgu3eZ2xISmaOq6Lhd5+zT1JgkfRSn4h
	+/aCQ62PBfhcV28g657uCKYIF1p1n2E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-b2F1Z52yPT6Mz4qxZzB0iw-1; Mon, 12 Jun 2023 12:33:52 -0400
X-MC-Unique: b2F1Z52yPT6Mz4qxZzB0iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4799A185A7A7;
	Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F4291C559;
	Mon, 12 Jun 2023 16:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BF95A19465B9;
	Mon, 12 Jun 2023 16:33:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 279DB194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 16:33:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A58D6200A35F; Mon, 12 Jun 2023 16:33:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 252422026833;
 Mon, 12 Jun 2023 16:33:48 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Jun 2023 18:33:39 +0200
Message-Id: <20230612163347.1293077-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 0/8] gfs2: Rework freeze / thaw logic
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently, filesystem freeze is implemented inside freeze_go_sync(), a
glock state transition callback.  It turns out that in some scenarios,
freezing the filesystem in such a callback can deadlock.  To prevent
that from happening, rework the freeze / thaw logic and move it out of
the glock state engine.

Andreas Gruenbacher (8):
  gfs2: Rename remaining "transaction" glock references
  gfs2: Rename the {freeze,thaw}_super callbacks
  gfs2: Rename gfs2_freeze_lock{ => _shared }
  gfs2: Reconfiguring frozen filesystem already rejected
  gfs2: Rename SDF_{FS_FROZEN => FREEZE_INITIATOR}
  gfs2: Rework freeze / thaw logic
  gfs2: Replace sd_freeze_state with SDF_FROZEN flag
  gfs2: gfs2_freeze_lock_shared cleanup

 fs/gfs2/glock.c      |   4 +-
 fs/gfs2/glops.c      |  52 +++++-------
 fs/gfs2/incore.h     |  10 +--
 fs/gfs2/log.c        |  11 +--
 fs/gfs2/ops_fstype.c |  15 +---
 fs/gfs2/recovery.c   |  28 +++----
 fs/gfs2/super.c      | 186 +++++++++++++++++++++++++++++++++----------
 fs/gfs2/super.h      |   1 +
 fs/gfs2/sys.c        |   4 +-
 fs/gfs2/trans.c      |   3 +-
 fs/gfs2/util.c       |  45 ++++-------
 fs/gfs2/util.h       |   3 +-
 12 files changed, 206 insertions(+), 156 deletions(-)

-- 
2.40.0

