Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD521161A0D
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IUxd2Y0377suMb2hGadTERC0zSNqXQ9uUluf7b41wng=;
	b=Z2aYVRm3zbvkbYg/CpzA29f5gK5T+wJ9lKdiFDoQQpIU3HmthAvZ2d9058k9vnkOQG9n9g
	vPRz83GsSBqEG2HI7K9ZAoKbd9D3vdbebBXJbT5CJ9iTtyrz1G+48yjCYqB+5V4HM/ywOn
	7DsVDVl0ZSkvD6ryhOP9xsa91eE2wyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-yYbINPQAO5ul1K98SBw3gQ-1; Mon, 17 Feb 2020 13:46:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B48C513EA;
	Mon, 17 Feb 2020 18:46:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A10838681F;
	Mon, 17 Feb 2020 18:46:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EC4835B02;
	Mon, 17 Feb 2020 18:46:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkR8d024787 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4AD8BD19B6; Mon, 17 Feb 2020 18:46:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43719D19BD
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 463CC80102B
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-GvT0qlL5MFuOJcdiJdZSRw-1; Mon, 17 Feb 2020 13:46:22 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPM-0005EA-Is; Mon, 17 Feb 2020 18:46:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:46:13 -0800
Message-Id: <20200217184613.19668-33-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: GvT0qlL5MFuOJcdiJdZSRw-1
X-MC-Unique: yYbINPQAO5ul1K98SBw3gQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkR8d024787
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	Cong Wang <xiyou.wangcong@gmail.com>, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 19/19] mm: Use memalloc_nofs_save in
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
---
 mm/readahead.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/readahead.c b/mm/readahead.c
index 94d499cfb657..8f9c0dba24e7 100644
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
@@ -174,6 +175,18 @@ void page_cache_readahead_limit(struct address_space *=
mapping,
 =09=09._nr_pages =3D 0,
 =09};
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
@@ -227,6 +240,7 @@ void page_cache_readahead_limit(struct address_space *m=
apping,
 =09if (readahead_count(&rac))
 =09=09read_pages(&rac, &page_pool);
 =09BUG_ON(!list_empty(&page_pool));
+=09memalloc_nofs_restore(nofs);
 }
 EXPORT_SYMBOL_GPL(page_cache_readahead_limit);
=20
--=20
2.25.0


