Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E673B3E98B3
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 21:24:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-dok5f5q1OT6arKdzs6mPWQ-1; Wed, 11 Aug 2021 15:24:01 -0400
X-MC-Unique: dok5f5q1OT6arKdzs6mPWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 252F71082926;
	Wed, 11 Aug 2021 19:23:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 160B15D9CA;
	Wed, 11 Aug 2021 19:23:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1C07181A0F8;
	Wed, 11 Aug 2021 19:23:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17BJJYZt003840 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 11 Aug 2021 15:19:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 64E942089A11; Wed, 11 Aug 2021 19:19:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60D6F2089A10
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 19:19:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D760B8556F2
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 19:19:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-398-Utk8uLHuNeC3Nei4GK45OA-1;
	Wed, 11 Aug 2021 15:19:28 -0400
X-MC-Unique: Utk8uLHuNeC3Nei4GK45OA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id C730760EB9;
	Wed, 11 Aug 2021 19:19:26 +0000 (UTC)
Date: Wed, 11 Aug 2021 12:19:26 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Dave Chinner <david@fromorbit.com>
Message-ID: <20210811191926.GJ3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-1-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 31/30] iomap: move iomap iteration code to
	iter.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Darrick J. Wong <djwong@kernel.org>

Now that we've moved iomap to the iterator model, rename this file to be
in sync with the functions contained inside of it.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/iomap/Makefile |    2 +-
 fs/iomap/iter.c   |    0 
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename fs/iomap/{apply.c => iter.c} (100%)

diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
index e46f936dde81..bb64215ae256 100644
--- a/fs/iomap/Makefile
+++ b/fs/iomap/Makefile
@@ -26,9 +26,9 @@ ccflags-y += -I $(srctree)/$(src)		# needed for trace events
 obj-$(CONFIG_FS_IOMAP)		+= iomap.o
 
 iomap-y				+= trace.o \
-				   apply.o \
 				   buffered-io.o \
 				   direct-io.o \
 				   fiemap.o \
+				   iter.o \
 				   seek.o
 iomap-$(CONFIG_SWAP)		+= swapfile.o
diff --git a/fs/iomap/apply.c b/fs/iomap/iter.c
similarity index 100%
rename from fs/iomap/apply.c
rename to fs/iomap/iter.c

