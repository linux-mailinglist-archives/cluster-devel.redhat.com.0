Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D70C340EAAD
	for <lists+cluster-devel@lfdr.de>; Thu, 16 Sep 2021 21:10:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631819439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U4IivBOM60vBl2uID90MKCb1403ubBgaKyTPPEbAcwA=;
	b=JqwzfG0HS7KdFZgxbVPfHY8lmhe/qp+FGE0w2vpHqZzVk1DbYw9kn5b4BEv8wqMc8pJPJy
	9adZdhVLpUPu4TYeEUivyOjvoQ58nllQuWz5kyCbZ7XphCGtDXxAkXaMlUolDkzNfUMobE
	QGOBEVg4sly1lQR3hYfg5zfwwUPUrRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-OEdP9T5_MS6pfpWTWxegew-1; Thu, 16 Sep 2021 15:10:38 -0400
X-MC-Unique: OEdP9T5_MS6pfpWTWxegew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A302A40C0;
	Thu, 16 Sep 2021 19:10:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF6FD60BD8;
	Thu, 16 Sep 2021 19:10:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E09DD4E590;
	Thu, 16 Sep 2021 19:10:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GJAP8N021565 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 15:10:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BA785C1C5; Thu, 16 Sep 2021 19:10:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-63.phx2.redhat.com [10.3.114.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 013AA5C1D1
	for <cluster-devel@redhat.com>; Thu, 16 Sep 2021 19:10:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 16 Sep 2021 14:09:57 -0500
Message-Id: <20210916191003.105866-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2 0/6] gfs2: fix bugs related to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This set of patches contains a few clean-ups and a patch to fix a
NULL Pointer dereference introduced by the new "node scope" patch
06e908cd9ead ("gfs2: Allow node-wide exclusive glock sharing").

Bob Peterson (6):
  gfs2: remove redundant check in gfs2_rgrp_go_lock
  gfs2: Add GL_SKIP holder flag to dump_holder
  gfs2: move GL_SKIP check from glops to do_promote
  gfs2: Switch some BUG_ON to GLOCK_BUG_ON for debug
  gfs2: simplify do_promote and fix promote trace
  gfs2: introduce and use new glops go_lock_needed

 fs/gfs2/glock.c  | 23 ++++++++++++++++-------
 fs/gfs2/glock.h  |  7 +++++++
 fs/gfs2/glops.c  | 16 +++++++++++++---
 fs/gfs2/incore.h |  1 +
 fs/gfs2/rgrp.c   | 41 +++++++++++++++++++++++++++++------------
 fs/gfs2/rgrp.h   |  1 +
 6 files changed, 67 insertions(+), 22 deletions(-)

-- 
2.31.1

