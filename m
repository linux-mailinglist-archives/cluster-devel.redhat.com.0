Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EC8ADFEE6B
	for <lists+cluster-devel@lfdr.de>; Sat, 16 Nov 2019 16:51:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573919491;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ll6b0oGBDta00zktY5Nk4Bj8Fy1FzreiQBdNLEpEYxw=;
	b=Dk2uDINXS95JX4MHwnKg7OvP8PNTmfRsVaVPkHz4iPK4EcTR25wLTgh/a0zmYPqP6S+Ofq
	knbMs4MXDIoI0WL9CVvimmtm23nxva+rP+IaCrj0tp1mEDlfm26DDLytI5al+di6zz/WTC
	QfBMIbz5HFf4RVqi/qpL7z3gr/P8kp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-i64iMHy-MK2Sqk1UU8EdHw-1; Sat, 16 Nov 2019 10:51:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83C551005502;
	Sat, 16 Nov 2019 15:51:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 706B85DA75;
	Sat, 16 Nov 2019 15:51:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 503DE1809567;
	Sat, 16 Nov 2019 15:51:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAGFpFdV013722 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 16 Nov 2019 10:51:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4349F112132D; Sat, 16 Nov 2019 15:51:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7AA1069F28
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:51:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB3AE800B42
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:51:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-412-63KZSrCtO9yqkFYF7ayeNA-1;
	Sat, 16 Nov 2019 10:51:07 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 60CEE21739;
	Sat, 16 Nov 2019 15:51:05 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 16 Nov 2019 10:49:26 -0500
Message-Id: <20191116155103.10971-3-sashal@kernel.org>
In-Reply-To: <20191116155103.10971-1-sashal@kernel.org>
References: <20191116155103.10971-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: 63KZSrCtO9yqkFYF7ayeNA-1
X-MC-Unique: i64iMHy-MK2Sqk1UU8EdHw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAGFpFdV013722
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.9 03/99] gfs2: Fix marking bitmaps
	non-full
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
index 0731267072706..65b62318fb840 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -630,7 +630,10 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
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
@@ -641,7 +644,13 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
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


