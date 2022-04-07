Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 944984F7021
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 03:17:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-pwqnu14ZOZiojssbYrDxZg-1; Wed, 06 Apr 2022 21:17:27 -0400
X-MC-Unique: pwqnu14ZOZiojssbYrDxZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2F7B803524;
	Thu,  7 Apr 2022 01:17:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7C30145B96C;
	Thu,  7 Apr 2022 01:17:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55E62194034E;
	Thu,  7 Apr 2022 01:17:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BCD3C1949763 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 01:17:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A141B401E97; Thu,  7 Apr 2022 01:17:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE8C40336E
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:17:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 846093803931
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:17:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-gkoywK4KNp-3eyi5_FTjPw-1; Wed, 06 Apr 2022 21:17:24 -0400
X-MC-Unique: gkoywK4KNp-3eyi5_FTjPw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB36B61DA4;
 Thu,  7 Apr 2022 01:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1C5C385A3;
 Thu,  7 Apr 2022 01:10:31 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  6 Apr 2022 21:09:59 -0400
Message-Id: <20220407011029.113321-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH AUTOSEL 5.17 01/31] gfs2: assign rgrp glock
 before compute_bitstructs
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
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com,
 syzbot+c6fd14145e2f62ca0784@syzkaller.appspotmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: application/octet-stream; x-default=true

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 428f651cb80b227af47fc302e4931791f2fb4741 ]

Before this patch, function read_rindex_entry called compute_bitstructs
before it allocated a glock for the rgrp. But if compute_bitstructs found
a problem with the rgrp, it called gfs2_consist_rgrpd, and that called
gfs2_dump_glock for rgd->rd_gl which had not yet been assigned.

read_rindex_entry
   compute_bitstructs
      gfs2_consist_rgrpd
         gfs2_dump_glock <---------rgd->rd_gl was not set.

This patch changes read_rindex_entry so it assigns an rgrp glock before
calling compute_bitstructs so gfs2_dump_glock does not reference an
unassigned pointer. If an error is discovered, the glock must also be
put, so a new goto and label were added.

Reported-by: syzbot+c6fd14145e2f62ca0784@syzkaller.appspotmail.com
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/rgrp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 0fb3c01bc557..9b04a570c582 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -922,15 +922,15 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 =09spin_lock_init(&rgd->rd_rsspin);
 =09mutex_init(&rgd->rd_mutex);
=20
-=09error =3D compute_bitstructs(rgd);
-=09if (error)
-=09=09goto fail;
-
 =09error =3D gfs2_glock_get(sdp, rgd->rd_addr,
 =09=09=09       &gfs2_rgrp_glops, CREATE, &rgd->rd_gl);
 =09if (error)
 =09=09goto fail;
=20
+=09error =3D compute_bitstructs(rgd);
+=09if (error)
+=09=09goto fail_glock;
+
 =09rgd->rd_rgl =3D (struct gfs2_rgrp_lvb *)rgd->rd_gl->gl_lksb.sb_lvbptr;
 =09rgd->rd_flags &=3D ~GFS2_RDF_PREFERRED;
 =09if (rgd->rd_data > sdp->sd_max_rg_data)
@@ -944,6 +944,7 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 =09}
=20
 =09error =3D 0; /* someone else read in the rgrp; free it and ignore it */
+fail_glock:
 =09gfs2_glock_put(rgd->rd_gl);
=20
 fail:
--=20
2.35.1

