Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 46349E9097
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Oct 2019 21:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572379836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jFxFJdENuIytL14OHuoFheDzWXcZW8cZiHPM8xd76D4=;
	b=MBkcZzg2OIrVit1mlh5Ece4s29BR8JvOaSJgWUvHaca6MapWzOxknjleB/NWuZx9tZH/E8
	8HkSrMdGGebtvRD7ifwV8tNaGvIjSAVs/7CKlL+VT4Jl742vKPTKA63xOjJ/zdyRd+tmrs
	YObU8IP3uTcb8eebm7hX/68mmudbwaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-ZgsdeaYhNjOBDlmm8697EA-1; Tue, 29 Oct 2019 16:10:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40CF15E8;
	Tue, 29 Oct 2019 20:10:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8DD11001B08;
	Tue, 29 Oct 2019 20:10:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D59E18089C8;
	Tue, 29 Oct 2019 20:10:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9TK9frD005411 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 29 Oct 2019 16:09:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A7BE60870; Tue, 29 Oct 2019 20:09:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.109])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED5AD60876
	for <cluster-devel@redhat.com>; Tue, 29 Oct 2019 20:09:37 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 29 Oct 2019 20:09:34 +0000
Message-Id: <20191029200934.16088-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix initialisation of args for remount
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
X-MC-Unique: ZgsdeaYhNjOBDlmm8697EA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

When gfs2 was converted to use fs_context, the initialisation of the
mount args structure to the currently active args was lost with the
removal of gfs2_remount_fs(), so the checks of the new args on remount
became checks against the default values instead of the current ones.
This caused unexpected remount behaviour and test failures (xfstests
generic/294, generic/306 and generic/452).

Reinstate the args initialisation, this time in gfs2_init_fs_context()
and conditional upon fc->purpose, as that's the only time we get control
before the mount args are parsed in the remount process.

Fixes: 1f52aa08d12f ("gfs2: Convert gfs2 to fs_context")
Signed-off-by: Andrew Price <anprice@redhat.com>
---

 fs/gfs2/ops_fstype.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index dc61af2c4d5e..1f247a0ab6ef 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1544,13 +1544,18 @@ static int gfs2_init_fs_context(struct fs_context *=
fc)
 =09if (args =3D=3D NULL)
 =09=09return -ENOMEM;
=20
-=09args->ar_quota =3D GFS2_QUOTA_DEFAULT;
-=09args->ar_data =3D GFS2_DATA_DEFAULT;
-=09args->ar_commit =3D 30;
-=09args->ar_statfs_quantum =3D 30;
-=09args->ar_quota_quantum =3D 60;
-=09args->ar_errors =3D GFS2_ERRORS_DEFAULT;
+=09if (fc->purpose =3D=3D FS_CONTEXT_FOR_RECONFIGURE) {
+=09=09struct gfs2_sbd *sdp =3D fc->root->d_sb->s_fs_info;
=20
+=09=09*args =3D sdp->sd_args;
+=09} else {
+=09=09args->ar_quota =3D GFS2_QUOTA_DEFAULT;
+=09=09args->ar_data =3D GFS2_DATA_DEFAULT;
+=09=09args->ar_commit =3D 30;
+=09=09args->ar_statfs_quantum =3D 30;
+=09=09args->ar_quota_quantum =3D 60;
+=09=09args->ar_errors =3D GFS2_ERRORS_DEFAULT;
+=09}
 =09fc->fs_private =3D args;
 =09fc->ops =3D &gfs2_context_ops;
 =09return 0;
--=20
2.21.0

