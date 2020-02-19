Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 20411164B86
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 18:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582132027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SSUQa6+eDXMxmZSkXgIkQlMuJIxUWyZmMo7Esz9dIk4=;
	b=RiPtH5PRIuZZInhlGjVdUbgLnoGpjx7Hu1tUwAqX70jHhZoJ08xDs70JJeXi4Q4T504Clj
	l4RELAMnzJ8v/K5vl6TG3QvFA1yny/JywESkZam3zBQiAiZOjSBYoDn2eCJankvYW8U+as
	/d0bQyelIHjKIsShWxjRf5j+DYCphYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-BkDPofZAO3SGl1vwOOQ58A-1; Wed, 19 Feb 2020 12:07:02 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 489E0192296C;
	Wed, 19 Feb 2020 17:06:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16D701001B05;
	Wed, 19 Feb 2020 17:06:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 522D81809567;
	Wed, 19 Feb 2020 17:06:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JH6skI019424 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 12:06:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 99C3410A8589; Wed, 19 Feb 2020 17:06:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9558C10A8585
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 17:06:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 148441011E1A
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 17:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-19-trZphtvZM92I3YcrUquGlA-1; Wed, 19 Feb 2020 12:06:49 -0500
X-MC-Unique: trZphtvZM92I3YcrUquGlA-1
X-MC-Unique: BkDPofZAO3SGl1vwOOQ58A-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4So6-00016p-If; Wed, 19 Feb 2020 17:06:42 +0000
Date: Wed, 19 Feb 2020 09:06:42 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200219170642.GS24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-31-willy@infradead.org>
	<20200219032900.GE10776@dread.disaster.area>
	<20200219060415.GO24185@bombadil.infradead.org>
	<20200219064005.GL10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200219064005.GL10776@dread.disaster.area>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JH6skI019424
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 17/19] iomap: Restructure
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 05:40:05PM +1100, Dave Chinner wrote:
> Ok, that's what the ctx.cur_page_in_bio check is used to detect i.e.
> if we've got a page that the readahead cursor points at, and we
> haven't actually added it to a bio, then we can leave it to the
> read_pages() to unlock and clean up. If it's in a bio, then IO
> completion will unlock it and so we only have to drop the submission
> reference and move the readahead cursor forwards so read_pages()
> doesn't try to unlock this page. i.e:
>=20
> =09/* clean up partial page submission failures */
> =09if (ctx.cur_page && ctx.cur_page_in_bio) {
> =09=09put_page(ctx.cur_page);
> =09=09readahead_next(rac);
> =09}
>=20
> looks to me like it will handle the case of "ret =3D=3D 0" in the actor
> function just fine.

Here's what I ended up with:

@@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos,=
 loff_t length,
                void *data, struct iomap *iomap, struct iomap *srcmap)
 {
        struct iomap_readpage_ctx *ctx =3D data;
-       loff_t done, ret;
-
-       for (done =3D 0; done < length; done +=3D ret) {
-               if (ctx->cur_page && offset_in_page(pos + done) =3D=3D 0) {
-                       if (!ctx->cur_page_in_bio)
-                               unlock_page(ctx->cur_page);
-                       put_page(ctx->cur_page);
-                       ctx->cur_page =3D NULL;
-               }
+       loff_t ret, done =3D 0;
+
+       while (done < length) {
                if (!ctx->cur_page) {
                        ctx->cur_page =3D iomap_next_page(inode, ctx->pages=
,
                                        pos, length, &done);
@@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t pos,=
 loff_t length,
                }
                ret =3D iomap_readpage_actor(inode, pos + done, length - do=
ne,
                                ctx, iomap, srcmap);
+               done +=3D ret;
+
+               /* Keep working on a partial page */
+               if (ret && offset_in_page(pos + done))
+                       continue;
+
+               if (!ctx->cur_page_in_bio)
+                       unlock_page(ctx->cur_page);
+               put_page(ctx->cur_page);
+               ctx->cur_page =3D NULL;
+
+               /* Don't loop forever if we made no progress */
+               if (WARN_ON(!ret))
+                       break;
        }
=20
        return done;
@@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, struct =
list_head *pages,
 done:
        if (ctx.bio)
                submit_bio(ctx.bio);
-       if (ctx.cur_page) {
-               if (!ctx.cur_page_in_bio)
-                       unlock_page(ctx.cur_page);
-               put_page(ctx.cur_page);
-       }
+       BUG_ON(ctx.cur_page);
=20
        /*
         * Check that we didn't lose a page due to the arcance calling

so we'll WARN if we get a ret =3D=3D 0 (matching ->readpage), and we'll
BUG if we ever see a page being leaked out of readpages_actor, which
is a thing that should never happen and we definitely want to be noisy
about if it does.


