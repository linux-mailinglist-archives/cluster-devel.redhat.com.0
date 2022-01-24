Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7344986C8
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 18:29:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643045380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6bdnsqqXnEk+PSTm72hhJy0BYOXAlbA4cGGgteNSTSY=;
	b=TyP90CRQb7NZ8P3VCDLoDmJY4eEcgRuiBl9dOQ+r33v4lsDiYZEtQ5kW8a3cC+aX7FcERV
	jjtdW98kOtJCYB/cNynQ8Eg2TdsedTypIfnOHTMztd1V/jRyrPkJxrOpM3Da6X+L47fOC+
	R4VrGWjtQWqOhQRnRDHfoc42alrYvZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-PULPFf9OPEeFkw9Bs7giBw-1; Mon, 24 Jan 2022 12:29:36 -0500
X-MC-Unique: PULPFf9OPEeFkw9Bs7giBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CE6064083;
	Mon, 24 Jan 2022 17:29:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F20646E1F0;
	Mon, 24 Jan 2022 17:29:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1EA54BB7C;
	Mon, 24 Jan 2022 17:29:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OHO1BT030450 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 12:24:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C79A777451; Mon, 24 Jan 2022 17:24:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F8FB7744E
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:23:57 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 24 Jan 2022 12:23:54 -0500
Message-Id: <20220124172357.554689-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/3] Fix how gfs2 handles timed-out dlm
	requests
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Recently, we introduced patches to time out lock requests that take too long,
specifically for iopen glocks during ABBA deadlocks during evict. Before
this patch set, gfs2 never canceled the failed requests that timed out,
which can lead to deadlocks to due dlm keeping the requests on its
Conversion queue.

To deal with the timed-out requests properly, and have dlm remove them from
its Conversion queue, gfs2 must send dlm an unlock request with the dlm
"cancel" flag, and then it also must deal with the AST that dlm sends back.
This AST may be a successful response to the Cancel request, or it may be
a successful AST from the original lock request. Either way, gfs2 had
bugs dealing with the situation.

This patch set attempts to fix the problem by sending DLM a cancel and
reacting to its AST. Some ABBA deadlocks were avoided by switching the
order in which gfs2 takes its inode and iopen glocks, which was different
between some lookups and evicts.

In the process of debugging this, we discovered a problem whereby dlm
will reject lock requests with -EBUSY while the request is being canceled.
We want dlm to wait until it's not busy, but until we find a proper dlm
based solution, we need to retry the request.

Andreas Gruenbacher (2):
  gfs2: cancel timed-out glock requests
  gfs2: Switch lock order of inode and iopen glock

Bob Peterson (1):
  gfs2: Retry on dlm -EBUSY (stop gap)

 fs/gfs2/glock.c    | 11 +++++++++++
 fs/gfs2/inode.c    | 49 +++++++++++++++++++++++++---------------------
 fs/gfs2/lock_dlm.c | 22 ++++++++++++++-------
 3 files changed, 53 insertions(+), 29 deletions(-)

-- 
2.34.1

