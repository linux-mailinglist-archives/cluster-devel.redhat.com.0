Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 57BF816679E
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D+QUhJdB9D12d0+Vk4fmzeVs3AywTwgM6rLllrukDdc=;
	b=ZSVyidH5oSLITCu24ClTvJUlH3GKHAaFkdQcL2vCdM32/0bpiH6ShfMzzEf3UwF9qyZ52y
	xwiweCD4PmrCDN0USxSgcOGFKvE0UKaCpogUTAXP+Clr6pU033EOBGJdki3PCkpO+0x7MY
	R88EyqIk2RZX9IosMY43LKCR2/BJsBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-u_6m6h5NMPqG-2Ca7PXLrA-1; Thu, 20 Feb 2020 14:54:04 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 378F48017CC;
	Thu, 20 Feb 2020 19:54:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 212E060C63;
	Thu, 20 Feb 2020 19:54:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0552E18089CD;
	Thu, 20 Feb 2020 19:54:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJrxVm009184 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:53:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6A6790F65; Thu, 20 Feb 2020 19:53:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BEB290F57
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:53:58 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:11 -0600
Message-Id: <20200220195329.952027-11-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 10/28] gfs2: Only complain the first
	time an io error occurs in quota or log
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: u_6m6h5NMPqG-2Ca7PXLrA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, all io errors received by the quota daemon or the
logd daemon would cause a complaint message to be issued, such as:

   gfs2: fsid=3Ddm-13.0: Error 10 writing to journal, jid=3D0

This patch changes it so that the error message is only issued the
first time the error is encountered.

Also, before this patch function gfs2_end_log_write did not set the
sd_log_error value, so log errors would not cause the file system to
be withdrawn. This patch sets the error code so the file system is
properly withdrawn if an io error is encountered writing to the journal.

WARNING: This change in function breaks check xfstests generic/441
and causes it to fail: io errors writing to the log should cause a
file system to be withdrawn, and no further operations are tolerated.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lops.c  | 5 +++--
 fs/gfs2/quota.c | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index c090d5ad3f22..0af2e5ff0d97 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -203,8 +203,9 @@ static void gfs2_end_log_write(struct bio *bio)
 =09struct bvec_iter_all iter_all;
=20
 =09if (bio->bi_status) {
-=09=09fs_err(sdp, "Error %d writing to journal, jid=3D%u\n",
-=09=09       bio->bi_status, sdp->sd_jdesc->jd_jid);
+=09=09if (!cmpxchg(&sdp->sd_log_error, 0, (int)bio->bi_status))
+=09=09=09fs_err(sdp, "Error %d writing to journal, jid=3D%u\n",
+=09=09=09       bio->bi_status, sdp->sd_jdesc->jd_jid);
 =09=09wake_up(&sdp->sd_logd_waitq);
 =09}
=20
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index ca2194cfa38e..dbe87b2b55af 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1476,8 +1476,8 @@ static void quotad_error(struct gfs2_sbd *sdp, const =
char *msg, int error)
 =09if (error =3D=3D 0 || error =3D=3D -EROFS)
 =09=09return;
 =09if (!gfs2_withdrawn(sdp)) {
-=09=09fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
-=09=09cmpxchg(&sdp->sd_log_error, 0, error);
+=09=09if (!cmpxchg(&sdp->sd_log_error, 0, error))
+=09=09=09fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
 =09=09wake_up(&sdp->sd_logd_waitq);
 =09}
 }
--=20
2.24.1

