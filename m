Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD4E16F1A6
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Feb 2020 22:49:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582667355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1TsbgbzNFUn+ppLPtLLgzU7ObQ3d5h7hbyunqqzYgoo=;
	b=Yj7MsUJjdMXBIW3V6+0FM0hg6EinHZXgidMacOLIk8Yqw+INOwDE1kJo1hgGzT+Ynf3QC2
	/aaEyw9vuD/DWOLxJq5vuWTWH657FPPPzJf2TjHD+NDxBVEPrdwfcgyYYXc+QGbgql6lIB
	4AGXi/z8R+tTrS0fEGH9Z6KFV78B+B4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-JYS7Kz-BNiKqImR-FW4BmA-1; Tue, 25 Feb 2020 16:49:12 -0500
X-MC-Unique: JYS7Kz-BNiKqImR-FW4BmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 726F3477;
	Tue, 25 Feb 2020 21:49:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4AD60C18;
	Tue, 25 Feb 2020 21:49:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4154418089CE;
	Tue, 25 Feb 2020 21:49:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PLmtiu010660 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 16:48:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9AC8D118DF94; Tue, 25 Feb 2020 21:48:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95BE11005E2A
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 21:48:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05CA585A31C
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 21:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-438-994c_WY_MLeJ1kPBNdYYIQ-1; Tue, 25 Feb 2020 16:48:50 -0500
X-MC-Unique: 994c_WY_MLeJ1kPBNdYYIQ-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6i4H-0007qB-Dl; Tue, 25 Feb 2020 21:48:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 25 Feb 2020 13:48:28 -0800
Message-Id: <20200225214838.30017-16-willy@infradead.org>
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PLmtiu010660
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	Cong Wang <xiyou.wangcong@gmail.com>, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v8 15/25] mm: Use memalloc_nofs_save in
	readahead path
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Ensure that memory allocations in the readahead path do not attempt to
reclaim file-backed pages, which could lead to a deadlock.  It is
possible, though unlikely this is the root cause of a problem observed
by Cong Wang.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
Suggested-by: Michal Hocko <mhocko@suse.com>
---
 mm/readahead.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/readahead.c b/mm/readahead.c
index 0afb55a49909..7f2d54fb1691 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -22,6 +22,7 @@
 #include <linux/mm_inline.h>
 #include <linux/blk-cgroup.h>
 #include <linux/fadvise.h>
+#include <linux/sched/mm.h>
=20
 #include "internal.h"
=20
@@ -185,6 +186,18 @@ void page_cache_readahead_unbounded(struct address_spa=
ce *mapping,
 =09};
 =09unsigned long i;
=20
+=09/*
+=09 * Partway through the readahead operation, we will have added
+=09 * locked pages to the page cache, but will not yet have submitted
+=09 * them for I/O.  Adding another page may need to allocate memory,
+=09 * which can trigger memory reclaim.  Telling the VM we're in
+=09 * the middle of a filesystem operation will cause it to not
+=09 * touch file-backed pages, preventing a deadlock.  Most (all?)
+=09 * filesystems already specify __GFP_NOFS in their mapping's
+=09 * gfp_mask, but let's be explicit here.
+=09 */
+=09unsigned int nofs =3D memalloc_nofs_save();
+
 =09/*
 =09 * Preallocate as many pages as we will need.
 =09 */
@@ -229,6 +242,7 @@ void page_cache_readahead_unbounded(struct address_spac=
e *mapping,
 =09 * will then handle the error.
 =09 */
 =09read_pages(&rac, &page_pool, false);
+=09memalloc_nofs_restore(nofs);
 }
 EXPORT_SYMBOL_GPL(page_cache_readahead_unbounded);
=20
--=20
2.25.0


