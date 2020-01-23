Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E5C31146D92
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hbLjYNNGuCF6efS3/tP67BxprK8S1OkeXADGZ6AFue4=;
	b=SkQLVZpK8lJhKD16Okjs5MB+zDFoisceRxdlVbV6f7G+ab/tezUwuDtcPYkdYoAqFoAPeB
	9eNP0UT1FUERv95gtOAmSd2sUpi0TxAEc8B6K49CP4mKDL5qRT5Vk4Ft8d8geyvRs/MPnt
	zJCVWRqGxMT1vbQ0iPkPSUX4vKynCDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-lb1NljSZONmjhvO81yZs3Q-1; Thu, 23 Jan 2020 10:57:01 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 565F41005512;
	Thu, 23 Jan 2020 15:56:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46B8A5DA75;
	Thu, 23 Jan 2020 15:56:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AC521832DF2;
	Thu, 23 Jan 2020 15:56:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFuPaT012440 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09AAE60C81; Thu, 23 Jan 2020 15:56:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 569BD60BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:23 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:50 +0000
Message-Id: <20200123155552.1080247-12-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/13] restoremeta: Combine parse_header()
	and check_header()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: lb1NljSZONmjhvO81yZs3Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fixes an issue where smh was being left with garbage values with
old metadata files with no header.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 2cfa2f44..7e47b810 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -856,20 +856,19 @@ static int save_header(struct metafd *mfd, uint64_t f=
sbytes)
 =09return 0;
 }
=20
-static void parse_header(char *buf, struct savemeta_header *smh)
+static int parse_header(char *buf, struct savemeta_header *smh)
 {
 =09struct savemeta_header *smh_be =3D (void *)buf;
=20
+=09if (be32_to_cpu(smh_be->sh_magic) !=3D SAVEMETA_MAGIC ||
+=09    be32_to_cpu(smh_be->sh_format) > SAVEMETA_FORMAT) {
+=09=09printf("No valid file header found. Falling back to old format...\n"=
);
+=09=09return -1;
+=09}
 =09smh->sh_magic =3D be32_to_cpu(smh_be->sh_magic);
 =09smh->sh_format =3D be32_to_cpu(smh_be->sh_format);
 =09smh->sh_time =3D be64_to_cpu(smh_be->sh_time);
 =09smh->sh_fs_bytes =3D be64_to_cpu(smh_be->sh_fs_bytes);
-}
-
-static int check_header(struct savemeta_header *smh)
-{
-=09if (smh->sh_magic !=3D SAVEMETA_MAGIC || smh->sh_format > SAVEMETA_FORM=
AT)
-=09=09return -1;
 =09printf("Metadata saved at %s", ctime((time_t *)&smh->sh_time)); /* ctim=
e() adds \n */
 =09printf("File system size %.2fGB\n", smh->sh_fs_bytes / ((float)(1 << 30=
)));
 =09return 0;
@@ -1155,14 +1154,10 @@ static int restore_init(const char *path, struct me=
tafd *mfd, struct savemeta_he
 =09=09return -1;
 =09}
 =09bp =3D restore_buf;
-=09parse_header(bp, smh);
-=09if (check_header(smh) !=3D 0)
-=09=09printf("No valid file header found. Falling back to old format...\n"=
);
-=09else {
+=09if (parse_header(bp, smh) =3D=3D 0) {
 =09=09bp =3D restore_buf + sizeof(*smh);
 =09=09restore_off =3D sizeof(*smh);
 =09}
-
 =09/* Scan for the position of the superblock. Required to support old for=
mats(?). */
 =09end =3D &restore_buf[256 + sizeof(struct saved_metablock) + sizeof(*sbm=
h)];
 =09while (bp <=3D end) {
--=20
2.24.1

