Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 49BCA4297AC
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0e5BdbfPVQGphc7nNl/5gQdF/qXD40alO0L1hRqnC9M=;
	b=V6tExl5j2omTnIa0MDt+fzXNJ1Ujn5BKOQF26/sENkgelq4pFSKDLa9AzfzDk4oFutaKqn
	w+lpG91UL7YLNaujfzgRkhsKfHIGMNw+J3AL5HLwSgXlexDkxZd6GXZlSKq2tF9+3Ll8uZ
	WERvGG1QWbGEqfzD2ZvwGlSt0VzE+30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-ybYxsmVJPHyIqFptHyzzcA-1; Mon, 11 Oct 2021 15:40:36 -0400
X-MC-Unique: ybYxsmVJPHyIqFptHyzzcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A8E584A5E4;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B4B22657E;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 279391801241;
	Mon, 11 Oct 2021 19:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeSXu028752 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A700526DFD; Mon, 11 Oct 2021 19:40:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 750B226DE2
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:08 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:39:55 -0500
Message-Id: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 00/13] gfs2: fix bugs related to
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

Hi,

This is version 3 of my patch collection: these are bugs and/or improvements
I made as a result of the recent "node scope" bugs and problems encountered
during the testing of them. In other words, some of the patches are not
directly related to the "node scope" bug directly, but they were found while
testing the patches. This version incorporates several suggestions made by
Andreas. Also, I broke the patch "gfs2: fix GL_SKIP node_scope problems" into
three smaller patches that do some refactoring to make sure I got the right
logic.

Andreas Gruenbacher (2):
  gfs2: Save ip from gfs2_glock_nq_init
  gfs2: Remove 'first' trace_gfs2_promote argument

Bob Peterson (11):
  gfs2: Allow append and immutable bits to coexist
  gfs2: dequeue iopen holder in gfs2_inode_lookup error
  gfs2: dump glocks from gfs2_consist_OBJ_i
  gfs2: change go_lock to go_instantiate
  gfs2: re-factor function do_promote
  gfs2: further simplify do_promote
  gfs2: split glock instantiation off from do_promote
  gfs2: fix GL_SKIP node_scope problems
  gfs2: Eliminate GIF_INVALID flag
  gfs2: remove RDF_UPTODATE flag
  gfs2: set glock object after nq

 fs/gfs2/file.c       |  10 +---
 fs/gfs2/glock.c      | 130 +++++++++++++++++++++++++++++++------------
 fs/gfs2/glock.h      |  14 ++++-
 fs/gfs2/glops.c      |  29 +++++-----
 fs/gfs2/incore.h     |   6 +-
 fs/gfs2/inode.c      |  12 ++--
 fs/gfs2/rgrp.c       |  57 +++++++++----------
 fs/gfs2/rgrp.h       |   2 +-
 fs/gfs2/super.c      |   4 +-
 fs/gfs2/trace_gfs2.h |   9 +--
 fs/gfs2/util.c       |   2 +
 11 files changed, 165 insertions(+), 110 deletions(-)

-- 
2.31.1

