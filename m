Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 47E1118D037
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 15:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584714201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9S9yJHP9gWmbXBs7jPCIrtNZVXCe+KVDtsEk4l1JFbc=;
	b=FTeVoeQuEVxlpYxJhjNSgdJwO7dOIRCqXeOLA9XR+mfejD3T04XPeQq9x00Pkqtp4azPBA
	wF1bHLLtBJyRnOV+u8czvG06mcuzGUmCQqLE+gW4aKnjdlqVUbEMP2zI3kX04TupMJIIdr
	FC0bi+jik8riyM6Aah+gbkQiH6v9hjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-oCcwicfJP9-U8w7CmtMvtA-1; Fri, 20 Mar 2020 10:23:19 -0400
X-MC-Unique: oCcwicfJP9-U8w7CmtMvtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E733805B62;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BB4573879;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AD0618089D5;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KEMkWw021923 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 10:22:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FAB02166AE8; Fri, 20 Mar 2020 14:22:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C1BE2166AE4
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 14:22:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71F5C8F68E4
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 14:22:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-90-EYdjSCvXOLuDBmawF-fLeg-1; Fri, 20 Mar 2020 10:22:43 -0400
X-MC-Unique: EYdjSCvXOLuDBmawF-fLeg-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jFIXh-0000ie-PV; Fri, 20 Mar 2020 14:22:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2020 07:22:21 -0700
Message-Id: <20200320142231.2402-16-willy@infradead.org>
In-Reply-To: <20200320142231.2402-1-willy@infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KEMkWw021923
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org,
	Cong Wang <xiyou.wangcong@gmail.com>, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v9 15/25] mm: Use memalloc_nofs_save in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
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
2.25.1


