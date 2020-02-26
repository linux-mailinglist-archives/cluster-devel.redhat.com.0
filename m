Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D5858170313
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Feb 2020 16:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582732141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UnX7+NoliYkNAsYe9W89eJ4tXqPWFA2au/nd+rGK5qQ=;
	b=ad1mTOsrLcluXF97z7do0xEJQ+/wt4budJ+VluYbK5oZP0GXYw3qvq7LHVlKfnjbtMqPTO
	lXfadfo9+q0N3u5V3vdCjO1eM22jPiQDXNm7Fih1l9ex8gG98N/YWUqgPw2F9xoHPZQmEn
	yDqwi8Kvy72x8YZmVokG705HTwD12qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-FRgUjtmVM6qA5T3h_AbQ1Q-1; Wed, 26 Feb 2020 10:48:59 -0500
X-MC-Unique: FRgUjtmVM6qA5T3h_AbQ1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 131B0DB65;
	Wed, 26 Feb 2020 15:48:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFAF0385;
	Wed, 26 Feb 2020 15:48:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51C1B8446D;
	Wed, 26 Feb 2020 15:48:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01QFmqh3014450 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 10:48:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D02C45C28D; Wed, 26 Feb 2020 15:48:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 835265C241
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 15:48:50 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 26 Feb 2020 09:48:42 -0600
Message-Id: <20200226154844.1264672-2-rpeterso@redhat.com>
In-Reply-To: <20200226154844.1264672-1-rpeterso@redhat.com>
References: <20200226154844.1264672-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: free quota data struct
	during evict, not file close
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, whenever a file was closed, if it was the last
process out, it freed the quota data via gfs2_qa_delete(). However,
that created race conditions between closers and other operations
like chown that relied upon the structure. This patch moves the
freeing of quota data to inode evict, and eliminates function
gfs2_qa_delete in favor of just freeing the structure.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/quota.c | 10 ----------
 fs/gfs2/quota.h |  1 -
 fs/gfs2/rgrp.c  |  1 -
 fs/gfs2/super.c |  3 +++
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 43ffe5997098..15158b6c933b 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -547,16 +547,6 @@ int gfs2_qa_alloc(struct gfs2_inode *ip)
 =09return error;
 }
=20
-void gfs2_qa_delete(struct gfs2_inode *ip, atomic_t *wcount)
-{
-=09down_write(&ip->i_rw_mutex);
-=09if (ip->i_qadata && ((wcount =3D=3D NULL) || (atomic_read(wcount) <=3D =
1))) {
-=09=09kmem_cache_free(gfs2_qadata_cachep, ip->i_qadata);
-=09=09ip->i_qadata =3D NULL;
-=09}
-=09up_write(&ip->i_rw_mutex);
-}
-
 int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, kgid_t gid)
 {
 =09struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
index 765627d9a91e..4a4a09aee7d9 100644
--- a/fs/gfs2/quota.h
+++ b/fs/gfs2/quota.h
@@ -16,7 +16,6 @@ struct gfs2_sbd;
 #define NO_GID_QUOTA_CHANGE INVALID_GID
=20
 extern int gfs2_qa_alloc(struct gfs2_inode *ip);
-extern void gfs2_qa_delete(struct gfs2_inode *ip, atomic_t *wcount);
 extern int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, kgid_t gid);
 extern void gfs2_quota_unhold(struct gfs2_inode *ip);
=20
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 2ee2f7d48bc1..7efc765ebc6a 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -683,7 +683,6 @@ void gfs2_rsqa_delete(struct gfs2_inode *ip, atomic_t *=
wcount)
 =09if ((wcount =3D=3D NULL) || (atomic_read(wcount) <=3D 1))
 =09=09gfs2_rs_deltree(&ip->i_res);
 =09up_write(&ip->i_rw_mutex);
-=09gfs2_qa_delete(ip, wcount);
 }
=20
 /**
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 693c6d13473c..3d36d8671cf6 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1410,6 +1410,9 @@ static void gfs2_evict_inode(struct inode *inode)
 out:
 =09truncate_inode_pages_final(&inode->i_data);
 =09gfs2_rsqa_delete(ip, NULL);
+=09if (ip->i_qadata)
+=09=09kmem_cache_free(gfs2_qadata_cachep, ip->i_qadata);
+=09ip->i_qadata =3D NULL;
 =09gfs2_ordered_del_inode(ip);
 =09clear_inode(inode);
 =09gfs2_dir_hash_inval(ip);
--=20
2.24.1

