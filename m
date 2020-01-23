Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 19003146DA4
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795117;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/R/0nlqHeWKH4040o/UZ9xs6W0QLXSoYOnhx5QmnJnY=;
	b=EGz5Qp0s195gwadTrTDawpuqhO55NTLFZsSp3goV+yDRCuhnqlQFkkOm8t3/U7Pt7G0T/Y
	A8XCpJoRD4d2HYJnOociEt82lq5NxPQQWO2hqqcRkyNK+3zYg2s6TwuXKHk2vksBPFD1VH
	Vxy0f6bvtBnT1UKPnUngADjADUXVAb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-XKrKO6XnP4SqO-6jPIb1-Q-1; Thu, 23 Jan 2020 10:58:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCB721B18BCA;
	Thu, 23 Jan 2020 15:58:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB22985750;
	Thu, 23 Jan 2020 15:58:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93DB31832DEE;
	Thu, 23 Jan 2020 15:58:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFuRWb012465 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 57B5060C84; Thu, 23 Jan 2020 15:56:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF81960BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:26 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:52 +0000
Message-Id: <20200123155552.1080247-14-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 13/13] restoremeta: Skip the right number of
	bytes for the superblock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: XKrKO6XnP4SqO-6jPIb1-Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fix a bug where the second saved block was reached by skipping over the
size of a gfs2 superblock, which is not always the correct offset.
Instead, skip over the length specified by the saved superblock's
descriptor.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index e20b405d..63cb91af 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1198,6 +1198,7 @@ static void complain(const char *complaint)
 static int restore_init(const char *path, struct metafd *mfd, struct savem=
eta_header *smh, int printonly)
 {
 =09struct gfs2_meta_header *sbmh;
+=09uint16_t sb_siglen;
 =09char *end;
 =09char *bp;
 =09int ret;
@@ -1229,6 +1230,7 @@ static int restore_init(const char *path, struct meta=
fd *mfd, struct savemeta_he
 =09/* Scan for the position of the superblock. Required to support old for=
mats(?). */
 =09end =3D &restore_buf[256 + sizeof(struct saved_metablock) + sizeof(*sbm=
h)];
 =09while (bp <=3D end) {
+=09=09sb_siglen =3D be16_to_cpu(((struct saved_metablock *)bp)->siglen);
 =09=09sbmh =3D (struct gfs2_meta_header *)(bp + sizeof(struct saved_metabl=
ock));
 =09=09if (sbmh->mh_magic =3D=3D cpu_to_be32(GFS2_MAGIC) &&
 =09=09    sbmh->mh_type =3D=3D cpu_to_be32(GFS2_METATYPE_SB))
@@ -1243,7 +1245,7 @@ static int restore_init(const char *path, struct meta=
fd *mfd, struct savemeta_he
 =09if (ret !=3D 0)
 =09=09return ret;
=20
-=09bp +=3D sizeof(struct saved_metablock) + sizeof(sbd.sd_sb);
+=09bp +=3D sizeof(struct saved_metablock) + sb_siglen;
 =09restore_off =3D bp - restore_buf;
 =09restore_left -=3D restore_off;
 =09return 0;
--=20
2.24.1

