Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFBDFE6C0
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 22:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573851783;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=euxj5y3MNrqxccxDIcGk3MfBbSdhh3h9Tz9M2IV/pcg=;
	b=IItyjQqNa6SM0O2pOfAPr9u0LX/g3Ocmxbd6ip+Sloy5Bv3umI1Izl0leC8hitIoAqa4i8
	oAJGL7kIUUIs7d0/cEYLrH+AaawhgfC++OD78ZHGyCWVQ7hy7YH7ow4OTEOnWqj9jV7Xho
	/LOLgAVfbOnAx50QmCktrX1CoQNWnn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-Goc7knZxPH2GYI2XHR14PQ-1; Fri, 15 Nov 2019 16:03:02 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A581E1005502;
	Fri, 15 Nov 2019 21:02:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 631175E263;
	Fri, 15 Nov 2019 21:02:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63DD74BB65;
	Fri, 15 Nov 2019 21:02:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFL2pFt025878 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 16:02:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C33381036C83; Fri, 15 Nov 2019 21:02:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 869A21001920;
	Fri, 15 Nov 2019 21:02:47 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C65818089C8;
	Fri, 15 Nov 2019 21:02:47 +0000 (UTC)
Date: Fri, 15 Nov 2019 16:02:47 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1645088061.30314093.1573851767349.JavaMail.zimbra@redhat.com>
In-Reply-To: <743223930.30313853.1573851480656.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.26]
Thread-Topic: gfs2: clean up iopen glock mess in gfs2_create_inode
Thread-Index: H/kL7DWQSlSr7NdNt9oCpPhDozaaNw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: clean up iopen glock mess in
	gfs2_create_inode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Goc7knZxPH2GYI2XHR14PQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I wrote this patch because Andreas pointed out the problem with
its predecessor patch, "gfs2: if finish_open returns error, clean
up iopen glock mess" wasn't correct because after the instantiate,
subsequent evicts should take care of the iopen glock properly.

This, then, is the revised patch that takes a different approach.
It reorders the iopen processing to make a little more sense and
prevents a possible use-after-free.

This patch has had minimal testing so far, so I don't have much
confidence in it yet. It makes logical sense, but it's a very
sensitive code path. We especially need to test the cases of
doing creates-during-deletes, deletes-during-creates, creates
during remote-node-deletes, and so forth.

Bob
---
Before this patch, gfs2_create_inode had a use-after-free for the
iopen glock in some error paths because it did this:

=09gfs2_glock_put(io_gl);
fail_gunlock2:
=09if (io_gl)
=09=09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);

In some cases, the io_gl was used for create and only had one
reference, so the glock might be freed before the clear_bit().
This patch tries to straighten it out by only jumping to the
error paths where iopen is properly set, and moving the
gfs2_glock_put after the clear_bit.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/inode.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index dcb5d363f9b9..cd7628f06ee6 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -712,7 +712,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
=20
 =09error =3D gfs2_trans_begin(sdp, blocks, 0);
 =09if (error)
-=09=09goto fail_gunlock2;
+=09=09goto fail_free_inode;
=20
 =09if (blocks > 1) {
 =09=09ip->i_eattr =3D ip->i_no_addr + 1;
@@ -723,7 +723,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
=20
 =09error =3D gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_iopen_glops, CREATE,=
 &io_gl);
 =09if (error)
-=09=09goto fail_gunlock2;
+=09=09goto fail_free_inode;
=20
 =09BUG_ON(test_and_set_bit(GLF_INODE_CREATING, &io_gl->gl_flags));
=20
@@ -772,15 +772,19 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
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
 =09glock_clear_object(io_gl, ip);
 =09gfs2_glock_dq_uninit(&ip->i_iopen_gh);
-=09gfs2_glock_put(io_gl);
 fail_gunlock2:
-=09if (io_gl)
-=09=09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+=09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+=09gfs2_glock_put(io_gl);
 fail_free_inode:
 =09if (ip->i_gl) {
 =09=09glock_clear_object(ip->i_gl, ip);

