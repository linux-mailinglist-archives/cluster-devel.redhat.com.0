Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96E787A16
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911995;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZgoBVhb9T+a2a1h2PBkRYG+wnpBHHKPQmxNXPuWEXkI=;
	b=gtz0FYnHmFpIxvyHylofO8JdCoCs4vyXxVunXFF2YRlyD4xliFfgBNORmTmX5g8JANoZXU
	fx1dHXkhqll5oh7oBCgBuEcLls7v9JvC43ZUZsUPvxmeuytFEwKsXpX/Ce7irHOAIPTS48
	gYsTxF4/080njXbUka/uNUegxcygeGE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-s5z430JkNI-u8CYjB1YnsA-1; Thu, 24 Aug 2023 17:19:52 -0400
X-MC-Unique: s5z430JkNI-u8CYjB1YnsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A13361C07583;
	Thu, 24 Aug 2023 21:19:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E0722166B26;
	Thu, 24 Aug 2023 21:19:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B5B819465A8;
	Thu, 24 Aug 2023 21:19:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF03D1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A4284C1602E; Thu, 24 Aug 2023 21:19:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21DC1C1602B;
 Thu, 24 Aug 2023 21:19:48 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:39 +0200
Message-Id: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 0/9] gfs2: quota cleanups and fixes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Bob and I have been looking into the following syzbot-reported quota
bug:

https://lore.kernel.org/all/0000000000002b5e2405f14e860f@google.com

The following patches fix that bug.  I've put those patches onto our
for-next branch; they will be submitted upstream in the upcoming merge
window.

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=for-next

Thanks,
Andreas

Andreas Gruenbacher (8):
  gfs2: Rename sd_{ glock => kill }_wait
  gfs2: Rename SDF_DEACTIVATING to SDF_KILL
  gfs2: Fix wrong quota shrinker return value
  gfs2: Use gfs2_qd_dispose in gfs2_quota_cleanup
  gfs2: Factor out duplicate quota data disposal code
  gfs2: No more quota complaints after withdraw
  gfs2: Fix initial quota data refcount
  gfs2: Fix quota data refcount after cleanup

Bob Peterson (1):
  gfs2: Use qd_sbd more consequently

 fs/gfs2/glock.c      |  10 ++--
 fs/gfs2/glops.c      |   2 +-
 fs/gfs2/incore.h     |   4 +-
 fs/gfs2/ops_fstype.c |   7 ++-
 fs/gfs2/quota.c      | 139 +++++++++++++++++++++++++------------------
 fs/gfs2/quota.h      |   1 +
 fs/gfs2/super.c      |   3 +-
 fs/gfs2/sys.c        |   2 +-
 8 files changed, 98 insertions(+), 70 deletions(-)

-- 
2.40.1

