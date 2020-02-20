Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 63A081667BD
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DEyBVR/4xwiduQuDVvS3ENL+BMTzjbpOBM4GSPMDesM=;
	b=jLfPEt0svoZoEaLDYfIVhfjYzvRx7OMCMWM053NB2ehyGWc1DPgnETWZqykeRgKycFTqtO
	4u1FZ0jC8/WinvcuJn2iMMk9mapOu4PC2GgiVrvZ8/zwkRXnP6rO7FLTyqPw5HDnVNRUnS
	qArM7IQOtvTuk5FYrurtTH0q41wANsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-6OJCzAI8PlSrdk8Xe_St6A-1; Thu, 20 Feb 2020 14:58:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1288110CE7BD;
	Thu, 20 Feb 2020 19:58:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E06745C557;
	Thu, 20 Feb 2020 19:58:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B946418089CD;
	Thu, 20 Feb 2020 19:58:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJse6D009419 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:54:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4E54C90F57; Thu, 20 Feb 2020 19:54:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0ED1790F79
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:54:38 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:28 -0600
Message-Id: <20200220195329.952027-28-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 27/28] gfs2: don't allow releasepage to
	free bd still used for revokes
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
X-MC-Unique: 6OJCzAI8PlSrdk8Xe_St6A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function gfs2_releasepage would free any bd
elements that had been used for the page being released. However,
those bd elements may still be queued to the sd_log_revokes list,
in which case we cannot free them until the revoke has been issued.

This patch adds additional checks for bds that are still being
used for revokes.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index ba83b49ce18c..786c1ce8f030 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -805,11 +805,16 @@ int gfs2_releasepage(struct page *page, gfp_t gfp_mas=
k)
 =09=09bd =3D bh->b_private;
 =09=09if (bd) {
 =09=09=09gfs2_assert_warn(sdp, bd->bd_bh =3D=3D bh);
-=09=09=09if (!list_empty(&bd->bd_list))
-=09=09=09=09list_del_init(&bd->bd_list);
 =09=09=09bd->bd_bh =3D NULL;
 =09=09=09bh->b_private =3D NULL;
-=09=09=09kmem_cache_free(gfs2_bufdata_cachep, bd);
+=09=09=09/*
+=09=09=09 * The bd may still be queued as a revoke, in which
+=09=09=09 * case we must not dequeue nor free it.
+=09=09=09 */
+=09=09=09if (!bd->bd_blkno && !list_empty(&bd->bd_list))
+=09=09=09=09list_del_init(&bd->bd_list);
+=09=09=09if (list_empty(&bd->bd_list))
+=09=09=09=09kmem_cache_free(gfs2_bufdata_cachep, bd);
 =09=09}
=20
 =09=09bh =3D bh->b_this_page;
--=20
2.24.1

