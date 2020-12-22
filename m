Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 05F102E0F78
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Dec 2020 21:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608669819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0RBa18RdlGtvK1vPJrtWjjotmZSkzIBlDkN50M4Cg7o=;
	b=RhzS3ec1NNokWOCiQOCjYzxCapJyz31Y0VuL2PkbCX8tULpqklP0aPbmm3QjWqnlzHN8XR
	2U4vqIoZSKoi6p2kClJ9wvI3c1ljaE+CSGKuDkPfAvQvYvsbhqjpT5GNhHCVAH3HxosTAg
	MRyZQX1tuOO187gNYwybuzu70pS8tF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-JPUHirIxOhOIvmqEf7O2jw-1; Tue, 22 Dec 2020 15:43:37 -0500
X-MC-Unique: JPUHirIxOhOIvmqEf7O2jw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1C2659;
	Tue, 22 Dec 2020 20:43:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93F39106D5CA;
	Tue, 22 Dec 2020 20:43:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2984B4BB7B;
	Tue, 22 Dec 2020 20:43:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BMKhW6D031403 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 15:43:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5CF17E2D9; Tue, 22 Dec 2020 20:43:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-81.phx2.redhat.com [10.3.112.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E56AE2D8
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 20:43:28 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 22 Dec 2020 14:43:26 -0600
Message-Id: <20201222204328.78528-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v2 PATCH 0/2] Circular lock dependency on
	unmount
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Version 2 implements Andreas's suggestions.

This patch set fixes a circular lock dependency flagged by LOCKDEP when a
gfs2 file system is unmounted. The first patch adds new helper functions
for holding and releasing the freeze glock. Functionality should be the same.
The second patch moves the freeze locks that used to be inside the
make_fs_ro and _rw functions to their callers. The unmount caller, however,
is exempted to avoid the lock dependency. The change means that function
init_threads is now called from within the freeze lock, but that should
not matter.

Bob Peterson (2):
  gfs2: Add common helper for holding and releasing the freeze glock
  gfs2: move freeze glock outside the make_fs_rw and _ro functions

 fs/gfs2/ops_fstype.c | 33 ++++++++++++++++----------------
 fs/gfs2/recovery.c   |  8 +++-----
 fs/gfs2/super.c      | 45 ++++----------------------------------------
 fs/gfs2/util.c       | 43 ++++++++++++++++++++++++++++++++++++++++--
 fs/gfs2/util.h       |  3 +++
 5 files changed, 68 insertions(+), 64 deletions(-)

-- 
2.29.2

