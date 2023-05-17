Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE29705E08
	for <lists+cluster-devel@lfdr.de>; Wed, 17 May 2023 05:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684293909;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6e3gVncYqL0+JWA6uRKnPQgmS4Ev7p8efpOspJp3ZDA=;
	b=GIN3aqFAIWCldA2DVMCSzM19f/ahak3kTJheQGi50McVEWLI17EVcHIIOsr8vVfYTPf0I6
	iWUFRjIko9XQiWYK3ObCCxY1CXBWl6n+EPHK3sOquX21KqN4fHkFxhBdST9m4YqUfQy1/Z
	WlAIsxjXTDK8vNKeTXoBgqhvqkYv0BU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-YidP2-K-OUSS9t2O1r5Vgg-1; Tue, 16 May 2023 23:25:05 -0400
X-MC-Unique: YidP2-K-OUSS9t2O1r5Vgg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09A50857E18;
	Wed, 17 May 2023 03:25:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2BDE492C3F;
	Wed, 17 May 2023 03:25:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B799919465B2;
	Wed, 17 May 2023 03:25:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DFD0C19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 17 May 2023 03:25:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C3D7B407D440; Wed, 17 May 2023 03:25:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC8B040C6EC4
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:25:02 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2D85857E0C
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:25:02 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-290-wzlcDKIqMQOOLMe2CdhBzQ-1; Tue,
 16 May 2023 23:24:57 -0400
X-MC-Unique: wzlcDKIqMQOOLMe2CdhBzQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pz7mN-004lN2-Kh; Wed, 17 May 2023 03:24:43 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 17 May 2023 04:24:36 +0100
Message-Id: <20230517032442.1135379-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 0/6] gfs2/buffer folio changes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Hannes Reinecke <hare@suse.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This kind of started off as a gfs2 patch series, then became entwined
with buffer heads once I realised that gfs2 was the only remaining
caller of __block_write_full_page().  For those not in the gfs2 world,
the big point of this series is that block_write_full_page() should now
handle large folios correctly.

It probably makes most sense to take this through Andrew's tree, once
enough people have signed off on it?

Matthew Wilcox (Oracle) (6):
  gfs2: Use a folio inside gfs2_jdata_writepage()
  gfs2: Pass a folio to __gfs2_jdata_write_folio()
  gfs2: Convert gfs2_write_jdata_page() to gfs2_write_jdata_folio()
  buffer: Convert __block_write_full_page() to
    __block_write_full_folio()
  gfs2: Support ludicrously large folios in gfs2_trans_add_databufs()
  buffer: Make block_write_full_page() handle large folios correctly

 fs/buffer.c                 | 75 ++++++++++++++++++-------------------
 fs/gfs2/aops.c              | 66 ++++++++++++++++----------------
 fs/gfs2/aops.h              |  2 +-
 fs/ntfs/aops.c              |  2 +-
 fs/reiserfs/inode.c         |  2 +-
 include/linux/buffer_head.h |  2 +-
 6 files changed, 75 insertions(+), 74 deletions(-)

-- 
2.39.2

