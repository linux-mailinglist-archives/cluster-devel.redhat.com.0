Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 146DA3BC286
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 20:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625509128;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O6aeNK5vFpQ3FyqA48YXzAW2Fvve8m6zFcu2OqMh/kk=;
	b=gh69qwcW2CkQmgKzt5+BemVB8i6eMCRMw8snjZwKrTy1lBQ6hwp4m26yC0OlHPZr5Fve3O
	QSSrI7bJb2VtC19gh/1Z45tCTlTmpPZVRNrd7kN+V/4yk9ULdiVf9psEdvGl0gSnIAQ6Dn
	YI+1xhPV0cVIancbLFi7q/2VtqTRalo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ritaxbLZMTabMXzn9Pmpog-1; Mon, 05 Jul 2021 14:18:46 -0400
X-MC-Unique: ritaxbLZMTabMXzn9Pmpog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D46A362F8;
	Mon,  5 Jul 2021 18:18:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B125E60C0F;
	Mon,  5 Jul 2021 18:18:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BA8A1809C99;
	Mon,  5 Jul 2021 18:18:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165IIVrA013717 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 14:18:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8130F2EB0D; Mon,  5 Jul 2021 18:18:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 686C319D9D;
	Mon,  5 Jul 2021 18:18:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Mon,  5 Jul 2021 20:18:22 +0200
Message-Id: <20210705181824.2174165-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [PATCH v2 0/2] iomap: small block problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Here are the two fixes that make sure that iop objects get attached to
pages eventually (in iomap_writepage_map if not earlier), but not too
early (before inline inodes are read).  These are the fixes required for
making gfs2 filesystems with a block size smaller than the page size
work again.

As Christoph has pointed out [*], there are several more cases in which
we can avoid iop creation.  Those improvements are still left to be done.

[*] https://lore.kernel.org/linux-fsdevel/YNqy0E4xFwHDhK32@infradead.org/

Thanks,
Andreas

Andreas Gruenbacher (2):
  iomap: Don't create iomap_page objects for inline files
  iomap: Permit pages without an iop to enter writeback

 fs/iomap/buffered-io.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.26.3

