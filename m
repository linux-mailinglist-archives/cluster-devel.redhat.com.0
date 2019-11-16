Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ABF5CFEEB6
	for <lists+cluster-devel@lfdr.de>; Sat, 16 Nov 2019 16:53:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573919634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ii4JVrbTO6nin/C8CiEL2dlFSNNAlFa9GInpzJW7IXI=;
	b=eOfPttZsm5kaJqJkS41h7QREcFdmuKBitlhFw2YZhKcuRtSaLU+cF9v8VunXozBUNAR+8r
	cTh8iZzgwtd7p7n31eIiT+f8OqbFM4CeBZEG9/36ZV/W3yLPGar3CczpJ8oL7RfXL+69ac
	TMvQ+8sS6FWQ/h//tEGJA4njCgsufzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-RwKp0soPOeuVIwkRIZKRLw-1; Sat, 16 Nov 2019 10:53:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52802800EBA;
	Sat, 16 Nov 2019 15:53:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 417271001281;
	Sat, 16 Nov 2019 15:53:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24D4D4BB65;
	Sat, 16 Nov 2019 15:53:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAGFrlFg013845 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 16 Nov 2019 10:53:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B4AD52166B2A; Sat, 16 Nov 2019 15:53:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0BC22166B27
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:53:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 539F0101A55E
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:53:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-361-sERPiDWGPBWHhZRoIE9E0w-1;
	Sat, 16 Nov 2019 10:53:43 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3E2C621920;
	Sat, 16 Nov 2019 15:53:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 16 Nov 2019 10:52:25 -0500
Message-Id: <20191116155339.11909-3-sashal@kernel.org>
In-Reply-To: <20191116155339.11909-1-sashal@kernel.org>
References: <20191116155339.11909-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: sERPiDWGPBWHhZRoIE9E0w-1
X-MC-Unique: RwKp0soPOeuVIwkRIZKRLw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAGFrlFg013845
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.4 03/77] gfs2: Fix marking bitmaps
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 9c159e6ad1164..ef432030783b0 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -645,7 +645,10 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
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
@@ -656,7 +659,13 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
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


