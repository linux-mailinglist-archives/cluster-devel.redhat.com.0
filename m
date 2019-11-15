Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9A4FE231
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 17:03:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573833792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HK7EfaN/ZHxEvJMA7E0WMjNK1JkYgEa9BS7epfWgwM4=;
	b=cA9QLGrk85hwAJ9QW8fDgNY5wOyPOQUL8HVKcsjlsOOppxWWFEBHyT9lmw3nbcdU+M4xP3
	Zac+5Db6lnEtMasLGpWTnnCTjJ9EYn4GEdQGEnF6KqHdBlOIcy4tUnSbctqDgDbqdR0FSW
	f6+KWGcqoMDzciWpHL7axXy3Xd6Cjlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-n3RQw-zuPieMKj3P_3nYiw-1; Fri, 15 Nov 2019 11:03:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2816C18B644E;
	Fri, 15 Nov 2019 16:03:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 122BE60BE1;
	Fri, 15 Nov 2019 16:03:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE40018089C8;
	Fri, 15 Nov 2019 16:03:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFG32vX008023 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 11:03:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EFAD228DD4; Fri, 15 Nov 2019 16:03:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E98CEF6E6
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 16:03:00 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43DCE18089C8
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 16:03:00 +0000 (UTC)
Date: Fri, 15 Nov 2019 11:03:00 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <923916143.30270056.1573833780225.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.3]
Thread-Topic: gfs2: if finish_open returns error, clean up iopen glock mess
Thread-Index: 6VG/17dPfa+4JtSXUgC/sg5jFer4cA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2] gfs2: if finish_open returns error,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: n3RQw-zuPieMKj3P_3nYiw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Just noticed (and fixed) the redundant clear_bit. Sorry.
---
Before this patch, if anything went wrong in function gfs2_create_inode
it would goto fail_gunlock3 and clean up the iopen glock it had just
created and locked. However, if function finish_open returns an error
it did not. That meant subsequent attempts to create the file were
seen as glock recursion errors on the iopen glock.

This patch adds additional checking for an error from finish_open and
cleans up the iopen glock appropriately.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index dcb5d363f9b9..36eb223b185e 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -772,6 +772,11 @@ static int gfs2_create_inode(struct inode *dir, struct=
 dentry *dentry,
 =09gfs2_glock_dq_uninit(ghs);
 =09gfs2_glock_dq_uninit(ghs + 1);
 =09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+=09if (error) {
+=09=09glock_clear_object(io_gl, ip);
+=09=09gfs2_glock_dq_uninit(&ip->i_iopen_gh);
+=09=09gfs2_glock_put(io_gl);
+=09}
 =09return error;
=20
 fail_gunlock3:

