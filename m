Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 322FFFED05
	for <lists+cluster-devel@lfdr.de>; Sat, 16 Nov 2019 16:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573918899;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dO9Sr85CYWry+QcLguNtJ7nIIDQrWn1KvRSZYEGN04s=;
	b=MD0I79+h8jY1MKMesaF98wDYrSvia487i8mbU/J1sjwQQdO+tj+xtygVZ/FeZByxg1gqXc
	92ACuk0Wh1svIlVcegZBdZWJzgFHkmdxMuwDOBklGvAn2bLcQrisV1t8GJ7FvoonfcdB+R
	pkgrl3Qw1tD2rqM6I4Sz6GBlPnp5AtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-oRuXL8_aMHWjI_g4rtrf2A-1; Sat, 16 Nov 2019 10:41:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CDE918766F2;
	Sat, 16 Nov 2019 15:41:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 652A86919A;
	Sat, 16 Nov 2019 15:41:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F26394BB65;
	Sat, 16 Nov 2019 15:41:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAGFfOvk013121 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 16 Nov 2019 10:41:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9EE8B2166B2A; Sat, 16 Nov 2019 15:41:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AC332166B27
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:41:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 670EC800296
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:41:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-256-AZIBfAkmP8ahzO9czUCnLA-1;
	Sat, 16 Nov 2019 10:41:20 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D29B020718;
	Sat, 16 Nov 2019 15:41:17 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 16 Nov 2019 10:37:22 -0500
Message-Id: <20191116154113.7417-7-sashal@kernel.org>
In-Reply-To: <20191116154113.7417-1-sashal@kernel.org>
References: <20191116154113.7417-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: AZIBfAkmP8ahzO9czUCnLA-1
X-MC-Unique: oRuXL8_aMHWjI_g4rtrf2A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAGFfOvk013121
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.19 007/237] gfs2: Fix marking
	bitmaps non-full
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit ec23df2b0cf3e1620f5db77972b7fb735f267eff ]

Reservations in gfs can span multiple gfs2_bitmaps (but they won't span
multiple resource groups).  When removing a reservation, we want to
clear the GBF_FULL flags of all involved gfs2_bitmaps, not just that of
the first bitmap.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Steven Whitehouse <swhiteho@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/rgrp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 449d0cb45a845..e37b40ec3f761 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -642,7 +642,10 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
 =09RB_CLEAR_NODE(&rs->rs_node);
=20
 =09if (rs->rs_free) {
-=09=09struct gfs2_bitmap *bi =3D rbm_bi(&rs->rs_rbm);
+=09=09u64 last_block =3D gfs2_rbm_to_block(&rs->rs_rbm) +
+=09=09=09=09 rs->rs_free - 1;
+=09=09struct gfs2_rbm last_rbm =3D { .rgd =3D rs->rs_rbm.rgd, };
+=09=09struct gfs2_bitmap *start, *last;
=20
 =09=09/* return reserved blocks to the rgrp */
 =09=09BUG_ON(rs->rs_rbm.rgd->rd_reserved < rs->rs_free);
@@ -653,7 +656,13 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
 =09=09   it will force the number to be recalculated later. */
 =09=09rgd->rd_extfail_pt +=3D rs->rs_free;
 =09=09rs->rs_free =3D 0;
-=09=09clear_bit(GBF_FULL, &bi->bi_flags);
+=09=09if (gfs2_rbm_from_block(&last_rbm, last_block))
+=09=09=09return;
+=09=09start =3D rbm_bi(&rs->rs_rbm);
+=09=09last =3D rbm_bi(&last_rbm);
+=09=09do
+=09=09=09clear_bit(GBF_FULL, &start->bi_flags);
+=09=09while (start++ !=3D last);
 =09}
 }
=20
--=20
2.20.1


