Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ABB537E41
	for <lists+cluster-devel@lfdr.de>; Mon, 30 May 2022 15:56:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-MzYjEXpKPBKzSKy0BqAdfw-1; Mon, 30 May 2022 09:56:06 -0400
X-MC-Unique: MzYjEXpKPBKzSKy0BqAdfw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95BA12919ED1;
	Mon, 30 May 2022 13:56:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A821492C3B;
	Mon, 30 May 2022 13:56:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 14E551947042;
	Mon, 30 May 2022 13:56:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C2F0519466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 May 2022 13:56:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B0C9D1121315; Mon, 30 May 2022 13:56:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE3E1121314
 for <cluster-devel@redhat.com>; Mon, 30 May 2022 13:56:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 933CC101A54E
 for <cluster-devel@redhat.com>; Mon, 30 May 2022 13:56:03 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-WyuF_aCOOKWbKHCQezXNqA-1; Mon, 30 May 2022 09:56:02 -0400
X-MC-Unique: WyuF_aCOOKWbKHCQezXNqA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5918B80D83;
 Mon, 30 May 2022 13:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013EBC3411E;
 Mon, 30 May 2022 13:46:58 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 30 May 2022 09:44:06 -0400
Message-Id: <20220530134406.1934928-76-sashal@kernel.org>
In-Reply-To: <20220530134406.1934928-1-sashal@kernel.org>
References: <20220530134406.1934928-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH AUTOSEL 5.10 76/76] gfs2: use i_lock
 spin_lock for inode qadata
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
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 5fcff61eea9efd1f4b60e89d2d686b5feaea100f ]

Before this patch, functions gfs2_qa_get and _put used the i_rw_mutex to
prevent simultaneous access to its i_qadata. But i_rw_mutex is now used
for many other things, including iomap_begin and end, which causes a
conflict according to lockdep. We cannot just remove the lock since
simultaneous opens (gfs2_open -> gfs2_open_common -> gfs2_qa_get) can
then stomp on each others values for i_qadata.

This patch solves the conflict by using the i_lock spin_lock in the inode
to prevent simultaneous access.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/quota.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 6e173ae378c4..ad953ecb5853 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -531,34 +531,42 @@ static void qdsb_put(struct gfs2_quota_data *qd)
  */
 int gfs2_qa_get(struct gfs2_inode *ip)
 {
-=09int error =3D 0;
 =09struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
+=09struct inode *inode =3D &ip->i_inode;
=20
 =09if (sdp->sd_args.ar_quota =3D=3D GFS2_QUOTA_OFF)
 =09=09return 0;
=20
-=09down_write(&ip->i_rw_mutex);
+=09spin_lock(&inode->i_lock);
 =09if (ip->i_qadata =3D=3D NULL) {
-=09=09ip->i_qadata =3D kmem_cache_zalloc(gfs2_qadata_cachep, GFP_NOFS);
-=09=09if (!ip->i_qadata) {
-=09=09=09error =3D -ENOMEM;
-=09=09=09goto out;
-=09=09}
+=09=09struct gfs2_qadata *tmp;
+
+=09=09spin_unlock(&inode->i_lock);
+=09=09tmp =3D kmem_cache_zalloc(gfs2_qadata_cachep, GFP_NOFS);
+=09=09if (!tmp)
+=09=09=09return -ENOMEM;
+
+=09=09spin_lock(&inode->i_lock);
+=09=09if (ip->i_qadata =3D=3D NULL)
+=09=09=09ip->i_qadata =3D tmp;
+=09=09else
+=09=09=09kmem_cache_free(gfs2_qadata_cachep, tmp);
 =09}
 =09ip->i_qadata->qa_ref++;
-out:
-=09up_write(&ip->i_rw_mutex);
-=09return error;
+=09spin_unlock(&inode->i_lock);
+=09return 0;
 }
=20
 void gfs2_qa_put(struct gfs2_inode *ip)
 {
-=09down_write(&ip->i_rw_mutex);
+=09struct inode *inode =3D &ip->i_inode;
+
+=09spin_lock(&inode->i_lock);
 =09if (ip->i_qadata && --ip->i_qadata->qa_ref =3D=3D 0) {
 =09=09kmem_cache_free(gfs2_qadata_cachep, ip->i_qadata);
 =09=09ip->i_qadata =3D NULL;
 =09}
-=09up_write(&ip->i_rw_mutex);
+=09spin_unlock(&inode->i_lock);
 }
=20
 int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, kgid_t gid)
--=20
2.35.1

