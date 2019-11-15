Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 49E8DFE221
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 16:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573833553;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ZPprmxrQKs0FMXsySPeh4Gnx0zWqoTrFyVQ1bRV5Xqw=;
	b=a16jiZLQxcOFxd1uo1fi1w6XUeZyVTeNmP+d/Mhzv9anrJx4pA9j0AEWR+/Y4xlgd0EmDs
	iP7phySJdr27wUvnVzHQ/VeWswOOVk6VYFWLLyGu+kWQxQYCQZ5h1cU53yFYLdSU+5UqLG
	Flq91xbQwPxpIPK0GasZTYQBx8azoKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-o6EjYA-QM9-yZ7eXu2Xbgg-1; Fri, 15 Nov 2019 10:59:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58118802684;
	Fri, 15 Nov 2019 15:59:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7E328DDC;
	Fri, 15 Nov 2019 15:59:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 389DC18089CD;
	Fri, 15 Nov 2019 15:59:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFFx4Oo007663 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 10:59:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E18BF6047B; Fri, 15 Nov 2019 15:59:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB4BD60470
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 15:59:01 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B055D18089C8
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 15:59:01 +0000 (UTC)
Date: Fri, 15 Nov 2019 10:59:01 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1327299538.30268889.1573833541581.JavaMail.zimbra@redhat.com>
In-Reply-To: <278378907.30268888.1573833534957.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.23]
Thread-Topic: gfs2: if finish_open returns error, clean up iopen glock mess
Thread-Index: 3oqXH6vYJ8YjH2UjMkRGdOfGrpBZMw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: if finish_open returns error,
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
X-MC-Unique: o6EjYA-QM9-yZ7eXu2Xbgg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

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

