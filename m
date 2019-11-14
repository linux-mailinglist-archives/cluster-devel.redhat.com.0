Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 86EC1FCB8C
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 18:12:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573751548;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/342DUQVO8nmMuEhrvMgKlo5F8ASLw+Wl4f9R/jezMY=;
	b=jMaMTC/DULdNZA+IHXwWvyBt6r5RzP3KUGzTsv7bmOYfNOfs94OQCAbXpcgBZs27V8DQt/
	VDAv6yC5dk/YF+oco3Uf9YrlmQ0pM38Ifalheq7I+bzffB8Gsugwj1kpQJDtb5HFSQhXLQ
	7gMaHLulVeTy7W2CF8FtXhJHzn12mGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-2AEEUj4RNsSqL_R4ZoSomw-1; Thu, 14 Nov 2019 12:12:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 585C71080F31;
	Thu, 14 Nov 2019 17:12:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3446F608B2;
	Thu, 14 Nov 2019 17:12:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15BF84BB5C;
	Thu, 14 Nov 2019 17:12:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEHCK8i000366 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 12:12:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 60DCA5F762; Thu, 14 Nov 2019 17:12:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57C595D6AE
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 17:12:17 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D70E14BB5C
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 17:12:17 +0000 (UTC)
Date: Thu, 14 Nov 2019 12:12:17 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1332745873.29963225.1573751537840.JavaMail.zimbra@redhat.com>
In-Reply-To: <2080848299.29962639.1573751528070.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.6]
Thread-Topic: gfs2: Abort gfs2_freeze if io error is seen
Thread-Index: OIBDhJjrpJJmAkCvE/x6rjBenerzSg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Abort gfs2_freeze if io error is
	seen
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
X-MC-Unique: 2AEEUj4RNsSqL_R4ZoSomw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Before this patch, an io error, such as -EIO writing to the journal
would cause function gfs2_freeze to go into an infinite loop,
continuously retrying the freeze operation. But nothing ever clears
the -EIO except unmount after withdraw, which is impossible if the
freeze operation never ends (fails). Instead you get:

[ 6499.767994] gfs2: fsid=3Ddm-32.0: error freezing FS: -5
[ 6499.773058] gfs2: fsid=3Ddm-32.0: retrying...
[ 6500.791957] gfs2: fsid=3Ddm-32.0: error freezing FS: -5
[ 6500.797015] gfs2: fsid=3Ddm-32.0: retrying...

This patch adds a check for -EIO in gfs2_freeze, and if seen, it
dequeues the freeze glock, aborts the loop and returns the error.
Also, there's no need to pass the freeze holder to function
gfs2_lock_fs_check_clean since it's only called in one place and
it's a well-known superblock pointer, so this simplifies that.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 8154c38e488b..eb1fbd533e6d 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -399,8 +399,7 @@ struct lfcc {
  * Returns: errno
  */
=20
-static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp,
-=09=09=09=09    struct gfs2_holder *freeze_gh)
+static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
 {
 =09struct gfs2_inode *ip;
 =09struct gfs2_jdesc *jd;
@@ -425,7 +424,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sd=
p,
 =09}
=20
 =09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_EXCLUSIVE,
-=09=09=09=09   GL_NOCACHE, freeze_gh);
+=09=09=09=09   GL_NOCACHE, &sdp->sd_freeze_gh);
=20
 =09list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
 =09=09error =3D gfs2_jdesc_check(jd);
@@ -441,7 +440,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sd=
p,
 =09}
=20
 =09if (error)
-=09=09gfs2_glock_dq_uninit(freeze_gh);
+=09=09gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
=20
 out:
 =09while (!list_empty(&list)) {
@@ -767,15 +766,20 @@ static int gfs2_freeze(struct super_block *sb)
 =09=09=09goto out;
 =09=09}
=20
-=09=09error =3D gfs2_lock_fs_check_clean(sdp, &sdp->sd_freeze_gh);
+=09=09error =3D gfs2_lock_fs_check_clean(sdp);
 =09=09if (!error)
 =09=09=09break;
=20
 =09=09if (error =3D=3D -EBUSY)
 =09=09=09fs_err(sdp, "waiting for recovery before freeze\n");
-=09=09else
+=09=09else if (error =3D=3D -EIO) {
+=09=09=09fs_err(sdp, "Fatal IO error: cannot freeze gfs2 due "
+=09=09=09       "to recovery error.\n");
+=09=09=09gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
+=09=09=09goto out;
+=09=09} else {
 =09=09=09fs_err(sdp, "error freezing FS: %d\n", error);
-
+=09=09}
 =09=09fs_err(sdp, "retrying...\n");
 =09=09msleep(1000);
 =09}

