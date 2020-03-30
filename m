Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 74B30197D6A
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OVduHR5LNCPDMzSW4tuV2sFC9Dvr3Qx/v0nqoyYFUp8=;
	b=Mr1B7CAtOUmMxBG21diapBgV2sfU/u1kalUuKLQ4cYUe80LONFZVcUrDzMrd1dK3rW7+zu
	YUG6QZ+T2Vg96pjrLWvpMcHxQ6W4Vgjd9n4xuQUDkey4T7zDKiCm++SJ1zlwEVPECRZC5y
	Jm7Nrl/foGKM+f3KbLU+umJshfU/Hw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-159iZXC6O4yUTj16vlLU3w-1; Mon, 30 Mar 2020 09:47:01 -0400
X-MC-Unique: 159iZXC6O4yUTj16vlLU3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26FFF801E78;
	Mon, 30 Mar 2020 13:46:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 138F060C85;
	Mon, 30 Mar 2020 13:46:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E993318089C8;
	Mon, 30 Mar 2020 13:46:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkkCk020688 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5596348; Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8BA95C1A8
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:43 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:21 -0500
Message-Id: <20200330134624.259349-37-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 36/39] gfs2: don't lock
	sd_log_flush_lock in try_rgrp_unlink
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

In function try_rgrp_unlink, we added a temporary lock of the
sd_log_flush_lock while searching the bitmaps. This protected us from
problems in which dinodes being freed were still in a state of flux
because the rgrp was in an active transaction. It was a kludge.
Now that we've straightened out the code for inode eviction, deletes,
and all the recovery mess, we no longer need this kludge.
This patch removes it, and should improve performance.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/rgrp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 692dc11d0f13..a321c34e3d6e 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1806,10 +1806,8 @@ static void try_rgrp_unlink(struct gfs2_rgrpd *rgd, =
u64 *last_unlinked, u64 skip
 =09struct gfs2_rbm rbm =3D { .rgd =3D rgd, .bii =3D 0, .offset =3D 0 };
=20
 =09while (1) {
-=09=09down_write(&sdp->sd_log_flush_lock);
 =09=09error =3D gfs2_rbm_find(&rbm, GFS2_BLKST_UNLINKED, NULL, NULL,
 =09=09=09=09      true);
-=09=09up_write(&sdp->sd_log_flush_lock);
 =09=09if (error =3D=3D -ENOSPC)
 =09=09=09break;
 =09=09if (WARN_ON_ONCE(error))
--=20
2.25.1

