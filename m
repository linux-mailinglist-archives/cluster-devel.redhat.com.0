Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8924C3BE77C
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jul 2021 13:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625658944;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+vPJmQDAbN01lKc36CC7ISIDmAfdSSFNZpFczSJaZAg=;
	b=LCeAobK0SNtAYW0WuOU2SxZY5QDzLZsPplv/r4mxlq01Xh85xDbB+6K7DPeGbTFTNH97AU
	rBSLWTCN0IJg6I1sgDBxFLlWDvoNiUXteAg4zt1CMTTpcv5tIbpXOuZI5XGJ2akP8VKB3O
	BQ8BJLTaC85qg5/tPTm7yfkatztZ0nQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-tPgxCq31OVG81DRRbMi7CQ-1; Wed, 07 Jul 2021 07:55:43 -0400
X-MC-Unique: tPgxCq31OVG81DRRbMi7CQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C0A68030B0;
	Wed,  7 Jul 2021 11:55:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 798635D6AB;
	Wed,  7 Jul 2021 11:55:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC7BA1809C99;
	Wed,  7 Jul 2021 11:55:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 167BtVYv030162 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 7 Jul 2021 07:55:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB9615D6AB; Wed,  7 Jul 2021 11:55:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.108])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 964FF5D741;
	Wed,  7 Jul 2021 11:55:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Wed,  7 Jul 2021 13:55:21 +0200
Message-Id: <20210707115524.2242151-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [PATCH v3 0/3] iomap: small block problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Here's another update of this patch queue.  Changes from v2:

* Reverse the order of the first two patches to make the queue bisect
  clean.  Adjust the patch descriptions accordingly.

* With the second patch, iomap_readpage_actor currently still creates
  iops.  Christoph has indicated that this should now be unnecessary
  as well, but testing has proven that we're not quite at that point,
  yet.

* Don't create iomap_page objects in iomap_page_mkwrite_actor anymore;
  this clearly has become obsolete with the first patch.

Thanks,
Andreas

Andreas Gruenbacher (3):
  iomap: Permit pages without an iop to enter writeback
  iomap: Don't create iomap_page objects for inline files
  iomap: Don't create iomap_page objects in iomap_page_mkwrite_actor

 fs/iomap/buffered-io.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.26.3

