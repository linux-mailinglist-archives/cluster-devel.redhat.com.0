Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D505F4F6FE5
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 03:14:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-ETYv-TTiP16faIL-e3_Cpw-1; Wed, 06 Apr 2022 21:14:25 -0400
X-MC-Unique: ETYv-TTiP16faIL-e3_Cpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D7F6899ED0;
	Thu,  7 Apr 2022 01:14:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00FF8C28115;
	Thu,  7 Apr 2022 01:14:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8909F194034E;
	Thu,  7 Apr 2022 01:14:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BC69E194034E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 01:14:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7812E40D2822; Thu,  7 Apr 2022 01:14:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 740C440D1B98
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:14:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87220804189
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:14:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-BJM-szaXNe--fOZxSD2Yrg-1; Wed, 06 Apr 2022 21:14:17 -0400
X-MC-Unique: BJM-szaXNe--fOZxSD2Yrg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B22361DCE;
 Thu,  7 Apr 2022 01:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E57C385A1;
 Thu,  7 Apr 2022 01:14:15 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  6 Apr 2022 21:13:49 -0400
Message-Id: <20220407011413.114662-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH AUTOSEL 5.10 01/25] gfs2: assign rgrp glock
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
index 5e8eef9990e3..6b61952772b3 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -905,15 +905,15 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 =09rgd->rd_bitbytes =3D be32_to_cpu(buf.ri_bitbytes);
 =09spin_lock_init(&rgd->rd_rsspin);
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
 =09rgd->rd_flags &=3D ~(GFS2_RDF_UPTODATE | GFS2_RDF_PREFERRED);
 =09if (rgd->rd_data > sdp->sd_max_rg_data)
@@ -927,6 +927,7 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 =09}
=20
 =09error =3D 0; /* someone else read in the rgrp; free it and ignore it */
+fail_glock:
 =09gfs2_glock_put(rgd->rd_gl);
=20
 fail:
--=20
2.35.1

