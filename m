Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 58E773511C7
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Apr 2021 11:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617268738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5pecntrFMgZIVP/tmVdOWRAuEJ0A2YmIbmIbp/C8+A8=;
	b=E3gkH8cy7mDww+61KKxWGJ3zIZUoCeme4PMmZO52aBt6t+Hiw1L/57I0juWNzP9KVJiLut
	xHYY2aEb/5xsvXi4wfNT7AKO0JUqYrckpmJM2mZ6NzXWr3OlEAPDwfLjOAyQvkdx3Np1Qo
	3gO+aLJFakCA2v+xeWHhKX2ML9/YsZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-IVPAuW_MOempkqQp63ptFA-1; Thu, 01 Apr 2021 05:18:57 -0400
X-MC-Unique: IVPAuW_MOempkqQp63ptFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F173185302B;
	Thu,  1 Apr 2021 09:18:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1322510023AC;
	Thu,  1 Apr 2021 09:18:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 063254A7C9;
	Thu,  1 Apr 2021 09:18:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1319IiFd028049 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 05:18:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBB0460CCD; Thu,  1 Apr 2021 09:18:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 227D86F985;
	Thu,  1 Apr 2021 09:18:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  1 Apr 2021 11:18:35 +0200
Message-Id: <20210401091839.2251916-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/4] gfs2: Various cleanups
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Here are a few minor clanups; please review.

Thanks,
Andreas

Andreas Gruenbacher (4):
  gfs2: Add new gfs2_iomap_get helper
  gfs2: Turn gfs2_extent_map into gfs2_{get,alloc}_extent
  gfs2: Replace gfs2_lblk_to_dblk with gfs2_get_extent
  gfs2: Turn gfs2_meta_indirect_buffer into gfs2_meta_buffer

 fs/gfs2/bmap.c     | 148 ++++++++++++++++++++++-----------------------
 fs/gfs2/bmap.h     |  13 ++--
 fs/gfs2/dir.c      |  13 ++--
 fs/gfs2/file.c     |   5 +-
 fs/gfs2/log.c      |   6 +-
 fs/gfs2/meta_io.c  |   9 ++-
 fs/gfs2/meta_io.h  |   6 +-
 fs/gfs2/quota.c    |   4 +-
 fs/gfs2/recovery.c |   4 +-
 9 files changed, 106 insertions(+), 102 deletions(-)

-- 
2.26.2

