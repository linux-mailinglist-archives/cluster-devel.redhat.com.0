Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4910378C097
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pb2rp2oAnr9Oo1vu1+qH7ufpYyy9MGUshj9liIlMI+o=;
	b=MnVpgb7vNEvrXpBK0kX8Ez6aRzLiRA1Pu8PWWn+G9Mg9AUtHxH6p1IpUxq0zpfY98PYLTM
	WnUnWNrsxTWWm3aEGqipGcIxnT0ul2kGdGPtPWEkiQqf+p7zJ6HAZQCqpyvfH2IGyWoD5r
	1crg5Pa196a7nBXZ8NPLFVDi4Y8fuaI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-1Ar0JzfhPHe0M6PzNW-_HA-1; Tue, 29 Aug 2023 04:41:13 -0400
X-MC-Unique: 1Ar0JzfhPHe0M6PzNW-_HA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 275318D40C5;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B57763F6C;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6B0791946A67;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89D0E19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:03:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D0A9C1602B; Fri, 25 Aug 2023 14:03:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 653D9C0004A
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:03:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4915938008BA
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:03:37 +0000 (UTC)
Received: from out-242.mta1.migadu.com (out-242.mta1.migadu.com
 [95.215.58.242]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-OFOnJaa1No2hqvI-rBDJpA-1; Fri, 25 Aug 2023 10:03:35 -0400
X-MC-Unique: OFOnJaa1No2hqvI-rBDJpA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:22 +0800
Message-Id: <20230825135431.1317785-21-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 20/29] xfs: distinguish error type of memory
 allocation failure for nowait case
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Previously, if we fail to get the memory we need, -ENOMEM is returned.
It can be -EAGAIN now since we support nowait now. Return the latter
when it is the case. Involved functions are:  _xfs_buf_map_pages(),
xfs_buf_get_maps(), xfs_buf_alloc_kmem() and xfs_buf_alloc_pages().

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 8b800ce28996..a6e6e64ff940 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -192,7 +192,7 @@ xfs_buf_get_maps(
 =09bp->b_maps =3D kmem_zalloc(map_count * sizeof(struct xfs_buf_map),
 =09=09=09=09KM_NOFS);
 =09if (!bp->b_maps)
-=09=09return -ENOMEM;
+=09=09return bp->b_flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
 =09return 0;
 }
=20
@@ -339,7 +339,7 @@ xfs_buf_alloc_kmem(
=20
 =09bp->b_addr =3D kmem_alloc(size, kmflag_mask);
 =09if (!bp->b_addr)
-=09=09return -ENOMEM;
+=09=09return flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
=20
 =09if (((unsigned long)(bp->b_addr + size - 1) & PAGE_MASK) !=3D
 =09    ((unsigned long)bp->b_addr & PAGE_MASK)) {
@@ -363,6 +363,7 @@ xfs_buf_alloc_pages(
 {
 =09gfp_t=09=09gfp_mask =3D __GFP_NOWARN;
 =09long=09=09filled =3D 0;
+=09bool=09=09nowait =3D flags & XBF_NOWAIT;
=20
 =09if (flags & XBF_READ_AHEAD)
 =09=09gfp_mask |=3D __GFP_NORETRY;
@@ -377,7 +378,7 @@ xfs_buf_alloc_pages(
 =09=09bp->b_pages =3D kzalloc(sizeof(struct page *) * bp->b_page_count,
 =09=09=09=09=09gfp_mask);
 =09=09if (!bp->b_pages)
-=09=09=09return -ENOMEM;
+=09=09=09return nowait ? -EAGAIN : -ENOMEM;
 =09}
 =09bp->b_flags |=3D _XBF_PAGES;
=20
@@ -451,7 +452,7 @@ _xfs_buf_map_pages(
 =09=09memalloc_nofs_restore(nofs_flag);
=20
 =09=09if (!bp->b_addr)
-=09=09=09return -ENOMEM;
+=09=09=09return flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
 =09}
=20
 =09return 0;
--=20
2.25.1

