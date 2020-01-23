Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C46A7146D91
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795021;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ml0ZZASeGq5J/eohn9EE0M+2iWA1uhUtpnMDFJcxgII=;
	b=S3NA8a1bu2lvaE2fmuUohr3LG1+QODSWqsF68WUjKgugRTxinwrQn17n6V/VEcmXYYRQye
	Ekoue3rpvrMahMFQ3PjDnboU9F7utfaPaQy59AXLKdXGd/T+34P5VTHP/1f6U2DcAGn9lX
	zvYPpC6lUIApLQ4r/ZKffxJK92XWeE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-pEwsI_RqOA2rwIQS19ZISw-1; Thu, 23 Jan 2020 10:56:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90AA802564;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8C6B8CCD5;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D4711832DF0;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFuN1w012434 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA25260C81; Thu, 23 Jan 2020 15:56:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE9260BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:21 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:49 +0000
Message-Id: <20200123155552.1080247-11-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/13] restoremeta: Convert iseof function
	to a flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: pEwsI_RqOA2rwIQS19ZISw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

EOF is flagged up on short reads so it can be detected in the ->read()
operation.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 99b88e42..2cfa2f44 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -54,8 +54,8 @@ struct metafd {
 =09gzFile gzfd;
 =09const char *filename;
 =09int gziplevel;
+=09int eof;
 =09int (*read)(struct metafd *mfd, void *buf, unsigned len);
-=09int (*iseof)(struct metafd *mfd);
 =09void (*close)(struct metafd *mfd);
 =09const char* (*strerr)(struct metafd *mfd);
 };
@@ -72,12 +72,10 @@ static const char *gz_strerr(struct metafd *mfd)
=20
 static int gz_read(struct metafd *mfd, void *buf, unsigned len)
 {
-=09return gzread(mfd->gzfd, buf, len);
-}
-
-static int gz_iseof(struct metafd *mfd)
-{
-=09return gzeof(mfd->gzfd);
+=09int ret =3D gzread(mfd->gzfd, buf, len);
+=09if (ret < len && gzeof(mfd->gzfd))
+=09=09mfd->eof =3D 1;
+=09return ret;
 }
=20
 static void gz_close(struct metafd *mfd)
@@ -1023,7 +1021,7 @@ static int restore_block(struct metafd *mfd, struct s=
aved_metablock *svb, char *
 =09return 0;
=20
 read_err:
-=09if (mfd->iseof(mfd))
+=09if (mfd->eof)
 =09=09return 1;
=20
 =09errstr =3D mfd->strerr(mfd);
@@ -1144,7 +1142,6 @@ static int restore_init(const char *path, struct meta=
fd *mfd, struct savemeta_he
 =09=09return 1;
 =09}
 =09mfd->read =3D gz_read;
-=09mfd->iseof =3D gz_iseof;
 =09mfd->close =3D gz_close;
 =09mfd->strerr =3D gz_strerr;
 =09mfd->gzfd =3D gzdopen(mfd->fd, "rb");
--=20
2.24.1

