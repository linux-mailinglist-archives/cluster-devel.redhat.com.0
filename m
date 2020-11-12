Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 20EB72B07DF
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Nov 2020 15:55:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605192900;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3d8wWT1r9v90am3iGYbHKsepYhSz5kPp5NGIzur+h9c=;
	b=Wn2IDGn+SllQ1efpuEZoeNmDJl+Z1LgOzRP8HV5KNrNz/RtSAccYbKMPldSCYPtSyaNjTI
	luQgoCGQ4VmlowBg9N86cSGkZSckBI6MvprrrFjJdX2MeNPek/d5+ciaKooHYiBq4INxxN
	digdBNzdcs2r51le74ZoZlR5HsQa2fA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-225fDXcUOdOlK2md9l3u8w-1; Thu, 12 Nov 2020 09:54:58 -0500
X-MC-Unique: 225fDXcUOdOlK2md9l3u8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F876101F013;
	Thu, 12 Nov 2020 14:54:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C983C5C1C7;
	Thu, 12 Nov 2020 14:54:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABAD9180B65D;
	Thu, 12 Nov 2020 14:54:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACEslkL021017 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 09:54:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A2FB5B4D8; Thu, 12 Nov 2020 14:54:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-10.phx2.redhat.com [10.3.113.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDBE176642
	for <cluster-devel@redhat.com>; Thu, 12 Nov 2020 14:54:42 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 12 Nov 2020 08:54:39 -0600
Message-Id: <20201112145442.376711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

