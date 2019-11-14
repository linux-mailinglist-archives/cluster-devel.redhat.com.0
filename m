Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EAEF0FC949
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 15:53:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573743230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/gLDyaaUgYhSOGI2SYSG0ZdNHBXuzYoZikZ3y97NdQ0=;
	b=gPFl2XBY/DwbpP4T/ls2XPqzOuWw0NqwQC1nCldxBfgthH8svuJ9/c/AYzkEVFDm9B8uBP
	0MxXbMGy9EGs2K1XjmUHS3nSBtkoUYDYhdVHboQcCpTLIaUnuaFNUJXeHJHylm0CWgB7PO
	SLtUrSWIHhuVChULyOxOBttKAzGNFmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-NrxCQt6bPuSjVU-CSsXF9A-1; Thu, 14 Nov 2019 09:53:48 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0850818B633E;
	Thu, 14 Nov 2019 14:53:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AA0010013A1;
	Thu, 14 Nov 2019 14:53:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B16DD18089CD;
	Thu, 14 Nov 2019 14:53:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEErdkK023557 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 09:53:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6ED566BF61; Thu, 14 Nov 2019 14:53:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A41F6BF71
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:53:36 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D40E618089C8
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:53:36 +0000 (UTC)
Date: Thu, 14 Nov 2019 09:53:36 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1888238671.29725688.1573743216821.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.18]
Thread-Topic: gfs2: Don't loop forever in gfs2_freeze if withdrawn
Thread-Index: D1k9YVYDEyJ5icOSuzrbx5bQUoTRhw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Don't loop forever in
	gfs2_freeze if withdrawn
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
X-MC-Unique: NrxCQt6bPuSjVU-CSsXF9A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Before this patch, function gfs2_freeze would loop forever if the
file system trying to be frozen is withdrawn. That's because function
gfs2_lock_fs_check_clean tries to enqueue the glock of the journal
and the gfs2_glock returns -EIO because you can't enqueue a journaled
glock after a withdraw.

This patch moves the check for file system withdraw inside the loop
so that the loop can end when withdraw occurs.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 478015bc6890..8154c38e488b 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -761,12 +761,12 @@ static int gfs2_freeze(struct super_block *sb)
 =09if (atomic_read(&sdp->sd_freeze_state) !=3D SFS_UNFROZEN)
 =09=09goto out;
=20
-=09if (gfs2_withdrawn(sdp)) {
-=09=09error =3D -EINVAL;
-=09=09goto out;
-=09}
-
 =09for (;;) {
+=09=09if (gfs2_withdrawn(sdp)) {
+=09=09=09error =3D -EINVAL;
+=09=09=09goto out;
+=09=09}
+
 =09=09error =3D gfs2_lock_fs_check_clean(sdp, &sdp->sd_freeze_gh);
 =09=09if (!error)
 =09=09=09break;

