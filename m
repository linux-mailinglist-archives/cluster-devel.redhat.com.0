Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE7BE29EEC8
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Oct 2020 15:52:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603983136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AQMCUg8pg2fSU555gqV6PGPfD8CPNW6WsZKV7hdc3Ew=;
	b=J/pqLuj0uDkFZZvzse+hrL4Nz9d1oKyuXfrfeeJAlQMyXdoiQG7j3Ag9HJD4i/pVoB7hGT
	fM8DnQIDHqfVyBjk1byvuXp7uK5J5Xwwu/D9hrLnCJqjmhqQZhA4l+6UWib5/uvxlaASyE
	T5G2aFcZiGISHBxVHtLRbp+XqYOMGg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-UW3vHN6rN2uzbFltGodx-g-1; Thu, 29 Oct 2020 10:52:14 -0400
X-MC-Unique: UW3vHN6rN2uzbFltGodx-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BBF31084CBE;
	Thu, 29 Oct 2020 14:52:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF50C1974D;
	Thu, 29 Oct 2020 14:52:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9DF65810D;
	Thu, 29 Oct 2020 14:52:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TEq9ip021687 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 10:52:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43E4E75261; Thu, 29 Oct 2020 14:52:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-104.phx2.redhat.com [10.3.113.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 115CD5B4CC
	for <cluster-devel@redhat.com>; Thu, 29 Oct 2020 14:52:03 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 29 Oct 2020 09:51:59 -0500
Message-Id: <20201029145203.451643-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/4] Fix some memory corruption issues
	found during testing
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

This set of 4 patches is my latest and greatest set for fixing various
problems I've recently discovered during xfstests testing.

Bob Peterson (4):
  gfs2: Free rd_bits later in gfs2_clear-rgrpd to fix use-after-free
  gfs2: Add missing truncate_inode_pages_final for sd_aspace
  gfs2: init_journal's undo directive should also undo the statfs inodes
  gfs2: don't initialize statfs_change inodes in spectator mode

 fs/gfs2/ops_fstype.c | 14 +++++++++-----
 fs/gfs2/rgrp.c       |  2 +-
 fs/gfs2/super.c      |  1 +
 3 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.26.2

