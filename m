Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B0B6726A73F
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 16:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600180714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3UHlRr3iTCPrdmDF1MjHCVdKmlEYB1jGzQTNlze8ZKU=;
	b=am6K20HqQL9Tzx/Fky6g0qBb//881KdE4Fof9vSfrcuda4w5NbNRyEnkKc6J4HFIB1dt4C
	B4u2BGG50hWEwTvLe6/95maHBNfjZUoEq9/o5/BnbU/hM2sJ/0iuHcjK5aGHWuTsSiZRqL
	GZ37Hjr3difNJ0E7dLYQL1XoI/00+NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-8YIdvY9zMB2UxzTQ24dgTw-1; Tue, 15 Sep 2020 10:38:31 -0400
X-MC-Unique: 8YIdvY9zMB2UxzTQ24dgTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29366EA1CD;
	Tue, 15 Sep 2020 14:38:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E844D60BE2;
	Tue, 15 Sep 2020 14:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A481D183D021;
	Tue, 15 Sep 2020 14:38:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FEcNeB013065 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 10:38:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47A2A60C0F; Tue, 15 Sep 2020 14:38:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17F0C60BE2
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 14:38:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 15 Sep 2020 09:38:17 -0500
Message-Id: <20200915143822.16485-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/5] Refactor gfs2_evict_inode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Function gfs2_evict_inode is very large and messy. This patch set is an
attempt to simplify the function and make it more understandable. This
will make it easier to maintain. I did this mainly because we need to fix
it so it can call truncate_inode_pages on the inode glock's address space.

Bob Peterson (5):
  gfs2: switch variable error to ret in gfs2_evict_inode
  gfs2: factor delete_evicted_inode out of gfs2_evict_inode
  gfs2: further simplify gfs2_evict_inode with new func
    may_delete_evicted
  gfs2: factor out evict code related to dinodes we are not deleting
  gfs2: simplify the logic in gfs2_evict_inode

 fs/gfs2/super.c | 214 ++++++++++++++++++++++++++++++------------------
 1 file changed, 136 insertions(+), 78 deletions(-)

-- 
2.26.2

