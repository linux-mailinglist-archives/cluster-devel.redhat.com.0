Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 48D781650AC
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E/c/Xa1t1idh/kFzCAl+qjKMQq0MajoS15YsOBdtE0Q=;
	b=O8N9sOlDC4HipEcD9qrm7DMu9TrTFAEZvlPXjdC3cLGABrPCohgGwNYggFkMS984wXybA5
	K263xOJjd8lhM6XexfP2O+gwcXbPxO7qc0c7b9K/UpDwDu/V1Meum728P5xYcw3LS+km07
	Y4zXDCv+heRIOQF73fvaJC1tvMxjwZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-HyajdvhCNhWLWd-GsxPo3Q-1; Wed, 19 Feb 2020 16:01:23 -0500
X-MC-Unique: HyajdvhCNhWLWd-GsxPo3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E35A8010CA;
	Wed, 19 Feb 2020 21:01:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33D2C60BE2;
	Wed, 19 Feb 2020 21:01:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0214B18089D0;
	Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1FNr001796 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9685D2166B2E; Wed, 19 Feb 2020 21:01:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 926E42166B2C
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A031019E0D
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-127-r38Hh2_GPPSLTB8aq3EyYw-1; Wed, 19 Feb 2020 16:01:11 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSv-0008VK-Gt; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:01:00 -0800
Message-Id: <20200219210103.32400-22-willy@infradead.org>
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: r38Hh2_GPPSLTB8aq3EyYw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1FNr001796
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 21/24] iomap: Restructure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 fs/iomap/buffered-io.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index cb3511eb152a..31899e6cb0f8 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos,=
 loff_t length,
 =09=09void *data, struct iomap *iomap, struct iomap *srcmap)
 {
 =09struct iomap_readpage_ctx *ctx =3D data;
-=09loff_t done, ret;
-
-=09for (done =3D 0; done < length; done +=3D ret) {
-=09=09if (ctx->cur_page && offset_in_page(pos + done) =3D=3D 0) {
-=09=09=09if (!ctx->cur_page_in_bio)
-=09=09=09=09unlock_page(ctx->cur_page);
-=09=09=09put_page(ctx->cur_page);
-=09=09=09ctx->cur_page =3D NULL;
-=09=09}
+=09loff_t ret, done =3D 0;
+
+=09while (done < length) {
 =09=09if (!ctx->cur_page) {
 =09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
 =09=09=09=09=09pos, length, &done);
@@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t pos,=
 loff_t length,
 =09=09}
 =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
 =09=09=09=09ctx, iomap, srcmap);
+=09=09done +=3D ret;
+
+=09=09/* Keep working on a partial page */
+=09=09if (ret && offset_in_page(pos + done))
+=09=09=09continue;
+
+=09=09if (!ctx->cur_page_in_bio)
+=09=09=09unlock_page(ctx->cur_page);
+=09=09put_page(ctx->cur_page);
+=09=09ctx->cur_page =3D NULL;
+
+=09=09/* Don't loop forever if we made no progress */
+=09=09if (WARN_ON(!ret))
+=09=09=09break;
 =09}
=20
 =09return done;
@@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, struct =
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


