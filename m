Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51DAF26C3F4
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 17:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600268442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DzhJblFJcIee2psjTF8t2v/VopYxQUV6IUd4z61aEyE=;
	b=bmKXav97QL2a/+0aAyVW2oABCBnHNO9GaR6brw2NnCN6e0L4Iv+kE0+Vxl7Jlajv73TN0N
	W9/wRGtGP7rUlgf24b0yRCFeX177CW5WdwJVSLMsZQPpSgwnjGeq5UTgAbStiJP1UyQBCa
	/jiXvZ7L4G/grM4K42vj1TKTluh5F4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-BKGmFNpLMxq1vqVLIclhIg-1; Wed, 16 Sep 2020 11:00:40 -0400
X-MC-Unique: BKGmFNpLMxq1vqVLIclhIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95498ADC38;
	Wed, 16 Sep 2020 15:00:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8273075145;
	Wed, 16 Sep 2020 15:00:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CCFF44A6C;
	Wed, 16 Sep 2020 15:00:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GF0UH8018913 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D0F64D; Wed, 16 Sep 2020 15:00:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F10CA5DE77
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 15:00:20 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 16 Sep 2020 10:00:14 -0500
Message-Id: <20200916150020.36582-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/6] Refactor gfs2_evict_inode (V2)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Function gfs2_evict_inode is very large and messy. This patch set is an
attempt to simplify the function and make it more understandable. This
will make it easier to maintain.

This is the second version of this patch set, and it implements the suggestions
Andreas made.

It also now adds a patch to fix a bug in which unmount causes a kernel panic
when system inode glocks still have pages in memory.

Bob Peterson (6):
  gfs2: switch variable error to ret in gfs2_evict_inode
  gfs2: factor evict_deleted_inode out of gfs2_evict_inode
  gfs2: further simplify gfs2_evict_inode with new func
    evict_should_delete
  gfs2: factor out evict code related to dinodes we are not deleting
  gfs2: simplify the logic in gfs2_evict_inode
  gfs2: special evict process for system inodes

 fs/gfs2/ops_fstype.c |  15 ++-
 fs/gfs2/super.c      | 244 ++++++++++++++++++++++++++++---------------
 2 files changed, 170 insertions(+), 89 deletions(-)

-- 
2.26.2

