Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3751B2CDA06
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Dec 2020 16:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607008981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xUG17eh5QT5dYfx5jH69hX+btYv+lYnjCu1+wkT4If8=;
	b=ZIgfubQgih8UNCfwLKC8wC9SSHD8JGJvS0dgG8opazD+UOm4l3RV/K8C036VuOj5ICaUZz
	LSSG91jTTqoyWofiaqZZzE9dAw2A6VAr+RYDZW24gjKkF+C3sk2auMRqDC+oaicYFy6CM0
	0NTgTusaCp52WMPy369mLtT+Qj3tg2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-mrCy6_fXNZ2hcOJpLzC7KQ-1; Thu, 03 Dec 2020 10:22:58 -0500
X-MC-Unique: mrCy6_fXNZ2hcOJpLzC7KQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4941E7162;
	Thu,  3 Dec 2020 15:22:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 309ED60854;
	Thu,  3 Dec 2020 15:22:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD5774E58E;
	Thu,  3 Dec 2020 15:22:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3FMmUb024294 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 10:22:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61BB7189A5; Thu,  3 Dec 2020 15:22:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-72.phx2.redhat.com [10.3.112.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33E4163BA7
	for <cluster-devel@redhat.com>; Thu,  3 Dec 2020 15:22:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu,  3 Dec 2020 09:22:39 -0600
Message-Id: <20201203152241.71617-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RHEL7.9.z PATCH 0/2] Circular lock dependency on
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

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

 fs/gfs2/ops_fstype.c | 33 +++++++++++++++--------------
 fs/gfs2/recovery.c   |  6 ++----
 fs/gfs2/super.c      | 45 ++++-----------------------------------
 fs/gfs2/util.c       | 50 ++++++++++++++++++++++++++++++++++++++++++--
 fs/gfs2/util.h       |  3 +++
 5 files changed, 74 insertions(+), 63 deletions(-)

-- 
2.28.0

