Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDA1146D8D
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PcMaL9QZf+3S9RoKBosdPDHQyQfDll21F7VLKPBeFdI=;
	b=Ank2IYmIuDS7G2PFP5BkDUnZPSHoDSAgADTyhBfUc8Wig4kTYBCsOzw7KooQkzEBtAy5b2
	UIp4R44Hj/RY8oFvqVt7UUlFt7Sodls4NF0KNlP5eCF9xzxozmnIZnXIMe/z82CGz6tIms
	fszwa2PYQKP/K5GyrGTf68qkhm5FhNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-eswGe5CmMB2bGXftzez0HA-1; Thu, 23 Jan 2020 10:56:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 524D51088384;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4200984BBD;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 286A11832DEA;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFu26M012319 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 180C960C81; Thu, 23 Jan 2020 15:56:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D41B60BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:00 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:41 +0000
Message-Id: <20200123155552.1080247-3-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 02/13] restoremeta: Abstract out metadata
	file opening
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
X-MC-Unique: eswGe5CmMB2bGXftzez0HA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Provide wrapper functions for the operations which make use of zlib
functions, to make it simpler to provide ones for other compression
methods later.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 46 +++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 9de53a97..a20d7aa0 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1191,13 +1191,33 @@ static void complain(const char *complaint)
 =09    "<dest file system>\n");
 }
=20
+static int open_metadata(const char *path, struct metafd *mfd)
+{
+=09mfd->filename =3D path;
+=09mfd->fd =3D open(path, O_RDONLY|O_CLOEXEC);
+=09if (mfd->fd < 0) {
+=09=09perror("Could not open metadata file");
+=09=09return 1;
+=09}
+=09mfd->gzfd =3D gzdopen(mfd->fd, "rb");
+=09if (!mfd->gzfd) {
+=09=09perror("gzdopen");
+=09=09return 1;
+=09}
+=09return 0;
+}
+
+static void close_metadata(struct metafd *mfd)
+{
+=09gzclose(mfd->gzfd);
+}
+
 void restoremeta(const char *in_fn, const char *out_device, uint64_t print=
only)
 {
 =09int error;
-=09gzFile gzfd;
 =09off_t pos =3D 0;
 =09struct savemeta_header smh =3D {0};
-=09int fd;
+=09struct metafd mfd =3D {0};
=20
 =09termlines =3D 0;
 =09if (!in_fn)
@@ -1205,15 +1225,9 @@ void restoremeta(const char *in_fn, const char *out_=
device, uint64_t printonly)
 =09if (!printonly && !out_device)
 =09=09complain("No destination file system specified.");
=20
-=09fd =3D open(in_fn, O_RDONLY|O_CLOEXEC);
-=09if (fd < 0) {
-=09=09perror("Could not open file");
-=09=09exit(1);
-=09}
-=09gzfd =3D gzdopen(fd, "rb");
-=09if (!gzfd)
-=09=09die("Can't open source file %s: %s\n",
-=09=09    in_fn, strerror(errno));
+=09error =3D open_metadata(in_fn, &mfd);
+=09if (error !=3D 0)
+=09=09exit(error);
=20
 =09if (!printonly) {
 =09=09sbd.device_fd =3D open(out_device, O_RDWR);
@@ -1224,8 +1238,8 @@ void restoremeta(const char *in_fn, const char *out_d=
evice, uint64_t printonly)
 =09=09=09=09  optional block no */
 =09=09printonly =3D check_keywords(out_device);
=20
-=09pos =3D restore_init(gzfd, &smh);
-=09error =3D restore_super(gzfd, pos);
+=09pos =3D restore_init(mfd.gzfd, &smh);
+=09error =3D restore_super(mfd.gzfd, pos);
 =09if (error)
 =09=09exit(1);
=20
@@ -1236,16 +1250,16 @@ void restoremeta(const char *in_fn, const char *out=
_device, uint64_t printonly)
 =09=09printf("There are %"PRIu64" free blocks on the destination device.\n=
", space);
 =09}
=20
-=09error =3D find_highest_block(gzfd, pos, sbd.fssize);
+=09error =3D find_highest_block(mfd.gzfd, pos, sbd.fssize);
 =09if (error)
 =09=09exit(1);
=20
-=09error =3D restore_data(sbd.device_fd, gzfd, pos, printonly);
+=09error =3D restore_data(sbd.device_fd, mfd.gzfd, pos, printonly);
 =09printf("File %s %s %s.\n", in_fn,
 =09       (printonly ? "print" : "restore"),
 =09       (error ? "error" : "successful"));
=20
-=09gzclose(gzfd);
+=09close_metadata(&mfd);
 =09if (!printonly)
 =09=09close(sbd.device_fd);
 =09free(indirect);
--=20
2.24.1

