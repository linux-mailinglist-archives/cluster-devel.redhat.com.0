Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 96996409D1C
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Sep 2021 21:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631561464;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=euIVFvVY48LKqnZY4iE2IqzKPUfYMJUx3c32+ct2UvQ=;
	b=AENRcK9ocHvRuU4683V9aLfgwBKNnWOLf4lXkgnE6tg9Z7zv01sN8s3i+5pFjeN7boSKEc
	SCEdABu55VZM29ZorPORcHT+3jRIMlB2KpVZt4l0szAfOb6axx6KdqPYGONsGCXPfPGKEk
	5GC4lhePTM3Z8wJiiw8qRZl9HqTwrU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-4M68e5hfN6uAojGUd0UWXQ-1; Mon, 13 Sep 2021 15:31:03 -0400
X-MC-Unique: 4M68e5hfN6uAojGUd0UWXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13F2050770;
	Mon, 13 Sep 2021 19:31:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F0651972D;
	Mon, 13 Sep 2021 19:31:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EED0A1800B9E;
	Mon, 13 Sep 2021 19:30:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18DJUXT7016750 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Sep 2021 15:30:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30B935D9DD; Mon, 13 Sep 2021 19:30:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-80.phx2.redhat.com [10.3.112.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F36A15D9CA
	for <cluster-devel@redhat.com>; Mon, 13 Sep 2021 19:30:28 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 13 Sep 2021 14:30:24 -0500
Message-Id: <20210913193028.75116-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/4] gfs2: fix bugs related to
	node_scope and go_lock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This set of patches contains a few clean-ups and a patch to fix a
NULL Pointer dereference introduced by the new "node scope" patch
06e908cd9ead ("gfs2: Allow node-wide exclusive glock sharing").

Bob Peterson (4):
  gfs2: remove redundant check in gfs2_rgrp_go_lock
  gfs2: Add GL_SKIP holder flag to dump_holder
  gfs2: move GL_SKIP check from glops to do_promote
  gfs2: rework go_lock mechanism for node_scope race

 fs/gfs2/glock.c  | 81 ++++++++++++++++++++++++++++++++++--------------
 fs/gfs2/glops.c  |  3 +-
 fs/gfs2/incore.h |  1 +
 fs/gfs2/rgrp.c   |  4 +--
 4 files changed, 61 insertions(+), 28 deletions(-)

-- 
2.31.1

