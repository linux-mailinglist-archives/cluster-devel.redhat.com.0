Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B79B01426D2
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jqdm1mmHjnsttvi9gIWxreK8Vfl2XXWFnnmfRDCUkgo=;
	b=VFixJPcEyjv1gvfEDppHTFWk17l9ngBXaSPha+nWMqar9ND6WeA2YgKGxCmdsgXqi62h7s
	M0BkM+goQaSKDwCMEWUVEq0c98wINnSm7lmTQbO8MigXUrZ+BbWwT/shmJekMmnQF1eKaT
	ufSNxuXlf7nfEgPeU9MF4MdrSHPEUwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-GicPbQ9vMSG9lfALFXQANw-1; Mon, 20 Jan 2020 04:13:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31C4A1005516;
	Mon, 20 Jan 2020 09:13:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F3481C94F;
	Mon, 20 Jan 2020 09:13:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F097218089CE;
	Mon, 20 Jan 2020 09:13:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DdM4031771 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72BAC84DAB; Mon, 20 Jan 2020 09:13:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8DD184D9F;
	Mon, 20 Jan 2020 09:13:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:13:03 +0100
Message-Id: <20200120091305.24997-10-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/11] gfs2: Check inode generation number
	in delete_work_func
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
X-MC-Unique: GicPbQ9vMSG9lfALFXQANw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

In delete_work_func, if the iopen glock still has an inode attached,
limit the inode lookup to that specific generation number: in the likely
case that the inode was deleted on the node on which the inode's link
count dropped to zero, we can skip verifying the on-disk block type and
reading in the inode.  The same applies if another node that had the
inode open as well managed to delete the inode before us.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 4 +++-
 fs/gfs2/incore.h | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 58da551ecb5c..1f906a3281b0 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -717,6 +717,7 @@ static bool gfs2_try_evict(struct gfs2_glock *gl)
 =09=09ip =3D NULL;
 =09spin_unlock(&gl->gl_lockref.lock);
 =09if (ip) {
+=09=09gl->gl_no_formal_ino =3D ip->i_no_formal_ino;
 =09=09set_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
 =09=09d_prune_aliases(&ip->i_inode);
 =09=09iput(&ip->i_inode);
@@ -762,7 +763,8 @@ static void delete_work_func(struct work_struct *work)
 =09=09}
 =09}
=20
-=09inode =3D gfs2_lookup_by_inum(sdp, no_addr, 0, GFS2_BLKST_UNLINKED);
+=09inode =3D gfs2_lookup_by_inum(sdp, no_addr, gl->gl_no_formal_ino,
+=09=09=09=09    GFS2_BLKST_UNLINKED);
 =09if (!IS_ERR_OR_NULL(inode)) {
 =09=09d_prune_aliases(inode);
 =09=09iput(inode);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index aecdde83c22c..f7a770a12107 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -376,7 +376,10 @@ struct gfs2_glock {
 =09struct delayed_work gl_work;
 =09union {
 =09=09/* For iopen glocks only */
-=09=09struct delayed_work gl_delete;
+=09=09struct {
+=09=09=09struct delayed_work gl_delete;
+=09=09=09u64 gl_no_formal_ino;
+=09=09};
 =09=09/* For rgrp glocks only */
 =09=09struct {
 =09=09=09loff_t start;
--=20
2.20.1

