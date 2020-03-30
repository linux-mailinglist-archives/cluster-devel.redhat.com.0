Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id D799D197D63
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ziF3q3kVBdIvrRSWZJK0hsunz0nk7xfED2QAyNJ7s3c=;
	b=hkYRaMZ716E3F7ux3yS+xXphuhZ7mKpelFqGFn+r9KgHa9PUDVZShdgW0n2Py/CPG9hzqa
	4GiAfBzy9iqO+onM7O0RXZmGi6agikcPC9U9Jhf2O7tuzIiJK2+V7uWGdza+81wqOsm/mC
	eDkVGQw9IU45QFaH7F+9ekvUaPzYh9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-Q03XUI60Ot6DxIURMfRmYg-1; Mon, 30 Mar 2020 09:46:53 -0400
X-MC-Unique: Q03XUI60Ot6DxIURMfRmYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE471050906;
	Mon, 30 Mar 2020 13:46:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25DE05C1C5;
	Mon, 30 Mar 2020 13:46:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 092AF944D4;
	Mon, 30 Mar 2020 13:46:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkhaV020655 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02B1A96F88; Mon, 30 Mar 2020 13:46:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAB1548
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:42 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:20 -0500
Message-Id: <20200330134624.259349-36-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 35/39] gfs2: Remove unnecessary
	gfs2_qa_{get, put} pairs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Andreas Gruenbacher <agruenba@redhat.com>

We now get the quota data structure when opening a file writable and put it
when closing that writable file descriptor, so there no longer is a need fo=
r
gfs2_qa_{get,put} while we're holding a writable file descriptor.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/file.c | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 99a75e779ac0..fe305e4bfd37 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -458,10 +458,6 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *v=
mf)
=20
 =09sb_start_pagefault(inode->i_sb);
=20
-=09ret =3D gfs2_qa_get(ip);
-=09if (ret)
-=09=09goto out;
-
 =09gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
 =09ret =3D gfs2_glock_nq(&gh);
 =09if (ret)
@@ -553,13 +549,11 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *=
vmf)
 out_unlock:
 =09gfs2_glock_dq(&gh);
 out_uninit:
-=09gfs2_qa_put(ip);
 =09gfs2_holder_uninit(&gh);
 =09if (ret =3D=3D 0) {
 =09=09set_page_dirty(page);
 =09=09wait_for_stable_page(page);
 =09}
-out:
 =09sb_end_pagefault(inode->i_sb);
 =09return block_page_mkwrite_return(ret);
 }
@@ -860,10 +854,6 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb=
, struct iov_iter *from)
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09ssize_t ret;
=20
-=09ret =3D gfs2_qa_get(ip);
-=09if (ret)
-=09=09return ret;
-
 =09gfs2_size_hint(file, iocb->ki_pos, iov_iter_count(from));
=20
 =09if (iocb->ki_flags & IOCB_APPEND) {
@@ -871,7 +861,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
=20
 =09=09ret =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
 =09=09if (ret)
-=09=09=09goto out;
+=09=09=09return ret;
 =09=09gfs2_glock_dq_uninit(&gh);
 =09}
=20
@@ -929,8 +919,6 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
=20
 out_unlock:
 =09inode_unlock(inode);
-out:
-=09gfs2_qa_put(ip);
 =09return ret;
 }
=20
@@ -1162,18 +1150,11 @@ static long gfs2_fallocate(struct file *file, int m=
ode, loff_t offset, loff_t le
 =09if (mode & FALLOC_FL_PUNCH_HOLE) {
 =09=09ret =3D __gfs2_punch_hole(file, offset, len);
 =09} else {
-=09=09ret =3D gfs2_qa_get(ip);
-=09=09if (ret)
-=09=09=09goto out_putw;
-
 =09=09ret =3D __gfs2_fallocate(file, mode, offset, len);
-
 =09=09if (ret)
 =09=09=09gfs2_rs_deltree(&ip->i_res);
-=09=09gfs2_qa_put(ip);
 =09}
=20
-out_putw:
 =09put_write_access(inode);
 out_unlock:
 =09gfs2_glock_dq(&gh);
@@ -1187,18 +1168,11 @@ static ssize_t gfs2_file_splice_write(struct pipe_i=
node_info *pipe,
 =09=09=09=09      struct file *out, loff_t *ppos,
 =09=09=09=09      size_t len, unsigned int flags)
 {
-=09int error;
-=09struct gfs2_inode *ip =3D GFS2_I(out->f_mapping->host);
 =09ssize_t ret;
=20
-=09error =3D gfs2_qa_get(ip);
-=09if (error)
-=09=09return (ssize_t)error;
-
 =09gfs2_size_hint(out, *ppos, len);
=20
 =09ret =3D iter_file_splice_write(pipe, out, ppos, len, flags);
-=09gfs2_qa_put(ip);
 =09return ret;
 }
=20
--=20
2.25.1

