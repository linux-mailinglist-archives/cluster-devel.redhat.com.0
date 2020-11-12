Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6809D2B0812
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Nov 2020 16:04:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605193458;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3d8wWT1r9v90am3iGYbHKsepYhSz5kPp5NGIzur+h9c=;
	b=d+k8om4BgHNthwXP3UJli8a3oCH2p4oU2rTa3xre6j9QBiaYa6BvGaqdbvFldIwUDvMV2k
	pHoxuOlj4px112WtMeRLrrr6ayGHK8jH4gX2wIeOSXQfpfCo1kxzBK2zPdzyw9eCrwc1VG
	I6Bt9eSgrqOsy5lMOzDO4IM8L7/b2tE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-yTPMTWnOMDKa1h8cTBbyHA-1; Thu, 12 Nov 2020 10:04:16 -0500
X-MC-Unique: yTPMTWnOMDKa1h8cTBbyHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 466AE803634;
	Thu, 12 Nov 2020 15:04:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F7DE1002C25;
	Thu, 12 Nov 2020 15:04:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF18F58100;
	Thu, 12 Nov 2020 15:04:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACEvlmh021283 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 09:57:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B0A0B27CC8; Thu, 12 Nov 2020 14:57:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-10.phx2.redhat.com [10.3.113.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 802B427BA5
	for <cluster-devel@redhat.com>; Thu, 12 Nov 2020 14:57:43 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 12 Nov 2020 08:57:41 -0600
Message-Id: <20201112145743.376789-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/2] Fix regression in "Ignore journal
	log writes for jdata holes"
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

Patch b2a846dbef4e ("gfs2: Ignore journal log writes for jdata holes"
caused a regression. It fixed one specific problem while breaking others.
The problem was that it changed the behavior of function gfs2_block_map
which is used by multiple callers so it had unintended consequences for
other callers.

This patch set reverts the patch and replaces it with a more targeted
solution that fixes just the one case it needs to.

Bob Peterson (2):
  Revert "gfs2: Ignore journal log writes for jdata holes"
  gfs2: Make special version of gfs2_get_block_noalloc for jdata

 fs/gfs2/aops.c | 30 ++++++++++++++++++++++++++++--
 fs/gfs2/bmap.c |  8 ++------
 fs/gfs2/log.c  |  2 ++
 3 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.26.2

