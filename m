Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8707A10298F
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Nov 2019 17:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574181665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DsQHdyL7e8AOu8oKICKUzDuF/mLTWm8mrfcEXBbcxOs=;
	b=OCHMsOSAIOLq3habEnITEAKiMBjzmGJ5GZclc6KM9+2nVx/Oj8VkF4j8GMdX9FraTEF9Kx
	7n1+Ieg9MBquWX7AjunYfAh31GWrxwfTKqiPMVoCwrUPZyPVAPKYNzWBcA6th+7ITvoa6o
	U6/crSqM7jmzjYGOc8qEIFBwPKkfyoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Rw1Yz0zNNw6eLCZxQjDA_g-1; Tue, 19 Nov 2019 11:40:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E158E5BA1;
	Tue, 19 Nov 2019 16:40:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21EF31EA;
	Tue, 19 Nov 2019 16:40:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C740A1809567;
	Tue, 19 Nov 2019 16:40:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJGenZN031749 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 11:40:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A36F22935D; Tue, 19 Nov 2019 16:40:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94D4C29371;
	Tue, 19 Nov 2019 16:40:46 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CD254BB5C;
	Tue, 19 Nov 2019 16:40:46 +0000 (UTC)
Date: Tue, 19 Nov 2019 11:40:46 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <693121786.35529468.1574181646510.JavaMail.zimbra@redhat.com>
In-Reply-To: <590695545.35528985.1574181592698.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.25]
Thread-Topic: gfs2: clean up iopen glock mess in gfs2_create_inode
Thread-Index: dju+BFIIjb5bps+bR3NFJgf/L+dscQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3] gfs2: clean up iopen glock mess in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Rw1Yz0zNNw6eLCZxQjDA_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is my latest version of this patch that fixes some issues
Andreas pointed out.

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
 fs/gfs2/inode.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index dcb5d363f9b9..4a1039c41c69 100644
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
@@ -732,7 +732,6 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09=09goto fail_gunlock2;
=20
 =09glock_set_object(ip->i_iopen_gh.gh_gl, ip);
-=09gfs2_glock_put(io_gl);
 =09gfs2_set_iop(inode);
 =09insert_inode_hash(inode);
=20
@@ -765,6 +764,8 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
=20
 =09mark_inode_dirty(inode);
 =09d_instantiate(dentry, inode);
+=09/* After instantiate, errors should result in evict which will destroy
+=09 * both inode and iopen glocks properly. */
 =09if (file) {
 =09=09file->f_mode |=3D FMODE_CREATED;
 =09=09error =3D finish_open(file, dentry, gfs2_open_common);
@@ -772,15 +773,15 @@ static int gfs2_create_inode(struct inode *dir, struc=
t dentry *dentry,
 =09gfs2_glock_dq_uninit(ghs);
 =09gfs2_glock_dq_uninit(ghs + 1);
 =09clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+=09gfs2_glock_put(io_gl);
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

