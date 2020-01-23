Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20679146D8F
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MA0HyuttDkhK0R7PJ5y0QXqL5Tjo8X1D7ncaIqHGxk8=;
	b=gtzHCP5Qo73dqWdhItwCIbnQSXsV1E2mVMfT5RQGsWnH81vlHfjZPXBWJWYkXYZwad5bO0
	N72DMYCiJ/LOIT1FcFyLa59+fLCIWdYJ56BkEIVXF99L4LtU/mJJl2esYdiW3EgwHx8rk8
	EQbpESgu2oigXi1ua54rj8iRep96e6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-eSUpcW18MAqkXWvWVodnEw-1; Thu, 23 Jan 2020 10:56:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D230A802565;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEC288CCD9;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2BE01832DF1;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFuEbX012395 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AA0D160C81; Thu, 23 Jan 2020 15:56:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD65860BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:13 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:47 +0000
Message-Id: <20200123155552.1080247-9-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 08/13] restoremeta: Remove
	find_highest_block()
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
X-MC-Unique: eSUpcW18MAqkXWvWVodnEw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Doing a first pass through the metadata file just to find the highest
saved block and report it is a bit excessive, so remove
find_highest_block() and simply use the value from the metadata file
header if present. For ancient files that don't have the header, we just
don't report the size, which is a reasonable tradeoff as old files are
really only encountered during testing.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 41 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index f73cb0e0..dd203974 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1066,37 +1066,6 @@ err:
 =09return -1;
 }
=20
-static int find_highest_block(struct metafd *mfd, off_t pos, uint64_t fssi=
ze)
-{
-=09int err =3D 0;
-=09uint64_t highest =3D 0;
-=09struct saved_metablock svb =3D {0};
-
-=09while (1) {
-=09=09mfd->seek(mfd, pos, SEEK_SET);
-=09=09err =3D restore_block(mfd, &svb, NULL, 0);
-=09=09if (err =3D=3D 1)
-=09=09=09break;
-=09=09if (err !=3D 0)
-=09=09=09return -1;
-
-=09=09if (svb.blk > highest)
-=09=09=09highest =3D svb.blk;
-=09=09pos +=3D sizeof(svb) + svb.siglen;
-=09}
-
-=09if (fssize > 0) {
-=09=09printf("Saved file system size is %"PRIu64" blocks, %.2fGB\n",
-=09=09       fssize, (fssize * sbd.bsize) / ((float)(1 << 30)));
-=09=09sbd.fssize =3D fssize;
-=09} else {
-=09=09sbd.fssize =3D highest + 1;
-=09}
-
-=09printf("Highest saved block is %"PRIu64" (0x%"PRIx64")\n", highest, hig=
hest);
-=09return 0;
-}
-
 static int restore_data(int fd, struct metafd *mfd, off_t pos, int printon=
ly)
 {
 =09struct saved_metablock savedata =3D {0};
@@ -1248,6 +1217,12 @@ void restoremeta(const char *in_fn, const char *out_=
device, uint64_t printonly)
 =09if (error)
 =09=09exit(1);
=20
+=09if (smh.sh_fs_bytes > 0) {
+=09=09sbd.fssize =3D smh.sh_fs_bytes / sbd.bsize;
+=09=09printf("Saved file system size is %"PRIu64" blocks, %.2fGB\n",
+=09=09       sbd.fssize, smh.sh_fs_bytes / ((float)(1 << 30)));
+=09}
+
 =09printf("This is gfs%c metadata.\n", sbd.gfs1 ? '1': '2');
=20
 =09if (!printonly) {
@@ -1255,10 +1230,6 @@ void restoremeta(const char *in_fn, const char *out_=
device, uint64_t printonly)
 =09=09printf("There are %"PRIu64" free blocks on the destination device.\n=
", space);
 =09}
=20
-=09error =3D find_highest_block(&mfd, pos, sbd.fssize);
-=09if (error)
-=09=09exit(1);
-
 =09error =3D restore_data(sbd.device_fd, &mfd, pos, printonly);
 =09printf("File %s %s %s.\n", in_fn,
 =09       (printonly ? "print" : "restore"),
--=20
2.24.1

