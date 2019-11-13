Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4B947FBABF
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gL4YXjxlxdzbu5t2qpPjyKvhIK4fucC/+pRYpyZOAyw=;
	b=cqB8vWULBiP24xte5ceZSKmq4o/bQpb3pjq6aW/Jzibtt5MijwnMs4tx1uid1kCVznmnRZ
	5BDhfZi1hIyf6nmT7hNCmlopTgw/3yonI7WPtTc4NLX8plQQTOeBb3bS/crSlh75hQUNrn
	UDtL+A+9ekw96gyNdSjxOyRgVYauQCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-55NuqWNDOMC7qIIbdaelFg-1; Wed, 13 Nov 2019 16:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F244106BC06;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B2F1A7FD;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6070A4E562;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUbgj005251 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E08C66973B; Wed, 13 Nov 2019 21:30:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABE195C1BB
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:37 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:08 -0600
Message-Id: <20191113213030.237431-11-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/32] gfs2: Don't loop forever in
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 55NuqWNDOMC7qIIbdaelFg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

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
--=20
2.23.0

