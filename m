Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id E8805197D4D
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OiZeZ/2siMHTMTdhUOqVepxvUed6KyFBLrWWh+v9vRw=;
	b=Z2hfqLwwwTWT0loLaOX+oSB9AoWag822SGEzOVUAwhcgPbHyjgVV/0jIueg7H7cOKEjqwA
	IpYpMTmewZrvpakBlN5IDdtlQ7Xz1sEq57uvSEfXL4FTDZk0QfkauBlsbViJzL/Td7Jl4r
	kPmCoRssBO4pEzrTBuW3VnCBRRCVdEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-Vuk29sIVPUCRADXWd7z_2w-1; Mon, 30 Mar 2020 09:46:47 -0400
X-MC-Unique: Vuk29sIVPUCRADXWd7z_2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 225B9800D5E;
	Mon, 30 Mar 2020 13:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6FBE96B65;
	Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C916C18089CD;
	Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkTEA020126 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 587FF48; Mon, 30 Mar 2020 13:46:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BA4C97B17
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:29 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:45:47 -0500
Message-Id: <20200330134624.259349-3-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 02/39] gfs2: Report errors before
	withdraw
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

From: Andreas Gruenbacher <agruenba@redhat.com>

In gfs2_rgrp_verify and compute_bitstructs, make sure to report errors befo=
re
withdrawing the filesystem: otherwise, when we withdraw first and withdraw =
is
configured to panic, we'll never get to the error reporting.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/rgrp.c | 48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index e7bf91ec231c..2bdd662deff5 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -457,24 +457,24 @@ void gfs2_rgrp_verify(struct gfs2_rgrpd *rgd)
 =09}
=20
 =09if (count[0] !=3D rgd->rd_free) {
-=09=09if (gfs2_consist_rgrpd(rgd))
-=09=09=09fs_err(sdp, "free data mismatch:  %u !=3D %u\n",
-=09=09=09       count[0], rgd->rd_free);
+=09=09gfs2_lm(sdp, "free data mismatch:  %u !=3D %u\n",
+=09=09=09count[0], rgd->rd_free);
+=09=09gfs2_consist_rgrpd(rgd);
 =09=09return;
 =09}
=20
 =09tmp =3D rgd->rd_data - rgd->rd_free - rgd->rd_dinodes;
 =09if (count[1] !=3D tmp) {
-=09=09if (gfs2_consist_rgrpd(rgd))
-=09=09=09fs_err(sdp, "used data mismatch:  %u !=3D %u\n",
-=09=09=09       count[1], tmp);
+=09=09gfs2_lm(sdp, "used data mismatch:  %u !=3D %u\n",
+=09=09=09count[1], tmp);
+=09=09gfs2_consist_rgrpd(rgd);
 =09=09return;
 =09}
=20
 =09if (count[2] + count[3] !=3D rgd->rd_dinodes) {
-=09=09if (gfs2_consist_rgrpd(rgd))
-=09=09=09fs_err(sdp, "used metadata mismatch:  %u !=3D %u\n",
-=09=09=09       count[2] + count[3], rgd->rd_dinodes);
+=09=09gfs2_lm(sdp, "used metadata mismatch:  %u !=3D %u\n",
+=09=09=09count[2] + count[3], rgd->rd_dinodes);
+=09=09gfs2_consist_rgrpd(rgd);
 =09=09return;
 =09}
 }
@@ -733,17 +733,6 @@ void gfs2_clear_rgrpd(struct gfs2_sbd *sdp)
 =09}
 }
=20
-static void gfs2_rindex_print(const struct gfs2_rgrpd *rgd)
-{
-=09struct gfs2_sbd *sdp =3D rgd->rd_sbd;
-
-=09fs_info(sdp, "ri_addr =3D %llu\n", (unsigned long long)rgd->rd_addr);
-=09fs_info(sdp, "ri_length =3D %u\n", rgd->rd_length);
-=09fs_info(sdp, "ri_data0 =3D %llu\n", (unsigned long long)rgd->rd_data0);
-=09fs_info(sdp, "ri_data =3D %u\n", rgd->rd_data);
-=09fs_info(sdp, "ri_bitbytes =3D %u\n", rgd->rd_bitbytes);
-}
-
 /**
  * gfs2_compute_bitstructs - Compute the bitmap sizes
  * @rgd: The resource group descriptor
@@ -814,11 +803,20 @@ static int compute_bitstructs(struct gfs2_rgrpd *rgd)
 =09}
 =09bi =3D rgd->rd_bits + (length - 1);
 =09if ((bi->bi_start + bi->bi_bytes) * GFS2_NBBY !=3D rgd->rd_data) {
-=09=09if (gfs2_consist_rgrpd(rgd)) {
-=09=09=09gfs2_rindex_print(rgd);
-=09=09=09fs_err(sdp, "start=3D%u len=3D%u offset=3D%u\n",
-=09=09=09       bi->bi_start, bi->bi_bytes, bi->bi_offset);
-=09=09}
+=09=09gfs2_lm(sdp,
+=09=09=09"ri_addr =3D %llu\n"
+=09=09=09"ri_length =3D %u\n"
+=09=09=09"ri_data0 =3D %llu\n"
+=09=09=09"ri_data =3D %u\n"
+=09=09=09"ri_bitbytes =3D %u\n"
+=09=09=09"start=3D%u len=3D%u offset=3D%u\n",
+=09=09=09(unsigned long long)rgd->rd_addr,
+=09=09=09rgd->rd_length,
+=09=09=09(unsigned long long)rgd->rd_data0,
+=09=09=09rgd->rd_data,
+=09=09=09rgd->rd_bitbytes,
+=09=09=09bi->bi_start, bi->bi_bytes, bi->bi_offset);
+=09=09gfs2_consist_rgrpd(rgd);
 =09=09return -EIO;
 =09}
=20
--=20
2.25.1

