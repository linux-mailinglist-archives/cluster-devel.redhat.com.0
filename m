Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACC8F4BF5
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Nov 2019 13:38:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573216706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XtC+w8u3RYtM8osYbIOHFjn5JDbr4UTuXtDLdYbkxiI=;
	b=Y6gsLBMvfqB3tuvAQxHg1TYDaKfgpr5YgOaEr7OVlBsVmnMZV2tI1n/VbCZBqL+vjcpwU/
	8UabpV2f7PA/0qlS8E1aphCBlah1lZRvMoX7OFoazUMu+BLrsa16jCMkWtGEzr0f6dXOls
	yDWT2raNkR7t9pn3ithJcQNTfqWKo00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-Spww1hEUPcW08DHqJ5BM2A-1; Fri, 08 Nov 2019 07:38:25 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C5FD1800D7B;
	Fri,  8 Nov 2019 12:38:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED64B5DA70;
	Fri,  8 Nov 2019 12:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D59FE4BB78;
	Fri,  8 Nov 2019 12:38:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8CcKIf002162 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 07:38:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EC6CD608B3; Fri,  8 Nov 2019 12:38:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.206.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 324E76084E;
	Fri,  8 Nov 2019 12:38:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  8 Nov 2019 13:38:14 +0100
Message-Id: <20191108123814.5138-2-agruenba@redhat.com>
In-Reply-To: <20191108123814.5138-1-agruenba@redhat.com>
References: <20191108123814.5138-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/2] gfs2: Fix end-of-file handling in
	gfs2_page_mkwrite
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
X-MC-Unique: Spww1hEUPcW08DHqJ5BM2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

When the filesystem block size is smaller than the page size, the last
page may contain blocks that lie entirely beyond the end of the file.
Make sure to only allocate blocks that lie at least partially in the
file.  Allocating blocks beyond that isn't useful, and what's more, they
will not be zeroed out and may end up containing random data.

With that change in place, make sure we'll still always unstuff stuffed
inodes: iomap_writepage and iomap_writepages currently can't handle
stuffed files.

In addition, simplify and move the end-of-file check further to the top
in gfs2_page_mkwrite to avoid weird side effects like unstuffing when
we're not.

Fixes xfstest generic/263.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 30b857017fd3..92524a946d03 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -423,10 +423,10 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *=
vmf)
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
 =09struct gfs2_alloc_parms ap =3D { .aflags =3D 0, };
-=09unsigned long last_index;
-=09u64 pos =3D page_offset(page);
+=09u64 offset =3D page_offset(page);
 =09unsigned int data_blocks, ind_blocks, rblocks;
 =09struct gfs2_holder gh;
+=09unsigned int length;
 =09loff_t size;
 =09int ret;
=20
@@ -436,20 +436,39 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *=
vmf)
 =09if (ret)
 =09=09goto out;
=20
-=09gfs2_size_hint(vmf->vma->vm_file, pos, PAGE_SIZE);
-
 =09gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
 =09ret =3D gfs2_glock_nq(&gh);
 =09if (ret)
 =09=09goto out_uninit;
=20
+=09/* Check page index against inode size */
+=09size =3D i_size_read(inode);
+=09if (offset >=3D size) {
+=09=09ret =3D -EINVAL;
+=09=09goto out_unlock;
+=09}
+
 =09/* Update file times before taking page lock */
 =09file_update_time(vmf->vma->vm_file);
=20
+=09/* page is wholly or partially inside EOF */
+=09if (offset > size - PAGE_SIZE)
+=09=09length =3D offset_in_page(size);
+=09else
+=09=09length =3D PAGE_SIZE;
+
+=09gfs2_size_hint(vmf->vma->vm_file, offset, length);
+
 =09set_bit(GLF_DIRTY, &ip->i_gl->gl_flags);
 =09set_bit(GIF_SW_PAGED, &ip->i_flags);
=20
-=09if (!gfs2_write_alloc_required(ip, pos, PAGE_SIZE)) {
+=09/*
+=09 * iomap_writepage / iomap_writepages currently don't support inline
+=09 * files, so always unstuff here.
+=09 */
+
+=09if (!gfs2_is_stuffed(ip) &&
+=09    !gfs2_write_alloc_required(ip, offset, length)) {
 =09=09lock_page(page);
 =09=09if (!PageUptodate(page) || page->mapping !=3D inode->i_mapping) {
 =09=09=09ret =3D -EAGAIN;
@@ -462,7 +481,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vm=
f)
 =09if (ret)
 =09=09goto out_unlock;
=20
-=09gfs2_write_calc_reserv(ip, PAGE_SIZE, &data_blocks, &ind_blocks);
+=09gfs2_write_calc_reserv(ip, length, &data_blocks, &ind_blocks);
 =09ap.target =3D data_blocks + ind_blocks;
 =09ret =3D gfs2_quota_lock_check(ip, &ap);
 =09if (ret)
@@ -483,13 +502,6 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *v=
mf)
 =09=09goto out_trans_fail;
=20
 =09lock_page(page);
-=09ret =3D -EINVAL;
-=09size =3D i_size_read(inode);
-=09last_index =3D (size - 1) >> PAGE_SHIFT;
-=09/* Check page index against inode size */
-=09if (size =3D=3D 0 || (page->index > last_index))
-=09=09goto out_trans_end;
-
 =09ret =3D -EAGAIN;
 =09/* If truncated, we must retry the operation, we may have raced
 =09 * with the glock demotion code.
@@ -502,7 +514,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vm=
f)
 =09if (gfs2_is_stuffed(ip))
 =09=09ret =3D gfs2_unstuff_dinode(ip, page);
 =09if (ret =3D=3D 0)
-=09=09ret =3D gfs2_allocate_page_backing(page, PAGE_SIZE);
+=09=09ret =3D gfs2_allocate_page_backing(page, length);
=20
 out_trans_end:
 =09if (ret)
--=20
2.20.1

