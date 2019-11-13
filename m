Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3D648FBADA
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KHrwgDG5P1iI2G/pdkGPnl3aPpzalk35fCSqPQO/NV4=;
	b=FMtepYGZz29EjBjd5ZaNE2ig3y4yFE5YZqPj9cpj6w4TEGmbOrBPlRa+zLU11JRSeGZzut
	1hLbwqgoV1T0kvn61SI9Tn8ajB9zKj+IlwQyHvGcg9rsUoWgmIwXBnAvMsgsNiJzgYyZZf
	DVIc29/YUlZf0mqjKfhsQO5jQgttqE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-dCGxYh65PqKd1bg4Da8ptw-1; Wed, 13 Nov 2019 16:31:06 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BE3B8C0966;
	Wed, 13 Nov 2019 21:31:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39177A7EB;
	Wed, 13 Nov 2019 21:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EDF34BB5B;
	Wed, 13 Nov 2019 21:31:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLV1vp005473 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:31:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 555D069739; Wed, 13 Nov 2019 21:31:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F7B669320
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:31:01 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:27 -0600
Message-Id: <20191113213030.237431-30-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 29/32] gfs2: if finish_open returns error,
	clean up iopen glock mess
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
X-MC-Unique: dCGxYh65PqKd1bg4Da8ptw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, if anything went wrong in function gfs2_create_inode
it would goto fail_gunlock3 and clean up the iopen glock it had just
created and locked. However, if function finish_open returns an error
it did not. That meant subsequent attempts to create the file were
seen as glock recursion errors on the iopen glock.

This patch adds additional checking for an error from finish_open and
cleans up the iopen glock appropriately.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index dcb5d363f9b9..acfc57e1cb53 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -772,6 +772,12 @@ static int gfs2_create_inode(struct inode *dir, struct=
 dentry *dentry,
 =09gfs2_glock_dq_uninit(ghs);
 =09gfs2_glock_dq_uninit(ghs + 1);
 =09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+=09if (error) {
+=09=09glock_clear_object(io_gl, ip);
+=09=09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+=09=09gfs2_glock_dq_uninit(&ip->i_iopen_gh);
+=09=09gfs2_glock_put(io_gl);
+=09}
 =09return error;
=20
 fail_gunlock3:
--=20
2.23.0

