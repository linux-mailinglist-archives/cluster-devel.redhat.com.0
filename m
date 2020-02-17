Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F08D0161A1A
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ySTev0nkjcuccLu01YQfxBDxqGhExZzf5V3VFxcMrSk=;
	b=gjKMEMwXWxLRn0c0vlOSeAdHu5u1tcQqhoy8qkNXusVFOE97xJk9culnH0+Hg80UDwngzj
	V+H6nE1hPK3XhAuubcuA83xabAepck2jaM1XC9oChhEUZb8/ABakvQoWr5hf3N5vutNwRb
	2tg+xmJdU3Khs401LxpFht18d26o5Tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-tQjoFSgtNnqAEKL5D3Z6RQ-1; Mon, 17 Feb 2020 13:46:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF5513E6;
	Mon, 17 Feb 2020 18:46:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 196725C3FA;
	Mon, 17 Feb 2020 18:46:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE2FC1803C41;
	Mon, 17 Feb 2020 18:46:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkRvn024788 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 48AC6D19D3; Mon, 17 Feb 2020 18:46:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40AD99C602
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CC5C900840
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-423-6UL0XuKeOQ6BRq2rlaESXg-1; Mon, 17 Feb 2020 13:46:22 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPM-0005Dk-G5; Mon, 17 Feb 2020 18:46:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:46:11 -0800
Message-Id: <20200217184613.19668-31-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: 6UL0XuKeOQ6BRq2rlaESXg-1
X-MC-Unique: tQjoFSgtNnqAEKL5D3Z6RQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkRvn024788
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 17/19] iomap: Restructure
	iomap_readpages_actor
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

By putting the 'have we reached the end of the page' condition at the end
of the loop instead of the beginning, we can remove the 'submit the last
page' code from iomap_readpages().  Also check that iomap_readpage_actor()
didn't return 0, which would lead to an endless loop.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/iomap/buffered-io.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index cb3511eb152a..44303f370b2d 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos,=
 loff_t length,
 =09=09void *data, struct iomap *iomap, struct iomap *srcmap)
 {
 =09struct iomap_readpage_ctx *ctx =3D data;
-=09loff_t done, ret;
+=09loff_t ret, done =3D 0;
=20
-=09for (done =3D 0; done < length; done +=3D ret) {
-=09=09if (ctx->cur_page && offset_in_page(pos + done) =3D=3D 0) {
-=09=09=09if (!ctx->cur_page_in_bio)
-=09=09=09=09unlock_page(ctx->cur_page);
-=09=09=09put_page(ctx->cur_page);
-=09=09=09ctx->cur_page =3D NULL;
-=09=09}
+=09while (done < length) {
 =09=09if (!ctx->cur_page) {
 =09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
 =09=09=09=09=09pos, length, &done);
@@ -418,6 +412,15 @@ iomap_readpages_actor(struct inode *inode, loff_t pos,=
 loff_t length,
 =09=09}
 =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
 =09=09=09=09ctx, iomap, srcmap);
+=09=09if (WARN_ON(ret =3D=3D 0))
+=09=09=09break;
+=09=09done +=3D ret;
+=09=09if (offset_in_page(pos + done) =3D=3D 0) {
+=09=09=09if (!ctx->cur_page_in_bio)
+=09=09=09=09unlock_page(ctx->cur_page);
+=09=09=09put_page(ctx->cur_page);
+=09=09=09ctx->cur_page =3D NULL;
+=09=09}
 =09}
=20
 =09return done;
@@ -451,11 +454,7 @@ iomap_readpages(struct address_space *mapping, struct =
list_head *pages,
 done:
 =09if (ctx.bio)
 =09=09submit_bio(ctx.bio);
-=09if (ctx.cur_page) {
-=09=09if (!ctx.cur_page_in_bio)
-=09=09=09unlock_page(ctx.cur_page);
-=09=09put_page(ctx.cur_page);
-=09}
+=09BUG_ON(ctx.cur_page);
=20
 =09/*
 =09 * Check that we didn't lose a page due to the arcance calling
--=20
2.25.0


